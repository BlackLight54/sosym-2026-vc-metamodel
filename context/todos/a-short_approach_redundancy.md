---
id: "A-SHORT"
short: "approach-redundancy"
title: "Approach redundancy check — compress and make precise"
status: done
priority: medium
depends_on: ["A-BG1", "A-BG2"]
binding_claims: [3, 4]
target: "sections/04_approach.md, sections/02_background.md"
pipeline: "advisor-2026-03-29"
assigned: "claude"
created: "2026-03-29"
---

## Goal

Make Sec 04 shorter and more precise by removing redundant explanations. The approach should reference BG definitions rather than re-explaining them. This also absorbs A-EXPL ("mindent elmagyarázunk?" / do we explain everything?).

## Context

Advisor feedback (2026-03-29): "precízebbé és rövidebbé szeretnénk tenni az approach leírását" (Make approach more precise and shorter) and "thorugh redundancy check."

The advisor specifically flagged the format capability propagation paragraph (Sec 04, current line 95) as poorly motivated: "nincs felépítve, nincs úgy bevezetve hogy jól el lehessen mondani" (not built up, not introduced so it can be properly explained).

## What to do

1. **Audit for repeated Refinery explanations.** The four-valued interpretation (must/must not/may/may not) is explained in:
   - Sec 2.3 (BG, line 30): full definition
   - Sec 4.4 (cross-layer, line 89): re-explained in trace consistency
   - Sec 4.4 (cross-layer, line 95): re-explained in format capability propagation

   Replace re-explanations with `(\autoref{sec:refinery})` references.

2. **Compress the flagged paragraph** (line 95, "Format capability propagation rules complete the cross-layer mechanism..."). This paragraph:
   - Re-explains four-valued interpretation (cut, reference BG)
   - Re-explains the distinction between propagation and error predicates (already covered in BG)
   - The actual new content (format capability propagation) can be stated in 2-3 sentences + a code listing (from A-CODE)

3. **Check for over-explanation for the MODELS audience.** The Mathematician reviewer knows: partial models, graph constraints, refinement, model finding. Do not explain these from scratch in Sec 04 if BG already covers them. Specifically check:
   - "Refinery's four-valued interpretation distinguishes..." (appears 3 times)
   - "refinement-based: every generated model is guaranteed to satisfy all constraints" (BG already says this)
   - "error predicate defines a structural pattern that must not hold" (BG already defines this)

4. **Page budget offset.** A-CODE adds code listings (~0.3 pages). A-SHORT must recover at least that much space through compression.

## Acceptance criteria

- [ ] Four-valued interpretation is explained once (in BG) and referenced elsewhere
- [ ] The flagged paragraph (format capability propagation) is shortened
- [ ] No Refinery concept defined in BG is re-defined in Sec 04
- [ ] Net page impact of A-SHORT + A-CODE is neutral or negative
