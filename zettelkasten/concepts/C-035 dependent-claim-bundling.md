---
id: C-035
title: Dependent-claim bundling constraint
type: concept
maturity: developing
tags: [layer/cross, kind/predicate, topic/dse]
sources: ["inbox/notion/03-3-dse.md"]
related: ["[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-009 cross-layer-constraint]]", "[[C-036 static-dynamic-revocation-mismatch]]", "[[S-027 own-tdk-thesis-mda]]"]
created: 2026-06-17
---

A DCL→CSL partitioning constraint from the precursor, grounded in a W3C VCDM example: atomizing
dependent claims into standalone credentials lets a Holder recombine them into a **false** claim. The
W3C case: "Staff Member" + "Department of Computing" and "Post Graduate Student" + "Department of
Economics", split into four single-designation credentials, can be re-presented as the false pair
"Staff Member" + "Department of Economics".

Reified as a partial-graph predicate: when claims have a hierarchical dependence, a credential carrying
a child claim must also carry the claim it directly depends on, applied up the whole dependence tree.
This makes the false-claim state unrepresentable at design time.

Relation to the current taxonomy ([[C-013 cross-layer-constraint-taxonomy-c1-c9]]): **not among C1–C9**;
a candidate entry for the journal's expanded constraint catalogue. Distinct from C4
(cross-credential value dependency, which is arithmetic over values) — this governs **co-location** of
claims. Exact inverse of [[C-036 static-dynamic-revocation-mismatch]] (which forces separation).

## Links
- [[C-009 cross-layer-constraint]] — the general device.
- [[C-036 static-dynamic-revocation-mismatch]] — the dual (separation) constraint.
- [[S-027 own-tdk-thesis-mda]] — precursor provenance.

## Source
Notion `3_dse` "Bundling dependent claims" (page 03); W3C VCDM 2.0.
