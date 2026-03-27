---
description: Build LaTeX from Markdown section files using pandoc and push to the Overleaf git remote with pre-flight checks. Use when pushing to Overleaf, updating Overleaf, or building and pushing LaTeX output.
---

# Skill: Overleaf Push

**Purpose:** Build LaTeX from Markdown section files and push to the Overleaf git remote. This is the bridge between the Markdown authoring environment and the Overleaf collaboration environment.

## Trigger

- "Push to Overleaf"
- "Update Overleaf"
- "Build and push"

## Prerequisites

- Pandoc pipeline is set up (Makefile or build.sh exists — see AUTHOR_NOTES.md "Setup TODO").
- Overleaf git remote is configured.
- `.bib` file is current (exported from Zotero).

## Steps

### 0. Pipeline guard

Check that the pandoc build pipeline exists:

```bash
test -f Makefile || test -f build.sh
```

**If neither exists:** Stop. Do not proceed to pre-flight or build. Report:

> "The pandoc pipeline is not set up yet. The Overleaf push requires a Makefile or build.sh that converts Markdown sections to LaTeX. See AUTHOR_NOTES.md 'Setup TODO' for the checklist — this needs to be built before the first push."

Add "Build pandoc pipeline (see AUTHOR_NOTES.md)" to TODO.md if it's not already there.

**If the pipeline exists:** Also check for the Overleaf git remote:

```bash
cd build && git remote get-url overleaf 2>/dev/null
```

If the remote is not configured, report: "The Overleaf git remote is not set up. See AUTHOR_NOTES.md 'Overleaf integration' for options." The build can still run for local verification, but the push step will be skipped.

Proceed to step 1.

### 1. Pre-flight check

Before building, verify:

- Report any remaining `%% @CITE: %%`, `%% @FORMAL: %%`, or `%% @TODO: %%` markers with counts. The pandoc filter strips all of them, so they won't break the build — but they represent unfinished work. Martin decides whether to push with markers remaining.
- Figures referenced in section files have source files in `pandoc/assets/`.
- The `.bib` file exists.

Report any issues. Martin decides whether to proceed or fix first.

### 2. Build

Run the pandoc build:

```bash
make build    # or: bash build.sh
```

This converts `sections/*.md` → `pandoc/*.tex` using the venue template and Lua filters.

### 3. Verify build output

Quick sanity checks on the generated LaTeX:
- Each section file produced a corresponding `.tex` file.
- No pandoc warnings about unrecognized constructs.
- Math mode delimiters survived conversion (`$...$` → `$...$`, `$$...$$` → `\[...\]` or equivalent).

If there are conversion problems, report them to Martin with the specific construct that failed. Do not push broken LaTeX.

### 4. Push

```bash
cd build
git add -A
git commit -m "[description of what changed]"
git push overleaf main
```

The commit message should summarize what changed in this push. Examples:
- "Draft sections 1-3, scaffold for sections 4-6"
- "Revised threat model (Section 3), updated contribution list"
- "Pre-submission: all sections drafted, figures in place"

### 5. Remind Martin

After a successful push:
- "Pushed to Overleaf. If this is a milestone (first-draft, pre-submission, submitted, camera-ready), label it in Overleaf History."

## Handling Overleaf-side changes

If collaborators have edited on Overleaf since the last push:

```bash
cd build
git pull overleaf main
```

Merge conflicts happen in `.tex` files — resolve in LaTeX. These edits live on the Overleaf/LaTeX side; they do not propagate back to Markdown automatically.

If significant changes were made on Overleaf that should be reflected in Markdown, Martin backports them manually. This should be rare — it only matters if the source of truth hasn't transitioned to LaTeX yet (see AUTHOR_NOTES.md "Source of truth transitions").

## When to run

- After a productive writing session (push the progress).
- Before collaborators need to review (give them current LaTeX).
- At milestones (first-draft, pre-submission, etc.).
- Before switching to Overleaf-as-source-of-truth for final polish.

## Output

- Built `.tex` files in `pandoc/`.
- Git push to Overleaf remote.
- Milestone label reminder if appropriate.
