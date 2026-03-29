---
id: "A-FIG"
short: "move-rename-figure"
title: "Move metamodel figure near constraint table + rename to type graph"
status: done
priority: medium
depends_on: []
binding_claims: []
target: "sections/04_approach.md"
pipeline: "advisor-2026-03-29"
assigned: "claude"
created: "2026-03-29"
---

## Goal

(1) Move `fig:metamodel` from top of Sec 4.1 (DCL) to near the constraint taxonomy table so cross-references resolve nearby. (2) Rename the caption from "metamodel" to "type graph."

## Context

Advisor feedback (2026-03-29): "Nagy ábrát későbbre rakni, a megfelelő helyre. pl. table-2-hez közel legyen, mert a CX-ket fel kell minél hamarabb oldani." and "fig 2 type graph meta modell helyett."

Currently the figure is at `sections/04_approach.md` line 19, right after `\label{sec:dcl}`. The constraint taxonomy table is at line ~67, after `\label{sec:cross-layer}`.

## What to do

1. **Move** the `![The three-layer metamodel...]` image block from line 19 to just before the constraint taxonomy table (near `\label{sec:cross-layer}`).

2. **Rename** the caption:
   - Old: "The three-layer metamodel. The domain concept layer (top)..."
   - New: "The three-layer type graph. The domain concept layer (top)..."

3. **Check prose references:** Search all section files for references to "metamodel diagram," "metamodel figure," or `\autoref{fig:metamodel}`. Ensure they still read correctly with the new placement and terminology. Note: "metamodel" as a concept stays (the paper's contribution IS a metamodel); only the *figure caption* changes to "type graph" (because the figure depicts the type graph of the metamodel).

4. **Check the figure PDF itself** (`pandoc/assets/fig_metamodel.pdf`): if it has "Metamodel" as a title/header within the image, flag for Martin to regenerate.

## Acceptance criteria

- [ ] Figure appears near the constraint taxonomy table in Sec 04
- [ ] Caption says "type graph" not "metamodel"
- [ ] All `\autoref{fig:metamodel}` references still make sense
- [ ] Prose distinguishes: "metamodel" (the contribution) vs. "type graph" (the figure)
