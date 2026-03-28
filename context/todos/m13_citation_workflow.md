---
id: "M13"
short: "citation-workflow"
title: "Update citation workflow to --biblatex + [@key]"
status: pending
priority: high
depends_on: ["M12"]
binding_claims: []
target: "pandoc/defaults.yaml, build.sh, sections/*.md"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Adopt `[@citekey]` Pandoc citation syntax with `--biblatex` flag. Replace `\cite{key}` in section files. Update or remove `citations.lua` stub.

See `prompts/2026-03-28_workflow_overhaul_phase2.md` Task 8.
