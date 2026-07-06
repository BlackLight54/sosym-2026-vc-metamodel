# Co-Author Guide

## Repository structure

This is the **main authoring repository** for the SoSyM journal article (successor of the
withdrawn MODELS'26 submission, whose frozen record lives in `BlackLight54/ACM-MODELS-26`).
Everything reachable from here:

| Path | What it is |
|------|-----------|
| `sections/`, `pandoc/` | Paper source (Markdown, authoritative) and generated LaTeX |
| `zettelkasten/` | Knowledge base: notes, maps, claims, decisions (`PIPELINE.md` = stage contract) |
| `context/`, `prompts/`, `skills/`, `.claude/` | Pipeline state, task prompts, automation, memory |
| `models/` | Submodule → `ACM-MODELS-26-code` (Refinery models, evaluation harness) |
| `prior_work/dse-vc-refinery` | Submodule → prior Refinery repo |
| `prior_work/ese-vc-fca` | Submodule → prior artifact repo |
| `overleaf/` | Attachment point for the Overleaf project (see `overleaf/README.md`) |

Clone with submodules: `git clone --recurse-submodules <url>`.

## What to edit

Edit the **Markdown files** in `sections/`:

| Section | File |
|---------|------|
| Abstract | `sections/00_abstract.md` |
| Introduction | `sections/01_introduction.md` |
| Background | `sections/02_background.md` |
| Overview | `sections/03_overview.md` |
| Approach | `sections/04_approach.md` |
| Evaluation | `sections/05_evaluation.md` |
| Related Work | `sections/06_related_work.md` |
| Conclusion | `sections/07_conclusion.md` |

These are the source of truth. The `.tex` files in `pandoc/` are generated output — do not edit them directly, unless we are just polishing.

## Converting to LaTeX / PDF

Run the build script to convert Markdown to LaTeX:

```bash
./build.sh            # draft mode (keeps @TODO markers as \todo{})
./build.sh submission # strips markers
```

Then compile the PDF:

```bash
latexmk -pdf pandoc/main.tex
```

**Requires:** [pandoc](https://pandoc.org/installing.html) and a LaTeX distribution (TeX Live, MiKTeX, etc.).

## Overleaf

The generated LaTeX is pushed to Overleaf via git. After building locally, the `pandoc/` directory is what Overleaf sees. You can view and compile there, but edits should go in the Markdown files, not on Overleaf.

## Writing conventions

- **Math:** `$...$` for inline, `$$...$$` for display.
- **Citations:** If you know the BibTeX key, use it. Otherwise leave a marker: `%% @CITE: description %%`
- **TODOs:** `%% @TODO: description %%`
- **Figures:** Source files go in `pandoc/assets/`.
- **References:** Managed in Zotero, exported to `pandoc/bibliography/references.bib`.

## Notes

- Double-blind submission — no author-identifying information in the text.
- `\todo{}` annotations in draft PDFs are internal markers, removed before submission.
