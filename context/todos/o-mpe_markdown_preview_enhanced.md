---
id: "O-MPE"
short: "mpe-pandoc-preview"
title: "Integrate Markdown Preview Enhanced with Pandoc for in-editor rendering"
status: pending
priority: medium
depends_on: []
binding_claims: []
target: ".vscode/, pandoc/"
pipeline: ""
assigned: "martin"
created: "2026-03-29"
---

## Goal

Set up the [Markdown Preview Enhanced](https://shd101wyy.github.io/markdown-preview-enhanced/) VS Code extension to render section files (`sections/*.md`) directly in VS Code, using our existing Pandoc pipeline so that annotations, math, citations, and cross-references render correctly in the preview.

## Context

Section files use Obsidian Markdown with Mathpix math conventions, custom annotation divs/spans (`.todo`, `.cite`, `.formal`, `.scaffold`, `.meta`, `.figure`), natbib-style citations (`[@key]`, `@key`), and cross-references (`\autoref{}`). The current authoring loop requires either Obsidian or a full Pandoc build to see rendered output. An in-editor preview would tighten the feedback loop during drafting and revision.

## Acceptance criteria

1. MPE installed and configured in `.vscode/extensions.json` (recommended extension) and `.vscode/settings.json`.
2. MPE uses our Pandoc executable (at `AppData/Local/Pandoc`) as the rendering backend, not its built-in Markdown renderer.
3. Math (`$...$`, `$$...$$`) renders correctly in preview.
4. Citations render (at minimum as keys, ideally resolved via `.bib`).
5. Custom annotation divs/spans render visibly (e.g., colored boxes or highlighted spans) so authors see where annotations are.
6. Fenced divs for environments (`::: {.theorem}`, `::: {.definition}`) render as labeled blocks.
7. Document the configuration in a short README or in `AUTHOR_NOTES.md` so all co-authors can replicate the setup.

## Implementation notes

- MPE supports Pandoc as a rendering backend via `"markdown-preview-enhanced.usePandocParser": true` and related settings.
- May need a custom CSS file for MPE to style annotation divs (`.todo` → yellow highlight, `.cite` → blue, etc.).
- Check whether our Lua filters (`pandoc/filters/annotations.lua`, `pandoc/filters/code-blocks.lua`) can run in the MPE Pandoc pipeline or if a simplified filter is needed.
- The `defaults.yaml` or a separate MPE-specific defaults file may be needed to point at the right bibliography and CSL.
- If full Pandoc rendering is too slow for interactive preview, consider a lightweight mode that handles math + annotations but skips citation resolution.
