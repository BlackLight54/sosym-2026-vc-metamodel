---
id: A-003
title: CSOK running-example instances (csok_instance.refinery, csok.problem)
type: artifact
maturity: permanent
tags: [kind/example, topic/refinery, prov/self]
sources: ["models/csok_instance.refinery", "models/csok.problem", "models/csok_standalone.problem", "models/README.md"]
related: ["[[C-021 csok-running-example]]", "[[M-006 running-example-csok]]", "[[A-001 vc-metamodel-refinery]]", "[[A-004 constraint-sensitivity-variants]]"]
created: 2026-06-17
---

**Artifact:** the CSOK (Hungarian Family Housing Subsidy) running example as Refinery models.
`csok_instance.refinery` defines three credentials (FamilyStatusCred, PropertyCred, IncomeCred) for a
shared applicant. `csok.problem` is the canonical entry point (imports metamodel + conflict + instance,
full governance; expected UNSAT). `csok_standalone.problem` (~11 KB) is the self-contained web-editor
version; `csok_generated.problem` is the SAT variant for generation; `csok_2x`/`csok_3x` scale to 6/9
credentials.

## What it provides
The single worked example carrying the whole paper, in executable form. Load `csok_standalone.problem`
in the Refinery editor to see the metamodel populated with the example and the solver assigning formats.

## Links
- [[C-021 csok-running-example]] — the example concept.
- [[M-006 running-example-csok]] — the running-example map.
- [[A-004 constraint-sensitivity-variants]] — the governance-subset variants of this instance.

## Source
`models/csok_instance*.refinery`, `models/csok*.problem`; `models/README.md`.
