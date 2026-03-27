#!/usr/bin/env bash
# build.sh — Convert sections/*.md to tex/sections/*.tex via pandoc
#
# Usage:
#   ./build.sh              # draft mode (markers → \todo{})
#   ./build.sh draft        # same
#   ./build.sh submission   # markers stripped
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

MODE="${1:-draft}"
SECTIONS_DIR="sections"
OUT_DIR="tex/sections"
FILTER_DIR="pandoc/filters"

# --- Validate mode ---
if [[ "$MODE" != "draft" && "$MODE" != "submission" ]]; then
    echo "ERROR: Unknown mode '$MODE'. Use 'draft' or 'submission'."
    exit 1
fi

# --- Check pandoc ---
if ! command -v pandoc &> /dev/null; then
    echo "ERROR: pandoc not found."
    echo ""
    echo "Install pandoc:"
    echo "  Windows:  winget install JohnMacFarlane.Pandoc"
    echo "  macOS:    brew install pandoc"
    echo "  Ubuntu:   sudo apt install pandoc"
    echo "  Or:       https://pandoc.org/installing.html"
    exit 1
fi

echo "pandoc $(pandoc --version | head -1 | awk '{print $2}')"
echo "Mode: $MODE"
echo ""

# --- Ensure output directory exists ---
mkdir -p "$OUT_DIR"

# --- Convert each section ---
converted=0
for md in "$SECTIONS_DIR"/[0-9]*.md; do
    [ -f "$md" ] || continue
    basename=$(basename "$md" .md)
    outfile="$OUT_DIR/${basename}.tex"
    echo "  $md → $outfile"

    pandoc "$md" \
        --from markdown+raw_tex+tex_math_dollars \
        --to latex \
        --lua-filter="$FILTER_DIR/cut-candidates.lua" \
        --lua-filter="$FILTER_DIR/tables.lua" \
        --lua-filter="$FILTER_DIR/markers.lua" \
        --lua-filter="$FILTER_DIR/code-blocks.lua" \
        --natbib \
        --metadata mode="$MODE" \
        --syntax-highlighting=none \
        --wrap=preserve \
        -o "$outfile"

    converted=$((converted + 1))
done

echo ""
echo "Converted $converted section(s)."

if [ "$converted" -eq 0 ]; then
    echo ""
    echo "WARNING: No section files found matching $SECTIONS_DIR/[0-9]*.md"
fi

echo ""
echo "Compile (local):  latexmk -pdf tex/main.tex"
echo "Compile (manual): TEXINPUTS=./tex/template//: pdflatex tex/main && bibtex main && pdflatex tex/main && pdflatex tex/main"
