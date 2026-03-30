---
id: "CUT-5"
short: "rw-alloy-compress"
title: "Compress Alloy/OCL comparison in Related Work"
status: done
priority: low
depends_on: []
binding_claims: []
target: "sections/06_related_work.md"
pipeline: "final-cut"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Cut ~0.05-0.1 pages from Related Work by compressing the Alloy comparison in Sec 6.3 (line 28 of `sections/06_related_work.md`).

## Context

The paragraph starting "Alloy performs bounded model finding..." runs 4 sentences explaining why Alloy and OCL differ from Refinery. The key distinction (fully concrete instances vs. partial models, SAT enumeration vs. incremental propagation) can be made in 2 sentences.

## Action

Merge the Alloy and OCL points into 2 sentences. Keep: (1) Alloy operates on fully concrete instances within a fixed scope, cannot represent open design decisions; (2) Refinery's four-valued partial model semantics distinguish definite violations from open decisions, enabling incremental reasoning as governance constraints arrive.

Drop: the re-encoding detail, the "OCL constraints on UML metamodels similarly assume" sentence (merge the point into the Alloy sentence).

## Acceptance criteria

- Alloy citation preserved
- Key distinction (concrete vs. partial) stated in ≤2 sentences
- No information essential to the positioning argument lost
