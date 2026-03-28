---
name: "Paper needs explicit formal claims"
description: "Paper is too shallow — must make formalizable claims about why the approach works, with a claims-strengthening pass across all sections"
type: project
status: active
date: "2026-03-28"
source: "Oszkár (consultation notes, Konzi w oszkár.md)"
affects: ["Sec 04 (approach)", "Sec 05 (evaluation)", "Sec 00 (abstract)"]
revisit_when: "after soundness/completeness claims are written into prose"
---

Oszkár's assessment: the paper is shallow ("shallow a cikk, nincs kimondott állítás"). It lacks explicit, formalizable claims about why the approach works. Every section that presents a modeling contribution must state what it guarantees, not just what it describes.

**Required actions:**
1. Section 4 and elsewhere must make rigorous claims ("szigorú kijelentéseket kell tenni").
2. A claims-strengthening pass is needed to identify where additional or stronger claims can be inserted.
3. Claims must be formalizable — connected to the soundness/completeness argument (see `decision_soundness_completeness.md`).

**How to apply:** When drafting or revising any section, ask: "What does this section *claim*, and can that claim be stated formally?" If the answer is vague, the section needs strengthening.
