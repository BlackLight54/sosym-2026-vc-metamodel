---
id: "M20"
short: "phase2-exec"
title: "Execute workflow overhaul Phase 2 — marker migration, citations, Z01 extraction"
status: pending
priority: high
depends_on: ["M11", "M05", "M06", "M08"]
binding_claims: []
target: "sections/*.md, pandoc/filters/, CLAUDE.md"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Execute the remaining Phase 2 tasks from `prompts/2026-03-28_workflow_overhaul_phase2.md`:

1. **Task 7: Marker migration** (M12) — Replace `%% @TYPE: content %%` with Pandoc divs/spans, create `annotations.lua` filter, define LaTeX environments in preamble.tex
2. **Task 8: Citation workflow** (M13) — Adopt `[@citekey]` with `--biblatex` flag
3. **Task 9: META-to-YAML** (M10) — Move `@META` markers to YAML frontmatter in section files
4. **Task 10: Z01 extraction** (M04) — Extract 51 triage items from Z01 synthesis as individual todo files
5. **Task 11: Final migration check** (M07) — Grep for stale references, verify all directories have READMEs, test build pipeline

**Prompt file:** `prompts/2026-03-28_workflow_overhaul_phase2.md` (Tasks 7-11)
**Parallelization:** See prompt file Parallelization Guide for batch execution order.
