---
name: "Soundness and completeness guarantees"
description: "Core formal contribution: if the tool says invalid, it IS invalid; generated models satisfy all constraints. Position against random/LLM baselines."
type: project
status: active
date: "2026-03-28"
source: "Oszkár (consultation notes, Konzi w oszkár.md)"
affects: ["Sec 04 (approach)", "Sec 05 (evaluation, model properties)", "Sec 02 (background, Refinery intro)", "Sec 07 (conclusion)"]
revisit_when: "after Oszkár writes the mathematical foundations in Background"
---

The paper must make explicit soundness and completeness claims for the Refinery-based formalization:

**Soundness:** If the tool reports a design as invalid, it IS invalid — no false positives on constraint violations. If we generate a model instance, it does not violate any constraint.

**Completeness:** If a design flaw exists (a constraint is violated), the tool detects it.

**Key framing (Oszkár's words):** "Detecting design flaws in early phase of development, even in partial models." The power is that this works on *partial* models, not just complete designs.

**Positioning:** Our approach provides stronger guarantees than:
- Random graph generation (Erdős-Rényi) — no constraint satisfaction guarantees
- LLM-based generation — no formal guarantees at all
- Manual inspection — cannot scale, misses cross-layer interactions

**Presentation:** Consider a box/table: "Soundness: guarantee 1, guarantee 2..." to make the formal properties visually prominent.

**Prerequisite:** The Background section needs a proper Refinery explanation (see `o-refinery-bg` todo) and mathematical foundations for the reader to understand *why* these guarantees hold. Predicate proof via bool encoding is the technical mechanism.

**Where in the paper:**
- Sec 04: State the guarantees when presenting cross-layer constraints
- Sec 05 (6.3 equivalent): "Model properties" subsection — models are correct, sound and complete
- Sec 07: Reiterate as headline contribution
