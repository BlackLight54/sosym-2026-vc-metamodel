---
id: "CUT-2"
short: "bg-example-block"
title: "Remove or compress Example block in Background"
status: done
priority: high
depends_on: []
binding_claims: []
target: "sections/02_background.md"
pipeline: "final-cut"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Cut ~0.1 pages from Background by removing or compressing the `::: {.example}` block (lines 61-63 of `sections/02_background.md`).

## Context

The example block walks through predicate evaluation on `reachable(a, b)` step by step, showing how conjunction of `property(a, p)` = true and `value(p, b)` = unknown yields unknown. This is pedagogically useful but expendable: the Predicate Satisfaction definition (lines 57-59) already explains conjunction semantics, and Listing 1 shows the predicate code.

## Action options (Martin decides)

**Option A (preferred under page pressure):** Remove the entire `::: {.example}` block. The definition + listing carry the concept.

**Option B:** Compress to one sentence integrated into the paragraph before or after the code listing. E.g., "For instance, if `property(a, p)` is true but `value(p, b)` is unknown, `reachable(a, b)` evaluates to unknown — the conjunction preserves uncertainty."

## Acceptance criteria

- The example block no longer appears as a standalone rendered block
- No dangling references to the example
