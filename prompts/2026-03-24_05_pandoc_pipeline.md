# Prompt: Build pandoc pipeline

**Task type:** Infrastructure (Claude Code)
**Target:** `Makefile` or `build.sh`, pandoc filters, templates

## Instruction for Claude Code

Read AUTHOR_NOTES.md "Setup TODO" section and build the Markdown → LaTeX → PDF pipeline.

## Requirements

1. **Build script** (`Makefile` or `build.sh`): converts each `sections/*.md` file to `.tex` via pandoc, then assembles into a single document.
2. **Venue template** (`tex/template/main.tex`): ACM sigconf preamble using `\documentclass[sigconf,review,anonymous]{acmart}` with `\bibliographystyle{ACM-Reference-Format}`. Uses `\input{}` per section.
3. **Lua filter — strip markers**: Remove `%% ... %%` Obsidian comments (or convert to `\todo{}` for draft mode).
4. **Lua filter — citations**: Convert `%% @CITE: key %%` to `\cite{key}` where key exists in `.bib`.
5. **Lua filter — environments**: Pass through `\begin{definition}...\end{definition}` etc. as raw LaTeX.
6. **Lua filter — figures**: Convert figure metadata blocks to `\begin{figure}...\end{figure}`.
7. **`.gitignore`** for build artifacts (`build/`, `*.aux`, `*.log`, etc.).

## Constraints

- The ACM template files are already in `tex/template/`. Use them.
- pandoc must be invoked with appropriate flags for math passthrough (`$...$` → `$...$`).
- Display math `$$...$$`: pandoc converts to `\[...\]` by default — this is fine for ACM sigconf.
- The pipeline should work on Windows (Martin's platform) with bash (Git Bash / WSL).
- Keep it simple. Don't over-engineer the filters — we can iterate.

## Test

After building, run the pipeline on a test section file and verify the output compiles with `pdflatex` or `latexmk`.

## After

- Pipeline files created.
- Update TODO.md: mark done.
- Update AUTHOR_NOTES.md "Setup TODO" checkboxes as appropriate.
