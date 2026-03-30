---
name: "BG defines Refinery notation, later sections reference it"
description: "All Refinery terms must be defined in Sec 2.3, then referenced via autoref in Sec 04/05 — no free-floating concepts"
type: project
date: 2026-03-29
status: active
source: "Oszkár (meeting 2026-03-29)"
affects: "Sec 02.3 (BG), Sec 04 (approach), Sec 05 (evaluation)"
revisit_when: "After A-BG1 and A-BG2 are complete"
---

Sec 2.3 must introduce all Refinery notation (error predicate, propagation rule, shadow predicate, scope constraint, four-valued interpretation, partial model, concretization, refinement). Sec 04 and 05 must reference BG definitions via `\autoref{sec:refinery}` at first use, not re-explain them.

Advisor feedback (2026-03-29): "be kell vezetni egy nyelvezetet a backgroundban a refinery-re, es akkor azt kell hasznalni" and "a background utani szovegek nem a backgroundra hivatkoznak, hanem csak ugy lebegnek." Concepts currently float without anchoring to their definitions.

**How to apply:**
- Four-valued interpretation is explained once (in BG) and referenced elsewhere
- No Refinery concept defined in BG is re-defined in Sec 04
- Every Refinery term in Sec 04 has a BG definition or is explicitly new to the contribution
- Subsumes X14 (Refinery terminology introduction)
