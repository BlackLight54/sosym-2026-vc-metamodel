---
id: M-014
title: MOC — figure plan (each figure carries a claim)
type: moc
maturity: developing
tags: [kind/method, prov/self]
sources: ["pandoc/assets/README.md", "artifacts/A-006 paper-figure-sources.md", "context/todos/t11_figure_production.md"]
related: ["[[M-011 claim-delivery-matrix]]", "[[M-008 artifact-inventory]]", "[[M-001 journal-paper-outline]]"]
created: 2026-07-05
---

Forward figure plan for the journal article. Rule: a figure earns its place by *carrying a claim* the
prose would otherwise have to argue alone; a figure that only decorates is cut. Production route per
repo convention: Excalidraw → TikZ/SVG in `pandoc/assets/`, specs via `skills/draft_figure_design`.
Existing sources inventoried in [[A-006 paper-figure-sources]].

| # | Figure | Carries | Status |
|---|---|---|---|
| F1 | Three-layer **type graph** (caption discipline per [[M-013 drafting-guardrails]]) | [[K-001 three-layer-metamodel]]; placed near the constraint table | exists (`fig_metamodel`) |
| F2 | CSOK teaser: three layers, one vertical + one horizontal conflict in a single visual | [[K-009 multilayer-invisibility]] at first glance | exists (`fig_teaser`) |
| F3 | Scalability plots (E1/E2) | [[K-004 automated-consistency-checking]] | exists (`fig_scalability`) |
| F4 | VCDM coverage map: metaclasses ↔ VCDM concepts, three excluded families marked design-time vs usage-time | [[K-005 coverage-validation]] soundness–completeness | planned (T11) |
| F5 | Expressiveness grid: 8 ARF constraints × full/partial, the five partials grouped under the two root causes | [[K-006 expressiveness-validation]] + the [[D-015 expressiveness-strength-first]] partials story | planned (T11) |
| F6 | Anti-pattern visibility ladder: intra-layer → cross-layer trace → ecosystem capability | [[K-007 antipattern-detection]] graduated-visibility argument | planned (T11) |
| F7 | **G0–G7 governance lattice** (proposed): the {eIDAS, Privacy, VCDM} power-set as a cube, seven SAT nodes, only the G7 top UNSAT | [[K-008 contradictory-cross-framework-constraints]] minimality — "every proper subset is satisfiable" as one image | proposed; data in [[A-004 constraint-sensitivity-variants]] |
| F8 | **Conflict anatomy** (proposed): statutory duties (Art. 5a(16)(b), 5b(3)) on one side, mandate chain (CIR 2024/2977 dual issuance → salted-hash ceiling) on the other, TS13/TS14 published-but-unbound in the wedge | [[C-034 statutory-unlinkability-gap]] + [[D-014 regulator-documented-conflict]] in the motivation | proposed |
| F9 | **Issuer/verifier boundary map** (proposed): DCL/CSL/FSL inside the remit box; RP registration, entitlements, access certificates outside, one arrow marking the named extension | [[D-013 verifier-scope-issuer-remit]] + [[C-040 verifier-side-extension-sketch]] in §5.3 | proposed |
| F10 | **Disclosure spectrum strip** (proposed): four tiers with expressivity/support/cost gradients; capability-matrix rows positioned on it | [[C-039 disclosure-spectrum]]; makes [[C-016 format-capability-matrix]] an ordering, not a flag list | proposed |
| — | Partial vs concrete model illustrations | [[C-008 four-valued-partial-model-semantics]] in background | exist (`partial.svg`, `concrete.svg`) |
| — | Functional overview box diagram (input → metamodel+predicates → OK / NOT_OK / GENERATED / UNVIABLE) | [[C-020 three-usage-modes]] | exists per §3.2 restructure; verify asset |

## Selection guidance for the spin step
F7 is the cheapest high-payoff addition: the data exists, the layout is a labeled cube, and it converts
the paper's strongest experimental sentence into its most memorable image. F8 and F9 each pre-empt a
top-3 objection (O5, O6 in [[M-010 objection-ledger]]). F10 is background support; include only if the
FSL elaboration (Tier 3 in [[M-012 journal-extension-delta]]) is in scope.

## Source
`pandoc/assets/` inventory; T11 figure todo; Notion figure specs (inbox pages 06, 07, 20); figure
proposals from the 2026-07-05 review pass.
