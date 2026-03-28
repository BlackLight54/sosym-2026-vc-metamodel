---
id: T10
short: "final-polish"
title: "Final polish — eval preamble, Intro P5, abstract numbers"
status: pending
depends_on: ["T08", "T09"]
binding_claims: [10]
target: sections/01_introduction.md, sections/00_abstract.md, sections/05_evaluation.md
priority: high
pipeline: "consolidation"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Three small but important pieces that depend on the full evaluation being in place: evaluation preamble, introduction structure paragraph (P5), and abstract evidence sentence with concrete numbers. Delivers **Binding Claim #10** (necessity/effectiveness argument).

## Read before writing

1. `sections/05_evaluation.md` — full section after T08 + T09
2. `sections/01_introduction.md` — current P5 (structure paragraph)
3. `sections/00_abstract.md` — current abstract (look for placeholder evidence claims)

## What to draft

### Evaluation preamble (2-3 sentences, top of Section 5)

- State the evaluation strategy: coverage, expressiveness, headline results, anti-pattern catalog, baseline comparison, scalability
- Forward-reference subsection structure
- Set expectations: design-science evaluation, not empirical user study

### Introduction P5 — Structure paragraph (~4-5 sentences)

- "\autoref{sec:background} introduces..." through "\autoref{sec:conclusion} summarizes..."
- Match actual section content (not stale descriptions)
- **Per X08**: Anti-patterns are in evaluation (Sec 5.1.4), not approach (Sec 4). Fix attribution.
- **Per O-P5**: Mention §5.2 Scalability Measurement

### Abstract evidence sentence

- Fill in concrete numbers from completed evaluation:
  - Coverage: $N$/$M$ VCDM 2.0 concepts (from §5.1.1)
  - Expressiveness: $K$ constraints from $S$ sources (from §5.1.2)
  - Anti-patterns detected: count (from §5.1.4)
- If numbers still placeholder, leave as `$N$/$M$` and flag for Martin

## Also absorbs

- **O-P5**: Update Intro P5 (identical scope)
- **X08**: Fix structure paragraph anti-pattern attribution

## Constraints

- All cross-references use `\autoref{sec:...}`
- Structure paragraph must accurately reflect final section contents
- Abstract numbers must match evaluation section exactly
- Budget: minimal — connecting/updating edits, not new content

## Acceptance criteria

- [ ] Evaluation preamble orients the reader before subsections
- [ ] P5 accurately maps the final paper structure
- [ ] Anti-patterns attributed to Sec 5.1.4, not Sec 4
- [ ] Abstract evidence sentence has concrete numbers or flagged placeholders
- [ ] Binding Claim #10 delivered
