---
id: O-MODES
short: "usage-modes"
title: "Clarify Refinery usage modes in Sec 03 and Sec 04"
status: done
depends_on: []
binding_claims: [4]
target: sections/03_overview.md, sections/04_approach.md
priority: medium
pipeline: "consolidation"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Clarify the three Refinery usage modes throughout Sec 03 (Functional Overview) and Sec 04 (Approach). The modes must be precisely defined and consistently annotated per-subsection in Sec 04.

## Context

Advisor directive (Oszkár, 2026-03-25, item 6): Sec 03 should include a functional overview as a box diagram — Input = Design Specification / Partial Design + Constraint Set → "Martin box" → Outputs: OK / NOT_OK(errors) / GENERATE(graph). Then Sec 3.3 walks through how a designer uses this on the running example.

**Binding Claim #4:** Automated consistency checking demonstration.

## Three usage modes

1. **Consistency checking (OK / NOT_OK):** All error predicates false → OK. At least one error predicate satisfied → NOT_OK with error identification.
2. **Error identification:** NOT_OK result includes which predicates fired and on which model elements. Designer sees the specific cross-layer inconsistency.
3. **Design space exploration (GENERATE / UNVIABLE):** Refinery generates diverse partial model completions satisfying all constraints. If no completion exists → UNVIABLE.

## What to do

### In Sec 03.2 (Functional Overview)

- Define the three modes with a box diagram figure spec (`::: {.figure}` div)
- Input/output specification: partial design + constraint set → one of three outputs
- **Per X12**: Operationalize "diverse model instances" — Refinery generates multiple distinct graph completions; designer inspects a sample (5-20 instances), not exhaustive enumeration

### In Sec 04 (per-subsection)

- Each predicate definition in A12–A15 (from T07) should note which usage modes it participates in
- Error predicates → checked in consistency checking, trigger NOT_OK in error identification
- Shadow predicates → informational in all modes
- Propagation rules → guide generation in exploration mode

## Acceptance criteria

- [ ] Three modes precisely defined in Sec 03.2
- [ ] Box diagram figure spec placed
- [ ] Per-subsection mode annotations in Sec 04 (coordinate with T07)
- [ ] "Diverse model instances" operationalized (from X12)
- [ ] Binding Claim #4 addressed
