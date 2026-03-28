---
id: "O-4VAL"
short: "four-valued-fix"
title: "Fix three-valued → four-valued Refinery interpretation throughout paper"
status: pending
priority: high
depends_on: []
binding_claims: [3]
target: "sections/02_background.md, sections/04_approach.md, sections/06_related_work.md"
pipeline: ""
assigned: "oszkár"
created: "2026-03-28"
---

## Goal

Correct all occurrences of "three-valued" Refinery interpretation to "four-valued" throughout the paper. Refinery uses four-valued logic (true, false, unknown, error), which decomposes to four partial interpretation states: **must** (committed true), **must not** (committed false), **may** (possibly true), **may not** (possibly false). The paper currently says "three-valued" in three locations and lists only three values (must, must not, unknown).

## Occurrences to fix

### 1. `sections/02_background.md` line 36 (definition site)

Current text:
> A partial model assigns a three-valued interpretation — *must* (definitely present), *must not* (definitely absent), or *unknown* (open for refinement) — to every node, edge, attribute value, and class membership

This is the authoritative definition in the paper. Needs to become four-valued with correct decomposition. Oscar should rewrite this as part of O-REFBG (the Refinery background rewrite) to properly explain the four-valued interpretation and how it enables the partial model semantics.

### 2. `sections/04_approach.md` line 151

Current text:
> Bindings that are definitely inconsistent with committed traces are set to **false** in Refinery's three-valued interpretation, removed from the space of valid completions before model generation explores them.

Replace "three-valued" with "four-valued". Note: line 157 in the same file already correctly uses "four-valued" with the full decomposition, so line 151 just needs the number fixed for consistency.

### 3. `sections/06_related_work.md` line 34

Current text:
> its three-valued partial model semantics enable reasoning over designs that are still incomplete

Replace "three-valued" with "four-valued".

## Why this matters

The Mathematician reviewer will check this. If the paper defines the interpretation as three-valued but Refinery's published semantics use four values (Semerath et al.), it signals either unfamiliarity with the tool or imprecision. Since Oscar designed Refinery, this should be authoritative.

## Relationship to other todos

- **O-REFBG**: Oscar is rewriting the Refinery background paragraph. The four-valued fix at occurrence #1 should be part of that rewrite.
- **X14**: Refinery terminology audit. The four-valued interpretation is the most important term to get right.

## Acceptance criteria

- [ ] No occurrence of "three-valued" referring to Refinery interpretation remains in any section file
- [ ] The definition in Sec 02 correctly states four values with their semantics
- [ ] Sec 04 and Sec 06 references are consistent with the Sec 02 definition
