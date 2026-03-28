---
id: "X13"
short: "baseline-strawman"
title: "Defend baseline comparison against strawman critique"
status: done
priority: low
depends_on: []
binding_claims: [10]
target: "sections/05_evaluation.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

Adversarial reviewer (X03 Reviewer D, Sec 5.4 comment): "The comparison against 'manual expert review' and 'single-layer metamodeling' is strawman-level. Of course a multi-layer model detects cross-layer issues that single-layer models miss — this follows by definition. A meaningful baseline would compare against an alternative multi-layer formalization (e.g., OCL constraints over a single integrated UML model, or an Alloy specification)."

Z01 item T41 adds a loop-closure sentence grounding the baseline comparison in the headline results, but does not address the strawman critique itself.

## Goal

Add 1-2 sentences in Sec 5.1.5 (baseline comparison) that acknowledge and defuse the strawman critique:

1. **Acknowledge the definitional advantage:** "A multi-layer model detecting cross-layer issues that single-layer approaches miss is, to some extent, expected by construction."
2. **Argue the baseline is appropriate:** No alternative multi-layer credential ecosystem formalization exists to compare against (this is the gap the paper fills). The comparison against single-layer approaches and manual review represents the actual state of practice, not a strawman. The gap analysis (Sec 6, surveys by Mazzocca et al. and Naghmouchi & Laurent) confirms no comparable multi-layer approach exists.
3. **Distinguish analytical from empirical:** The baseline comparison is analytical by necessity (no existing tool to run side-by-side). The graduated visibility argument in the anti-pattern table provides the analytical substance.

## Constraints

- Keep to 1-2 sentences — the baseline comparison paragraph is already concise
- Do not concede the point fully — the comparison is legitimate given the state of the field

## Acceptance criteria

- Sec 5.1.5 acknowledges the definitional advantage of multi-layer over single-layer
- The acknowledgment explains why the chosen baselines are appropriate (no alternative exists)
- Binding Claim #10 (necessity/effectiveness argument) is maintained
