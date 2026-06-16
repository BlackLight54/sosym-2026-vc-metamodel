---
id: C-015
title: Metamodel coverage as soundness–completeness
type: concept
maturity: permanent
tags: [topic/vcdm, topic/evaluation, kind/method]
sources: ["sections/05_evaluation.md §5.1.1", ".claude/memory/decision_vcdm_coverage_elaboration.md"]
related: ["[[C-005 vcdm-2.0-grounding]]", "[[C-028 three-axis-validation]]", "[[K-005 coverage-validation]]"]
created: 2026-06-16
---

Coverage of W3C VCDM 2.0 is characterized as a **soundness–completeness pair, not a measurement
metric**. *Soundness*: every metaclass and capability predicate traces to a VCDM concept (DCL
metaclasses formalize claim-level structure, CSL the credential packaging model, FSL format classes
plus six capability predicates the governance-relevant format properties). *Completeness*: the
metamodel deliberately excludes three VCDM concept families that lie outside credential *schema
design* — proof mechanisms (cryptographic, orthogonal to structure), verifiable presentations (runtime
protocols), and credential status (lifecycle). These three govern how a credential is *used*, not how
its structure is *designed*.

The justification is the design-time vs usage-time distinction: governance constraints from eIDAS,
GDPR, and W3C bear on structure and format assignment, and formalizing those at design time is what
makes cross-source conflicts detectable.

## Links
- [[C-005 vcdm-2.0-grounding]] — what is grounded.
- [[C-028 three-axis-validation]] — coverage is validation axis 1.
- [[K-005 coverage-validation]] — the binding claim.

## Source
`sections/05_evaluation.md §5.1.1`; vcdm-coverage-elaboration decision.
