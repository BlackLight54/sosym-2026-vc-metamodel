---
name: "Sec 03 restructured as Overview"
description: "Section 03 renamed from Motivation to Overview with three subsections: 3.1 Motivation, 3.2 Functional Overview (box diagram), 3.3 Usage Workflow"
type: project
status: active
date: "2026-03-25"
source: "Oszkár (meeting 2026-03-25 18:30)"
affects: ["Sec 03 structure", "page budget (~1.5 pages)", "fig_functional_overview"]
revisit_when: "page budget forces cuts — 3.3 is most compressible"
---

Rename Section 03 from "Motivation" to "Overview" with three subsections:

- **3.1 Motivation** — existing M1-M5 content retained (scenario setup, cross-layer constraints, single-layer failure, governance complication, problem statement)
- **3.2 Functional Overview** — box/pipeline diagram showing Input (partial design specification + constraint set) → Processing (metamodel + graph predicates) → Output (OK / NOT_OK(errors) / GENERATED(possible_design) or UNVIABLE(reasons)). Style: "like Imre's BPM paper" — clean box diagram. Production: Excalidraw → TikZ.
- **3.3 Usage Workflow** — designer walkthrough on CSOK example: specify credentials → run consistency checking → see error → adjust → re-check → explore alternatives.

**Rationale (Oszkár's words):** "Motivation helyett overview, és az overview kezdődik 3.1 Motivation-nel. Utána Functional Overview... Itt kell nekünk egy olyan doboz, mint amit Imrével csináltunk a BPM-es cikkben... 3.3 How to use on this example. Tehát egy tervezőmérnök mit csinál?"

**Budget:** Sec 03 increased from 1.0 to ~1.5 pages (Motivation 0.7, Functional Overview 0.5, Usage Workflow 0.3).

**Status in prose:** Structure implemented in `sections/03_overview.md`.
