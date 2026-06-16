---
id: C-026
title: Headline 2 — cross-credential predicate gap (horizontal)
type: concept
maturity: permanent
tags: [topic/format, kind/result, layer/cross]
sources: ["sections/05_evaluation.md §5.1.3", "sections/04_approach.md §4.4", ".claude/memory/decision_two_headline_results.md"]
related: ["[[C-011 shadow-predicate]]", "[[C-016 format-capability-matrix]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-025 governance-conflict-vertical]]", "[[K-009 multilayer-invisibility]]"]
created: 2026-06-16
---

The second headline result, *horizontal*: a domain constraint spanning credential boundaries exceeds
any single format's capability. The floor-area rule `property_area ≥ min_area(num_children)` (C4)
combines values from two credentials issued by independent authorities — property area (land registry)
and number of children (civil registry). No in-scope format supports cross-credential arithmetic
predicates in zero-knowledge (`supports_multi_credential_proof` is empty for all five). To verify the
constraint the verifier must see both raw values, defeating the privacy ZKP-capable formats promise.

Captured as the shadow predicate `cross_cred_predicate_gap` (C9), which fires for every aligned
credential pair. No layer-internal check reveals the gap: the DCL constraint is well-defined, both
credentials are well-formed at the CSL, each format is valid at the FSL. Orthogonal to Headline 1
(conflicting requirements on one credential vs a requirement no format can meet across credentials).

## Links
- [[C-011 shadow-predicate]] — the `cross_cred_predicate_gap` / `aligned` predicates.
- [[C-016 format-capability-matrix]] — the empty multi-credential column.
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]] — C4/C9.
- [[C-025 governance-conflict-vertical]] — the orthogonal first headline.
- [[K-009 multilayer-invisibility]] — the binding claim.

## Source
`sections/05_evaluation.md §5.1.3`; `sections/04_approach.md §4.4`.
