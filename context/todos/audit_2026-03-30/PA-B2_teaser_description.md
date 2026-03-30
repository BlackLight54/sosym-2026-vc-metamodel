---
id: "PA-B2"
short: "teaser-description"
title: "Fill teaser figure \\Description{} placeholder"
status: pending
priority: high
depends_on: []
binding_claims: []
target: "sections/03_overview.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Replace the placeholder `\Description{Teaser figure description.}` in the teaser figure block with a meaningful alt-text description. ACM submission compliance requires figure alt-text; submissions without it may be rejected by the system.

## Context

The paper audit (Z01 synthesis, item B2) identified that `sections/03_overview.md` line 29 contains a raw LaTeX teaser figure block with a placeholder `\Description{}`. The teaser figure shows the CSOK running example across three metamodel layers (DCL, CSL, FSL) demonstrating both vertical and horizontal cross-layer constraints.

## What to write

Replace `\Description{Teaser figure description.}` with a descriptive alt-text such as:

`\Description{Three-layer metamodel instance for the housing subsidy (CSOK) running example, showing Domain Concept Layer entities (family status, property, income), Credential Schema Layer credential subjects with trace links, and Format-Specific Layer format assignments. Vertical constraint (income governance conflict) and horizontal constraint (floor area predicate gap) are highlighted with cross-layer edges.}`

The description should be factual, ~1-2 sentences, and describe what the figure visually depicts for accessibility purposes. Match the actual figure content — read the surrounding prose (lines 25-32) and the teaser figure design in the approach section to confirm what the figure shows.

## Target file

`sections/03_overview.md` — line 29 (or wherever `\Description{Teaser figure description.}` appears in the raw LaTeX block).

## Acceptance criteria

- [ ] `\Description{}` contains a meaningful alt-text (not placeholder)
- [ ] Description matches actual figure content
- [ ] No other teaser block attributes are changed
