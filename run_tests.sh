#!/usr/bin/env bash
# run_tests.sh — three-tier test harness for the VC ecosystem metamodel.
#
#   smoke       Tier 1. Toolchain + headline conflict + one probe pair + two
#               generate runs. Six solver invocations, dispatched concurrently.
#               Budget: under 30 s.
#   validate    Tier 2. Every declared instance under `check -k`, plus `generate`
#               on every instance declared as a generation entry point. Verdicts
#               come from expectations.tsv and evaluation/instances/expectations.tsv;
#               a .problem file declared in neither is a failure.
#   perf quick  Tier 3, reduced. RUNS=3 over scale points 1/10/30, E0+E1+E2.
#   perf full   Tier 3, archival. Delegates to run_measurements.sh all (~1 hour).
#
# Both perf modes end in evaluation/check_ceilings.py, which fails if any
# benchmark mean exceeds CEILING_SECONDS.
#
# Environment: JOBS (default 4) concurrent containers, TIMEOUT (default 300 s)
# per invocation, CEILING_SECONDS for the perf gate.
#
# Verdict classification (pinned empirically 2026-08-05, refinery-cli digest
# sha256:88f1332e9aae...). Exit status alone does NOT separate an unsatisfiable
# model from a broken one: `check -k` returns 1 both for a real UNSAT and for a
# parse failure, and so does `generate`. Each operation therefore needs its own
# unsatisfiability signal in the output:
#
#   operation   exit 0    unsatisfiable                        anything else
#   check -k    SAT       "Inconsistencies found in model:"    ERROR
#   generate    SAT       "UnsatisfiableProblemException"      ERROR
#
# ERROR is a failure whatever the expectation says. Collapsing it into UNSAT is
# how a metamodel that no longer parses passes a test suite where half the corpus
# is expected to be UNSAT.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REFINERY_IMAGE="ghcr.io/graphs4value/refinery-cli:latest"
JOBS="${JOBS:-4}"
TIMEOUT="${TIMEOUT:-300}"

export MSYS_NO_PATHCONV=1   # Git Bash path mangling prevention

# ──────────────────────────────────────────────────────────
# Worker. Runs one (operation, file) pair and writes one result line.
#
# ALWAYS exits 0. Two reasons: a nonzero docker status is the expected path for
# half the corpus, and `xargs -P` aborts the whole pool with status 123 as soon
# as one child exits 1-125, which would kill the parent before it aggregates.
# The outcome travels in the result file, never in the exit status.
# ──────────────────────────────────────────────────────────
run_one() {
    local spec="$1" resdir="$2"
    local op file expected
    IFS=$'\t' read -r op file expected <<<"$spec"

    local flags
    case "$op" in
        checkk)   flags="check -k" ;;
        generate) flags="generate" ;;
        *)        printf '%s\t%s\t%s\tERROR\tFAIL\t0\n' "$file" "$op" "$expected" \
                      > "$resdir/$(printf '%s' "${file}_${op}" | tr '/' '_')"
                  return 0 ;;
    esac

    local out status start end
    start=$(date +%s)
    set +e
    # shellcheck disable=SC2086  # $flags is a two-word operation, split on purpose
    out=$(timeout "$TIMEOUT" docker run --rm -v "$SCRIPT_DIR:/work" -w /work \
              "$REFINERY_IMAGE" $flags "/work/$file" 2>&1)
    status=$?
    set -e
    end=$(date +%s)

    local observed
    if [ "$status" -eq 0 ]; then
        observed=SAT
    elif [ "$status" -eq 124 ]; then
        observed=TIMEOUT
    elif [ "$op" = checkk ] && grep -q 'Inconsistencies found in model' <<<"$out"; then
        observed=UNSAT
    elif [ "$op" = generate ] && grep -q 'UnsatisfiableProblemException' <<<"$out"; then
        observed=UNSAT
    else
        observed=ERROR
    fi

    local outcome
    if [ "$observed" = ERROR ] || [ "$observed" = TIMEOUT ]; then
        outcome=FAIL
    elif [ "$expected" = UNKNOWN ]; then
        outcome=INFO
    elif [ "$observed" = "$expected" ]; then
        outcome=PASS
    else
        outcome=FAIL
    fi

    printf '%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$file" "$op" "$expected" "$observed" "$outcome" "$((end - start))" \
        > "$resdir/$(printf '%s' "${file}_${op}" | tr '/' '_')"

    # Keep the diagnostic for failures only; passing runs produce a lot of model text.
    if [ "$outcome" = FAIL ]; then
        printf '%s\n' "$out" | tail -20 \
            > "$resdir/$(printf '%s' "${file}_${op}" | tr '/' '_').log"
    fi
    return 0
}

# ──────────────────────────────────────────────────────────
# Manifests
# ──────────────────────────────────────────────────────────
MANIFESTS=(
    "$SCRIPT_DIR/expectations.tsv"
    "$SCRIPT_DIR/evaluation/instances/expectations.tsv"
)

# Emit "file<TAB>check_k<TAB>generate" for every declared row, comments stripped.
manifest_rows() {
    local m
    for m in "${MANIFESTS[@]}"; do
        [ -f "$m" ] || continue
        while IFS=$'\t' read -r file check_k gen _rest; do
            case "${file:-}" in ''|\#*) continue ;; esac
            printf '%s\t%s\t%s\n' "$file" "$check_k" "$gen"
        done < "$m"
    done
}

expectation_for() {
    local want_file="$1" want_op="$2" file check_k gen
    while IFS=$'\t' read -r file check_k gen; do
        if [ "$file" = "$want_file" ]; then
            [ "$want_op" = checkk ] && { printf '%s\n' "$check_k"; return 0; }
            printf '%s\n' "$gen"; return 0
        fi
    done < <(manifest_rows)
    return 1
}

# ──────────────────────────────────────────────────────────
# Pool: read a job list on stdin, run it, print the table, return 1 on any FAIL.
# ──────────────────────────────────────────────────────────
run_pool() {
    local label="$1" jobs="$2"
    local resdir joblist
    resdir=$(mktemp -d)
    joblist=$(mktemp)
    cat > "$joblist"

    local total
    total=$(wc -l < "$joblist")
    echo "=== $label: $total run(s), $jobs at a time ==="

    # -I keeps each newline-delimited line intact, so the tabs survive as one arg.
    # Invoked through `bash` because exec bits do not survive every sync.
    xargs -a "$joblist" -P "$jobs" -I{} bash "$SCRIPT_DIR/run_tests.sh" _one {} "$resdir"

    local pass=0 fail=0 info=0
    local file op expected observed outcome secs
    while IFS=$'\t' read -r file op expected observed outcome secs; do
        printf '  %-6s %-8s %-52s %s (expected %s, %ss)\n' \
            "$outcome" "$op" "$file" "$observed" "$expected" "$secs"
        case "$outcome" in
            PASS) pass=$((pass + 1)) ;;
            INFO) info=$((info + 1)) ;;
            *)    fail=$((fail + 1)) ;;
        esac
    done < <(find "$resdir" -maxdepth 1 -type f ! -name '*.log' -exec cat {} + 2>/dev/null \
                 | grep -v '^$' | sort -t$'\t' -k5,5 -k1,1)

    echo ""
    echo "  $pass passed, $fail failed, $info reported (no expectation)"

    local rc=0
    if [ "$fail" -gt 0 ]; then
        rc=1
        echo ""
        echo "  Last output lines of failing runs:"
        local log
        for log in "$resdir"/*.log; do
            [ -f "$log" ] || continue
            echo "  --- $(basename "$log" .log)"
            sed 's/^/    /' "$log"
        done
    fi

    # Explicit cleanup, not a RETURN trap: a RETURN trap set here also fires on
    # the caller's return, where $resdir is out of scope and `set -u` aborts.
    rm -rf "$resdir" "$joblist"
    return "$rc"
}

# Turn "op file" pairs into job lines with the declared expectation attached.
job_line() {
    local op="$1" file="$2" expected
    if ! expected=$(expectation_for "$file" "$op"); then
        echo "ERROR: $file has no row in any expectations.tsv" >&2
        exit 1
    fi
    printf '%s\t%s\t%s\n' "$op" "$file" "$expected"
}

# ──────────────────────────────────────────────────────────
# Tier 1: smoke
# ──────────────────────────────────────────────────────────
run_smoke() {
    command -v docker >/dev/null 2>&1 || { echo "FAIL: docker not on PATH"; exit 1; }
    if ! docker image inspect "$REFINERY_IMAGE" >/dev/null 2>&1; then
        echo "FAIL: image not present locally — run: docker pull $REFINERY_IMAGE"
        echo "      (pulling here would blow the 30 s budget silently)"
        exit 1
    fi

    # check -k answers "is concretization not excluded"; generate answers "does the
    # solver actually produce a model". They diverge, so smoke asks both.
    {
        job_line checkk   csok.problem                      # headline conflict fires
        job_line checkk   csok_no_conflict.problem          # ablation resolves it
        job_line checkk   probe_cyclic.problem              # error predicate still fires
        job_line checkk   probe_cyclic_control.problem      # and is not vacuous
        job_line generate csok_generated.problem            # a model is found, not just admitted
        job_line generate probe_common_parent.problem       # generate-side UNSAT path
    } | run_pool "Tier 1 — smoke" 6
}

# ──────────────────────────────────────────────────────────
# Tier 2: validation
# ──────────────────────────────────────────────────────────
run_validate() {
    # Every .problem on disk must be declared. An undeclared instance is not a
    # silent pass: adding a model means stating what it should do.
    local undeclared=0 f rel
    while IFS= read -r f; do
        rel="${f#"$SCRIPT_DIR"/}"
        if ! manifest_rows | awk -F'\t' -v f="$rel" '$1 == f { hit = 1 } END { exit !hit }'; then
            echo "UNDECLARED: $rel has no row in any expectations.tsv"
            undeclared=$((undeclared + 1))
        fi
    done < <(find "$SCRIPT_DIR" -name '*.problem' -not -path '*/.git/*' | sort)

    local jobs_file
    jobs_file=$(mktemp)
    local file check_k gen
    while IFS=$'\t' read -r file check_k gen; do
        [ "$check_k" = SKIP ] || printf 'checkk\t%s\t%s\n' "$file" "$check_k" >> "$jobs_file"
        [ "$gen" = SKIP ]     || printf 'generate\t%s\t%s\n' "$file" "$gen"   >> "$jobs_file"
    done < <(manifest_rows)

    local rc=0
    run_pool "Tier 2 — validation" "$JOBS" < "$jobs_file" || rc=1
    rm -f "$jobs_file"

    if [ "$undeclared" -gt 0 ]; then
        echo "  $undeclared undeclared instance file(s)"
        rc=1
    fi
    return "$rc"
}

# ──────────────────────────────────────────────────────────
# Tier 3: performance. Serial by construction — parallel timing is meaningless.
# ──────────────────────────────────────────────────────────
run_perf() {
    local mode="${1:-quick}"
    case "$mode" in
        quick)
            echo "=== Tier 3 — performance (quick: RUNS=3, scale points 1/10/30) ==="
            local exp
            for exp in e0 e1 e2; do
                RUNS="${RUNS:-3}" SCALE_POINTS_OVERRIDE="${SCALE_POINTS_OVERRIDE:-1 10 30}" \
                    bash "$SCRIPT_DIR/run_measurements.sh" "$exp"
            done
            ;;
        full)
            echo "=== Tier 3 — performance (full campaign, ~1 hour) ==="
            # The archival campaign runs the config.yaml sweep, whatever narrowing
            # a previous quick run or the caller's environment asked for. A run
            # labelled "full" that silently measured three scale points would be
            # worse than no run.
            unset SCALE_POINTS_OVERRIDE
            bash "$SCRIPT_DIR/run_measurements.sh" all
            ;;
        *)
            echo "Usage: $0 perf {quick|full}" >&2
            exit 1
            ;;
    esac
    python3 "$SCRIPT_DIR/evaluation/check_ceilings.py"
}

# ──────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────
case "${1:-}" in
    _one)     run_one "$2" "$3" ;;
    smoke)    run_smoke ;;
    validate) run_validate ;;
    perf)     run_perf "${2:-quick}" ;;
    *)
        echo "Usage: $0 {smoke|validate|perf [quick|full]}" >&2
        exit 1
        ;;
esac
