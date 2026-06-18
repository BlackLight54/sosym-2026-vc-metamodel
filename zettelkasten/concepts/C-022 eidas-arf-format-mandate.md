---
id: C-022
title: eIDAS ARF format mandate
type: concept
maturity: permanent
tags: [topic/eidas, topic/governance, layer/fsl]
sources: ["sections/03_overview.md §3.1", "sections/05_evaluation.md §5.1.3"]
related: ["[[C-018 governance-annotations]]", "[[C-024 two-tier-governance-framing]]", "[[C-025 governance-conflict-vertical]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-033 dual-issuance-mandate]]", "[[S-028 eudiw-arf-status-2026]]"]
created: 2026-06-16
---

The eIDAS 2.0 Architecture and Reference Framework (ARF) mandates specific credential formats for
EU-wallet government attestations: SD-JWT-VC or mdoc. **Neither supports predicate proofs.** This is a
*hard* requirement — a legal/technical mandate the designer cannot relax — modeled as the `EidasMandate`
annotation and constraint C5.

The mandate is the first horn of the income governance conflict: it requires a format family that
structurally cannot provide the privacy capability GDPR demands. In the expressiveness evaluation,
three of eight ARF constraints are fully expressible and five partially expressible; none falls outside
the metamodel's capacity.

## Links
- [[C-018 governance-annotations]] — the EidasMandate marker.
- [[C-024 two-tier-governance-framing]] — eIDAS as hard vs GDPR as operationally binding.
- [[C-025 governance-conflict-vertical]] — C5 in the conflict.
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]] — C5.

## Source
`sections/03_overview.md §3.1`; `sections/05_evaluation.md §5.1.3`.
