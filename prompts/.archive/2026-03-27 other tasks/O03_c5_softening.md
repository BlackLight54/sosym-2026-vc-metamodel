# O03: C5 Claim Softening — Abstract + Introduction P2

**Wave:** 0.5 (after O01 verification results are known, parallel with consolidation Wave 1)
**Execution:** Single agent. Targeted prose revision — surgical edits, not full redrafts.
**Dependencies:** O01 (must know whether Ding & Sato 2023 is verified — affects the count of MDE-for-SSI papers acknowledged).
**Target files:** `sections/00_abstract.md`, `sections/01_introduction.md` (P2 only).
**Downstream:** T10 (polish) touches the abstract evidence sentence and intro P5 but not P2. No conflict.

---

## Context

The gap analysis (2026-03-25) found that MDE **has** been applied to the SSI domain — four prior works exist (ChorSSI, SecureSSI, Pattiyanon et al., Barclay et al.). context/DECISIONS.md records the corrected claim (2026-03-25, "Claim C5 correction"):

> **Do not claim:** "MDE has not been applied to the VC/SSI domain."
> **Instead claim:** "No prior work applies multi-level metamodeling to VC credential design with formalized cross-layer constraints spanning domain semantics, credential structure, and format-specific representation."

The abstract and introduction P2 may still contain the overclaim. This prompt applies the correction surgically.

## Read Before Writing

1. `context/DECISIONS.md` — 2026-03-25 entry "Claim C5 correction: MDE has been applied to SSI" (exact corrected wording)
2. `sections/00_abstract.md` — current gap sentence (Para 1, S3: "no existing tool checks their cross-layer consistency")
3. `sections/01_introduction.md` — current P2 (gap paragraph, lines 17-24)
4. `context/archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md` — the four MDE-for-SSI papers and their differentiation
5. O01 output — verification status of Ding & Sato 2023 and Schardong & Custodio 2024

## What to Do

### In `sections/01_introduction.md` — P2 (gap paragraph)

1. Read the current P2 text carefully. Identify any sentence that implies MDE or metamodeling has never been applied to SSI/VC.
2. Replace with the corrected claim from context/DECISIONS.md. The replacement should:
   - Acknowledge that prior MDE work for SSI exists (without listing all four — that's Sec 06's job)
   - State the specific gap: no multi-level metamodel with formalized cross-layer constraints
   - Maintain the paragraph's argumentative flow (gap → consequence → need)
3. The paragraph already contains framing about cross-layer invisibility ("Design errors that span multiple layers go unnoticed..."). The corrected claim should reinforce this framing, not contradict it.

**Example revision direction** (adapt to context, do not copy verbatim):
- Before: "no formal model captures these cross-layer constraints" (if this is what's there)
- After: "While model-driven approaches have been applied to SSI for security analysis and interaction choreography, no prior work defines a multi-level metamodel that formalizes cross-layer constraints spanning domain semantics, credential structure, and format-specific representation."

### In `sections/00_abstract.md`

1. Read the current abstract. Identify the gap sentence (currently Para 1, S3).
2. The current wording is: "no existing tool checks their cross-layer consistency." This is scoped to tools/checking, which may already be defensible. Evaluate:
   - If the sentence claims "no MDE/metamodel for VC" → rewrite to match context/DECISIONS.md.
   - If it only claims "no tool checks cross-layer consistency" → this is narrower and may be correct. Verify against the four known MDE-for-SSI papers (none of them checks cross-layer consistency). If defensible, leave as-is.
3. If any other sentence in the abstract implies MDE hasn't been applied to SSI, soften it.

### After Edits

- Verify the corrected claims in both files are consistent with each other.
- Verify consistency with `sections/06_related_work.md` scaffolds (§6.2 corrected C5 note).
- Check off TODO.md items: "Soften C5 claim in introduction P2 and abstract" (§ Other tasks) and Wave 0.5 items (§ Other tasks — Prompt Pipeline).

## Constraints

- **Minimal edits.** Do not rewrite P2 from scratch. Surgically replace the overclaim.
- The corrected claim must match the context/DECISIONS.md version in substance, even if phrased differently for flow.
- Do **not** touch P1, P3, P4, P5 in the introduction.
- Do **not** touch the abstract beyond the gap sentence scope.
- Do **not** add the four MDE-for-SSI paper citations here — that is Sec 06's job. At most, acknowledge their existence in passing.
- Obsidian Markdown. No LLM tells. Match the existing register.
