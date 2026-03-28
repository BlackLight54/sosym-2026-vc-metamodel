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

RUNS=10
WARMUP=1

# Git Bash path mangling prevention (for direct docker calls in validate)
export MSYS_NO_PATHCONV=1

# Scale points matching config.yaml
SCALE_POINTS=(1 3 5 10 15 20 30)

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

# Docker command builder for hyperfine (runs via cmd.exe, not bash)
refinery_cmd() {
    local mode="$1"
    local problem_file="$2"

    if [ "$mode" = "check" ]; then
        echo "docker run --rm -v ${DOCKER_VOLUME} -w /work $REFINERY_IMAGE check -k /work/evaluation/instances/$problem_file"
    else
        echo "docker run --rm -v ${DOCKER_VOLUME} -w /work $REFINERY_IMAGE $mode /work/evaluation/instances/$problem_file"
    fi
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
    local outfile="$RESULTS_DIR_WIN\\e0_baseline.json"

    if [ ! -f "$INSTANCES_DIR_LOCAL/$fname" ]; then
        echo "  SKIP: $fname not found"
        return
    fi

    echo "  Benchmarking: check $fname (no-op baseline)"
    "$HYPERFINE" \
        --runs "$RUNS" \
        --warmup "$WARMUP" \
        --export-json "$outfile" \
        --command-name "baseline_noop" \
        "$(refinery_cmd check "$fname")"
    echo ""
}

# ──────────────────────────────────────────────────────────
# E1: Check scalability (SAT + UNSAT at each scale point)
# ──────────────────────────────────────────────────────────
run_e1() {
    echo "=== E1: Check Scalability ==="
    for n in "${SCALE_POINTS[@]}"; do
        for variant in sat unsat; do
            local fname="scale_${n}_${variant}.problem"
            local outfile="$RESULTS_DIR_WIN\\e1_check_S${n}_${variant}.json"

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
                "$(refinery_cmd check "$fname")"
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
        local outfile="$RESULTS_DIR_WIN\\e2_generate_S${n}_sat.json"

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
        local outfile="$RESULTS_DIR_WIN\\e3_sensitivity_G${i}.json"

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

    local cpu_model
    cpu_model=$(powershell.exe -Command "(Get-CimInstance Win32_Processor).Name" 2>/dev/null | tr -d '\r' || echo "unknown")

    local ram_gb
    ram_gb=$(powershell.exe -Command "[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 1)" 2>/dev/null | tr -d '\r' || echo "unknown")

    local os_version
    os_version=$(powershell.exe -Command "(Get-CimInstance Win32_OperatingSystem).Caption + ' ' + (Get-CimInstance Win32_OperatingSystem).Version" 2>/dev/null | tr -d '\r' || echo "unknown")

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
    all)
        capture_environment
        run_e0
        run_e1
        run_e2
        run_e3
        ;;
    *)
        echo "Usage: $0 {all|e0|e1|e2|e3|validate}"
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
