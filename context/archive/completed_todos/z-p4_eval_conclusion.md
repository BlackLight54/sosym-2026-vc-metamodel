---
id: "Z-P4"
short: "eval-conclusion"
title: "Evaluation polish + Conclusion minor fixes"
status: done
depends_on: ["T08"]
binding_claims: [7, 10]
target: "sections/05_evaluation.md, sections/07_conclusion.md"
priority: medium
pipeline: "z01-triage"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Polish evaluation elaboration subsection and fix conclusion gaps. Bundles Z01 items T39, T40, T46, T47.

**Prerequisite:** T08 (evaluation elaboration) should be done first — the subsections this todo polishes are drafted by T08.

## Read before writing

1. `sections/05_evaluation.md` lines 1-113 — elaboration subsections (do NOT touch scalability in lines 115+)
2. `sections/07_conclusion.md` — conclusion text
3. `sections/04_approach.md` — anti-pattern predicates (for T47 conclusion mention)

## What to draft

### Evaluation polish (Sec 05, lines 1-113 only)

**T39 — NAIH paragraph compression:**
The NAIH (Hungarian data protection authority) example paragraph in the anti-pattern subsection (5.1.4) is too long. Compress ~30%. Keep the three essential elements:
- The bank was fined for privacy violation
- The pregnancy booklet example (concrete illustration)
- The NAIH finding (regulatory consequence)

Cut: detailed medical data description, extended regulatory context. The reader needs the pattern (privacy violation → fine), not the medical specifics.

**T40 — SNARK row in format table:**
The SNARK row in the format capability table (in 5.1.2 or 5.1.3) is a distraction from the core formats analyzed in the paper (SD-JWT-VC, AnonCreds, JSON-LD VC). Move the SNARK entry to a footnote: "ZK-SNARK-based formats such as Mina Protocol credentials support predicate proofs but are not deployed in EU wallet ecosystems and lack W3C VCDM conformance." This keeps the information accessible without cluttering the main comparison.

### Conclusion fixes (Sec 07)

**T46 — Split compound future work (line 17):**
The third future work direction currently combines two concerns: "an empirical case study with credential ecosystem designers would evaluate whether the formalization improves design decision-making in practice, and investigation of portability to other constraint-based toolchains would reduce the current single-tool dependency." Split into two separate directions:
- Direction 3: Empirical evaluation with credential ecosystem designers
- Direction 4: Portability investigation to other constraint-based toolchains (Alloy, USE/OCL)

Result: 4 distinct future work directions (FSL extension, constraint catalog broadening, empirical evaluation, tool portability).

**T47 — Anti-pattern mention in conclusion P2 (line 13):**
The conclusion's second paragraph discusses the governance conflict and cross-credential predicate gap but does not mention the anti-pattern detection contribution. Add a brief clause: "The formalization additionally classifies five structural anti-patterns as graph predicates, establishing that the metamodel subsumes standard structural well-formedness checking (\autoref{sec:antipatterns})." Place after the headline results sentence.

## Constraints

- Do NOT touch Sec 05.2 (scalability) or Sec 05.3 (threats) — those are T09's scope
- Sec 07 budget: 0.75 pages
- No LLM tells
- `\autoref{}` for cross-references

## Acceptance criteria

- [ ] NAIH paragraph compressed ~30% (3 key elements retained)
- [ ] SNARK moved from table row to footnote
- [ ] Conclusion has 4 distinct future work directions
- [ ] Anti-patterns mentioned in conclusion P2
- [ ] No edits to Sec 05 lines 115+
