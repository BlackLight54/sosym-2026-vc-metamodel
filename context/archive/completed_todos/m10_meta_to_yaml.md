---
id: "M10"
short: "meta-to-yaml"
title: "Move @META markers to YAML frontmatter in sections"
status: done
priority: high
depends_on: ["M12"]
binding_claims: []
target: "sections/*.md"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Extract `%% @META: key: value %%` lines from each section file, add YAML frontmatter block, remove marker lines. Update skills that read @META markers.

See `prompts/2026-03-28_workflow_overhaul_phase2.md` Task 9.
