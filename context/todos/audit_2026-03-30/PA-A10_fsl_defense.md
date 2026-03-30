---
id: "PA-A10"
short: "fsl-defense-weak"
title: "FSL defense text weaker than decision prescribes"
status: done
priority: low
depends_on: []
binding_claims: [1]
target: "sections/04_approach.md, sections/07_conclusion.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Decision `decision_fsl_elaboration` (deferred) calls for explicit prose acknowledging the FSL gap ("Unlike DCL and CSL...") in Sec 04.3 and listing FSL maturity as a limitation in Sec 07. The audit found neither text in the current draft. The FSL subsection has no intra-layer constraints, making the "three-layer" claim vulnerable to the adversarial reviewer's attack #4.

## Acceptable risk rationale

The decision is deferred. The current factual statement at 04_approach.md:78 is honest about FSL's current scope. Strengthening the defense risks overclaiming if the FSL genuinely lacks load-bearing constraints. Three of four reviewers flag FSL thinness, but the champion can still champion based on the cross-layer insight.

## Action if addressed

Add 1-2 sentences to Sec 04.3 explicitly acknowledging that FSL currently captures format capability predicates but not format-internal constraints (e.g., SD-JWT-VC disclosure granularity). Add one sentence to Sec 07 or Sec 05.4 listing FSL elaboration as future work.
