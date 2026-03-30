---
id: "CUT-1"
short: "bg-truth-redundancy"
title: "Trim redundant truth-value re-explanation in Background"
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

Cut ~0.1 pages from Background by removing the redundant truth-value re-explanation paragraph (line 45 of `sections/02_background.md`).

## Context

The paragraph starting "The four-valued interpretation assigns each element one of four statuses..." re-enumerates the four truth values (`true`, `false`, `unknown`, `error`) that are already defined in the Partial Model definition block (lines 41-43). This is redundant.

## Action

Compress the paragraph to 1-2 sentences that retain only the information NOT already in the definition:
- The diagram convention (solid = true, dashed = unknown, absence = false)
- The refinement concept (unknown values are gradually refined to true/false; a model with only true/false is *concrete*)
- The error-as-contradiction concept (design decision contradicts a constraint)

Delete the re-enumeration of the four values ("true (the value must be true), false (the value must be false)...").

Also remove the `[do we have diagrams?]{.todo}` inline annotation — this is stale.

## Acceptance criteria

- The paragraph is ≤3 sentences
- No information loss beyond the redundant enumeration
- The `.todo` marker is gone
