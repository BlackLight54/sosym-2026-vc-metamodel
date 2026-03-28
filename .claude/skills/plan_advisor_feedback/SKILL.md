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
- Current paper state: section files, decision memories in `.claude/memory/decision_*.md`, `context/todos/INDEX.md`.

## Steps

### 1. Capture raw feedback

If not already saved, write raw notes to `context/archive/feedback/[source]_[date].md`.

Format: preserve the original structure. Add section headers if the source is unstructured. Tag each item with the person who raised it (e.g., `[Imre]`, `[Reviewer B]`).

### 2. Extract actionable items

Read the raw feedback. For each actionable item, classify:

| Item | Type | Urgency | Affects |
|------|------|---------|---------|
| [summary] | direction / correction / question / suggestion | blocking / important / nice-to-have | [sections] |

- **Direction:** Advisor says "do X" or "frame it as Y." -> Decision.
- **Correction:** "This is wrong" or "This term is non-standard." -> Decision + revision.
- **Question:** "Have you considered X?" -> Research task or decision.
- **Suggestion:** "You might also mention Y." -> TODO item, prioritized by impact.

### 3. Record decisions

For each direction or correction, create a decision memory file in `.claude/memory/` with type: project. Each entry has: date, decision, rationale (from the advisor's reasoning), affected sections, and revisit condition.

If a new decision supersedes an existing one, move the old memory file to `context/archive/superseded_decisions/` and remove it from MEMORY.md before writing the replacement.

### 4. Design execution pipeline

If <=3 tasks result: add to `context/todos/` directly.

If >3 tasks result: run `skills/plan_consolidation_pipeline` to produce an ordered prompt pipeline. The claim evidence audit step can be skipped if the feedback doesn't affect binding claims — but verify this explicitly.

### 5. Map feedback to binding claims

Check: does any feedback item affect a binding claim from the abstract? Read `.claude/memory/claim_*.md` to check. If yes, flag it — binding claim changes are highest priority and may require re-running `skills/review_claim_evidence_audit` after the pipeline executes.

### 6. Report

Present to Martin:
- Decisions recorded (with links to decision files)
- Pipeline designed (with link to PIPELINE.md) or tasks added
- Binding claims affected (if any)
- Items deferred or rejected (with reasoning)

## After

- Execute the pipeline (Martin approves, then runs each prompt).
- After execution: re-run `skills/review_claim_evidence_audit` if binding claims were affected.
- Update `context/todos/`: mark feedback processing as done, add pipeline tasks.