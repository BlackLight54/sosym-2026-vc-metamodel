#!/usr/bin/env bash
# run_measurements.sh — Orchestrate Hyperfine measurement campaign
#
# Lives in models/ (supplementary material root). Docker mounts this
# directory as /work, so `import vc_metamodel.` resolves to the
# canonical metamodel — no copies.
#
# Usage:
#   ./run_measurements.sh              # Run all experiments (E0, E1, E2, E3)
#   ./run_measurements.sh e0           # Run only E0 (baseline overhead)
#   ./run_measurements.sh e1           # Run only E1 (check scalability)
#   ./run_measurements.sh e2           # Run only E2 (generate scalability)
#   ./run_measurements.sh e3           # Run only E3 (constraint sensitivity)
#   ./run_measurements.sh validate     # Quick validation pass (no timing)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTANCES_DIR="$SCRIPT_DIR/evaluation/instances"
RESULTS_DIR="$SCRIPT_DIR/evaluation/results"
REFINERY_IMAGE="ghcr.io/graphs4value/refinery-cli:latest"

RUNS="${RUNS:-10}"
WARMUP="${WARMUP:-1}"

# Git Bash path mangling prevention (for direct docker calls in validate)
export MSYS_NO_PATHCONV=1

# Scale points matching config.yaml
SCALE_POINTS=(1 3 5 10 15 20 30)

# ──────────────────────────────────────────────────────────
# OS detection. Windows (Git Bash / MSYS) needs backslash result paths for
# hyperfine's --export-json (it runs via cmd.exe) and powershell for hardware
# metadata. Linux/macOS use forward slashes and /proc + uname. Both branches are
# preserved so Martin's canonical Windows environment still works unchanged.
# ──────────────────────────────────────────────────────────
case "${OSTYPE:-}" in
    msys*|cygwin*|win32) IS_WINDOWS=1; SEP='\' ;;
    *)                   IS_WINDOWS=0; SEP='/' ;;
esac

# Diverse instance parameters (must match config.yaml `diverse:`)
DIVERSE_DEPTH_N=12
DIVERSE_DEPTHS=(1 2 3 4 6 12)
DIVERSE_SCALE_DEPTH=4

# ──────────────────────────────────────────────────────────
# Windows compatibility: Hyperfine is a native Windows binary.
# - It defaults to cmd.exe as shell (no bash features like || true)
# - --export-json paths must be Windows-style (no apostrophes)
# - Docker volume mounts must use C:/ paths when run via cmd.exe
# - For UNSAT cases, use --ignore-failure instead of || true
#
# If the project path contains special chars (e.g., apostrophe),
# we mirror the models/ tree to a safe location preserving structure.
# ──────────────────────────────────────────────────────────

if [[ "$SCRIPT_DIR" == *"'"* ]] || [[ "$SCRIPT_DIR" == *" "* ]]; then
    SAFE_DIR="$HOME/refinery_eval"
    mkdir -p "$SAFE_DIR/evaluation/instances" "$SAFE_DIR/evaluation/results"
    # Mirror models/ structure: metamodel at root, instances in subdir
    cp "$SCRIPT_DIR"/*.refinery "$SAFE_DIR/" 2>/dev/null || true
    cp "$INSTANCES_DIR"/*.problem "$SAFE_DIR/evaluation/instances/" 2>/dev/null || true
    MOUNT_DIR="$SAFE_DIR"
    MOUNT_DIR_WIN="$(cygpath -w "$SAFE_DIR")"
    INSTANCES_DIR_LOCAL="$SAFE_DIR/evaluation/instances"
    RESULTS_DIR_WIN="$(cygpath -w "$SAFE_DIR/evaluation/results")"
    RESULTS_DIR_LOCAL="$SAFE_DIR/evaluation/results"
    RESULTS_COPY_BACK="$RESULTS_DIR"
    echo "[Windows compat] Using safe paths:"
    echo "  Mount:   $MOUNT_DIR_WIN"
    echo "  Results: $RESULTS_DIR_WIN"
else
    MOUNT_DIR="$SCRIPT_DIR"
    MOUNT_DIR_WIN="$SCRIPT_DIR"
    INSTANCES_DIR_LOCAL="$INSTANCES_DIR"
    RESULTS_DIR_WIN="$RESULTS_DIR"
    RESULTS_DIR_LOCAL="$RESULTS_DIR"
    RESULTS_COPY_BACK=""
fi

mkdir -p "$RESULTS_DIR_LOCAL"

# Resolve hyperfine
HYPERFINE="${HYPERFINE:-hyperfine}"
if ! command -v "$HYPERFINE" &>/dev/null; then
    if [ -f "$HOME/bin/hyperfine.exe" ]; then
        HYPERFINE="$HOME/bin/hyperfine.exe"
    else
        echo "ERROR: hyperfine not found. Install it or set HYPERFINE env var."
        exit 1
    fi
fi

echo "=== VC Ecosystem Metamodel — Measurement Campaign ==="
echo "Hyperfine: $($HYPERFINE --version)"
echo "Docker: $(docker --version)"
echo "Mount:     $MOUNT_DIR"
echo "Instances: $INSTANCES_DIR_LOCAL"
echo "Results:   $RESULTS_DIR_LOCAL"
echo ""

# Docker mounts models/ as /work. Instances at /work/evaluation/instances/.
DOCKER_VOLUME="${MOUNT_DIR_WIN}:/work"

# Docker command builder for hyperfine.
#   checkk       -> refinery check -k   (concretizability; enforces error predicates)
#   consistency  -> refinery check      (partial-model consistency; ignores error preds)
#   generate     -> refinery generate   (full design-space exploration)
refinery_cmd() {
    local mode="$1"
    local problem_file="$2"
    local op
    case "$mode" in
        checkk)      op="check -k" ;;
        consistency) op="check" ;;
        generate)    op="generate" ;;
        *)           op="$mode" ;;
    esac
    echo "docker run --rm -v ${DOCKER_VOLUME} -w /work $REFINERY_IMAGE $op /work/evaluation/instances/$problem_file"
}

# ──────────────────────────────────────────────────────────
# Validation pass: run each instance once, check SAT/UNSAT
# ──────────────────────────────────────────────────────────
run_validate() {
    echo "=== Validation Pass ==="
    local pass=0
    local fail=0

    for f in "$INSTANCES_DIR_LOCAL"/*.problem; do
        fname="$(basename "$f")"
        echo -n "  $fname ... "

        output=$(docker run --rm \
            -v "$MOUNT_DIR:/work" -w /work \
            "$REFINERY_IMAGE" check -k "/work/evaluation/instances/$fname" 2>&1) || true

        if echo "$output" | grep -qi "inconsist\|error"; then
            result="UNSAT"
        else
            result="SAT"
        fi

        if [[ "$fname" == *"_unsat"* ]]; then
            expected="UNSAT"
        elif [[ "$fname" == *"_sat"* ]]; then
            expected="SAT"
        elif [[ "$fname" == *"G7"* ]]; then
            expected="UNSAT"
        else
            expected="SAT"
        fi

        if [ "$result" = "$expected" ]; then
            echo "OK ($result)"
            pass=$((pass + 1))
        else
            echo "FAIL (expected $expected, got $result)"
            fail=$((fail + 1))
        fi
    done

    echo ""
    echo "Validation: $pass passed, $fail failed"
    [ "$fail" -eq 0 ] || exit 1
}

# ──────────────────────────────────────────────────────────
# E0: Baseline — Docker + JVM startup overhead (no-op problem)
# ──────────────────────────────────────────────────────────
run_e0() {
    echo "=== E0: Baseline (Docker + JVM overhead) ==="
    local fname="noop.problem"
    local outfile="${RESULTS_DIR_WIN}${SEP}e0_baseline.json"

    if [ ! -f "$INSTANCES_DIR_LOCAL/$fname" ]; then
        echo "  SKIP: $fname not found"
        return
    fi

    echo "  Benchmarking: check -k $fname (no-op baseline)"
    "$HYPERFINE" \
        --runs "$RUNS" \
        --warmup "$WARMUP" \
        --export-json "$outfile" \
        --command-name "baseline_noop" \
        "$(refinery_cmd checkk "$fname")"
    echo ""
}

# ──────────────────────────────────────────────────────────
# EC: Consistency check (plain `check`, no -k) — SAT + UNSAT at each scale.
# Key property (T12): plain `check` returns SAT (consistent) on EVERY instance,
# including _unsat variants, because it does not enforce error predicates. Only
# `check -k` (E1) distinguishes SAT from UNSAT. This experiment demonstrates that
# distinction quantitatively.
# ──────────────────────────────────────────────────────────
run_ec() {
    echo "=== EC: Consistency Check (plain check, no -k) ==="
    for n in "${SCALE_POINTS[@]}"; do
        for variant in sat unsat; do
            local fname="scale_${n}_${variant}.problem"
            local outfile="${RESULTS_DIR_WIN}${SEP}ec_consistency_S${n}_${variant}.json"

            if [ ! -f "$INSTANCES_DIR_LOCAL/$fname" ]; then
                echo "  SKIP: $fname not found"
                continue
            fi

            echo "  Benchmarking: check $fname"
            "$HYPERFINE" \
                --runs "$RUNS" \
                --warmup "$WARMUP" \
                --export-json "$outfile" \
                --command-name "consistency_S${n}_${variant}" \
                "$(refinery_cmd consistency "$fname")"
            echo ""
        done
    done
}

# ──────────────────────────────────────────────────────────
# E1: Check scalability (SAT + UNSAT at each scale point)
# ──────────────────────────────────────────────────────────
run_e1() {
    echo "=== E1: Check Scalability ==="
    for n in "${SCALE_POINTS[@]}"; do
        for variant in sat unsat; do
            local fname="scale_${n}_${variant}.problem"
            local outfile="${RESULTS_DIR_WIN}${SEP}e1_check_S${n}_${variant}.json"

            if [ ! -f "$INSTANCES_DIR_LOCAL/$fname" ]; then
                echo "  SKIP: $fname not found"
                continue
            fi

            echo "  Benchmarking: check -k $fname"
            local ignore_flag=""
            [ "$variant" = "unsat" ] && ignore_flag="--ignore-failure"
            "$HYPERFINE" \
                --runs "$RUNS" \
                --warmup "$WARMUP" \
                $ignore_flag \
                --export-json "$outfile" \
                --command-name "check_S${n}_${variant}" \
                "$(refinery_cmd checkk "$fname")"
            echo ""
        done
    done
}

# ──────────────────────────────────────────────────────────
# E2: Generate scalability (SAT only)
# ──────────────────────────────────────────────────────────
run_e2() {
    echo "=== E2: Generate Scalability ==="
    for n in "${SCALE_POINTS[@]}"; do
        local fname="scale_${n}_sat.problem"
        local outfile="${RESULTS_DIR_WIN}${SEP}e2_generate_S${n}_sat.json"

        if [ ! -f "$INSTANCES_DIR_LOCAL/$fname" ]; then
            echo "  SKIP: $fname not found"
            continue
        fi

        echo "  Benchmarking: generate $fname"
        "$HYPERFINE" \
            --runs "$RUNS" \
            --warmup "$WARMUP" \
            --export-json "$outfile" \
            --command-name "generate_S${n}_sat" \
            "$(refinery_cmd generate "$fname")"
        echo ""
    done
}

# ──────────────────────────────────────────────────────────
# E3: Constraint sensitivity (8 governance configs at N=3)
# ──────────────────────────────────────────────────────────
run_e3() {
    echo "=== E3: Constraint Sensitivity ==="
    for i in 0 1 2 3 4 5 6 7; do
        local fname="sensitivity_G${i}.problem"
        local outfile="${RESULTS_DIR_WIN}${SEP}e3_sensitivity_G${i}.json"

        if [ ! -f "$INSTANCES_DIR_LOCAL/$fname" ]; then
            echo "  SKIP: $fname not found"
            continue
        fi

        echo "  Benchmarking: check -k $fname"
        local ignore_flag=""
        [ "$i" = "7" ] && ignore_flag="--ignore-failure"
        "$HYPERFINE" \
            --runs "$RUNS" \
            --warmup "$WARMUP" \
            $ignore_flag \
            --export-json "$outfile" \
            --command-name "check_G${i}" \
            "$(refinery_cmd check "$fname")"
        echo ""
    done
}

# ──────────────────────────────────────────────────────────
# ED: Structurally diverse instances (AF02 / Q-007).
# Two families of chained instances (a credential can describe the value of its
# parent credential): a depth sweep at fixed N=12, and a depth-fixed N-sweep.
# Measures concretizability (check -k) and, on SAT instances, generation.
# ──────────────────────────────────────────────────────────
run_ed() {
    echo "=== ED: Structurally Diverse Instances (chained) ==="

    # (a) Depth sweep at fixed N — check -k + generate (all SAT)
    for d in "${DIVERSE_DEPTHS[@]}"; do
        local fname="diverse_depth_D${d}_N${DIVERSE_DEPTH_N}_sat.problem"
        if [ ! -f "$INSTANCES_DIR_LOCAL/$fname" ]; then
            echo "  SKIP: $fname not found"
            continue
        fi
        echo "  Benchmarking: check -k $fname"
        "$HYPERFINE" --runs "$RUNS" --warmup "$WARMUP" \
            --export-json "${RESULTS_DIR_WIN}${SEP}ed_depth_check_D${d}_N${DIVERSE_DEPTH_N}.json" \
            --command-name "ed_check_D${d}" \
            "$(refinery_cmd checkk "$fname")"
        echo "  Benchmarking: generate $fname"
        "$HYPERFINE" --runs "$RUNS" --warmup "$WARMUP" \
            --export-json "${RESULTS_DIR_WIN}${SEP}ed_depth_generate_D${d}_N${DIVERSE_DEPTH_N}.json" \
            --command-name "ed_generate_D${d}" \
            "$(refinery_cmd generate "$fname")"
        echo ""
    done

    # (b) Depth-fixed N-sweep — check -k (SAT + UNSAT) + generate (SAT)
    for n in "${SCALE_POINTS[@]}"; do
        for variant in sat unsat; do
            local fname="diverse_scale_D${DIVERSE_SCALE_DEPTH}_S${n}_${variant}.problem"
            if [ ! -f "$INSTANCES_DIR_LOCAL/$fname" ]; then
                echo "  SKIP: $fname not found"
                continue
            fi
            echo "  Benchmarking: check -k $fname"
            local ignore_flag=""
            [ "$variant" = "unsat" ] && ignore_flag="--ignore-failure"
            "$HYPERFINE" --runs "$RUNS" --warmup "$WARMUP" $ignore_flag \
                --export-json "${RESULTS_DIR_WIN}${SEP}ed_scale_check_D${DIVERSE_SCALE_DEPTH}_S${n}_${variant}.json" \
                --command-name "ed_scale_check_S${n}_${variant}" \
                "$(refinery_cmd checkk "$fname")"
            echo ""
        done
        local satf="diverse_scale_D${DIVERSE_SCALE_DEPTH}_S${n}_sat.problem"
        if [ -f "$INSTANCES_DIR_LOCAL/$satf" ]; then
            echo "  Benchmarking: generate $satf"
            "$HYPERFINE" --runs "$RUNS" --warmup "$WARMUP" \
                --export-json "${RESULTS_DIR_WIN}${SEP}ed_scale_generate_D${DIVERSE_SCALE_DEPTH}_S${n}.json" \
                --command-name "ed_scale_generate_S${n}" \
                "$(refinery_cmd generate "$satf")"
            echo ""
        fi
    done
}

# ──────────────────────────────────────────────────────────
# Capture environment metadata
# ──────────────────────────────────────────────────────────
capture_environment() {
    local envfile="$RESULTS_DIR_LOCAL/environment.json"
    echo "Capturing environment metadata..."

    local refinery_digest
    refinery_digest=$(docker inspect "$REFINERY_IMAGE" --format='{{.Id}}' 2>/dev/null || echo "unknown")

    local docker_version
    docker_version=$(docker --version 2>/dev/null || echo "unknown")

    local hyperfine_version
    hyperfine_version=$("$HYPERFINE" --version 2>/dev/null || echo "unknown")

    local cpu_model ram_gb os_version
    if [ "$IS_WINDOWS" -eq 1 ]; then
        cpu_model=$(powershell.exe -Command "(Get-CimInstance Win32_Processor).Name" 2>/dev/null | tr -d '\r' || echo "unknown")
        ram_gb=$(powershell.exe -Command "[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 1)" 2>/dev/null | tr -d '\r' || echo "unknown")
        os_version=$(powershell.exe -Command "(Get-CimInstance Win32_OperatingSystem).Caption + ' ' + (Get-CimInstance Win32_OperatingSystem).Version" 2>/dev/null | tr -d '\r' || echo "unknown")
    else
        # Linux/macOS: read /proc and uname. On WSL2, RAM is the memory the Linux
        # VM sees (typically ~half of physical), which is the honest figure for
        # what the container had available.
        cpu_model=$(grep -m1 "model name" /proc/cpuinfo 2>/dev/null | cut -d: -f2 | sed 's/^ *//' || echo "unknown")
        [ -z "$cpu_model" ] && cpu_model=$(uname -p 2>/dev/null || echo "unknown")
        local mem_kb
        mem_kb=$(grep -m1 MemTotal /proc/meminfo 2>/dev/null | awk '{print $2}')
        if [ -n "$mem_kb" ]; then
            ram_gb=$(awk "BEGIN{printf \"%.1f\", $mem_kb/1048576}")
        else
            ram_gb="unknown"
        fi
        os_version="$(uname -s) $(uname -r)"
        if [ -r /etc/os-release ]; then
            os_version="$(. /etc/os-release && echo "$PRETTY_NAME") ($(uname -s) $(uname -r))"
        fi
    fi

    cat > "$envfile" <<EOF
{
    "refinery_image": "$REFINERY_IMAGE",
    "refinery_digest": "$refinery_digest",
    "docker_version": "$docker_version",
    "hyperfine_version": "$hyperfine_version",
    "cpu": "$cpu_model",
    "ram_gb": "$ram_gb",
    "os": "$os_version",
    "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
    "runs_per_benchmark": $RUNS,
    "warmup_runs": $WARMUP
}
EOF
    echo "  Saved to $envfile"
}

# ──────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────
case "${1:-all}" in
    validate)
        run_validate
        ;;
    e0)
        capture_environment
        run_e0
        ;;
    ec)
        capture_environment
        run_ec
        ;;
    e1)
        capture_environment
        run_e1
        ;;
    e2)
        capture_environment
        run_e2
        ;;
    e3)
        capture_environment
        run_e3
        ;;
    ed)
        capture_environment
        run_ed
        ;;
    all)
        capture_environment
        run_e0
        run_ec
        run_e1
        run_e2
        run_e3
        run_ed
        ;;
    *)
        echo "Usage: $0 {all|e0|ec|e1|e2|e3|ed|validate}"
        exit 1
        ;;
esac

# Copy results back if we used a safe directory
if [ -n "${RESULTS_COPY_BACK:-}" ]; then
    echo "Copying results from $RESULTS_DIR_LOCAL to $RESULTS_COPY_BACK ..."
    mkdir -p "$RESULTS_COPY_BACK"
    cp "$RESULTS_DIR_LOCAL"/*.json "$RESULTS_COPY_BACK/" 2>/dev/null || true
    echo "  Done."
fi

echo ""
echo "=== Done ==="
echo "Results in: ${RESULTS_COPY_BACK:-$RESULTS_DIR_LOCAL}/"
ls -la "${RESULTS_COPY_BACK:-$RESULTS_DIR_LOCAL}/"*.json 2>/dev/null || echo "(no results yet)"
