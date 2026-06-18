---
id: A-006
title: Paper figure sources (pandoc/assets/ + Notion figure specs)
type: artifact
maturity: developing
tags: [kind/example, prov/self, prov/notion]
sources: ["pandoc/assets/", "pandoc/assets/README.md", "inbox/notion/06-architecture-diagram.md", "inbox/notion/07-entity-alignment-in-vc-schema-model-example.md", "inbox/notion/20-self-e-p-overview-diagram.md"]
related: ["[[C-001 three-layer-metamodel-overview]]", "[[M-006 running-example-csok]]", "[[C-030 scalability-measurement]]", "[[C-008 four-valued-partial-model-semantics]]", "[[M-007 writing-gaps]]"]
created: 2026-06-17
---

**Artifact:** the figure source files. In `pandoc/assets/`: `fig_metamodel` (the three-layer metamodel
diagram), `fig_teaser` (running-example teaser), `fig_scalability` (E1/E2 plots), `Model.excalidraw`,
and `partial.svg`/`concrete.svg`/`graph.svg` (partial-vs-concrete model illustrations). Notion holds
additional design specs not yet rebuilt as assets: the architecture diagram, the entity-alignment
example, and the self-evaluated-policies overview (inbox pages 06, 07, 20).

## What it provides
The visual evidence the figures carry. `fig_metamodel` illustrates [[C-001 three-layer-metamodel-overview]];
`fig_teaser` the [[M-006 running-example-csok]] thread; `fig_scalability` the
[[C-030 scalability-measurement]] result; the partial/concrete SVGs the
[[C-008 four-valued-partial-model-semantics]]. Partially resolves the "figures outstanding" item in
[[M-007 writing-gaps]] — the sources exist; the Notion specs (architecture, entity-alignment) still need
rebuilding via `draft_figure_design`.

## Links
- [[C-001 three-layer-metamodel-overview]] — `fig_metamodel`.
- [[M-006 running-example-csok]] — `fig_teaser`.
- [[C-030 scalability-measurement]] — `fig_scalability`.
- [[M-007 writing-gaps]] — the outstanding-figure gap this partly closes.

## Source
`pandoc/assets/`; Notion figure specs (inbox pages 06, 07, 20).
