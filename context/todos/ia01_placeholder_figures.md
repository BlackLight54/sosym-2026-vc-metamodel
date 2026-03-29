---
id: "IA01"
short: "placeholder-figures"
title: "Replace three placeholder figures with actual content"
status: pending
priority: high
depends_on: []
binding_claims: [4, 7, 9]
target: "sections/03_overview.md, sections/04_approach.md, sections/05_evaluation.md"
pipeline: "integrity-audit"
assigned: "martin"
created: "2026-03-28"
---

Three figures remain as `\fbox{\parbox{...}}` placeholders:

1. **fig_functional_overview** (`sections/03_overview.md:28-35`): Functional overview diagram showing partial design + constraints -> metamodel + graph predicates -> outcomes.
2. **fig_constraint_taxonomy** (`sections/04_approach.md:136-143`): Cross-layer constraint taxonomy (C1-C9).
3. **fig_scalability** (`sections/05_evaluation.md:112-119`): Scalability plot of wall-clock time vs. model size.

A paper with 3/4 placeholder figures signals incompleteness. This is the highest-priority item before upload.

**Acceptance criteria:** All three figures replaced with rendered content (PNG/PDF) or at minimum the scalability plot generated from actual measurement data.
