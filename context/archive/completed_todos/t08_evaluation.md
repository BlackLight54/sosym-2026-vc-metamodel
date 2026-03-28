---
id: T08
short: "eval-elaboration"
title: "Sec 05 elaboration — coverage, expressiveness, anti-patterns, baseline"
status: done
depends_on: ["T07"]
binding_claims: [5, 6, 7, 9]
target: sections/05_evaluation.md
priority: high
pipeline: "consolidation"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Draft Sec 05.1 evaluation subsections: VCDM coverage (5.1.1), constraint expressiveness table (5.1.2), anti-pattern detection table (5.1.4), multi-layer visibility argument, and baseline comparison (5.1.5). The two headline results (5.1.3) are already fully drafted — do NOT touch.

**Status:** Coverage (5.1.1), expressiveness (5.1.2), anti-pattern (5.1.4), and baseline (5.1.5) are now drafted. Remaining work: verify against Refinery model, check for gaps flagged by X-series todos.

## Context

**Binding claims delivered:** #5 (coverage), #6 (expressiveness — HIGH RISK), #7 (anti-patterns), #9 (multi-layer visibility).

## Read before writing

1. `sections/05_evaluation.md` — current state
2. `sections/04_approach.md` — layer definitions (needed for coverage mapping)
3. `models/vc_metamodel.refinery` — authoritative predicate names
4. `context/archive/arf_5_3_4_gap_analysis.md` — ARF constraint analysis (8 constraints, 3 fully expressible)

## What was drafted (verify completeness)

### 5.1.1 Metamodel coverage — DRAFTED

- Soundness–completeness framing (per decision_vcdm_coverage_not_metric.md)
- Three excluded VCDM concept families identified (proof mechanisms, presentations, credential status)
- Coverage figure placeholder placed

### 5.1.2 Constraint expressiveness — DRAFTED

- Table with 3 fully expressible ARF constraints (ARF-C1, ARF-C4, ARF-C7) — ARF-prefixed (absorbs O-ARF)
- Five partially expressible analyzed in prose (two root causes)
- ARF-C7 validation remark (external validation of layer architecture)

### 5.1.3 Headline results — ALREADY DRAFTED, DO NOT TOUCH

### 5.1.4 Anti-pattern detection — DRAFTED

- Five anti-patterns in table with predicate mappings
- Graduated visibility argument (intra-layer → cross-layer → ecosystem-level)

### 5.1.5 Baseline comparison — DRAFTED

- Three baselines: manual review, single-layer metamodeling, integrated multi-layer
- Structural comparison (no empirical tool comparison exists)

## Remaining work from absorbed todos

- **X03**: Verify "none falls entirely outside metamodel capacity" — is it defended with a stated criterion? If not, add 1-2 sentences defining the boundary between "partially expressible" and "outside capacity"
- **X09**: Add 2-3 sentences on what formal model adds beyond expert domain knowledge (explicitness, scalability, completeness, reproducibility) — check if Sec 05.1.3 already contains this
- **X13**: Verify baseline comparison acknowledges definitional advantage and argues baselines are appropriate (no alternative multi-layer credential formalization exists)

## Acceptance criteria

- [ ] Expressiveness table populated with ARF-prefixed IDs
- [ ] Anti-pattern table with graduated visibility argument
- [ ] Baseline comparison with appropriate defense
- [ ] Coverage framed as elaboration, not metric
- [ ] X03, X09, X13 issues addressed or confirmed addressed
- [ ] Binding Claims #5, #6, #7, #9 delivered
