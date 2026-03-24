# Figures

Source files for paper figures. Designed via `skills/figure_design`, drafted by LLM, refined by Martin.

## Naming

Filename matches label: `fig_example.pdf` → label `fig:example`.

## Formats

- `.tikz` / `.tex` — TikZ diagrams (precise positioning, good for protocol flows and architecture)
- `.py` — generated plots; output to PDF (apply clean style, not matplotlib defaults)
- `.excalidraw` — hand-drawn-style; export to SVG/PDF (good for quick iteration)
- `.svg` — vector graphics; convert to PDF for LaTeX (editable in Inkscape/Illustrator)
- `.mermaid` — quick planning diagrams; convert to TikZ/SVG for publication

## Visual vocabulary

See `STYLE.md` in this directory (created by `skills/figure_design` when multiple figures exist). Ensures consistent colors, shapes, and conventions across all figures.

## Iteration

Figures are iterated during writing, not deferred. When the argument evolves, the figure evolves too. The `skills/figure_design` iteration protocol tracks this.

## Quality checklist (before submission)

- [ ] All figures referenced in text near where they appear
- [ ] Captions are self-contained (conclusion first, then panel descriptions)
- [ ] Readable in grayscale
- [ ] Readable at column width (text not too small)
- [ ] Visual vocabulary consistent across figures
- [ ] No decorative elements — every visual element encodes information
- [ ] Source files present in this directory for all figures
