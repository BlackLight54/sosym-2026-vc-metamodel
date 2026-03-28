---
id: "M21"
short: "archive-prompts"
title: "Archive executed prompts to context/archive/"
status: done
priority: medium
depends_on: []
binding_claims: []
target: "prompts/"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Move executed/superseded prompt files from `prompts/` to `context/archive/`. Keep only active, unexecuted prompts in `prompts/`.

Candidates for archiving (executed in previous sessions):
- `prompts/2026-03-27_paper_audit.md` — produced `prompts/2026-03-27_section_reviews/`
- `prompts/2026-03-27_workflow_audit.md` — led to workflow overhaul
- `prompts/2026-03-28_workflow_overhaul.md` — Phase 1 spec, fully executed
- `prompts/2026-03-28_workflow_overhaul_remaining.md` — Phase 1 remaining, fully executed
- `prompts/2026-03-27_consolidation/` — consolidation prompts (check execution status)
- `prompts/2026-03-27 other tasks/` — check execution status
- `prompts/2026-03-27_section_reviews/` — audit outputs, keep Z01_synthesis.md accessible until M04 (Z01 extraction) is done
- `prompts/review.md` — check if still active

**Keep active:**
- `prompts/2026-03-28_workflow_overhaul_phase2.md` — active Phase 2 prompt

**Decision needed:** Whether to archive entire directories or individual files. Martin decides which are fully executed.
