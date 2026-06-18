---
id: C-018
title: Governance annotations
type: concept
maturity: permanent
tags: [layer/fsl, topic/governance, kind/metamodel]
sources: ["sections/04_approach.md §4.3"]
related: ["[[C-004 format-specific-layer]]", "[[C-022 eidas-arf-format-mandate]]", "[[C-023 gdpr-data-minimization]]", "[[C-025 governance-conflict-vertical]]"]
created: 2026-06-16
---

Three governance annotation classes — `EidasMandate`, `PrivacyRequirement`, `VcdmConformance` — attach
regulatory requirements to individual credentials as typed markers. They are the metamodel's device for
making governance sources **first-class structural elements**: each annotation records *which*
independent framework imposes a requirement, so a conflict can be attributed to its sources rather than
collapsing into an undifferentiated constraint set.

Annotations feed error identification and DSE: the `governance_conflict` error predicate fires only
when both an `EidasMandate` and a `PrivacyRequirement` target the same credential and no format
satisfies both alongside VCDM conformance.

## Links
- [[C-004 format-specific-layer]] — where annotations attach.
- [[C-022 eidas-arf-format-mandate]], [[C-023 gdpr-data-minimization]] — the sources annotated.
- [[C-025 governance-conflict-vertical]] — annotations trigger the conflict predicate.

## Source
`sections/04_approach.md §4.3`.
