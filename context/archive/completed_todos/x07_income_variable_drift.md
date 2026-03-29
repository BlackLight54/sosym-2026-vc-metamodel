---
id: "X07"
short: "income-var-drift"
title: "Align 'income' variable name across Sec 2 and Sec 4"
status: done
priority: low
depends_on: []
binding_claims: []
target: "sections/02_background.md, sections/04_approach.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

The variable name for the income property drifts between sections:
- Sec 2.1 uses `$\mathit{income} \geq \mathit{threshold}$`
- Sec 4.3 and 5.1.3 use `$\text{monthly\_income} \geq \text{threshold}$`

The shift from `income` to `monthly_income` is minor but noticeable. Since Sec 2 uses the example before the running example is formally introduced in Sec 3, the Sec 2 usage is a forward reference that should match the established notation.

## Source

- X01 (Argument Coherence): Terminology drift analysis, Running Example inconsistencies

## Goal

Align to `monthly\_income` everywhere (the more precise term used in the formalization), or use plain `income` everywhere if the simpler form is preferred for the background's informal usage. Check which sections use which form and unify.

## Acceptance criteria

- The income variable name is consistent across all sections
- No forward-reference mismatch between Sec 2's informal usage and Sec 4's formal definition
