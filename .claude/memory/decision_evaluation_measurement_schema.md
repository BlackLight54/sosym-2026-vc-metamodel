---
name: "Evaluation: fixed measurement schema, ≥2 pages"
description: "Evaluation must have ≥2 pages with fixed schema: RQs, selected domains, measurement setup, results (2 diagrams), analysis, threats to validity"
type: project
status: active
date: "2026-03-25"
source: "Oszkár + Imre (meeting 2026-03-25)"
affects: ["Sec 05 structure and budget", "fig_validation_runtime", "fig_generation_runtime"]
revisit_when: "never — hard requirement from both advisors"
---

Evaluation section requires at least two pages and must follow a fixed measurement schema:

1. **Research questions** — e.g., "How does validation runtime scale with model size?"
2. **Selected domains** — 2-5 model instances of increasing size, described descriptively. Scaling justification: "We prepare additional instances and explain why this approximates larger models."
3. **Measurement setup** — tools, environment, metrics. Inspiration from Noor's ECMFA paper.
4. **Measurement results** — 2 full-width diagrams (`figure*`) at page top (validation runtime, generation runtime).
5. **Analysis of results** — answer RQs, draw conclusions, state lessons learned.
6. **Threats to validity** — internal, external, construct, conclusion validity. "How many ways could we have gotten this wrong."

Additionally: compare against a baseline development tool to justify why Refinery rather than alternatives.

**Rationale (Oszkár):** "Kell mérés, legalább két oldal evaluation." + "Összehasonlítani valami baseline fejlesztési eszközzel, ami miatt Refinery." + detailed schema specification (see raw notes).

**Rationale (Imre):** Emphasized measurement requirement and scale justification.

**Status in prose:** Sec 05 restructured with elaboration (5.1) and scalability measurement (5.2) subsections. Schema scaffolded but measurement data pending.
