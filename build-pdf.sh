#!/usr/bin/env bash
# build-pdf.sh — Full pipeline: Markdown → LaTeX → PDF
set -eo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
LOCAL="${LOCALAPPDATA:-$USERPROFILE/AppData/Local}"
export PATH="$PATH:$LOCAL/Pandoc:$LOCAL/Programs/MiKTeX/miktex/bin/x64"
bash build.sh draft
latexmk
