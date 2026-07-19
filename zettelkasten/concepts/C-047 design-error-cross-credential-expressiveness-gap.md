---
id: C-047
title: Cross-credential expressiveness-gap design-error class
type: concept
maturity: developing
tags: [topic/format, kind/result, layer/cross]
sources: ["context/slr/axis_d.md", "sections/05_evaluation.md §5.1.3", "zettelkasten/claims/K-016 design-error-taxonomy.md"]
related: ["[[K-016 design-error-taxonomy]]", "[[C-026 cross-credential-predicate-gap-horizontal]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-011 shadow-predicate]]", "[[K-009 multilayer-invisibility]]", "[[S-058 georgiev-dangerous-code-2012]]", "[[S-059 brubaker-frankencerts-2014]]"]
created: 2026-07-17
---

**`[proposed]` (AF01/K-016).** Design-error class: a well-defined domain constraint spans values from credentials issued by independent authorities and exceeds the proof capability of every deployed format, so the verifier is forced to over-collect raw values, defeating the privacy the formats promise. The VC-ecosystem analogue of the PKI **verifier-side capability and validation limit**, where what a verifier can actually check falls short of what the design requires.

- **Layer scope:** DCL to FSL (a domain-layer predicate with no format-layer realization).
- **Detection instrument:** `shadow` predicate ([[C-011 shadow-predicate]]); the cross-credential predicate-gap constraint **C9** ([[C-013 cross-layer-constraint-taxonomy-c1-c9]]); recorded, not repaired, because the gap is a capability limit rather than a contradiction.
- **X.509 precedent carrier:** [[S-058 georgiev-dangerous-code-2012]] and [[S-059 brubaker-frankencerts-2014]] (the gap between what certificate-validation code is required to check and what it can or does check).
- **VC instance (headline result):** [[C-026 cross-credential-predicate-gap-horizontal]], the floor-area rule `property_area >= min_area(num_children)` combining land-registry and civil-registry credentials, unsupported by any format's zero-knowledge capability.

This class is the second the paper's headline results instantiate. Headline 2 (horizontal) lands here and in **no other class**; the orthogonal Headline 1 lands in [[C-046 design-error-cross-framework-governance-conflict]].

## Links
- [[K-016 design-error-taxonomy]]: the taxonomy this class belongs to.
- [[C-026 cross-credential-predicate-gap-horizontal]]: the headline VC instance (C9).
- [[K-009 multilayer-invisibility]]: the binding claim the instance delivers.

## Source
AF01 WS1 synthesis; corpus axis d (verifier-side carriers); C-026; K-016.
