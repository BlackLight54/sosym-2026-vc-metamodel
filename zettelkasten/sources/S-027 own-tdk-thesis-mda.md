---
id: S-027
title: TDK thesis — MDA/CIM-PIM-PSM precursor (own prior work, Notion)
type: source
maturity: developing
tags: [topic/dse, topic/refinery, prov/notion, prov/self]
citekey:
sources: ["inbox/notion/02-1-introduction.md", "inbox/notion/03-3-dse.md", "inbox/notion/04-4-approach.md", "inbox/notion/05-7-conclusion.md", "inbox/notion/06-architecture-diagram.md", "inbox/notion/07-entity-alignment-in-vc-schema-model-example.md"]
related: ["[[S-025 own-dse-vc-refinery]]", "[[D-003 no-mda-terminology]]", "[[D-012 format-driven-restructuring]]", "[[C-001 three-layer-metamodel-overview]]", "[[C-035 dependent-claim-bundling]]", "[[C-036 static-dynamic-revocation-mismatch]]"]
created: 2026-06-17
---

**Own prior work (TDK thesis), drafted in Notion.** The direct manuscript precursor of the layered
metamodel, written in **MDA vocabulary**: the design space exploration of VC schema ecosystems framed
as a CIM→PIM→PSM transformation chain over Refinery partial graph models. The Notion page
"Detecting Cross-Layer Design Errors…" records the conference version (authors Kocsis, Semeráth,
Marussy, Micskei; ACM MODELS'26; **status: withdrawn**), now being converted to the journal article.

## Vocabulary mapping (precursor → current)
The current paper renames the three layers and drops MDA framing ([[D-003 no-mda-terminology]]):

| Precursor (MDA) | Current ([[C-001 three-layer-metamodel-overview]]) |
|---|---|
| CIM — knowledge graph | DCL — domain concept layer |
| PIM — abstract VC schemas | CSL — credential schema layer |
| PSM — format-specific schemas | FSL — format-specific layer |

The precursor's Refinery predicate set already prefigures the current formalization: `non_connected`
(error), `pim_and_cim_should_align`/`tracing_cim_to_pim` (propagation), `aligned`, `prop_source`/
`prop_target`, `no_cred_props_for_cred_entity`/`root_ent_doesnt_have_cred` (errors) — corresponding to
[[C-010 propagation-rule-and-negative-elimination]], [[C-014 trace-reference]], [[C-012 error-predicate]].

## Relation to this work
Translate, do not copy. The precursor emphasized **DSE / Pareto-optimal schema partitioning and
format interoperability**; the journal article re-centers on **cross-layer design-error detection under
multi-source governance** ([[D-012 format-driven-restructuring]]). Two motivating constraints survive
the reframing as candidate catalogue entries: [[C-035 dependent-claim-bundling]] and
[[C-036 static-dynamic-revocation-mismatch]]. SOTA examples cited by the precursor (EUDIW/PID,
Amazon/Kaushik-Srinivasan cross-border trade 2023, Garzon 5G 2024) remain unresolved candidate S-notes.
**Open:** citekey UNRESOLVED — own unpublished thesis; cite the withdrawn MODELS'26 paper instead.

## Links
- [[S-025 own-dse-vc-refinery]] — the CSCS-2024 short-paper sibling in the same line.
- [[D-003 no-mda-terminology]] — why MDA vocabulary was dropped.

## Source
Notion pages 01–07 (inbox/notion/).
