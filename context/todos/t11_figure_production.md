---
id: "T11"
short: "figure-production"
title: "Produce remaining 6 figure placeholders"
status: pending
priority: high
depends_on: ["O05", "T07", "T09"]
binding_claims: [4, 5, 6, 7]
target: "pandoc/assets/, sections/03_overview.md, sections/04_approach.md, sections/05_evaluation.md"
pipeline: "consolidation"
assigned: "martin"
created: "2026-03-28"
---

Six figures have LaTeX `\fbox` placeholder boxes in the section files (added 2026-03-28 marker cleanup). O05 covers fig:teaser and fig:metamodel separately. This todo tracks the remaining six.

## Figures

### 1. fig:functional_overview (Sec 03, column-width)

Box/pipeline diagram: partial design + constraints → metamodel + graph predicates → OK / NOT_OK(errors) / GENERATED / UNVIABLE. Production: Excalidraw → TikZ.

**Effort:** Medium. Requires design iteration.

### 2. fig:constraint_taxonomy (Sec 04, column-width)

The cross-layer constraint table (C1–C9) formatted as a captioned figure. Content already exists as inline Markdown table — needs formatting as a proper LaTeX table figure.

**Effort:** Low. Mechanical formatting.

### 3. fig:generated_model (Sec 04, column-width)

Refinery-generated model instance for the housing subsidy example. Requires running Refinery and capturing output. Optional — paper stands without it, but X04 (concrete Refinery output for automated checking claim) depends on it.

**Effort:** Medium. Depends on Refinery formalization being complete.
**Depends on:** Refinery model completion (acyclicity constraint, A16 worked example).

### 4. fig:coverage_table (Sec 05, column-width)

VCDM 2.0 coverage mapping: concept → metamodel element → layer → in-scope/out-of-scope. Derivable from the metamodel definition in Sec 04 and the VCDM spec.

**Effort:** Medium. Content needs to be authored, but it's a structured table derivation.

### 5. fig:expressiveness_table (Sec 05, column-width)

Extended constraint expressiveness table: all 8 eIDAS ARF constraints with full expressibility classification. Inline table (tab:expressiveness) shows 3; this extends to all 8.

**Effort:** Low–Medium. Content partially exists in supplementary analysis.

### 6. fig:scalability (Sec 05, full-width figure*)

Runtime vs. model size plot. Requires measurement data from `run_measurements.sh`.

**Effort:** Low once data exists. Mechanical plotting.
**Depends on:** Scalability measurements (todos in 05_evaluation.md).

## Notes

- All placeholders use raw LaTeX `\fbox` blocks with `\label` and `\caption` already set.
- To produce a figure: replace the `\fbox{\parbox{...}}` with `\includegraphics{pandoc/assets/fig_NAME.pdf}` (or TikZ inline).
- Use `skills/draft_figure_design` for structured design of non-trivial figures.
