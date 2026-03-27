# O04: Evaluation Design

**Wave:** 1.5 (after consolidation T01-T03 complete — contribution list stable; before T08 evaluation drafting)
**Execution:** Single agent. Runs `skills/evaluation_design`. Produces a plan, not prose.
**Dependencies:** T01 + T02 + T03 (layer definitions must be stable for contribution-to-evaluation mapping).
**Target file:** Plan output presented to Martin. Updates to TODO.md if needed.
**Downstream:** T08 (evaluation elaboration drafting) — the evaluation design informs what T08 drafts.

---

## Context

The evaluation section (Sec 05) already has substantial structure from the Sec 05 restructure (P04, 2026-03-26):

- **5.1 Elaboration:** VCDM coverage (5.1.1), constraint expressiveness table (5.1.2), headline results (5.1.3), anti-pattern detection (5.1.4), baseline comparison (5.1.5)
- **5.2 Scalability Measurement:** RQs, model instances, setup, results, analysis
- **5.3 Threats to Validity:** internal, external, construct, conclusion

This skill run is a **verification pass**: does the existing structure adequately map contributions to evidence? It may surface:
- Gaps: contributions without corresponding evaluation questions
- Mismatches: claim strength exceeding evaluation method
- Venue misalignment: evaluation approach not matching MODELS exemplar papers

## What to Do

1. Read `skills/evaluation_design/SKILL.md` and follow its steps.
2. Read the 3 numbered contributions from `sections/01_introduction.md` P3:
   - C1: Three-layer metamodel grounded in VCDM 2.0
   - C2: Cross-layer constraints as Refinery graph predicates
   - C3: Three-axis validation (coverage, expressiveness, error visibility)
3. Read the current evaluation structure in `sections/05_evaluation.md`.
4. Read `VENUE.md` — exemplar papers (Semerath et al. MODELS 2020, MODELS 2013) for evaluation patterns.
5. Map each contribution to evaluation questions. Check coverage.
6. Check that claim strength (abstract binding claims #1-#10) matches evaluation method strength.
7. Flag any mismatches, gaps, or venue-convention violations.
8. Present the analysis to Martin in plan mode. Do not draft prose.

## Read Before Executing

1. `skills/evaluation_design/SKILL.md` — skill steps
2. `sections/01_introduction.md` — P3 contribution list
3. `sections/05_evaluation.md` — current evaluation structure and scaffolds
4. `sections/00_abstract.md` — binding claims #1-#10
5. `VENUE.md` — exemplar papers, reviewer personas
6. `DECISIONS.md` — two headline results decision, evaluation-related decisions

## Constraints

- **Plan mode only.** No prose output. Present analysis and recommendations.
- Do not modify `sections/05_evaluation.md`. Only identify what T08 should draft or adjust.
- If the existing evaluation structure is adequate, say so and explain why — a "no changes needed" result is valuable.
- If gaps are found, propose specific additions with placement and rationale.
