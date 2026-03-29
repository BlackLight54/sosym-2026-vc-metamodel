---
id: "A-CONC"
short: "shorten-conclusion"
title: "Move limitations + future work from conclusion to evaluation"
status: pending
priority: medium
depends_on: []
binding_claims: []
target: "sections/07_conclusion.md, sections/05_evaluation.md"
pipeline: "advisor-2026-03-29"
assigned: "claude"
created: "2026-03-29"
---

## Goal

Shorten the conclusion by moving the limitations paragraph and the future work paragraph into the evaluation section (Sec 05). The conclusion should be ~2 paragraphs: summary + final claim.

## Context

Advisor feedback (2026-03-29): "túl hosszú a conclusion, inkább az evalba menjenek ezek a dolgok" (Conclusion too long, move these things to eval).

Current conclusion (`sections/07_conclusion.md`) has 4 paragraphs:
1. Summary of contribution (keep)
2. Headline results (keep)
3. Limitations: "The format-specific layer..." (move to eval)
4. Future work: "Four directions follow..." (move to eval)

The final sentence of para 4 ("Both headline results...cross-layer design errors are structural consequences...") is the paper's closing claim and should stay in the conclusion.

**Coordination with T09:** The moved content lands in the same area as T09 (threats + scalability). If T09 has already created a threats subsection, append there. If not, create a "### Limitations" subsection in Sec 05.

## What to do

1. In `sections/07_conclusion.md`:
   - Keep paragraphs 1 and 2
   - Remove paragraphs 3 and 4
   - Preserve the final two sentences of para 4 ("Both headline results and two of five...multi-layer formal modeling is the minimum formalization that makes them visible before deployment.") as the conclusion's closing

2. In `sections/05_evaluation.md`:
   - Add a "### Limitations" subsection (or append to existing threats section)
   - Paste the limitations paragraph (para 3) and the future work content (para 4, minus the closing sentences kept in conclusion)

## Acceptance criteria

- [ ] Conclusion is ≤2 paragraphs + closing claim
- [ ] Limitations and future work appear in Sec 05
- [ ] No content is lost in the move
- [ ] The closing claim stays in the conclusion
