---
id: "A-REBUS"
short: "rebus-preamble"
title: "Copy relevant preamble elements from Rebus paper"
status: pending
priority: medium
depends_on: []
binding_claims: []
target: "pandoc/preamble.tex"
pipeline: "advisor-2026-03-29"
assigned: "martin"
created: "2026-03-29"
---

## Goal

Integrate relevant preamble elements from the Rebus paper into `pandoc/preamble.tex`. The Rebus paper (by Oszkár's group) likely has lstlisting styles, math environments, or formatting macros that apply to this paper's Refinery content.

## Context

Advisor feedback (2026-03-29): "rebus cikkjéből preambulum cuccokat copyzni" (Copy preamble stuff from Rebus paper).

This is broader than A-LST (which only adds the lstlisting language). The Rebus preamble may contain:
- lstlisting style configuration (font size, frame, numbering)
- Math environment definitions used with Refinery formalizations
- Custom commands for Refinery-specific notation

## What to do

1. **Martin provides** the Rebus paper's preamble (or the relevant subset)
2. **Claude integrates** the relevant parts into `pandoc/preamble.tex`, checking for conflicts with the existing ACM sigconf setup
3. If the Rebus lstlisting setup supersedes A-LST's language definition, merge them

## Acceptance criteria

- [ ] Martin has provided the Rebus preamble
- [ ] Relevant elements are integrated into `pandoc/preamble.tex`
- [ ] No conflicts with ACM sigconf class or existing preamble
