---
id: M-011
title: MOC — claim delivery matrix (claim → evidence → figure → threat → open item)
type: moc
maturity: developing
tags: [kind/method, prov/self]
sources: [".claude/memory/claim_*.md", "sections/*.md", "models/README.md"]
related: ["[[M-008 artifact-inventory]]", "[[M-010 objection-ledger]]", "[[M-012 journal-extension-delta]]", "[[M-001 journal-paper-outline]]"]
created: 2026-07-05
---

One row per binding claim: where the evidence lives, which artifact reproduces it, which figure carries
it, which framing decision governs its presentation, which objection threatens it (see
[[M-010 objection-ledger]]), and what is still open. This is the spin document's backbone: a claim that
cannot resolve through this table is not ready to be promised. [[M-008 artifact-inventory]] is the
artifact-centric inverse of this map.

| Claim | Status | Prose evidence | Artifact | Figure ([[M-014 figure-plan]]) | Framing | Threat | Open |
|---|---|---|---|---|---|---|---|
| [[K-001 three-layer-metamodel]] | delivered | §4.1–4.4 | [[A-001 vc-metamodel-refinery]] | F1 type graph (exists) | [[D-001 modeling-first-framing]], [[D-003 no-mda-terminology]] | O1 | — |
| [[K-002 vcdm-grounding]] | delivered | §2.1, §4, §5.1.1 | [[A-001 vc-metamodel-refinery]] | F4 coverage map (planned, T11) | [[C-015 coverage-soundness-completeness]] lens | O3 | coverage figure |
| [[K-003 cross-layer-constraints-as-predicates]] | delivered | §4.4 | [[A-001 vc-metamodel-refinery]], [[A-002 governance-conflict-predicate]] | taxonomy table (exists) | [[D-004 gap-framing-collected-and-formalized]], [[D-005 formal-claims-required]] | O2 | — |
| [[K-004 automated-consistency-checking]] | delivered | §3.2, §4.4, §5.2 | [[A-005 evaluation-harness]] | F3 scalability (exists) | [[D-008 error-detection-vs-dse-two-modalities]] | O2 | closed 2026-07-17 (T12+AF02): all three operations (check, check -k, generate) benchmarked; richer instances ([[Q-007 scalability-deeper-hierarchies]], deeper hierarchies + multi-subject) measured, sublinear scaling holds under structural diversity, [[D-021 q007-structurally-diverse-instances]] |
| [[K-005 coverage-validation]] | delivered, figure open | §5.1.1 | — (prose audit) | F4 coverage map (planned) | [[D-007 three-axis-validation-structure]] | O3 | figure (T11) |
| [[K-006 expressiveness-validation]] | delivered, figure open | §5.1.2 | — (constraint table) | F5 expressiveness grid (planned) | [[D-015 expressiveness-strength-first]], [[D-016 dated-snapshot-method-over-catalogue]] | O7, O8 | re-verify closed 2026-07-13: ARF-C1..C8 confirmed against v2.9.0, classification unchanged 3 full / 5 partial (see K-note); figure (T11) |
| [[K-007 antipattern-detection]] | delivered, figure open | §5.1.4 | predicates in [[A-001 vc-metamodel-refinery]] | F6 anti-pattern visibility (planned) | [[D-007 three-axis-validation-structure]] | O3 | figure (T11) |
| [[K-008 contradictory-cross-framework-constraints]] | delivered | §5.1.3 | [[A-002 governance-conflict-predicate]], [[A-004 constraint-sensitivity-variants]] | F7 G0–G7 lattice (proposed) | [[D-014 regulator-documented-conflict]], [[D-011 gdpr-two-tier-operationalization]] | O5 | — |
| [[K-009 multilayer-invisibility]] | delivered | §5.1.3–5.1.5 | [[A-003 csok-instance-models]] | F2 teaser (exists) | [[D-012 format-driven-restructuring]] | O12 | — |
| [[K-010 necessity-of-multilayer-modeling]] | delivered, §5.3 open | §5.1.3–5.1.4, §7 | — (argument over the above) | F9 boundary map (proposed) | [[D-013 verifier-scope-issuer-remit]] qualifies the scope | O6, O11 | §5.3 external-validity paragraph (O-EUTHREAT) |
| [[K-016 design-error-taxonomy]] | `[proposed]` (D-020; not yet promised) | closing element; no section yet (spine) | — (documented synthesis over corpus axis d + non-web-PKI arm; [[C-044 design-error-issuance-schema-binding]]–[[C-049 design-error-single-point-of-trust]], [[M-015 design-error-taxonomy]]) | taxonomy figure (proposed, spine) | [[D-020 rq0-relevance-and-error-taxonomy]] | O3, O13 | `[proposed]` class set + wording (Martin); WS2 non-web-PKI arm done (10 carriers, PARTIAL, all six classes covered); WS3 pulls: Bochnia + Serrano verbatim-confirmed, Schmidt + Sroor need manual full-text pull to freeze, Hadan dimensions verified (already correct in S-055); section placement (spine) |

Differentiation claims [[K-011 differentiation-chorssi]]–[[K-015 differentiation-mlm-new-domain]] are
delivered in §6 and threaded via [[M-004 novelty-and-positioning]]; their objection is O1 collectively.

## Reading rule
Before the spin step promises a contribution, its row must have no blank evidence cell and its Open
cell must be either empty or scheduled. Update rows when a todo closes; a status change here must also
land in the K-note.

## Source
Derived from the K-notes, `sections/*.md`, `models/README.md`, and the June–July 2026 threat and
framing passes.
