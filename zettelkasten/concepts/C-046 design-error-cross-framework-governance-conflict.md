---
id: C-046
title: Cross-framework governance-conflict design-error class
type: concept
maturity: developing
tags: [topic/governance, kind/result, layer/fsl]
sources: ["context/slr/axis_d.md", "sections/05_evaluation.md §5.1.3", "zettelkasten/claims/K-016 design-error-taxonomy.md"]
related: ["[[K-016 design-error-taxonomy]]", "[[C-025 governance-conflict-vertical]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-012 error-predicate]]", "[[K-008 contradictory-cross-framework-constraints]]", "[[S-057 lopez-why-pki-failed-2005]]", "[[S-063 grindal-webpki-governance-2025]]", "[[S-056 gutmann-pki-not-dead-2002]]"]
created: 2026-07-17
---

**`[proposed]` (AF01/K-016).** Design-error class: two or more independently enacted governance frameworks impose jointly unsatisfiable format requirements on a single credential, so no compliant representation exists. The VC-ecosystem analogue of PKI **governance failure**, where trust and policy authority is fragmented across bodies whose rules do not compose.

- **Layer scope:** FSL, with roots in DCL to FSL and CSL to FSL (each framework constrains a different layer aspect; the contradiction is a format-level result).
- **Detection instrument:** `error` predicate; the governance-conflict constraint **C8** ([[C-013 cross-layer-constraint-taxonomy-c1-c9]]), which emerges only when C5, C6 and C7 are checked jointly.
- **X.509 precedent carrier:** [[S-057 lopez-why-pki-failed-2005]] (multi-source failure, why PKIs failed); [[S-063 grindal-webpki-governance-2025]] (governance as a first-class layer of the trust ecosystem); [[S-056 gutmann-pki-not-dead-2002]] (design-versus-deployment-reality mismatch).
- **Governance-regime carriers (AF01 governance arm):** [[S-077 ec-eidas-evaluation-swd-2021]], the Commission's own eIDAS evaluation finding that divergent national supervision produced fragmentation and reduced trust (primary regulatory instrument); [[S-076 enisa-trust-services-incidents-2024]], the mandatory ENISA aggregation of trust-service security incidents reported by national supervisory bodies (documented failure history); [[S-080 weigl-ssi-construction-governance-2023]] (GIQ), the governance tension between the self-sovereignty ideal and the institutional embedding trust frameworks require. Parsovs 2020 ([[S-065 parsovs-estonian-eid-2020]]) also evidences a listed provider's failures escaping supervision.
- **VC instance (headline result):** [[C-025 governance-conflict-vertical]], the income-governance conflict (eIDAS ARF vs GDPR Art. 5(1)(c) vs W3C VCDM on IncomeCred), unsatisfiable at G7.

This class is one of the two the paper's headline results instantiate. Headline 1 (vertical) lands here and in **no other class**; the orthogonal Headline 2 lands in [[C-047 design-error-cross-credential-expressiveness-gap]].

## Links
- [[K-016 design-error-taxonomy]]: the taxonomy this class belongs to.
- [[C-025 governance-conflict-vertical]]: the headline VC instance (C8).
- [[K-008 contradictory-cross-framework-constraints]]: the binding claim the instance delivers.

## Source
AF01 WS1 synthesis; corpus axis d (governance-failure carriers); C-025; K-016.
