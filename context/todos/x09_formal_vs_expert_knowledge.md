---
id: "X09"
short: "formal-vs-expert"
title: "Defend what formal model adds beyond expert domain knowledge"
status: pending
priority: medium
depends_on: []
binding_claims: [9, 10]
target: "sections/05_evaluation.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

Adversarial reviewer attack (X03 Reviewer D, weakness 5): "Once you know that SD-JWT-VC lacks predicate proofs and eIDAS mandates SD-JWT-VC, the income conflict is obvious. The paper dresses up a known format limitation as a 'headline result.' [...] What does the metamodel add to what domain experts already know?"

Business manager reviewer (X03 Reviewer C, Q2): "In practice, would a competent credential architect not notice this conflict through domain expertise alone? What does the formal approach add beyond what an expert already knows?"

Z01 items T18 and T30 add novelty defense paragraphs in Sec 4.4 and 6.3, but they address "this isn't standard multi-level modeling" — not the distinct question of "what does formalization add beyond expert intuition."

## Goal

Add 2-3 sentences in the headline results discussion (Sec 05.1.3, after presenting the results) that articulate what the formal model adds:

1. **Explicitness:** The conflict is "obvious" only after it has been identified. The formal model makes the three independent constraint sources and their conjunction explicit, turning implicit domain knowledge into a checkable specification.
2. **Scalability:** A domain expert can reason about 3 credentials and 3 governance sources. An ecosystem with 30 credential types and 15 regulatory sources exceeds human cognitive capacity for cross-source interaction analysis. The formal model scales where expert intuition does not.
3. **Completeness:** Expert review is necessarily selective. The formal model systematically checks all constraint combinations — the sensitivity experiment (G0-G7) demonstrates that only the three-way conjunction is unsatisfiable, confirming no simpler conflict exists. An expert might not check all $2^3$ subsets.
4. **Reproducibility:** The formal specification is a shared artifact that multiple stakeholders can inspect, unlike individual expert judgment.

## Constraints

- Do not oversell — acknowledge that the running example's conflict is relatively simple. The argument is about methodology, not about this specific instance.
- Keep to 2-3 sentences. The defense should be concise, not a paragraph-length justification.

## Acceptance criteria

- Sec 05.1.3 contains a brief argument for what formalization adds beyond domain expertise
- The argument addresses scalability and systematicity, not just the specific running example
- Binding Claims #9 (multi-layer errors invisible to single-layer inspection) and #10 (necessity/effectiveness argument) are strengthened
