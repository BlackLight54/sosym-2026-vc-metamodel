# Workflow Overhaul: Skills, Structure, and Project State

**Date:** 2026-03-28
**Scope:** Scaffold improvements. Do NOT touch section files or paper content.
**Mode:** Plan first for each major change, then execute after Martin confirms.

---

## Context

A cross-reference audit of the workflow against actual project usage revealed several gaps. This prompt implements the highest-impact fixes: new skills for discovered patterns, skill reorganization into categories, late-start mode for time awareness, and a redesigned project state structure replacing the monolithic DECISIONS.md with a memory-like folder system.

Read these files for full context before starting:

1. `context/WORKFLOW.md` — current workflow (being revised)
2. `context/DECISIONS.md` — current monolithic decisions file (being replaced)
3. `TODO.md` — especially the Done table (ground truth of what happened)
4. `CLAUDE.md` — time awareness section (being revised)
5. `AUTHOR_NOTES.md` — conventions and session flow (being updated)
6. `context/NOTES_REGARDING_WORKFLOW_SCAFFOLD.md` — Martin's raw notes on workflow improvements
7. `.claude/skills/README.md` — current skill inventory (being reorganized)
8. `prompts/2026-03-27_consolidation/PIPELINE.md` — the consolidation pipeline pattern (being promoted to a skill)
9. `prompts/2026-03-27_paper_audit.md` — the paper audit prompt (being promoted to a skill)
10. `prompts/2026-03-27_section_reviews/Z01_synthesis.md` — synthesis output (evidence of the pattern)
11. `.claude/skills/revision_orchestration/SKILL.md` — closest existing skill to consolidation pipeline
12. `.claude/skills/claim_evidence_audit/SKILL.md` — being repositioned as planning driver

---

## Task 1: Skill Categorization

### Background

There are 28 skills plus 2 guides. They sit in a flat directory. As the skill count grows, navigation becomes harder. The README.md already groups them informally (Setup, Research, Writing support, Quality, Revision, Post-submission, Reference, Infrastructure). Formalize this by prefixing skill directory names with a category tag.

### What to do

**Step 1 (plan mode):** Present the three category schemes below. Martin picks one.

**Option A — Lifecycle phases (7 categories):**

| Prefix | Category | Skills |
|--------|----------|--------|
| `setup_` | Project initialization | cfp_import, section_scaffold, abstract_scaffold, reviewer_personas |
| `research_` | Literature & gap analysis | gap_analysis, prior_work_import, related_work_positioning |
| `write_` | Drafting support | evaluation_design, evaluation_execution, limitations_threats, figure_design, structure_paragraph, notation_table, bibliography |
| `review_` | Quality & audits | paper_status, champion_test, prior_decision_audit, claim_evidence_audit, pre_submission_check, final_review, **paper_audit** (new) |
| `plan_` | Planning & orchestration | revision_orchestration, budget_cut, **consolidation_pipeline** (new), **advisor_feedback** (new) |
| `build_` | Infrastructure | pandoc_convert, overleaf_push |
| `guide_` | Reference guides (not executable) | refinery, reviewer_archetypes_guide, running_example_guide |
| `post_` | Post-submission | rebuttal |

**Option B — Function-based (6 categories, merges post into plan):**

| Prefix | Category | Skills |
|--------|----------|--------|
| `init_` | Setup & scaffolding | cfp_import, section_scaffold, abstract_scaffold, reviewer_personas |
| `research_` | Literature & positioning | gap_analysis, prior_work_import, related_work_positioning |
| `draft_` | Writing & figures | evaluation_design, evaluation_execution, limitations_threats, figure_design, structure_paragraph, notation_table, bibliography |
| `check_` | Audits & checks | paper_status, champion_test, prior_decision_audit, claim_evidence_audit, pre_submission_check, final_review, **paper_audit** (new) |
| `orchestrate_` | Planning, revision, pipelines | revision_orchestration, budget_cut, rebuttal, **consolidation_pipeline** (new), **advisor_feedback** (new) |
| `infra_` | Build & deploy | pandoc_convert, overleaf_push |
| `guide_` | Reference (non-executable) | refinery, reviewer_archetypes_guide, running_example_guide |

**Option C — Minimal (4 categories, coarser grouping):**

| Prefix | Category | Skills |
|--------|----------|--------|
| `plan_` | Planning, setup, orchestration, research | cfp_import, section_scaffold, abstract_scaffold, reviewer_personas, gap_analysis, prior_work_import, related_work_positioning, revision_orchestration, budget_cut, rebuttal, **consolidation_pipeline** (new), **advisor_feedback** (new) |
| `write_` | All drafting, figures, bibliography | evaluation_design, evaluation_execution, limitations_threats, figure_design, structure_paragraph, notation_table, bibliography |
| `review_` | All quality checks and audits | paper_status, champion_test, prior_decision_audit, claim_evidence_audit, pre_submission_check, final_review, **paper_audit** (new) |
| `build_` | Infrastructure + guides | pandoc_convert, overleaf_push, refinery, reviewer_archetypes_guide, running_example_guide |

**Step 2 (after Martin picks):** Rename all skill directories to use the chosen prefix. Update all references in:
- `.claude/skills/README.md`
- `context/WORKFLOW.md` (every `skills/[name]` reference)
- `AUTHOR_NOTES.md` (session flow references)
- `CLAUDE.md` (if any skill references exist)
- Any cross-references inside SKILL.md files that reference other skills

Do NOT break the Claude Code skill loading mechanism — verify that `.claude/skills/[new_name]/SKILL.md` is the expected structure.

---

## Task 2: New Skill — Consolidation Pipeline Design

### Background

The consolidation pipeline (`prompts/2026-03-27_consolidation/`) was the project's most effective planning mechanism. It introduced: PIPELINE.md format, dependency graphs, wave parallelism, binding claim tracking per task, critical path identification. None of this exists as a reusable skill. The closest skill (`revision_orchestration`) handles cross-cutting *revisions*, not ground-up consolidation of scaffolded sections.

### What to create

Create `.claude/skills/[prefix]consolidation_pipeline/SKILL.md` with this content (adapt prefix per Task 1 decision):

```markdown
---
description: Design a consolidation pipeline that maps binding claims to ordered prompt files with dependency tracking. Use when multiple sections need simultaneous drafting from scaffolds, when a claim evidence audit reveals gaps across sections, or when advisor feedback triggers cross-cutting work.
---

# Skill: Consolidation Pipeline Design

**Purpose:** Transform a claim evidence audit or set of work items into an ordered, dependency-aware prompt pipeline. Each prompt file is self-contained. The pipeline tracks which binding claims each task delivers, identifies the critical path, and groups independent tasks into parallel waves.

## Trigger

- "Design a consolidation pipeline"
- "Plan the remaining drafting work"
- "Turn these audit findings into a work plan"
- "How do I get from here to a submittable paper?"

## Inputs

- Binding claim status (from `skills/claim_evidence_audit` or abstract contract)
- Current section state (which sections have scaffolds, partial drafts, or complete drafts)
- DECISIONS.md active decisions (constraints on every task)
- TODO.md (remaining work items)

## Prerequisites

Run `skills/claim_evidence_audit` first. The audit's binding claim status table is the primary input — it determines task priority and critical path.

## Steps

### 1. Assess current state

For each section file:
- Read the file. Classify: scaffold only / partial draft / complete draft / needs revision.
- Count unresolved markers (@TODO, @SCAFFOLD, @CITE, @FORMAL, @FIGURE).
- Note which binding claims this section must deliver (from the abstract contract).

### 2. Design the task graph

For each deliverable unit (a section, subsection, or cross-cutting concern):
- Create a task node with: ID, target file, paragraphs/subsections, binding claims, dependencies.
- Dependencies are other tasks whose output this task needs (definitions, terminology, examples).
- A task that only needs scaffolds cleaned has no content dependencies (Wave 0).
- A task that defines terms used by other tasks is on the critical path.

**Ordering principle:** The critical path runs through the highest-risk undelivered binding claims. Tasks on the critical path are sequenced; tasks off the critical path are parallelized.

### 3. Identify waves

Group tasks by dependency depth:
- **Wave 0:** Mechanical prep (file restructuring, scaffold merging) — no content dependencies.
- **Wave 1:** Tasks that depend only on Wave 0. These can run in parallel.
- **Wave 2:** Tasks that depend on Wave 1 outputs. Etc.
- The critical path determines the minimum number of waves.

### 4. Write PIPELINE.md

Create `prompts/[date]_[label]/PIPELINE.md` with:

```
# [Label] Pipeline ([date])

[N] prompt files ([task IDs]).
Critical path: **[T_id → T_id → ... → T_id]**

[ASCII dependency diagram — see prompts/2026-03-27_consolidation/PIPELINE.md for format]

## Task summary

| Task | Section | Content | Dependencies | Binding claims | Status |
|------|---------|---------|--------------|----------------|--------|
```

### 5. Write individual prompt files

One file per task. Filename: `T[NN]_[short_label].md`.

Each prompt file includes:

```
# T[NN]: [Title]

**Wave:** [N] (parallel with [other tasks] / sequential after [task])
**Dependencies:** [task IDs that must complete first]
**Target file:** `sections/[filename].md` — [which paragraphs/subsections]
**Downstream:** [tasks that depend on this one]

---

## Context

[What exists in the target file now. What this task's role is in the overall pipeline.]

**Binding claims delivered:** [#N (text), #M (text)]

## Read Before Writing

[Numbered list of files to read, with specific line ranges or sections]

## What to Draft

[Per-paragraph or per-subsection breakdown with specific content guidance]

### DO NOT TOUCH

[Explicit list of paragraphs, sections, or content this task must not modify]

## Constraints

[Terminology, DECISIONS.md entries that apply, page budget, presentation format, "do NOT" rules]

## After

[Verification steps. What to check. What downstream tasks to note.]
```

### 6. Update TODO.md

Add a "Current focus" section pointing to the pipeline directory, listing all tasks with checkboxes, and stating the critical path.

## Output

- `prompts/[date]_[label]/PIPELINE.md` — pipeline overview with dependency diagram
- `prompts/[date]_[label]/T[NN]_[label].md` — one per task
- Updated TODO.md

## Quality checks

- Every binding claim from the abstract appears in at least one task's "Binding claims delivered" field.
- Every task's dependencies are satisfiable (no circular dependencies).
- The critical path covers all HIGH RISK binding claims.
- Each prompt file is self-contained — a fresh Claude Code session can execute it without reading other prompts.
```

---

## Task 3: New Skill — Advisor Feedback Processing

### Background

The advisor meeting on 2026-03-25 triggered a cascade: raw notes → 4 DECISIONS.md entries → 8 prompt files (P01–P08) → all executed in ~36 hours. This pattern (external feedback → decisions → pipeline → execution) was the most impactful workflow event but is undocumented.

### What to create

Create `.claude/skills/[prefix]advisor_feedback/SKILL.md`:

```markdown
---
description: Process advisor or reviewer feedback into decisions, tasks, and an execution pipeline. Use after advisor meetings, after receiving reviewer comments, or when external feedback requires cross-cutting changes.
---

# Skill: Advisor Feedback Processing

**Purpose:** Transform raw feedback (meeting notes, reviewer comments, email) into a structured response: decisions recorded, tasks identified, pipeline designed, and execution tracked.

## Trigger

- "Process advisor feedback"
- "We had a meeting — here are the notes"
- "Process these reviewer comments"
- "Turn this feedback into a work plan"

## Inputs

- Raw feedback source: meeting notes file, pasted reviewer comments, or email content.
- Current paper state: section files, DECISIONS.md, TODO.md.

## Steps

### 1. Capture raw feedback

If not already saved, write raw notes to `context/archive/feedback/[source]_[date].md`.

Format: preserve the original structure. Add section headers if the source is unstructured. Tag each item with the person who raised it (e.g., `[Imre]`, `[Oszkár]`, `[Reviewer B]`).

### 2. Extract actionable items

Read the raw feedback. For each actionable item, classify:

| Item | Type | Urgency | Affects |
|------|------|---------|---------|
| [summary] | direction / correction / question / suggestion | blocking / important / nice-to-have | [sections] |

- **Direction:** Advisor says "do X" or "frame it as Y." → Decision.
- **Correction:** "This is wrong" or "This term is non-standard." → Decision + revision.
- **Question:** "Have you considered X?" → Research task or decision.
- **Suggestion:** "You might also mention Y." → TODO item, prioritized by impact.

### 3. Record decisions

For each direction or correction, create a decision entry (see Task 5 for the new decision format). Each entry has: date, decision, rationale (from the advisor's reasoning), affected sections, and revisit condition.

If a new decision supersedes an existing one, mark the old one as superseded with a pointer to the new one.

### 4. Design execution pipeline

If ≤3 tasks result: add to TODO.md directly. Use "Revise a section" templates.

If >3 tasks result: run `skills/consolidation_pipeline` to produce an ordered prompt pipeline. The claim evidence audit step can be skipped if the feedback doesn't affect binding claims — but verify this explicitly.

### 5. Map feedback to binding claims

Check: does any feedback item affect a binding claim from the abstract? If yes, flag it — binding claim changes are highest priority and may require re-running `skills/claim_evidence_audit` after the pipeline executes.

### 6. Report

Present to Martin:
- Decisions recorded (with links to decision files)
- Pipeline designed (with link to PIPELINE.md)
- Binding claims affected (if any)
- Items deferred or rejected (with reasoning)

## After

- Execute the pipeline (Martin approves, then runs each prompt).
- After execution: re-run `skills/claim_evidence_audit` if binding claims were affected.
- Update TODO.md: mark feedback processing as done, add pipeline tasks.
```

---

## Task 4: New Skill — Paper Audit (15-agent pattern)

### Background

The paper audit prompt (`prompts/2026-03-27_paper_audit.md`) produced a 15-agent review pipeline (`prompts/2026-03-27_section_reviews/`) with per-section reviews (S00–S07), cross-cutting analyses (X01–X04), and a synthesis (Z01). This was the most thorough quality check the project ran. It should be a reusable skill.

### What to create

Create `.claude/skills/[prefix]paper_audit/SKILL.md`. Base it on the content of `prompts/2026-03-27_paper_audit.md` (read it in full), but restructure as a skill:

**Key adaptations from the prompt to the skill:**
1. The "Files to read" section becomes dynamic — the skill reads the current section inventory from `sections/` rather than hardcoding filenames.
2. The 10-section output format from the prompt becomes the skill's output template.
3. Add a "Recommended execution" section explaining the multi-agent pattern:
   - **Phase 1 (parallel):** One agent per section file (S00–S07), each producing a standalone review against DECISIONS.md, binding claims, and reviewer personas.
   - **Phase 2 (parallel):** Cross-cutting agents: X01 (argument coherence across sections), X02 (claim evidence audit), X03 (reviewer persona simulation), X04 (decision/CFP compliance).
   - **Phase 3 (sequential):** Z01 synthesis agent reads all S and X outputs, produces the triage table and strategic decisions.
4. Add guidance on when to run: after first complete draft, before submission, after major revisions.
5. The skill output directory is `prompts/[date]_paper_audit/` with the S/X/Z naming convention.

**Also copy the structural template** from the paper audit prompt's output format (sections 1–10: Binding Claim Delivery Matrix, Decision Compliance, Gap Analysis Integration, Reviewer Simulation, Argument Flow, Running Example Consistency, Prose–Model Consistency, Markers Census, Cross-Reference Integrity, Critical Path to Submission).

---

## Task 5: Project State Redesign — Decisions as a Folder

### Background

DECISIONS.md is a monolithic file that grows with every decision. It works for a single paper but has problems:
- Hard to reference individual decisions from prompts (must quote text, can't link)
- No metadata (type, status, affected sections) parseable by skills
- Superseded decisions clutter the active list
- No way to search/filter by affected section

The user wants a folder-based system inspired by Claude's memory architecture: each decision is its own file with frontmatter, and an index file provides overview.

### What to do

**Step 1 (plan mode):** Present these structure options to Martin.

**Option A — Decisions folder with index (minimal change):**

```
context/
├── decisions/
│   ├── INDEX.md              ← one-line summaries (like MEMORY.md)
│   ├── 2026-03-24_modeling_first_framing.md
│   ├── 2026-03-24_no_mda_terminology.md
│   ├── 2026-03-24_csok_running_example.md
│   ├── 2026-03-25_c5_claim_correction.md
│   ├── 2026-03-26_dcl_rename.md
│   ├── 2026-03-27_no_code_listings.md
│   └── ...
├── archive/
│   ├── feedback/             ← meeting notes, reviewer comments
│   ├── research/             ← gap analysis, regulatory analysis
│   ├── cuts/                 ← removed text with recovery context
│   └── superseded_decisions/ ← old decisions moved here when superseded
├── VENUE.md
├── CFP.md
└── WORKFLOW.md
```

Each decision file:
```markdown
---
date: 2026-03-24
title: Modeling-first framing
status: active           # active | superseded | revisit
superseded_by:           # link to replacement decision if superseded
affects: [01_introduction, 03_overview, 04_approach, 05_evaluation, 00_abstract]
revisit_when: "If reviewers want stronger detection/tooling claims"
tags: [framing, title, contribution]
---

# Modeling-first framing

**Decision:** Frame the paper around multi-level metamodeling as the contribution...
**Rationale:** The previous title implied an error-detection algorithm...
```

INDEX.md:
```markdown
# Active Decisions

- [Modeling-first framing](2026-03-24_modeling_first_framing.md) — metamodeling, not detection
- [No MDA terminology](2026-03-24_no_mda_terminology.md) — no CIM/PIM/PSM, use multi-level
- [DCL rename](2026-03-26_dcl_rename.md) — Claim Property Layer → Domain Concept Layer
...

# Superseded

- [CPL naming](../archive/superseded_decisions/2026-03-24_cpl_naming.md) — superseded by DCL rename
```

**Option B — Unified context store (Claude memory style, more ambitious):**

```
context/
├── active/                   ← everything currently in force
│   ├── decisions/            ← individual decision files with frontmatter
│   │   ├── INDEX.md
│   │   └── [decision files]
│   ├── todos/                ← individual TODO files (replaces monolithic TODO.md)
│   │   ├── INDEX.md          ← priority-ordered list with status
│   │   ├── t07_cross_layer.md
│   │   ├── t08_evaluation.md
│   │   └── ...
│   ├── claims/               ← one file per binding claim with delivery status
│   │   ├── INDEX.md
│   │   ├── claim_01_three_layer.md
│   │   └── ...
│   ├── VENUE.md
│   ├── CFP.md
│   └── WORKFLOW.md
├── archive/
│   ├── feedback/
│   ├── research/
│   ├── cuts/
│   ├── superseded_decisions/
│   └── completed_todos/
└── references/               ← collected reference notes
```

Each TODO file:
```markdown
---
id: T07
title: Cross-layer constraints
status: pending          # pending | in_progress | done | blocked
depends_on: [T01, T02]
binding_claims: [3]
target: sections/04_approach.md
pipeline: prompts/2026-03-27_consolidation/
---

Sec 04 paragraphs A12–A15. Trace consistency, entity alignment, anti-patterns, propagation.
```

Each claim file:
```markdown
---
id: 1
claim: "Three-layer metamodel (DCL, CSL, FSL)"
status: partial          # not_started | partial | delivered | weak
evidence_section: 04_approach
risk: low
---

DCL defined (T01 ✅), CSL defined (T02 ✅), FSL defined (T03 ✅).
Cross-layer not yet drafted (T07 pending).
```

**Option C — Hybrid (decisions as folder, TODO stays monolithic):**

Same as Option A for decisions and archive, but keep TODO.md as a single file (it works well for quick scanning). Add a `context/active/claims/` folder for binding claim tracking only.

```
context/
├── decisions/
│   ├── INDEX.md
│   └── [decision files]
├── claims/
│   ├── INDEX.md
│   └── [claim files]
├── archive/
│   ├── feedback/
│   ├── research/
│   ├── cuts/
│   └── superseded_decisions/
├── VENUE.md
├── CFP.md
└── WORKFLOW.md
```

TODO.md stays at project root as-is.

**Step 2 (after Martin picks):** Migrate DECISIONS.md content:
- Split each `### YYYY-MM-DD — [label]` entry into its own file with frontmatter.
- Create INDEX.md with one-line summaries.
- Move superseded decisions to archive.
- Update all references to DECISIONS.md in CLAUDE.md, WORKFLOW.md, AUTHOR_NOTES.md, skill files.
- Update `skills/prior_decision_audit` to read the decisions folder instead of a monolithic file.

---

## Task 6: Late-Start Mode in CLAUDE.md

### Background

The time-awareness brackets in CLAUDE.md assume a project that started weeks before deadline. This project compressed setup → drafting → submission into 5 days. The "<7 days: polish only" prescription was impossible — the contribution didn't exist yet. Research groups frequently start papers late. The brackets need a late-start mode.

### What to do

In CLAUDE.md, find the `## Time awareness` section. Add a new mode after the existing brackets:

```markdown
- **Late-start mode (project started within the deadline bracket):**
  The standard phase brackets assume a project that started early and is converging.
  When the project starts <14 days before deadline, ignore phase prescriptions.
  Operate on critical-path logic instead:

  1. Run `skills/claim_evidence_audit` (or `skills/abstract_scaffold` if no abstract exists yet) to identify binding claims.
  2. Rank claims by submission risk: what must be delivered vs. what would be nice.
  3. Build a consolidation pipeline (`skills/consolidation_pipeline`) ordered by critical path through highest-risk claims.
  4. Execute the pipeline. No exploration, no optional skills, no scope expansion.
  5. Every task must deliver a binding claim or directly support one. If it doesn't, it doesn't happen.
  6. Cut scope aggressively and early. A focused paper that delivers 6/10 binding claims convincingly beats a scattered paper that partially delivers 10/10.

  **Detection:** Late-start mode activates when:
  - The first entry in the Done table is within 14 days of the submission deadline, OR
  - `skills/paper_status` reports >50% of binding claims undelivered with <14 days remaining.

  **Transition out:** Once all critical-path tasks are complete and binding claims are delivered, switch to the standard "<7 days" or "<2 days" bracket for polish.
```

Also update the "At session start" paragraph to include late-start detection:

```markdown
At session start, run `skills/paper_status` for a snapshot. If the project is in late-start mode (see above), skip the standard phase prescription and report: binding claims delivered, critical path remaining, days to deadline.
```

---

## Task 7: Reposition Claim Evidence Audit as Planning Driver

### Background

`skills/claim_evidence_audit` is listed only under "Review tasks" in WORKFLOW.md, but in practice it was the planning engine: its output directly determined the consolidation pipeline's task ordering and critical path. The skill itself doesn't need to change — its positioning in WORKFLOW.md and its relationship to `skills/consolidation_pipeline` needs to be documented.

### What to do

1. In `context/WORKFLOW.md`, add a new subsection under a "Planning tasks" heading (or under whatever category the consolidation pipeline skill lands in):

```markdown
### Claim-driven planning

**Skill sequence:** `skills/claim_evidence_audit` → `skills/consolidation_pipeline`

The claim evidence audit produces a binding claim status table (delivered / partial / missing for each abstract commitment). This table is the primary input to consolidation pipeline design:
- **Critical path** runs through the highest-risk undelivered claims.
- **Task priority** is determined by which binding claims each task delivers.
- **Scope cuts** are decided by dropping the lowest-priority binding claims.

Run the audit before designing any multi-task pipeline. Re-run after the pipeline completes to verify delivery.
```

2. In `skills/claim_evidence_audit/SKILL.md`, add a "Downstream" section:

```markdown
## Downstream

The binding claim status table produced by this skill feeds directly into:
- `skills/consolidation_pipeline` — determines task ordering, critical path, and scope cuts.
- `skills/advisor_feedback` — determines whether feedback affects binding claims.
- Late-start mode in CLAUDE.md — binding claim delivery percentage triggers mode activation.
```

---

## Task 8: Update WORKFLOW.md and AUTHOR_NOTES.md

After Tasks 1–7 are complete, update these files to reflect all changes:

### WORKFLOW.md updates:
- Add "Planning tasks" section with: consolidation_pipeline, advisor_feedback, claim-driven planning.
- Update all `skills/[name]` references to use new prefixed names (from Task 1).
- Add the updated "Draft a section" prompt template with: paragraph IDs, binding claims, page budget, current state, risk flags, data sources, "do NOT" constraints (derived from how T01/T07/T08 actually looked vs. the generic template).
- Add "Marker hygiene" task type (pre-draft scaffold merging, post-draft marker resolution, pre-submission scan).
- Add "Process advisor feedback" under Planning tasks pointing to the new skill.

### AUTHOR_NOTES.md updates:
- Update "During writing" section to reference the claim-driven planning sequence.
- Update skill references to use new prefixed names.
- Add the paper audit to "Preparing to submit" (run it after final_review or as an alternative).
- Update archive conventions to reflect new taxonomy (feedback/, research/, cuts/, superseded_decisions/).

### README.md (skills) updates:
- Reorganize the table by category prefix.
- Add new skills (consolidation_pipeline, advisor_feedback, paper_audit).

---

## Execution Order

1. **Task 5 first** (plan mode) — Martin picks the project state structure. This affects where decisions go, which affects all other tasks.
2. **Task 1 next** (plan mode) — Martin picks the skill categorization. This affects directory names in all subsequent tasks.
3. **Tasks 2, 3, 4** (parallel) — Create the three new skills. Independent of each other.
4. **Task 6** — Late-start mode in CLAUDE.md.
5. **Task 7** — Reposition claim evidence audit.
6. **Task 5 execution** — Migrate DECISIONS.md content to the chosen structure.
7. **Task 1 execution** — Rename skill directories.
8. **Task 8 last** — Update WORKFLOW.md, AUTHOR_NOTES.md, skills/README.md with all changes.

Present the plan-mode choices (Tasks 1 and 5) together at the start. After Martin decides, execute the rest in order.

---

## Constraints

- Do NOT touch section files, paper content, or the pandoc pipeline.
- Do NOT delete DECISIONS.md until the migration is verified (keep it as `context/archive/DECISIONS_monolithic_backup.md`).
- Every skill file must follow the existing format: frontmatter with `description:`, then `# Skill: [Name]`, then Purpose/Trigger/Inputs/Steps/Output sections.
- When renaming skill directories, verify that Claude Code's skill loading mechanism still works (it reads `.claude/skills/[name]/SKILL.md`).
- The `context/NOTES_REGARDING_WORKFLOW_SCAFFOLD.md` file contains Martin's raw ideas. Cross-reference it during Task 8 — mark implemented items as done in that file.
- After all changes, run `ls .claude/skills/` and verify the new structure makes sense visually.
