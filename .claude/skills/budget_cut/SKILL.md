---
description: Diagnose page budget usage and propose restructuring when the paper exceeds its page limit. Use when the paper is too long, checking where pages are going, or deciding what to cut or compress.
---

# Skill: Budget Cut

**Purpose:** Diagnose page budget usage across the manuscript and propose restructuring when the paper exceeds (or will exceed) its page limit. Two modes: *diagnostic* (budget tree — where are the pages going?) and *prescriptive* (restructuring plan — what to cut, compress, or relocate).

## Trigger

- "Page budget usage tree"
- "Where are my pages going?"
- "We need major reengineering"
- "How do I cut N pages?"
- "Cut to budget"
- "What's over budget?"

## Inputs

- All section files in `sections/`.
- VENUE.md (page limit, supplementary strategy).
- DECISIONS.md (rationale for current structure — avoid undoing deliberate choices blindly).
- `figures/` directory (figure count and estimated footprint).
- `@META: Budget:` markers in each section file.

## Steps

### 1. Measure actual usage

For each section file in `sections/`:

**Word count method** (primary):
- Count words of prose content only — exclude `%% ... %%` markers, `@META` blocks, `@SCAFFOLD` blocks, and LaTeX preamble.
- Include figure/table captions and math environments in the count.
- Apply the **ACM sigconf heuristic: ~800 words per page** for prose-only content.

**Figure/table adjustment:**
- Scan for `%% @FIGURE:` markers and any inline figure references. Each single-column figure ≈ 0.3 pages. Each full-width figure ≈ 0.5 pages. Each table ≈ 0.2–0.4 pages (estimate from row count if available).
- Add figure/table footprint to the section's page estimate.

**Display math adjustment:**
- Count `$$...$$` blocks and `\begin{definition}`/`\begin{theorem}` environments. Each display math block ≈ 3 lines ≈ 0.05 pages.

Record for each section:
- Raw word count (prose only).
- Estimated figure/table footprint (pages).
- Estimated display math footprint (pages).
- **Total estimated pages.**

**Optional — compiled measurement:**
If `build.sh` succeeds and `latexmk` is available, compile to PDF and extract actual page boundaries per section using `\label`/page refs or manual inspection. Report compiled page counts alongside estimates. If compilation is not available, state that estimates are heuristic and recommend a compilation check.

### 2. Extract budgets

From each section file, read the `%% @META: Budget: ... %%` marker. Parse the page number (e.g., "1.25 pages" → 1.25).

From VENUE.md, read:
- **Total page limit** (main text).
- **Reference page allowance** (separate from main text).

Compute:
- **Sum of section budgets.** Flag if they don't sum to the page limit (budget allocation error).
- **Unallocated pages** = page limit − sum of section budgets.

### 3. Build the budget tree

Present as a table:

```
## Page Budget Tree — [date]

Page limit: [N] pages (VENUE.md)
Estimated total: [M] pages ([over/under] by [delta])

| Section | Budget | Est. pages | Delta | Status |
|---------|--------|-----------|-------|--------|
| 01 Introduction | 1.25 | 1.4 | +0.15 | OVER |
| 02 Background | 1.25 | 0.9 | −0.35 | under |
| 03 Overview | 1.5 | 1.8 | +0.3 | OVER |
| 04 Approach | 3.0 | 3.6 | +0.6 | OVER |
| 05 Evaluation | 2.5 | 2.1 | −0.4 | under |
| 06 Related Work | 0.75 | 0.8 | +0.05 | ~ |
| 07 Conclusion | 0.75 | 0.6 | −0.15 | ~ |
| **Total** | **10.0** | **11.2** | **+1.2** | **OVER** |

Figures: [N] figures consuming est. [F] pages (included above).
Display math: [D] blocks consuming est. [M] pages (included above).
```

Status codes:
- **OVER**: exceeds budget by >10%.
- **under**: below budget by >20% (may indicate incomplete section or compression opportunity).
- **~**: within tolerance (±10%).

### 4. Diagnose inflation sources

For each section marked OVER, identify the likely cause:

| Inflation type | Signal | Example |
|----------------|--------|---------|
| **Prose bloat** | High word count relative to budget, low figure/math density | Over-explained background; redundant transitions |
| **Figure creep** | Section has more or larger figures than budgeted | Running example grew from 1 to 3 figures |
| **Definition sprawl** | Many display math blocks / formal environments | Definitions could be compressed or moved to appendix |
| **Scope creep** | Section covers topics not in its `@META: Goal` | Background section also doing related work's job |
| **Structural misfit** | Content belongs in a different section | Approach section contains evaluation-like examples |

For each section marked **under**, diagnose:
- **Intentionally lean:** Section is complete but compressed — no action needed.
- **Incomplete:** Section has TODO/SCAFFOLD markers — not a cut opportunity, it will grow.
- **Missing content:** Section's goal (from `@META`) is not fully addressed.

Report per-section diagnosis as a bulleted list under the budget tree.

### 5. Propose restructuring (prescriptive mode)

**Only enter this step if Martin asks for restructuring** (trigger: "We need major reengineering", "How do I cut N pages?", or explicit request). Otherwise, stop after Step 4 and present the diagnostic.

#### 5a. Rank cut strategies

For the sections that are OVER budget, rank candidate strategies by **argument damage** (lowest damage first):

| Strategy | Damage | Typical savings |
|----------|--------|----------------|
| **Trim prose** — remove filler, compress transitions, tighten phrasing | None | 5–15% per section |
| **Compress examples** — reduce running example instances, merge similar cases | Low | 0.2–0.5 pages |
| **Relocate to supplementary** — move proofs, full definitions, extended examples to an online appendix (if venue allows) | Low–Medium | 0.5–2.0 pages |
| **Merge sections** — combine Background + Overview, or Related Work + Background | Medium | 0.3–0.5 pages (from eliminated transitions/headers) |
| **Drop a contribution** — remove one claim and all its supporting material | High | 0.5–1.5 pages |
| **Restructure argument** — change the paper's narrative arc to require less scaffolding | High | Variable |

For each strategy, estimate the page savings and identify which sections are affected.

#### 5b. Build a cut plan

Present an ordered plan:

```
## Restructuring Proposal — target: cut [X] pages

### Phase 1: Low-damage cuts (est. savings: [Y] pages)
1. [Section]: [specific action] — est. [n] pages saved.
   Reason: [why this is safe to cut].
2. ...

### Phase 2: Medium-damage cuts (est. savings: [Y] pages)
3. [Section]: [specific action] — est. [n] pages saved.
   Risk: [what the paper loses].
4. ...

### Phase 3: High-damage cuts (only if phases 1–2 insufficient)
5. [Section]: [specific action] — est. [n] pages saved.
   Risk: [what the paper loses]. Requires: [downstream changes].

**Cumulative savings: [total] pages.**
**Remaining delta after plan: [+/- pages].**
```

#### 5c. Identify `@CUT-START` / `@CUT-END` candidates

For specific prose passages recommended for cutting, identify exact locations where `%% @CUT-START: reason %%` and `%% @CUT-END %%` markers could be placed. These markers integrate with the existing `cut-candidates.lua` pandoc filter:
- In draft mode: highlighted with color tint for Martin's review.
- In submission mode: markers stripped, text kept.

Present as:
```
### Cut candidate markers to insert
- sections/04_approach.md, around lines [N–M]: [reason]
- sections/03_overview.md, around lines [N–M]: [reason]
```

Do NOT insert the markers — present them for Martin's approval. If Martin says "do it," use `skills/revision_orchestration` to generate ordered edit prompts.

### 6. Check downstream coherence

For any proposed cuts or restructuring, trace forward/backward references:

- If content is cut from Section X, does Section Y reference it?
- If a figure is removed, are there dangling `Figure~\ref{fig:...}` references?
- If a definition is relocated, do later proofs or evaluations depend on it?

Report dependency risks alongside the cut plan.

### 7. Update TODO.md

If restructuring is proposed and Martin approves:
- Add tasks for each cut/edit, ordered by dependency.
- Reference prompt files if `skills/revision_orchestration` is used for execution.

If only diagnostic was requested, add a single task: "Review page budget diagnostic and decide on cuts."

## Output

### Diagnostic mode (default)
- Page budget tree table.
- Per-section inflation/underuse diagnosis.
- Summary: total estimated pages, delta from limit, top 3 sections to watch.
- No file modifications.

### Prescriptive mode (on request)
- Everything from diagnostic mode, plus:
- Ranked cut strategies with estimated savings.
- Phased cut plan.
- `@CUT-START`/`@CUT-END` marker candidates.
- Downstream coherence risks.
- TODO.md updates (after approval).

## Accuracy caveat

Word-count heuristics are estimates. ACM sigconf formatting, font sizes, figure placement, and LaTeX spacing can cause actual page counts to diverge by ±0.5 pages from estimates. **Always verify against a compiled PDF before finalizing cuts.** The diagnostic is a planning tool, not a precise measurement.

## Interaction with other skills

- **`skills/paper_status`:** Paper status reports section maturity; budget_cut reports section *size*. Complementary — run paper_status first for context.
- **`skills/revision_orchestration`:** If cuts touch multiple sections, use revision_orchestration to decompose the edits into ordered prompts.
- **`skills/claim_evidence_audit`:** Before dropping a contribution (Phase 3), run claim_evidence_audit to understand what evidence chain breaks.
- **`skills/figure_design`:** If figure creep is diagnosed, coordinate with figure_design to consolidate or resize figures.
- **`cut-candidates.lua`:** The pandoc filter that renders `@CUT-START`/`@CUT-END` markers. This skill proposes where to place them; the filter handles rendering.

## When to run

- **After first full draft** — baseline measurement before revision phase.
- **When page count feels tight** — Martin suspects over-budget but doesn't know where.
- **Before submission** — final budget check alongside `skills/pre_submission_check`.
- **After major content additions** — new figure, expanded evaluation, added subsection.
