---
id: C-017
title: Capability-driven format elimination
type: concept
maturity: permanent
tags: [layer/fsl, topic/format, topic/dse, kind/predicate]
sources: ["sections/04_approach.md §4.3, §4.4"]
related: ["[[C-010 propagation-rule-and-negative-elimination]]", "[[C-016 format-capability-matrix]]", "[[C-025 governance-conflict-vertical]]", "[[C-020 three-usage-modes]]"]
created: 2026-06-16
---

Format-capability propagation rules apply negative elimination at the format level: when a governance
annotation demands a capability, incompatible format classes are eliminated, narrowing the format
design space during generation. Requiring `supports_predicate_proof` on IncomeCred excludes SD-JWT-VC,
JWT-VC, mdoc, and JSON-LD, leaving only AnonCreds — which does not conform to VCDM, setting up the
governance conflict.

When **no** in-scope format satisfies a required capability, the only workaround is restructuring the
DCL — replacing a numeric property with pre-computed boolean claims. That is a cross-layer design
consequence: a format limitation forces a change two layers up.

## Links
- [[C-010 propagation-rule-and-negative-elimination]] — the mechanism.
- [[C-016 format-capability-matrix]] — the capabilities being matched.
- [[C-025 governance-conflict-vertical]] — the conflict elimination sets up.
- [[C-020 three-usage-modes]] — elimination underlies DSE / UNVIABLE results.

## Source
`sections/04_approach.md §4.3, §4.4`.
