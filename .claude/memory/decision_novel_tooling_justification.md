---
name: "Justify novel tooling necessity"
description: "Must explain specific challenges that necessitate Refinery — not generic 'we need a tool' but why existing tools (OCL, Alloy, manual) are insufficient"
type: project
status: active
date: "2026-03-25"
source: "Oszkár (meeting 2026-03-25 18:30)"
affects: ["Sec 03.2 functional overview", "Sec 05.1 baseline comparison"]
revisit_when: "if baseline comparison section is cut for page budget"
---

The paper must justify why existing modeling/verification tools cannot address the cross-layer constraint problem, identifying the specific challenges that necessitate novel tooling (Refinery with partial graph semantics).

**Rationale (Oszkár's words):** "Meg kell indokolnunk azt, hogy miért nem lehet a meglévő eszközöket ezekre a területekre használni. Tehát mik azok a challenge-ok, amik meg kellett, hogy ilyenkor a novámód elérjük a fejlesztését? ... That necessitates the development of novel modeling and verification tools."

Generic "no tool exists" is insufficient. Must identify *what* about the problem (partial models, multi-layer predicates, design space exploration) demands partial graph modeling semantics specifically.

**Status in prose:** Baseline comparison subsection in Sec 05.1 compares against OCL/Alloy/manual inspection.
