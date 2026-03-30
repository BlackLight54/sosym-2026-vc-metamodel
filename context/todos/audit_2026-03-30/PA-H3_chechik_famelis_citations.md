---
id: "PA-H3"
short: "partial-model-citations"
title: "Add Chechik/Famelis partial model citations to Related Work"
status: pending
priority: medium
depends_on: []
binding_claims: [3, 4]
target: "sections/06_related_work.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Add citations to Chechik and Famelis's foundational partial model work in the Related Work section. VENUE.md explicitly names these as mathematician reviewer (Persona B) expectations: "Knows Refinery or its foundations. Could be someone aligned with Semerath/Varro/Chechik/Famelis."

## Context

The paper audit (Z01, item H3; S06 report) identified that `sections/06_related_work.md` Sec 6.3 discusses multi-level modeling and graph-based DSE but does not cite the foundational partial model literature that Refinery's four-valued semantics descend from. The mathematician reviewer will notice this gap because it is the intellectual lineage of the paper's core tool.

## Key references to add

Near the Refinery/partial-model discussion in Sec 06.3 (around line 27), add citations to:

- **Famelis, Salay, Chechik** — "Partial Models: Towards Modeling and Reasoning with Uncertainty" (ICSE 2012 or similar)
- **Chechik et al.** — work on multi-valued model checking and partial model merging

Check the project bibliography (`pandoc/references.bib`) first — these may already have BibTeX entries. If not, add entries. Use `[@key]` citation syntax in the Markdown.

## What to write

1-2 sentences positioning Refinery's partial model semantics relative to Chechik/Famelis's foundational work. The point is lineage acknowledgment, not a detailed comparison. Example structure: "Refinery's partial model semantics extend the [multi-valued/partial model] framework of [Chechik et al.] and [Famelis et al.], which established [key concept]. Our work applies these foundations to [credential ecosystem domain]."

## Acceptance criteria

- [ ] Chechik and/or Famelis cited in Sec 06.3
- [ ] BibTeX entries present in `pandoc/references.bib`
- [ ] Citation contextualizes Refinery's intellectual lineage
