---
id: "CUT-3"
short: "eval-limitations-compress"
title: "Compress Limitations and Future Work paragraph"
status: done
priority: medium
depends_on: []
binding_claims: []
target: "sections/05_evaluation.md"
pipeline: "final-cut"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Cut ~0.1 pages from Evaluation by compressing Sec 5.4 Limitations and Future Work (lines 127-131 of `sections/05_evaluation.md`).

## Context

The section has two paragraphs: one on empirical evaluation gap (~40 words), one listing four future directions in full sentences (~100 words). The four directions largely restate limitations already identified in Threats (Sec 5.3). Under page pressure, this conventional section can be shorter without reviewer penalty.

## Action

- Merge the "not evaluated empirically" sentence into Threats (Sec 5.3) as a final sentence
- Compress the four future directions into a compact enumeration (2 sentences or a semicolon-separated list)
- Target: reduce from ~140 words to ~70 words

## Acceptance criteria

- Limitations section is ≤4 sentences total
- All four directions are still mentioned (even if briefly)
- No new content added
