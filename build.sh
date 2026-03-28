#!/usr/bin/env bash
# build.sh — Convert sections/*.md to pandoc/*.tex via pandoc
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
OUT_DIR="pandoc"
DEFAULTS="pandoc/defaults.yaml"

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

# --- Convert each section ---
converted=0
for md in "$SECTIONS_DIR"/[0-9]*.md; do
    [ -f "$md" ] || continue
    basename=$(basename "$md" .md)
    outfile="$OUT_DIR/${basename}.tex"
    echo "  $md → $outfile"

    pandoc "$md" \
        --defaults "$DEFAULTS" \
        --metadata mode="$MODE" \
        -o "$outfile"

    converted=$((converted + 1))
done

# --- Convert teaser figure (non-numbered source) ---
if [ -f "$SECTIONS_DIR/teaser.md" ]; then
    echo "  $SECTIONS_DIR/teaser.md → $OUT_DIR/teaser.tex"
    pandoc "$SECTIONS_DIR/teaser.md" \
        --defaults "$DEFAULTS" \
        --metadata mode="$MODE" \
        -o "$OUT_DIR/teaser.tex"
fi

echo ""
echo "Converted $converted section(s)."

if [ "$converted" -eq 0 ]; then
    echo ""
    echo "WARNING: No section files found matching $SECTIONS_DIR/[0-9]*.md"
fi

echo ""
echo "Compile (local):  latexmk -pdf pandoc/main.tex"
