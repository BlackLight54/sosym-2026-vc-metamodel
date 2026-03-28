---
id: "M09"
short: "crossref-pandoc"
title: "Set up pandoc-crossref for \\autoref references"
status: pending
priority: medium
depends_on: ["M12"]
binding_claims: []
target: "pandoc/defaults.yaml, build.sh"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Set up pandoc-crossref filter for `{#sec:label}` headers and `@sec:label` references → `\autoref{sec:label}` in LaTeX output.
