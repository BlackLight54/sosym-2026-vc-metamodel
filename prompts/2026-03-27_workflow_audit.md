# Cross-Reference Audit: Workflow ↔ Full Project State

## Goal

Read context/WORKFLOW.md and cross-reference it against the entire accumulated project state — all section drafts, context/DECISIONS.md, TODO.md, context/VENUE.md, CLAUDE.md, gap analysis, meeting notes, consolidation pipeline, memory files, plan files, and the notes file. Produce a structured audit report identifying what the workflow captures well, what it misses, and what it should become for the next paper.

## Recommended setup

Use `/model opus[1m]` — this task reads ~20 files and needs the full picture in context simultaneously.
Use `/effort high` for deeper reasoning on cross-referencing.

## Files to read in full

**Core workflow and project files:**
- `context/WORKFLOW.md`
- `context/DECISIONS.md`
- `TODO.md` (especially the Done table — ground truth of what actually happened)
- `context/VENUE.md` (deadlines, reviewer personas, supplementary strategy)
- `CLAUDE.md` (operating modes, time-awareness brackets, plan-mode protocol, persona)
- `NOTES_REGARDING_WORKFLOW_SCAFFOLD.md`

**Accumulated project knowledge:**
- `context/archive/meeting_notes_2026-03-25.md`
- `context/archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md`
- `context/archive/arf_5_3_4_gap_analysis.md`

**Pipeline artifacts:**
- `prompts/2026-03-27_consolidation/PIPELINE.md`
- `prompts/2026-03-27 other tasks/PIPELINE.md`

**Plan files:**
- `.claude/plans/linked-petting-prism.md` (consolidation plan)

**Memory files (feedback, user profile, references):**
- All files in `C:\Users\Martin\.claude\projects\c--Users-Martin-code-MODELS-26\memory\` (read MEMORY.md index first, then each referenced file)

**Actual prompt files (for template drift analysis — read 3):**
- `prompts/2026-03-27_consolidation/T01_dcl_definitions.md`
- `prompts/2026-03-27_consolidation/T07_cross_layer.md`
- `prompts/2026-03-27_consolidation/T08_evaluation.md`

**Scan headers/first 50 lines for context:**
- All section files in `sections/` (to see what markers, metadata, and structure look like in practice)
- `skills/reviewer_archetypes_guide/SKILL.md`
- `skills/running_example_guide/SKILL.md`

**Skill inventory:**
- `ls skills/` — list all skill directories

## Output format

Plan mode. Do NOT edit any files. Produce a single structured report with these 14 sections:

---

### 1. Workflow Gaps
Work types, patterns, or recurring tasks that emerged during the project but have no corresponding task type or skill reference in context/WORKFLOW.md.

For each gap: what the missing task type is, where the evidence comes from (which file/decision/event), and a proposed context/WORKFLOW.md entry (task name, skill reference if applicable, prompt template if needed).

### 2. Dead or Underused Entries
Workflow task types that were never used, proved unhelpful, or were superseded by how work actually got done.

For each: the task type, why it appears unused (never in Done table, no prompt references it, etc.), recommendation (keep/revise/remove).

### 3. Uncodified Lessons
Hard-earned lessons visible in context/DECISIONS.md, meeting notes, or the notes file that should be codified into the workflow but aren't.

For each: the lesson (from which file), what it implies for the workflow, and where in context/WORKFLOW.md it should land.

### 4. Skill Coverage Matrix

| Skill name | In context/WORKFLOW.md? | Exists in skills/? | Actually used (Done table)? | Notes |
|---|---|---|---|---|

### 5. Pipeline Pattern Promotion
What patterns from the consolidation pipeline should become first-class workflow templates? Be specific: show what the template would look like.

Focus on: dependency graphs, wave parallelism, binding claim tracking per task, critical path identification.

### 6. Decision–Workflow Guards
Decisions in context/DECISIONS.md that constrain how tasks should be done but have no corresponding workflow guard or checklist step.

For each: the decision, the implied guard, and where it should appear in context/WORKFLOW.md (which task type's checklist or constraints).

### 7. Notes Backlog Triage

| Note item | Implemented? | Still relevant? | Action (close/implement/defer) |
|---|---|---|---|

### 8. Temporal Analysis
Map the Done table chronologically against CLAUDE.md's time-awareness brackets (>30d, 15-30d, 7-14d, <7d, <2d). Did the prescribed phase behavior (exploration → drafting → convergence → polish) match what actually happened? Where did the project deviate? Should the brackets be recalibrated?

### 9. Advisor Feedback Integration
The `meeting_notes → context/DECISIONS.md → prompt pipeline` cascade was a discovered workflow pattern. Document it: what triggered it, what steps it involved, how long it took, what it produced. Propose a context/WORKFLOW.md task type with a prompt template.

### 10. Audit-Driven Prioritization
The `claim_evidence_audit` skill produced binding claim status that directly determined the consolidation pipeline's critical path and task ordering. This feedback loop (`audit → priority ranking → pipeline design`) is not captured in context/WORKFLOW.md. Document the pattern and propose where it belongs.

### 11. Prompt Template Drift
Compare the actual T01/T07/T08 prompt files against context/WORKFLOW.md's "Draft a section" and "Draft formal definition" templates. Where do the real prompts contain structure (binding claims, cross-references to other tasks, wave dependencies, specific subsection targets) that the templates don't account for? Propose updated templates.

### 12. Plan File vs. Prompt Directory
When should work produce a `.claude/plans/` file, a `prompts/` directory, or both? Derive the answer from how this project actually used them. Propose a decision rule for context/WORKFLOW.md.

### 13. Marker Discipline
The project uses @CITE, @TODO, @FORMAL, @FIGURE, @META, @SCAFFOLD markers. The workflow defines them but doesn't say when to *clean* them. The consolidation workflow invented T00b (scaffold merging) ad hoc. Propose a marker hygiene task type: when to run it, what it does, how it fits into the pipeline pattern.

### 14. Archive Taxonomy
context/WORKFLOW.md says "significant removed text goes to archive/" but in practice archive/ also holds gap analysis results, meeting notes, FCA exports, and ARF analysis. The convention drifted. Propose a revised archive taxonomy that matches actual usage.

---

## Constraints

- Do NOT propose changes to section content — this is a workflow audit, not a paper review.
- Do NOT run skills or edit files.
- Be direct about what is missing and what is dead weight. No hedging.
- If something in context/WORKFLOW.md is well-designed and validated by how the project actually played out, say so briefly — but focus the report on gaps and improvements.
- Where you identify a pattern, show the pattern concretely (with an example from this project), don't just name it abstractly.
- This audit is for improving the workflow for future papers, not for fixing this paper. Frame recommendations accordingly.
