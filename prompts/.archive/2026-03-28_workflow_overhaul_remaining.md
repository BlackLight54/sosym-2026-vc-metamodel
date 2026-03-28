# Workflow Overhaul — Remaining Tasks

**Date:** 2026-03-28
**Context:** First session completed skills creation, CLAUDE.md updates, and skill repositioning. Migration and renaming remain.
**Full plan:** `.claude/plans/jiggly-twirling-wilkes.md`
**Original prompt:** `prompts/2026-03-28_workflow_overhaul.md` (Tasks 1-8 specification)
**Scope:** Scaffold only. Do NOT touch section files.

---

## What's Done

1. **5 new skills created** (SKILL.md files written):
   - `.claude/skills/consolidation_pipeline/SKILL.md`
   - `.claude/skills/advisor_feedback/SKILL.md`
   - `.claude/skills/paper_audit/SKILL.md`
   - `.claude/skills/consistency_check/SKILL.md`
   - `.claude/skills/session_close/SKILL.md`

2. **CLAUDE.md updated:**
   - Late-start mode added to `## Time awareness`
   - `## Session close` section added (archive convention documented)
   - `## Key files` updated for new project state (memories, todos, archive)
   - Edit protocol: `context/todos/` replaces `TODO.md`

3. **claim_evidence_audit repositioned:**
   - "Downstream" section added linking to consolidation_pipeline, advisor_feedback, late-start mode
   - Step 7 updated to write to `context/todos/`

4. **paper_status extended:**
   - Inputs: reads `context/todos/INDEX.md` + memory files
   - Step 5: reports claim delivery status from MEMORY.md, detects late-start mode
   - References to DECISIONS.md updated

5. **Partial migration started:**
   - 6 claim files exist: `.claude/memory/claim_01` through `claim_06`
   - Archive directories created: `context/archive/{feedback,research,cuts,superseded_decisions,completed_todos}`, `context/todos/`, `context/references/`
   - `feedback_edit_markdown_not_latex.md` exists in `.claude/memory/`

---

## Remaining Tasks (execute in order)

### Task A: Complete claim migration (4 files)

Create claims 07-10 in `.claude/memory/`. Read `sections/00_abstract.md` lines 14-17 for the claim text:

| File | Claim | Status hint |
|------|-------|-------------|
| `claim_07_antipattern_detection.md` | Error detection vs. known anti-patterns | partial (scaffolded in Sec 05) |
| `claim_08_contradictory_constraints.md` | Formally contradictory cross-framework constraints | partial (headline results designed, needs prose) |
| `claim_09_multilayer_invisibility.md` | Multi-layer errors invisible to single-layer inspection | partial (follows from claim 8) |
| `claim_10_necessity_argument.md` | Necessity/effectiveness argument for multi-layer modeling | not_started |

Use same format as existing claim files (read `claim_01_three_layer.md` for template).

### Task B: Create decision memory files (15 files)

Read `context/DECISIONS.md`. Create one file per decision in `.claude/memory/`:

| Decision | Filename |
|----------|----------|
| Thesis framing: modeling-first | `decision_modeling_first_framing.md` |
| Domain: MDE | `decision_domain_mde.md` |
| No MDA terminology | `decision_no_mda_terminology.md` |
| CSOK running example | `decision_csok_running_example.md` |
| Motivation ends with problem statement | `decision_motivation_problem_statement.md` |
| Teaser figure | `decision_teaser_figure.md` |
| Claim C5 correction | `decision_c5_claim_correction.md` |
| Gap analysis confirmed | `decision_gap_analysis_confirmed.md` |
| CSOK naming convention | `decision_csok_naming.md` |
| GDPR two-tier framing | `decision_gdpr_two_tier.md` |
| Format-driven restructuring | `decision_format_driven_restructuring.md` |
| mdoc simplified | `decision_mdoc_simplified.md` |
| Two headline results | `decision_two_headline_results.md` |
| DCL rename | `decision_dcl_rename.md` |
| No code listings | `decision_no_code_listings.md` |

Format per file:
```markdown
---
name: [title]
description: [one-line for retrieval]
type: project
date: [YYYY-MM-DD]
status: active
affects: [section list]
revisit_when: "[condition]"
tags: [tags]
---

**Decision:** [text from DECISIONS.md]
**Rationale:** [text from DECISIONS.md]
**Why:** [distilled reason]
**How to apply:** [when this constraint kicks in]
```

After creating all files, backup original to `context/archive/DECISIONS_monolithic_backup.md`.

### Task C: Decompose TODO.md into context/todos/

Read `TODO.md`. For each **pending** item, create a file in `context/todos/` with frontmatter (id, title, status, depends_on, binding_claims, target). Key pending items:

- `t07_cross_layer.md` — Sec 04 A12-A15 cross-layer constraints
- `t08_evaluation.md` — Sec 05 elaboration
- `t09_threats_scalability.md` — Sec 05 threats + scalability
- `t10_polish.md` — final polish
- `scalability_figures.md` — 2 figure* diagrams
- `baseline_comparison.md` — draft baseline paragraph
- `threats_to_validity.md` — threats subsection
- `arf_constraint_collision.md` — prefix ARF IDs
- `refinery_usage_modes.md` — clarify OK/NOT_OK/GENERATED
- `nour_staf_paper.md` — double-blind citation strategy
- `soften_c5.md` — soften C5 in abstract + intro P2
- `fig_teaser_and_metamodel.md` — figure design
- Plus any other actionable pending items

Create `context/todos/INDEX.md` with one-line summaries.
Backup original to `context/archive/TODO_monolithic_backup.md`.

### Task D: Create project-level MEMORY.md

Create `.claude/memory/MEMORY.md` as the auto-loaded index. Include all decisions, claims, and any feedback files:

```markdown
# Decisions

- [Modeling-first framing](decision_modeling_first_framing.md) — metamodeling, not detection
- [Domain: MDE](decision_domain_mde.md) — MDE venue, not formal methods
[... one line per decision]

# Claims

- [Claim 1: Three-layer metamodel](claim_01_three_layer.md) — DCL + CSL + FSL
- [Claim 2: VCDM grounding](claim_02_vcdm_grounding.md) — mapping to W3C VCDM 2.0
[... one line per claim]

# Feedback

- [Edit Markdown not LaTeX](feedback_edit_markdown_not_latex.md) — always edit sections/*.md
```

### Task E: Rename all 33 skill directories

Use `git mv` for each rename. Full mapping:

```
abstract_scaffold        → setup_abstract_scaffold
advisor_feedback         → plan_advisor_feedback
bibliography             → draft_bibliography
budget_cut               → plan_budget_cut
cfp_import               → setup_cfp_import
champion_test            → review_champion_test
claim_evidence_audit     → review_claim_evidence_audit
consistency_check        → project_consistency_check
consolidation_pipeline   → plan_consolidation_pipeline
evaluation_design        → draft_evaluation_design
evaluation_execution     → draft_evaluation_execution
figure_design            → draft_figure_design
final_review             → review_final_review
gap_analysis             → research_gap_analysis
limitations_threats      → draft_limitations_threats
notation_table           → draft_notation_table
overleaf_push            → project_overleaf_push
pandoc_convert           → project_pandoc_convert
paper_audit              → review_paper_audit
paper_status             → review_paper_status
pre_submission_check     → review_pre_submission_check
prior_decision_audit     → review_prior_decision_audit
prior_work_import        → research_prior_work_import
rebuttal                 → plan_rebuttal
refinery                 → ref_refinery
related_work_positioning → research_related_work_positioning
reviewer_archetypes_guide → review_reviewer_archetypes
reviewer_personas        → setup_reviewer_personas
revision_orchestration   → plan_revision_orchestration
running_example_guide    → ref_running_example
section_scaffold         → setup_section_scaffold
session_close            → project_session_close
structure_paragraph      → draft_structure_paragraph
```

### Task F: Update all cross-references

After renaming, grep for old skill names and update in:

1. **`.claude/skills/README.md`** — reorganize table by 7 categories (setup_, research_, draft_, review_, plan_, ref_, project_)
2. **`context/WORKFLOW.md`** — all `skills/[old_name]` refs. Also add:
   - "Planning tasks" section with consolidation_pipeline, advisor_feedback, claim-driven planning
   - "Project maintenance tasks" with consistency_check, session_close
   - "Marker hygiene" task type
   - Updated "Draft a section" prompt template
3. **`AUTHOR_NOTES.md`** — skill refs, archive conventions, paper_audit in submission prep, session_close in session end
4. **`CLAUDE.md`** — any remaining old skill refs
5. **All SKILL.md files** — grep `.claude/skills/` for inter-skill references
6. **`prior_decision_audit`** — update to read `.claude/memory/decision_*.md` instead of `context/DECISIONS.md`
7. **`context/NOTES_REGARDING_WORKFLOW_SCAFFOLD.md`** — mark implemented items as done

### Task G: Verification

- [ ] `ls .claude/skills/` — 33 prefixed directories
- [ ] `ls .claude/memory/decision_*` — 15 decision files
- [ ] `ls .claude/memory/claim_*` — 10 claim files
- [ ] `.claude/memory/MEMORY.md` has entries for all
- [ ] `ls context/todos/` — todo files + INDEX.md
- [ ] Grep for old unprefixed skill names — none found
- [ ] Grep for `context/DECISIONS.md` — none except backup
- [ ] Each `.claude/skills/[prefix_name]/SKILL.md` exists
- [ ] Backups exist: `context/archive/DECISIONS_monolithic_backup.md`, `context/archive/TODO_monolithic_backup.md`

---

## Constraints

- Do NOT touch section files or paper content
- Do NOT delete DECISIONS.md or TODO.md until migration verified
- Superseded memories → `context/archive/`, never deleted
- Verify skill loading: Claude Code reads `.claude/skills/[name]/SKILL.md`
