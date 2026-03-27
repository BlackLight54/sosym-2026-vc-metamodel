# T10: Final Polish — Evaluation Preamble, Intro P5, Abstract Numbers

**Wave:** 3 (after T08 + T09 complete)
**Execution:** Single agent. Revises existing prose + drafts short connecting text.
**Dependencies:** T08 (evaluation content), T09 (threats + scalability).
**Target files:** `sections/05_evaluation.md` (preamble), `sections/01_introduction.md` (P5), `sections/00_abstract.md` (evidence sentence).
**Downstream:** None — this is the final task.

---

## Context

This task handles three small but important pieces that depend on the full evaluation being in place:
1. Evaluation section preamble — introduces the evaluation strategy before diving into subsections
2. Introduction P5 — the structure paragraph that tells the reader what is in each section
3. Abstract evidence sentence — fills in concrete numbers from the completed evaluation

**Binding claims delivered:** #10 (necessity argument — abstract evidence).

## Read Before Writing

1. `sections/05_evaluation.md` — full section after T08 + T09
2. `sections/01_introduction.md` — current P5 (structure paragraph, may already be drafted)
3. `sections/00_abstract.md` — current abstract (look for placeholder or vague evidence claims)
4. `CLAUDE.md` — writing style

## What to Draft

### Evaluation Preamble (2-3 sentences, top of Section 5)
- State the evaluation strategy: coverage characterization against VCDM 2.0, expressiveness against EU governance requirements, two headline results demonstrating cross-layer constraint value, anti-pattern detection catalog, baseline comparison, scalability measurement
- Forward-reference the subsection structure
- Set expectations: this is a design-science evaluation (not empirical user study)

### Introduction P5 — Structure Paragraph (~4-5 sentences)
- "Section~\ref{sec:background} introduces..." through "Section~\ref{sec:conclusion} summarizes..."
- Use `\ref{sec:...}` for ALL section references
- Match the actual section content (not stale descriptions)
- If P5 already exists, update it to reflect final section contents

### Abstract Evidence Sentence
- Find the sentence in the abstract that states evaluation evidence
- Fill in concrete numbers from completed evaluation:
  - Coverage: $N$/$M$ VCDM 2.0 concepts (from T08 5.1.1)
  - Expressiveness: $K$ constraints from $S$ sources (from T08 5.1.2)
  - Anti-patterns detected: count (from T08 5.1.4)
- If numbers are still placeholder, leave as `$N$/$M$` but flag for Martin

### DO NOT TOUCH
- Abstract structure beyond the evidence sentence
- Introduction P1-P4
- Evaluation subsection content (T08/T09 output)

## Constraints

- All cross-references MUST use `\ref{sec:...}`
- Structure paragraph must accurately reflect final section contents
- Abstract numbers must match evaluation section exactly — no rounding or exaggeration
- Budget: minimal — these are connecting/updating edits, not new content
- No LLM tells. Obsidian Markdown.
