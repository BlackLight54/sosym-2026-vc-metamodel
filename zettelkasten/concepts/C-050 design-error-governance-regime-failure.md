---
id: C-050
title: Governance-regime failure design-error class (out-of-model)
type: concept
maturity: developing
tags: [topic/governance, kind/result, prov/external]
sources: ["context/slr/axis_d_nonweb.md", "context/slr/corpus_map.md", "zettelkasten/claims/K-016 design-error-taxonomy.md"]
related: ["[[K-016 design-error-taxonomy]]", "[[C-046 design-error-cross-framework-governance-conflict]]", "[[C-049 design-error-single-point-of-trust]]", "[[S-077 ec-eidas-evaluation-swd-2021]]", "[[S-076 enisa-trust-services-incidents-2024]]", "[[S-080 weigl-ssi-construction-governance-2023]]", "[[S-065 parsovs-estonian-eid-2020]]"]
created: 2026-07-17
---

**`[proposed]` (AF01/K-016).** Design-error class: the institutional governance *regime* around a credential ecosystem fails, through fragmented or divergent supervision, unresolved tension between actors, or accumulated operational and sustainability debt, so the ecosystem degrades even when every individual credential is well-formed. This is distinct from [[C-046 design-error-cross-framework-governance-conflict]]: that class is a *formal* unsatisfiability of joint constraints on one credential (the in-model C8 predicate, headline C-025); this class is *runtime and institutional* dysfunction of the governing bodies themselves.

- **Layer scope:** **out-of-model.** Like [[C-049 design-error-single-point-of-trust]], regime failure is a runtime, institutional, and operational property of the governing organizations, not a structural relation among credential facts, so it is named out-of-model rather than mapped to a layer. Naming it explicitly is the honest move: the governance-arm evidence documents real design-relevant failure, but the metamodel does not detect it.
- **Detection instrument:** none in-model.
- **Carriers (AF01 governance arm):** [[S-077 ec-eidas-evaluation-swd-2021]] (the Commission's own eIDAS evaluation finding divergent national supervision produced fragmentation and reduced trust, a primary regulatory instrument); [[S-076 enisa-trust-services-incidents-2024]] (mandatory ENISA aggregation of trust-service security incidents reported by national supervisory bodies); [[S-080 weigl-ssi-construction-governance-2023]] (Government Information Quarterly, the tension between the self-sovereignty ideal and the institutional embedding trust frameworks require); [[S-065 parsovs-estonian-eid-2020]] (a listed provider's key-management failures escaping supervision).
- **VC relation:** the EU trusted-list governance regime and SSI trust-framework governance (vLEI, ToIP, Sovrin) are the B2B/B2G instances; the Sovrin Foundation collapse ([[S-079 sovrin-foundation-dissolution-2025]]) is where regime failure and single-point-of-trust ([[C-049 design-error-single-point-of-trust]]) meet.

## Why separate from C-046
C-046 is the paper's load-bearing formal result (an in-model predicate, C8, that headline C-025 instantiates). Filing runtime-regime carriers under it would blur the in-model formal claim with out-of-model institutional evidence, the first thing a formal reviewer attacks. Keeping them here preserves "each in-model class maps to a layer" while still recording the governance-arm findings honestly.

## Links
- [[K-016 design-error-taxonomy]]: the taxonomy this class belongs to; the second out-of-model class alongside [[C-049 design-error-single-point-of-trust]].
- [[C-046 design-error-cross-framework-governance-conflict]]: the in-model formal sibling this class is deliberately kept distinct from.

## Source
AF01 governance arm; advisor review 2026-07-17 (correcting the C-046 over-assignment); corpus axis_d_nonweb; K-016.
