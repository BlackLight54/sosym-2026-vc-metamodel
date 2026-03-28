---
name: "Justify tooling with specific guarantees on partial models"
description: "Why Refinery over a drawing tool: formal guarantees enable detecting design flaws early, even in partial models — spell out results for readers"
type: feedback
---

When justifying why Refinery (and not a drawing program, manual process, or general-purpose tool), the argument must be concrete: Refinery provides formal guarantees on *partial* models that no drawing tool or manual inspection can offer.

**Why:** Oszkár's point: "Miért refinery-t használunk, miért nem egy rajzolóprogramot: ha mi helyesen formalizáljuk, akkor hibás az hibás, rá tudunk mutatni egy design flaw-ra. Detecting design flaws in early phase of development, even in partial models." Readers don't understand graph modeling — results must be spelled out.

**How to apply:** In Sec 03 (functional overview) and Sec 05 (baseline comparison), state the specific guarantee: "If the formalization is correct, then a reported constraint violation corresponds to an actual design flaw — even when the model is incomplete." Connect to `decision_soundness_completeness.md`. Complements `decision_novel_tooling_justification.md` which focuses on why OCL/Alloy/manual are insufficient — this feedback focuses on *what Refinery specifically provides*.
