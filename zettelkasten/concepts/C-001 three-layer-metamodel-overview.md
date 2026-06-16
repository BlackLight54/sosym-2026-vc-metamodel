---
id: C-001
title: Three-layer metamodel overview
type: concept
maturity: permanent
tags: [layer/cross, kind/metamodel]
sources: ["sections/04_approach.md §4 intro", ".claude/memory/claim_01_three_layer.md"]
related: ["[[C-002 domain-concept-layer]]", "[[C-003 credential-schema-layer]]", "[[C-004 format-specific-layer]]", "[[C-009 cross-layer-constraint]]", "[[K-001 three-layer-metamodel]]"]
created: 2026-06-16
---

Credential ecosystem design involves three distinct concerns: what domain-level facts exist and how
they relate, how those facts are grouped into credentials with defined subjects and claims, and which
concrete format each credential uses. The metamodel separates these into three layers — the Domain
Concept Layer (DCL), the Credential Schema Layer (CSL), and the Format-Specific Layer (FSL). Each
layer is derived from the one above and carries its own intra-layer constraints; constraints within
and across layers are formalized as graph predicates the Refinery framework evaluates.

The layers are abstraction layers but **not** related by instantiation: a credential schema is not an
instance of a domain concept, it is a separate representation governed by a different authority. This
distinguishes the metamodel from standard multi-level metamodeling.

## Links
- [[C-002 domain-concept-layer]], [[C-003 credential-schema-layer]], [[C-004 format-specific-layer]] — the layers.
- [[C-009 cross-layer-constraint]] — what connects them.
- [[K-001 three-layer-metamodel]] — the binding claim.

## Source
`sections/04_approach.md` opening; claim_01.
