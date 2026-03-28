---
id: "M04"
short: "z01-extract"
title: "Consolidate Z01 triage items into existing todos"
status: done
priority: high
depends_on: []
binding_claims: []
target: "context/todos/"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Read `prompts/.archive/2026-03-27_section_reviews/Z01_synthesis.md` (51 triage items) and the cross-cutting analyses (X01–X04 in same directory). Instead of creating 51 new todo files, consolidate Z01 items into existing todos where they overlap, and create new todos only for genuinely uncovered items.

## Context

Many Z01 items are already covered by existing todos:
- T01–T06 consolidation todos → already executed and archived
- T07, T08, T09, T10 → exist as todos, need enrichment from Z01 detail
- O-series todos → cover figure design, threats, baseline, etc.
- X01–X13 → already extracted from cross-cutting analyses

## Steps

1. Read Z01_synthesis.md triage table (T01–T51).
2. For each item, check if an existing todo covers it. If yes, add Z01 context (issue description, source agents, severity) to the existing todo body.
3. For uncovered items: create a new todo with full context from Z01. Use `Z-` prefix for IDs.
4. Also read X01–X04 cross-cutting analyses. Verify all actionable issues are captured either in existing X-series todos or in other todos.
5. Update `context/todos/INDEX.md` after consolidation.

## Acceptance criteria

- Every Z01 triage item is either (a) mapped to an existing todo with Z01 context added, or (b) created as a new Z-series todo, or (c) explicitly marked as already done/not applicable
- No duplicate todos exist
- INDEX.md is current
