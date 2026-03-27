#!/usr/bin/env bash
# run_measurements.sh — Orchestrate Hyperfine measurement campaign
#
# Usage:
#   ./run_measurements.sh              # Run all experiments (E1, E2, E3)
#   ./run_measurements.sh e1           # Run only E1 (check scalability)
#   ./run_measurements.sh e2           # Run only E2 (generate scalability)
#   ./run_measurements.sh e3           # Run only E3 (constraint sensitivity)
#   ./run_measurements.sh validate     # Quick validation pass (no timing)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTANCES_DIR="$SCRIPT_DIR/instances"
RESULTS_DIR="$SCRIPT_DIR/results"
REFINERY_IMAGE="ghcr.io/graphs4value/refinery-cli:latest"

RUNS=10
WARMUP=1
SHELL_FLAG="--shell bash"  # Required on Windows/Git Bash; Hyperfine defaults to cmd.exe

# Git Bash path mangling prevention (inherited by Hyperfine subshells)
export MSYS_NO_PATHCONV=1

# Scale points matching config.yaml
SCALE_POINTS=(1 3 5 10 15 20 30)

mkdir -p "$RESULTS_DIR"

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
echo "Instances: $INSTANCES_DIR"
echo "Results:   $RESULTS_DIR"
echo ""

# Docker command builder (MSYS_NO_PATHCONV prevents Git Bash path mangling)
# $3: if "allow_fail", appends "|| true" so Hyperfine doesn't abort on UNSAT exit code 1
refinery_cmd() {
    local mode="$1"
    local problem_file="$2"
    local allow_fail="${3:-}"
    local suffix=""
    [ "$allow_fail" = "allow_fail" ] && suffix=" || true"

    # For "check" mode, use "check -k" (concretizability — enforces error predicates)
    if [ "$mode" = "check" ]; then
        echo "MSYS_NO_PATHCONV=1 docker run --rm -v \"$INSTANCES_DIR:/work\" -w /work $REFINERY_IMAGE check -k /work/$problem_file${suffix}"
    else
        echo "MSYS_NO_PATHCONV=1 docker run --rm -v \"$INSTANCES_DIR:/work\" -w /work $REFINERY_IMAGE $mode /work/$problem_file${suffix}"
    fi
}

# ──────────────────────────────────────────────────────────
# Validation pass: run each instance once, check SAT/UNSAT
# ──────────────────────────────────────────────────────────
run_validate() {
    echo "=== Validation Pass ==="
    local pass=0
    local fail=0

    for f in "$INSTANCES_DIR"/*.problem; do
        fname="$(basename "$f")"
        echo -n "  $fname ... "

        output=$(MSYS_NO_PATHCONV=1 docker run --rm \
            -v "$INSTANCES_DIR:/work" -w /work \
            "$REFINERY_IMAGE" check -k "/work/$fname" 2>&1) || true

        if echo "$output" | grep -qi "inconsist\|error"; then
            result="UNSAT"
        else
            result="SAT"
        fi

        # Check expected result
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
            ((pass++))
        else
            echo "FAIL (expected $expected, got $result)"
            ((fail++))
        fi
    done

    echo ""
    echo "Validation: $pass passed, $fail failed"
    [ "$fail" -eq 0 ] || exit 1
}

# ──────────────────────────────────────────────────────────
# E1: Check scalability (SAT + UNSAT at each scale point)
# ──────────────────────────────────────────────────────────
run_e1() {
    echo "=== E1: Check Scalability ==="
    for n in "${SCALE_POINTS[@]}"; do
        for variant in sat unsat; do
            local fname="scale_${n}_${variant}.problem"
            local outfile="$RESULTS_DIR/e1_check_S${n}_${variant}.json"

            if [ ! -f "$INSTANCES_DIR/$fname" ]; then
                echo "  SKIP: $fname not found"
                continue
            fi

            echo "  Benchmarking: check -k $fname"
            local fail_flag=""
            [ "$variant" = "unsat" ] && fail_flag="allow_fail"
            "$HYPERFINE" \
                $SHELL_FLAG \
                --runs "$RUNS" \
                --warmup "$WARMUP" \
                --export-json "$outfile" \
                --command-name "check_S${n}_${variant}" \
                "$(refinery_cmd check "$fname" "$fail_flag")"
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
        local outfile="$RESULTS_DIR/e2_generate_S${n}_sat.json"

        if [ ! -f "$INSTANCES_DIR/$fname" ]; then
            echo "  SKIP: $fname not found"
            continue
        fi

        echo "  Benchmarking: generate $fname"
        "$HYPERFINE" \
            $SHELL_FLAG \
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
        local outfile="$RESULTS_DIR/e3_sensitivity_G${i}.json"

        if [ ! -f "$INSTANCES_DIR/$fname" ]; then
            echo "  SKIP: $fname not found"
            continue
        fi

        echo "  Benchmarking: check -k $fname"
        local fail_flag=""
        [ "$i" = "7" ] && fail_flag="allow_fail"
        "$HYPERFINE" \
            $SHELL_FLAG \
            --runs "$RUNS" \
            --warmup "$WARMUP" \
            --export-json "$outfile" \
            --command-name "check_G${i}" \
            "$(refinery_cmd check "$fname" "$fail_flag")"
        echo ""
    done
}

# ──────────────────────────────────────────────────────────
# Capture environment metadata
# ──────────────────────────────────────────────────────────
capture_environment() {
    local envfile="$RESULTS_DIR/environment.json"
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
        run_e1
        run_e2
        run_e3
        ;;
    *)
        echo "Usage: $0 {all|e1|e2|e3|validate}"
        exit 1
        ;;
esac

echo ""
echo "=== Done ==="
echo "Results in: $RESULTS_DIR/"
ls -la "$RESULTS_DIR/"*.json 2>/dev/null || echo "(no results yet)"
