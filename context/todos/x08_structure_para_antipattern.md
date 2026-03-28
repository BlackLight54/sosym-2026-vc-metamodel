---
id: "X08"
short: "struct-para-antipattern"
title: "Fix structure paragraph: anti-patterns are in evaluation, not approach"
status: pending
priority: low
depends_on: []
binding_claims: []
target: "sections/01_introduction.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

The introduction's structure paragraph (approximately line 29) says the approach section "formalizes cross-layer constraints as Refinery graph predicates, including trace consistency, entity alignment, and structural anti-pattern detection." However, anti-pattern detection is in Sec 5.1.4 (evaluation), not Sec 4 (approach). The approach section defines the predicates; the evaluation section catalogs the anti-patterns.

Z01 item T42 compresses the structure paragraph but does not flag this factual inaccuracy.

## Source

- X01 (Argument Coherence): Break 6, severity LOW

## Goal

Adjust the structure paragraph to either:
- Remove "structural anti-pattern detection" from the approach description and add it to the evaluation description, or
- Say the approach section defines predicates "whose application to anti-pattern detection is demonstrated in the evaluation"

## Acceptance criteria

- Structure paragraph accurately describes what is in each section
- Anti-pattern detection is attributed to Sec 5.1.4, not Sec 4
