# T00b: Scaffold/Placeholder Merging

**Wave:** 0b (after T00, before all writing tasks)
**Execution:** Single agent. Mechanical — merge markers, no prose writing.
**Dependencies:** T00 (file restructuring must be complete).
**Downstream:** All writing tasks T01-T10 depend on clean `@TODO` blocks.

---

## Context

Nearly every unwritten paragraph has BOTH `@SCAFFOLD` blocks AND `@TODO: PLACEHOLDER` blocks containing overlapping information. This creates noise for writing agents. Merge each pair into a single clean `@TODO` that gives a writing agent everything it needs in one block.

## Task

For each unwritten paragraph in the affected files, produce a single `@TODO` block in this format:

```
%% @TODO: [ID] — [Job]. [Key content with specific terms, predicates, citations]. [Binding claims if any]. [Length: N sentences / N paragraphs]. %%
```

**Rules:**
1. Merge all `@SCAFFOLD` content and `@TODO: PLACEHOLDER` content into one `@TODO`
2. Remove all `@SCAFFOLD` lines for that paragraph
3. Keep standalone `@CITE` markers (they serve a different purpose)
4. Keep `@FORMAL` markers (they flag formal definition needs)
5. Keep `@FIGURE` markers (they flag figure needs)
6. Keep `@META` headers at the top of each file
7. If a `@SCAFFOLD` precedes already-drafted prose, leave it as-is (harmless reference for context)
8. Preserve all existing drafted prose unchanged

## Affected Files

### `sections/02_background.md`
Merge pairs: B1+PLACEHOLDER, B2 scaffold, B3 scaffold, B4+PLACEHOLDER, B5 scaffold, B6+B7+PLACEHOLDER

### `sections/04_approach.md`
Merge pairs: Preamble+PLACEHOLDER, A1+PLACEHOLDER, A2+PLACEHOLDER, A4+PLACEHOLDER, A5+PLACEHOLDER, A6+PLACEHOLDER, A8+PLACEHOLDER, A9 scaffolds, A12+PLACEHOLDER, A13+PLACEHOLDER, A14 scaffold, A15 scaffold, A16 scaffold
**Do NOT touch** drafted prose at A3, A7, A10, A11, A17.

### `sections/05_evaluation.md`
Merge pairs: E0 preamble, E1+PLACEHOLDER, E4+E5+PLACEHOLDER, E7 scaffold, E8+PLACEHOLDER, E9 scaffold, E10+PLACEHOLDER, E11+PLACEHOLDER, S1-S4 scaffolds, T1+PLACEHOLDER, T2+PLACEHOLDER, T3+PLACEHOLDER, T4+PLACEHOLDER
**Do NOT touch** drafted prose at Headline 1, Headline 2, Complementarity remark.

### `sections/06_related_work.md`
Merge pairs: R1+PLACEHOLDER, R2+PLACEHOLDER, R3+PLACEHOLDER, R4+PLACEHOLDER

### `sections/07_conclusion.md`
Merge pairs: C1+PLACEHOLDER, C2+PLACEHOLDER, C3+PLACEHOLDER, C4+PLACEHOLDER

## Verification

After merging:
- [ ] No `@SCAFFOLD` lines remain in any file (except before already-drafted prose)
- [ ] Every unwritten paragraph has exactly one `@TODO` block
- [ ] All `@CITE`, `@FORMAL`, `@FIGURE`, `@META` markers preserved
- [ ] All drafted prose unchanged
- [ ] Each `@TODO` includes: paragraph ID, job, key content, binding claims (if any), length target
