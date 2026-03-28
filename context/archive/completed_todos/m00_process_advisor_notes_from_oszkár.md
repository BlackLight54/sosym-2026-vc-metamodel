---
id: "M00"
short: "advisor-notes"
title: "Process advisor notes from Oszkár (2026-03-25) into decisions, todos, and memories"
status: done
priority: high
depends_on: []
binding_claims: []
target: ".claude/memory/decision_*.md, .claude/memory/feedback_*.md, context/todos/"
pipeline: ""
assigned: "claude"
created: "2026-03-28"
---

## Goal

Formalize all unprocessed advisor feedback from the 2026-03-25 meeting with Oszkár into the project's persistence system (decisions, feedback memories, todos). After this task, no advisor direction should exist only in the raw notes.

## Source

Raw notes from `context/archive/meeting_notes_2026-03-25.md`, Oszkár section. Reproduced here for self-containment:

### Raw notes (Oszkár, 2026-03-25 18:30)

1. **Gap paragraph reframing:** In the gap paragraph, replace "scattered across" framing with: we *collected and formalized* existing constraints. This way no citation is needed for the gap claim itself.
2. **Emerging constraint interactions:** After the gap paragraph, state explicitly that constraints have cross-layer interactions — they exhibit emerging behaviour / interactions that cannot be predicted by single-layer inspection.
3. **Justify novel tooling:** Explain *why* existing tools cannot address these challenges. What are the specific challenges that necessitated developing a novel approach? (i.e., why Refinery specifically, not just "we need a tool")
4. **Competing peer requirements:** Key insight for framing: unlike hierarchical requirement systems (e.g., automotive engineering), VC ecosystems have *competing peer requirements* from stakeholders who do not necessarily cooperate. Their goals may not be reconcilable into a single coherent whole. This is a core motivating difference.
5. **Noor ECMFA citation:** Noor's ECMFA paper is related work. Must cite and differentiate clearly — if a reviewer sees both papers, the distinction must be obvious.
6. **Sec 03 restructuring:** Rename "Motivation" to "Overview". Structure as:
   - 3.1 Motivation (existing content)
   - 3.2 Functional Overview — a box diagram (like the BPM paper with Imre): Input = Design Specification / Partial Design + Constraint Set → "Martin box" → Outputs: OK / NOT_OK (with errors) / GENERATE (graph)
   - 3.3 How to use on this example — walkthrough of what a designer does step-by-step with the tool (sees error → fixes → iterates)
7. **Evaluation schema (at least 2 pages):**
   - Research questions (e.g., "How does validation runtime scale with model size?")
   - Scaling approach: prepare a second (larger) instance, justify why it approximates real scale
   - Selected domains: at least 2, preferably 3-5 models, described descriptively
   - Measurement setup: tools, environment, metrics (draw inspiration from Noor's paper)
   - Measurement results: 2 diagrams in `figure*` at top of page
   - Analysis: answer the RQs, state lessons learned
   - Threats to validity: internal, external, construct, conclusion validity
8. **VCDM coverage is not a measurement:** VCDM-based model coverage shows how far we got in formalization, not a metric. Frame as elaboration/soundness-completeness, not as measurement.
9. **Re-derive binding claims:** Re-run binding claims derivation from the original abstract.
10. **Teaser figure:** Oszkár to provide Refinery screenshot from SW for teaser placeholder.
11. **Teams group:** Create Teams group for coordination.

## Already processed (do NOT duplicate)

These items from the same meeting are already captured in `.claude/memory/`:

- **DCL rename** → `decision_dcl_rename.md` (originally from Imre notes same meeting, but applies)
- **No MDA terminology** → `decision_no_mda_terminology.md`
- **CSOK running example** → `decision_csok_running_example.md`

## Items already covered by existing todos

Cross-reference before creating duplicates:

- Item 7 (evaluation schema) → partially covered by `T08` (eval elaboration), `O-FIG` (scalability figs), `O-BASE` (baseline), `O-THREATS` (threats to validity)
- Item 6.2 (functional overview box diagram) → partially covered by `O05` (teaser/figure design) and `O-MODES` (usage modes)
- Item 9 (re-derive binding claims) → run `skills/review_claim_evidence_audit`
- Item 10 (teaser figure) → `O05` exists, but add note that Oszkár provides Refinery screenshot
- Item 11 (Teams group) → external coordination, not a Claude task

## What needs to be created

For each item below, create the appropriate artifact:

### New decisions (`.claude/memory/decision_*.md`)

- **Item 1+2: Gap paragraph + emerging interactions** → `decision_gap_framing.md` — Gap claim uses "collected and formalized" framing (no citation needed). Must explicitly state cross-layer constraint interactions produce emergent behaviour unpredictable by single-layer inspection.
- **Item 4: Competing peer requirements** → `decision_peer_requirements_framing.md` — VC ecosystem constraints come from competing, non-cooperating stakeholders (unlike hierarchical automotive requirements). This is a core motivating distinction.
- **Item 6: Sec 03 restructure** → `decision_sec03_overview_structure.md` — Rename Sec 03 from "Motivation" to "Overview" with subsections: 3.1 Motivation, 3.2 Functional Overview (box diagram), 3.3 Worked example walkthrough.
- **Item 8: VCDM coverage framing** → `decision_vcdm_coverage_not_metric.md` — VCDM model coverage is elaboration (soundness/completeness), not a measurement. Do not present it as a metric.

### New feedback memories (`.claude/memory/feedback_*.md`)

- **Item 3: Justify novel tooling** → `feedback_justify_tooling.md` — Must explain *specific challenges* that necessitate novel tooling, not just assert the need. Generic "existing tools are insufficient" is not enough.
- **Item 5: Noor ECMFA differentiation** → `feedback_noor_differentiation.md` — Noor's ECMFA paper must be cited and clearly differentiated. A reviewer who sees both must immediately understand the distinction.

### Todos to create or update (`context/todos/`)

- **Item 6.2:** Create todo for Sec 03 functional overview box diagram (input/output spec above). Check if `O05` or `O-MODES` already covers this; if not, create new todo.
- **Item 7:** Verify `T08`, `O-FIG`, `O-THREATS` collectively cover the full evaluation schema. If gaps exist (e.g., "selected domains" descriptive section, measurement setup details), create targeted todos.
- **Item 9:** Add note to binding claims that they need re-derivation from the original abstract. Can be a todo or a note on existing claim memories.
- **Item 10:** Update `O05` to note that Oszkár provides a Refinery screenshot placeholder.

## Acceptance criteria

- [ ] Every numbered item above has a corresponding artifact (decision, feedback, todo) or is marked as already covered
- [ ] No duplication with existing decisions or todos
- [ ] All new decisions have: rationale, affects, revisit_when
- [ ] All new feedback has: rule, why, how to apply
- [ ] INDEX.md and MEMORY.md updated to reference new files
- [ ] Items 10 and 11 noted as external/Martin tasks, not Claude tasks
