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

- Binding claim status (from `skills/review_claim_evidence_audit` or abstract contract)
- Current section state (which sections have scaffolds, partial drafts, or complete drafts)
- Active decisions in `.claude/memory/decision_*.md` (constraints on every task)
- `context/todos/INDEX.md` (remaining work items)

## Prerequisites

Run `skills/review_claim_evidence_audit` first. The audit's binding claim status table is the primary input — it determines task priority and critical path.

## Steps

### 1. Assess current state

For each section file:
- Read the file. Classify: scaffold only / partial draft / complete draft / needs revision.
- Count unresolved annotation markers (`.todo`, `.scaffold`, `.cite`, `.formal`, `.figure` divs/spans).
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

```markdown
# [Label] Pipeline ([date])

[N] prompt files ([task IDs]).
Critical path: **[T_id -> T_id -> ... -> T_id]**

[ASCII dependency diagram]

## Task summary

| Task | Section | Content | Dependencies | Binding claims | Status |
|------|---------|---------|--------------|----------------|--------|
```

### 5. Write individual prompt files

One file per task. Filename: `T[NN]_[short_label].md`.

Each prompt file includes:

```markdown
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

[Terminology, decision entries that apply, page budget, presentation format, "do NOT" rules]

## After

[Verification steps. What to check. What downstream tasks to note.]
```

### 6. Update todos

Add todo files to `context/todos/` pointing to the pipeline directory, listing all tasks, and stating the critical path.

## Output

- `prompts/[date]_[label]/PIPELINE.md` — pipeline overview with dependency diagram
- `prompts/[date]_[label]/T[NN]_[label].md` — one per task
- Updated `context/todos/`

## Quality checks

- Every binding claim from the abstract appears in at least one task's "Binding claims delivered" field.
- Every task's dependencies are satisfiable (no circular dependencies).
- The critical path covers all HIGH RISK binding claims.
- Each prompt file is self-contained — a fresh Claude Code session can execute it without reading other prompts.
