---
id: "M12"
short: "marker-migration"
title: "Migrate markers from %% to Pandoc divs/spans"
status: pending
priority: high
depends_on: []
binding_claims: []
target: "sections/*.md, pandoc/filters/, pandoc/preamble.tex"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Replace `%% @TYPE: content %%` marker syntax with Pandoc Markdown constructs (divs/spans with classes). Create `annotations.lua` filter, define LaTeX environments, migrate all section files, update CLAUDE.md and skills.

See `prompts/2026-03-28_workflow_overhaul_phase2.md` Task 7 for full spec.
