# Skill: Paper Status Diagnostic

**Purpose:** Lightweight snapshot of where the paper stands. Run at the start of every session and whenever Martin asks "where are we?" Reports section maturity, unresolved markers, figure status, outstanding TODOs, and time-to-deadline — everything needed to decide what to work on next.

This is not a quality review (that's `skills/final_review`). This is a dashboard: fast, factual, actionable.

## Trigger

- "Where are we?"
- "What's the status?"
- "Paper status"
- Automatically at session start (see CLAUDE.md session protocol)

## Inputs

- All section files in `sections/`.
- TODO.md.
- VENUE.md (deadline).
- `figures/` directory.
- CLAUDE.md (thesis — is it filled?).

## Steps

### 1. Time check

Read submission deadline from VENUE.md.

Compute and report:
- **Days remaining:** [N] days until submission deadline.
- **Phase:** Map to the time-based behavior from CLAUDE.md (exploration / drafting / revision / polish / emergency).
- **Phase guidance:** One sentence on what the current phase means for today's work.

If deadline is not set, flag it: "No deadline in VENUE.md — time-based guidance unavailable."

### 2. Section maturity scan

For each file in `sections/`, classify its maturity:

| Maturity | Criteria |
|----------|---------|
| **Empty** | File exists but contains only the header comment block (goal/budget/dependencies) or nothing beyond the heading. |
| **Skeleton** | Contains paragraph-level guidance (`%% P1: ...`, `%% P2: ...`) or bullet-point outlines, but no prose. |
| **Draft** | Contains substantial prose (multiple paragraphs) but still has `%% @TODO: %%` or `%% @FORMAL: %%` markers, or the prose hasn't been reviewed. |
| **Revised** | Prose exists, markers are mostly resolved, section has been through at least one revision pass. |
| **Polished** | No unresolved markers, prose is reviewed, figures are in place. Ready for final review. |

Report as a table:

```
| Section | File | Maturity | Markers | Notes |
|---------|------|----------|---------|-------|
| Abstract | 00_abstract.md | Draft | 0C 0F 1T | TODO: revisit after first draft |
| Introduction | 01_introduction.md | Skeleton | 0C 0F 0T | P3 contributions not written |
| Background | 02_background.md | Empty | — | Depends on gap analysis |
| ... | | | | |
```

Markers column: `NC NF NT` = N CITE markers, N FORMAL markers, N TODO markers.

### 3. Marker summary

Scan all section files for `%% @CITE:`, `%% @FORMAL:`, `%% @TODO:`, and `%% @FIGURE:` markers. Report totals:

- **Unresolved citations:** [N] across [M] sections.
- **Unresolved formal elements:** [N] across [M] sections.
- **Inline TODOs:** [N] across [M] sections.
- **Figure placeholders:** [N] (with/without corresponding source files in `figures/`).

If any count is high relative to the phase (e.g., 15 unresolved citations in polish phase), flag it.

### 4. Figure status

For each `%% @FIGURE: fig:[label] %%` marker in section files:
- Does a corresponding source file exist in `figures/`?
- What format is it in?

Report:

```
| Figure | Section | Source file | Status |
|--------|---------|-------------|--------|
| fig:running_example | §2 | figures/fig_running_example.tikz | Exists |
| fig:architecture | §3 | — | Missing |
| fig:results | §5 | figures/fig_results.py | Exists |
```

### 5. TODO.md alignment check

Read TODO.md. Check for drift:

- **Stale done items** that reference sections which have since changed.
- **Missing tasks** for sections that are still Empty or Skeleton but have no TODO entry.
- **Orphan tasks** that reference files or concepts that no longer exist.

Report any misalignment. Do not fix TODO.md automatically — present findings and let Martin decide.

### 6. Setup completeness

Check whether foundational elements are in place:

| Element | Status |
|---------|--------|
| Thesis in CLAUDE.md | Filled / Placeholder |
| VENUE.md populated | Yes / Partial / No |
| Reviewer personas generated | Yes / No |
| Running example chosen | Yes (check DECISIONS.md) / No |
| Comparison matrix exists | Yes / No |
| Pandoc pipeline built | Yes / No (check for Makefile or build.sh) |

### 7. Risk flags

Based on the above, flag any risks:

- **Behind schedule:** Many sections still Empty/Skeleton with <15 days remaining.
- **Marker debt:** Growing number of unresolved markers across sessions (compare to previous runs if available).
- **Missing figures:** Figure placeholders without source files in drafting or later phases.
- **Scope creep:** New sections or contributions appearing after the drafting phase should have started.
- **Thesis drift:** If the thesis in CLAUDE.md no longer matches what the sections are actually arguing (requires a quick content check, not a deep review).

### 8. Recommend next action

Based on the current phase, section maturity, and risk flags, recommend 1–3 things Martin should work on in this session. Prioritize:

1. Risk flags (blockers first).
2. Lowest-maturity sections that are on the critical path.
3. Unresolved markers in otherwise-mature sections.
4. Figure drafting for sections that are past Skeleton.

Frame as options, not commands — this is plan mode.

## Output format

Present as a compact report, not a wall of text:

```
## Paper Status — [date]

**Deadline:** [date] ([N] days remaining)
**Phase:** [phase] — [one sentence guidance]

### Sections
[maturity table]

### Markers
[summary counts + flags]

### Figures
[figure table, only if figures are in play]

### Risks
[bulleted risk flags, or "None" if clean]

### Recommended next actions
1. [action]
2. [action]
3. [action]
```

## Session history (optional)

If DECISIONS.md contains notes from previous sessions, compare:
- Which sections advanced since last session?
- Which markers were resolved?
- Are we on track relative to the deadline?

This comparison is opportunistic — don't fail if no history exists.

## When to run

- **Every session start.** This is the first thing Claude does when Martin opens a session.
- **On request** ("Where are we?").
- **Before major decisions** (scope changes, adding/removing contributions).

## Interaction with other skills

- **Time awareness in CLAUDE.md:** The phase determination here aligns with CLAUDE.md's time-based behavior rules. Both use the same phase definitions.
- **`skills/final_review`:** Paper status is a lightweight check; final review is a deep read. Don't confuse them.
- **`skills/pre_submission_check`:** Paper status counts markers; pre_submission_check diagnoses them.

## Output

- Compact status report.
- Risk flags.
- Recommended next actions.
- No file modifications (this skill is read-only).
