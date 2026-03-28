#!/usr/bin/env bash
# Launch Refinery web editor with the models directory mounted.
# Imports in .problem files (e.g., "import vc_metamodel.") resolve
# against .refinery files in this directory via the /work mount.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

docker run --rm -p 8888:8888 -v "$SCRIPT_DIR:/work" ghcr.io/graphs4value/refinery:latest

echo "Refinery editor available at http://localhost:8888"
