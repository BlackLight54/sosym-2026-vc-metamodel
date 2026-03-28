---
id: O03
short: "soften-c5"
title: "Soften C5 novelty claim in abstract + intro P2"
status: done
depends_on: ["O01"]
binding_claims: []
target: sections/00_abstract.md, sections/01_introduction.md
priority: medium
pipeline: "consolidation"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Apply the C5 claim correction from `decision_c5_claim_correction.md` to the abstract and introduction P2. The gap analysis found four MDE-for-SSI papers — the novelty claim must be scoped to the specific intersection: multi-level metamodel + cross-layer constraints + VC credential design.

## Decision (from decision_c5_claim_correction.md)

**Do not claim:** "MDE has not been applied to the VC/SSI domain."
**Instead claim:** "No prior work applies multi-level metamodeling to VC credential design with formalized cross-layer constraints spanning domain semantics, credential structure, and format-specific representation."

## Known MDE-for-SSI papers

1. ChorSSI (Cippitelli et al. 2023) — BPMN choreography
2. SecureSSI (Ding & Sato 2023) — security analysis (VERIFY via O01)
3. Pattiyanon et al. (2022, MODELSWARD) — weakness detection via DSMLs
4. Barclay et al. (2020) — iStar governance modeling

None defines a multi-layer metamodel or formalizes cross-layer constraints. The defensible claim is the specific intersection.

## What to do

### In `sections/01_introduction.md` — P2 (gap paragraph)

1. Identify any sentence implying MDE/metamodeling has never been applied to SSI/VC
2. Replace with corrected claim: acknowledge prior MDE work exists (without listing — that's Sec 06's job), state the specific gap
3. Maintain paragraph's argumentative flow (gap → consequence → need)

### In `sections/00_abstract.md`

1. Check gap sentence (currently "no existing tool checks their cross-layer consistency")
2. If it only claims "no tool checks cross-layer consistency" — may already be defensible (narrower scope). Verify against the four papers.
3. If any sentence implies MDE hasn't been applied to SSI — soften it

## Constraints

- **Minimal edits.** Surgically replace the overclaim.
- Do NOT touch P1, P3, P4, P5 in introduction
- Do NOT add the four citations here — that's Sec 06's job
- Depends on O01: need verified paper count before finalizing

## Acceptance criteria

- [ ] No overclaiming in abstract or intro P2
- [ ] Corrected claim matches decision_c5_claim_correction.md in substance
- [ ] Paragraph flow preserved
