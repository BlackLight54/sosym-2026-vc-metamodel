---
id: "CUT-4"
short: "approach-csl-tighten"
title: "Tighten CSL running-example walkthrough in Approach"
status: done
priority: medium
depends_on: []
binding_claims: []
target: "sections/04_approach.md"
pipeline: "final-cut"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Cut ~0.1 pages from Approach by tightening the CSL running-example walkthrough (lines 48-52 of `sections/04_approach.md`).

## Context

The CSL section opens with a detailed walkthrough naming all three credentials with explicit subscript notation ($\text{CS\_Applicant}_1$, etc.) across lines 48-52. Line 52 then restates entity alignment with explicit notation, but `aligned()` is formally defined later in Sec 4.4 (line 142-143). The alignment point is made twice.

## Action

- Keep the three-credential description (line 48) but compress: drop the explicit subscript notation for individual claims (the trace concept is clear without enumerating every $\text{has\_children}_1 \to \text{num\_children}_1$)
- Remove the explicit alignment paragraph (line 52) — the formal definition in Sec 4.4 covers this, and the cross-property constraint point is already made
- Target: reduce lines 48-52 from ~5 dense sentences to ~3

## Acceptance criteria

- The three credentials and their issuers are still named
- The trace concept is still introduced
- No forward reference to `aligned()` is broken
