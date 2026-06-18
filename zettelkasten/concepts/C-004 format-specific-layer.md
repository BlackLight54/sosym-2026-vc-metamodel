---
id: C-004
title: Format-Specific Layer (FSL)
type: concept
maturity: permanent
tags: [layer/fsl, topic/format, kind/metamodel]
sources: ["sections/04_approach.md §4.3", ".claude/memory/decision_fsl_elaboration.md", ".claude/memory/decision_format_driven_restructuring.md"]
related: ["[[C-001 three-layer-metamodel-overview]]", "[[C-016 format-capability-matrix]]", "[[C-018 governance-annotations]]", "[[C-017 capability-driven-format-elimination]]", "[[Q-002 fsl-intra-layer-constraints]]"]
created: 2026-06-16
---

The third layer assigns each credential a concrete representation format. The five formats in scope
(AnonCreds, JSON-LD, JWT-VC, SD-JWT-VC, mdoc) are subclasses of `Formatted_Credential`; each credential
contains exactly one.

Unlike the DCL and CSL, the FSL carries **no intra-layer structural constraints** (no error predicates
analogous to `non_connected` or `no_empty_cred`). Its contribution is nevertheless load-bearing:
capability predicates feed cross-layer constraints C5–C9, governance annotations attach regulatory
requirements to individual credentials, and propagation rules narrow the format design space during
generation. Formats lacking predicate proofs force issuers to pre-compute boolean claims, restructuring
the DCL — a cross-layer design consequence. Adding format-internal constraints (SD-JWT-VC disclosure
granularity, mdoc namespace partitioning) would strengthen the layer but is not required for the
cross-layer contribution; this deferral is defended argumentatively, not as an oversight.

## Links
- [[C-016 format-capability-matrix]] — the six capability predicates per format.
- [[C-018 governance-annotations]] — EidasMandate / PrivacyRequirement / VcdmConformance markers.
- [[C-017 capability-driven-format-elimination]] — how propagation narrows the format space.
- [[Q-002 fsl-intra-layer-constraints]] — the deferred elaboration.

## Source
`sections/04_approach.md §4.3`; FSL-elaboration and format-driven-restructuring decisions.
