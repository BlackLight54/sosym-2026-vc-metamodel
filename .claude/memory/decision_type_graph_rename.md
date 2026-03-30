---
name: "Rename metamodel figure caption to 'type graph'"
description: "fig:metamodel caption says 'type graph' not 'metamodel'; move figure near constraint table"
type: project
date: 2026-03-29
status: active
source: "Oszkár (meeting 2026-03-29)"
affects: "Sec 04 (approach), fig:metamodel caption and placement"
revisit_when: "Never — terminology clarification"
---

The metamodel figure caption should say "type graph" because the figure depicts the type graph of the metamodel. The concept "metamodel" remains in prose (the contribution IS a metamodel); only the figure caption changes. Also move the figure from top of Sec 4.1 to near the constraint taxonomy table so cross-references resolve nearby.

Advisor feedback (2026-03-29): "fig 2 type graph meta modell helyett" and "Nagy abrat kesobbre rakni, a megfelelo helyre."

**How to apply:**
- Caption: "The three-layer type graph" not "The three-layer metamodel"
- Placement: near constraint taxonomy table (Sec 4.4), not Sec 4.1 opener
- Check all `\autoref{fig:metamodel}` references still read correctly
- If figure PDF has "Metamodel" as internal title, flag for regeneration
