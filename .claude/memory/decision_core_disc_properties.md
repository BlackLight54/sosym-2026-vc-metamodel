---
name: "CORE-DISC property mapping"
description: "Map approach to Refinery's graph generation properties: Consistency (primary), Diversity/Scalability (addressed), Realistic (out of scope)"
type: project
status: active
date: "2026-03-28"
source: "Oszkár (consultation notes, Konzi w oszkár.md)"
affects: ["Sec 05 (evaluation)", "Sec 07 (conclusion)"]
revisit_when: "when evaluation section is finalized"
---

Oszkár identified that the approach covers the CORE-DISC properties of Refinery's graph generation framework. The paper should map contributions to these properties:

**Consistency (primary focus):** The core contribution. Formalized constraints ensure generated/validated models are consistent. This is where soundness/completeness applies. See `decision_soundness_completeness.md`.

**Realistic:** "Not discussed here" — out of scope for this paper. The models represent abstract credential ecosystem designs, not concrete real-world instances. Acknowledge this explicitly.

**Diverse:** Must say something. Why do we need diverse solutions in credential design? Because stakeholders (issuers, verifiers, holders) have different goals; diverse valid configurations show the design space. Even brief treatment is required.

**Scalable:** Must say something. Why generate/evaluate larger graphs? Because real credential ecosystems involve many credential types, attribute sets, and governance frameworks. If somebody wants a bigger model, Refinery can produce it. Connect to scalability evaluation (O-FIG, X06).

**How to apply:** In Sec 05 or Sec 07, ensure each property gets at least a sentence. Consistency gets a full subsection (model properties). The others need explicit acknowledgment — even "Realistic model generation is beyond scope" is better than silence.
