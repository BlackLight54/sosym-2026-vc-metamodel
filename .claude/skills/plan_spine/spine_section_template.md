# Spine section block template

One block per section in `context/spine/SPINE.md`. Fill the contract fields in Pass 4, the placement
fields in Pass 5. Keep cells structural; a cell that wants to become a paragraph belongs to paragraph
engineering.

```markdown
## §N — [Title] {#sec:label}

**Job:** [one sentence: what this section does for the paper]
**Entry state:** [what the reader knows and believes arriving]
**Exit state:** [what the reader must know and believe leaving]
**Claims advanced:** [K-ids from M-011]
**Objections pre-empted:** [O-ids from M-010]

| Element | Vault ID | Introduced here? | Used from | Cross-refs to |
|---------|----------|------------------|-----------|---------------|
| [name]  | [[...]]  | yes / no (→ §X)  | §…        | §…            |

**Figures/tables:** [F-ids from M-014, at which element]
**Example beat:** [which running-example difficulty this section advances]
**Feeds:** §… **Depends on:** §…
**Budget risk:** [none / flag with reason — no page arithmetic]
```
