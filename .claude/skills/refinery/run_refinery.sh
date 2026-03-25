#!/usr/bin/env bash
# run_refinery.sh — Run Refinery CLI commands via Docker
#
# Usage:
#   ./run_refinery.sh generate <file.problem> [-n 5] [-o output.refinery]
#   ./run_refinery.sh check <file.problem>
#   ./run_refinery.sh concretize <file.problem> [-o output.refinery]
#
# Commands:
#   generate   Generate model instances from a partial specification
#   check      Check partial model consistency
#   concretize Concretize a partial model (resolve all unknowns)
#
# Options (generate):
#   -n NUM     Maximum number of solutions (default: 1)
#   -o FILE    Output file (default: stdout)
#   -r SEED    Random seed (default: 1)
#   -s SCOPE   Extra scope constraints
#   -S SCOPE   Override scope constraints
#
# Options (check):
#   -k         Check concretization of the partial model
#
# Options (concretize):
#   -o FILE    Output file (default: stdout)
#
# Examples:
#   ./run_refinery.sh generate prior_work/dse-vc-refinery/vc_model.new.problem
#   ./run_refinery.sh generate prior_work/dse-vc-refinery/vc_model.new.problem -n 5
#   ./run_refinery.sh check prior_work/dse-vc-refinery/vc_model.new.problem

set -euo pipefail

REFINERY_IMAGE="ghcr.io/graphs4value/refinery-cli:latest"

if [ $# -lt 2 ]; then
    echo "Usage: $0 <generate|check|concretize> <file.problem> [options...]"
    echo "Run '$0 --help' for details."
    exit 1
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    head -28 "$0" | tail -26
    exit 0
fi

COMMAND="$1"
INPUT_FILE="$2"
shift 2

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File not found: $INPUT_FILE"
    exit 1
fi

# Resolve to absolute path for Docker mount
ABS_INPUT="$(cd "$(dirname "$INPUT_FILE")" && pwd)/$(basename "$INPUT_FILE")"
FILE_BASE="$(basename "$INPUT_FILE")"
HOST_DIR="$(dirname "$ABS_INPUT")"

echo "Running: refinery $COMMAND $FILE_BASE $*"
echo "---"

# MSYS_NO_PATHCONV prevents Git Bash on Windows from mangling /work paths
MSYS_NO_PATHCONV=1 docker run --rm \
    -v "$HOST_DIR:/work" \
    "$REFINERY_IMAGE" \
    "$COMMAND" "/work/$FILE_BASE" "$@"
