---
id: C-036
title: Static/dynamic revocation-mismatch constraint
type: concept
maturity: developing
tags: [layer/cross, kind/predicate, topic/dse]
sources: ["inbox/notion/03-3-dse.md"]
related: ["[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-009 cross-layer-constraint]]", "[[C-035 dependent-claim-bundling]]", "[[S-027 own-tdk-thesis-mda]]"]
created: 2026-06-17
---

A DCL→CSL partitioning constraint from the precursor: claims with **mismatched revocation lifespans**
must be placed in **separate** credentials. Example: a passport credential carrying a person's name
(constant for life) and their right to travel abroad (revoked periodically). Bundling them means
revoking the dynamic claim needlessly revokes the static one, and can leave the Holder unable to present
a claim that should still be valid.

Reified as a partial-graph predicate forbidding a credential from containing two claims with different
revocation patterns. It is the **dual** of [[C-035 dependent-claim-bundling]]: bundling forces
co-location, revocation-mismatch forces separation. Together they show the catalogue must express both
"must be together" and "must be apart" partitioning rules.

Relation to the current taxonomy ([[C-013 cross-layer-constraint-taxonomy-c1-c9]]): **not among C1–C9**;
candidate for the expanded constraint catalogue. Introduces a temporal/lifecycle dimension
(revocation cadence) absent from the current structural and governance constraints.

## Links
- [[C-009 cross-layer-constraint]] — the general device.
- [[C-035 dependent-claim-bundling]] — the dual (co-location) constraint.
- [[S-027 own-tdk-thesis-mda]] — precursor provenance.

## Source
Notion `3_dse` "Static-dynamic claims" (page 03).
