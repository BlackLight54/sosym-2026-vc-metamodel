---
id: C-005
title: W3C VCDM 2.0 grounding
type: concept
maturity: permanent
tags: [topic/vcdm, kind/metamodel]
sources: ["sections/02_background.md §2.1", ".claude/memory/claim_02_vcdm_grounding.md", ".claude/memory/decision_vcdm_coverage_elaboration.md"]
related: ["[[C-001 three-layer-metamodel-overview]]", "[[C-015 coverage-soundness-completeness]]", "[[K-002 vcdm-grounding]]", "[[S-001 sporny-vcdm-2.0]]"]
created: 2026-06-16
---

The W3C Verifiable Credentials Data Model 2.0 defines a verifiable credential as a tamper-evident set
of claims an issuer makes about one or more credential subjects. A *claim* is a subject–property–value
triple; the issuer asserts claims, the holder possesses and presents the credential, the verifier
checks it. VCDM standardizes this structural vocabulary but does **not** prescribe domain-level value
semantics, the encoding format, or presentation-time privacy capabilities. That gap between structural
vocabulary and format-specific concerns is what the three-layer separation fills.

The metamodel is grounded in VCDM 2.0: every metaclass and capability predicate traces to a VCDM
concept (soundness). The grounding is characterized as a soundness–completeness pair rather than a
coverage metric.

## Links
- [[C-015 coverage-soundness-completeness]] — how grounding is validated.
- [[K-002 vcdm-grounding]] — the binding claim.
- [[S-001 sporny-vcdm-2.0]] — the source spec.

## Source
`sections/02_background.md §2.1`; claim_02; vcdm-coverage-elaboration decision.
