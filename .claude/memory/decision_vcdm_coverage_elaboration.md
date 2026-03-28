---
name: "VCDM coverage is elaboration, not measurement"
description: "VCDM-based model coverage shows formalization depth (soundness/completeness), not a quantitative measurement metric"
type: project
status: active
date: "2026-03-25"
source: "Imre (meeting 2026-03-25 18:00)"
affects: ["Sec 05.1 (elaboration subsection)", "evaluation narrative"]
revisit_when: "if coverage analysis produces quantitative results worth reporting as measurement"
---

VCDM-based model coverage tells us how far we got in formalizing the domain, but has no measurement value. Frame it as elaboration — soundness/completeness of the formalization — not as a quantitative evaluation metric.

**Rationale (Imre's words):** "A VCDM alapú model coverage annyi értelme van, hogy megmondja, hogy meddig jutottunk el a munkában, de különben mérési értelme nincs. Ez inkább sima eval mint mérés, vagy elaboration-soundness/completeness."

**How to apply:** In Sec 05.1, present coverage as "Elaboration: Metamodel Coverage" — a characterization of how completely the metamodel captures VCDM concepts. Do not present coverage percentages as if they were experimental results. The actual measurement is in Sec 05.2 (scalability).

**Status in prose:** Sec 05.1 reframed as elaboration during restructuring.
