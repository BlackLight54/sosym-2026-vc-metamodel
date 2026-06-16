---
id: A-001
title: Three-layer metamodel (vc_metamodel.refinery)
type: artifact
maturity: permanent
tags: [topic/refinery, kind/metamodel, prov/self]
sources: ["models/vc_metamodel.refinery", "models/README.md"]
related: ["[[C-001 three-layer-metamodel-overview]]", "[[C-007 graph-predicate-formalization]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-016 format-capability-matrix]]", "[[C-010 propagation-rule-and-negative-elimination]]"]
created: 2026-06-17
---

**Artifact:** `models/vc_metamodel.refinery` (~10.8 KB) — the primary artifact. Defines all classes,
relations, propagation rules, derived predicates, and format-capability constraints of the three layers
(DCL, CSL, FSL) in Refinery's DSL.

## What it provides
The executable form of the metamodel the paper describes in prose. Every layer concept and predicate
note traces here: DCL subjects/properties/values, CSL credentials/claims/subjects, FSL format classes
with capability predicates (selective disclosure, predicate proofs, VCDM conformance) and governance
annotations. Inspect interactively via `models/run_editor.sh` (Refinery web editor) or
`check`/`generate` through the Refinery CLI Docker image.

## Links
- [[C-001 three-layer-metamodel-overview]] — the structure this encodes.
- [[C-007 graph-predicate-formalization]] — predicates as the constraint language.
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]] — constraints C1–C9 realized here.
- [[C-016 format-capability-matrix]] — the FSL capability predicates.

## Source
`models/vc_metamodel.refinery`; `models/README.md` (Key files).
