---
id: C-025
title: Headline 1 — income governance conflict (vertical)
type: concept
maturity: permanent
tags: [topic/governance, kind/result, layer/fsl]
sources: ["sections/05_evaluation.md §5.1.3", ".claude/memory/claim_08_contradictory_constraints.md", ".claude/memory/decision_two_headline_results.md"]
related: ["[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-016 format-capability-matrix]]", "[[C-012 error-predicate]]", "[[C-026 cross-credential-predicate-gap-horizontal]]", "[[K-008 contradictory-cross-framework-constraints]]", "[[C-034 statutory-unlinkability-gap]]", "[[D-014 regulator-documented-conflict]]"]
created: 2026-06-16
---

The first headline result, *vertical*: three independently enacted governance frameworks impose
contradictory format requirements on a **single** credential (IncomeCred). eIDAS ARF (C5) requires
SD-JWT-VC/mdoc; GDPR Art. 5(1)(c) (C6) requires predicate-proof capability; W3C VCDM (C7) requires
VCDM conformance. The `governance_conflict` error predicate has two disjunctive clauses: clause 1 fires
for VCDM-conformant formats lacking predicate proofs (SD-JWT-VC, JSON-LD, JWT-VC); clause 2 fires for
predicate-proof-capable formats outside VCDM (AnonCreds); mdoc lacks both. No format escapes all
constraints — **unsatisfiable**.

The constraint-sensitivity experiment confirms it: of eight governance subsets (G0–G7), only the full
conjunction G7 is unsatisfiable; every proper subset admits a valid assignment. The only workaround,
pre-computing boolean threshold claims in SD-JWT-VC, requires changing the DCL — a cross-layer
consequence visible only under multi-layer analysis.

## Links
- [[C-016 format-capability-matrix]] — the asymmetry that forces the conflict.
- [[C-012 error-predicate]] — the `governance_conflict` predicate.
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]] — C5/C6/C7/C8.
- [[C-026 cross-credential-predicate-gap-horizontal]] — the orthogonal second headline.
- [[K-008 contradictory-cross-framework-constraints]] — the binding claim.
- [[C-034 statutory-unlinkability-gap]] — the same conflict shape documented in the live EU framework.
- [[D-014 regulator-documented-conflict]] — presentation: regulator-documented first, CSOK as instantiation.

## Source
`sections/05_evaluation.md §5.1.3`; claim_08; two-headline-results decision.
