---
description: Convert Markdown section files to LaTeX using pandoc and the project's Lua filters. Use when building LaTeX locally, checking conversion output, or preparing for an Overleaf push.
---

# Skill: Pandoc Convert

**Purpose:** Run the pandoc build pipeline to convert `sections/*.md` → `pandoc/*.tex`. This is the lightweight conversion step — no pre-flight checks, no Overleaf push. Use `overleaf_push` when you also need to push.

## Trigger

- "Convert to LaTeX"
- "Run pandoc"
- "Build LaTeX"
- "Convert sections"

## Arguments

- **mode** (optional): `draft` (default) or `submission`.
  - `draft`: Annotation divs/spans (`.todo`, `.cite`, `.formal`, etc.) become `\todo{}` annotations.
  - `submission`: markers are stripped entirely.
- If the user says "submission mode", "clean build", or "strip markers", use `submission`. Otherwise default to `draft`.

## Steps

### 1. Run the build

```bash
bash build.sh [mode]
```

Report the pandoc version and number of sections converted from the script output.

### 2. Verify output

For each section file that was converted, check:

- The `.tex` file exists in `pandoc/`.
- The file is non-empty.
- Math delimiters survived: spot-check that `$...$` passages in the source appear as `$...$` or `\(...\)` in the output, and `$$...$$` appears as `\[...\]` or equivalent.

If any file is missing or empty, report the failure. Do not silently succeed.

### 3. Report

Summarize:
- Number of sections converted.
- Mode used (draft/submission).
- Any conversion issues found in step 2.
- If draft mode: count of `\todo` commands in the generated `.tex` files (gives a sense of remaining markers).

## Mechanical skill

This skill is purely mechanical — execute directly without plan-mode approval.

## Output

- Built `.tex` files in `pandoc/`.
- Summary of conversion results.
