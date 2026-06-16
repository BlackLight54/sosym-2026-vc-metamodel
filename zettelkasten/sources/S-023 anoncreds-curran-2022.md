---
id: S-023
title: AnonCreds specification (Curran et al.)
type: source
maturity: permanent
tags: [topic/format, prov/external]
citekey: curran2022anoncreds
sources: ["sections/02_background.md §2.1", "sections/04_approach.md §4.3"]
related: ["[[C-016 format-capability-matrix]]", "[[C-025 governance-conflict-vertical]]"]
created: 2026-06-16
---

**Curran et al., 2022.** AnonCreds: a credential format supporting both selective disclosure and
predicate proofs (ZKPs that a value satisfies a predicate without disclosing it).

## Relation to this work
The only in-scope format with `supports_predicate_proof` / `supports_zkp` — and the only one that does
**not** conform to W3C VCDM 2.0. This asymmetry is the crux of Headline 1: predicate-proof capability
and VCDM conformance are mutually exclusive among the in-scope formats.

## Links
- [[C-016 format-capability-matrix]] — its capability row.
- [[C-025 governance-conflict-vertical]] — the conflict it anchors.

## Source
Background §2.1; approach §4.3.
