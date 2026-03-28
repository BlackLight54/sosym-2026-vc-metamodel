---
id: "M04"
short: "z01-extract"
title: "Extract todos from Z01 synthesis analysis"
status: pending
priority: high
depends_on: []
binding_claims: []
target: "context/todos/"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Read `prompts/2026-03-27_section_reviews/Z01_synthesis.md` and extract 51 triage items as individual todo files. Priority mapping: CRITICAL (T01-T08) → high with Z-T prefix, IMPORTANT (T09-T31) → medium, POLISH (T32-T51) → low. All get pipeline: "z01-triage".

See `prompts/2026-03-28_workflow_overhaul_phase2.md` Task 10.
