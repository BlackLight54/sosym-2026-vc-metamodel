---
id: Q-006
title: Does the formalization port beyond Refinery?
type: question
maturity: developing
tags: [topic/refinery, kind/formal, prov/self]
sources: ["sections/05_evaluation.md §5 limitations/future work"]
related: ["[[C-006 partial-graph-modeling-refinery]]", "[[S-022 jackson-alloy-2012]]", "[[C-019 soundness-completeness-guarantee]]"]
created: 2026-06-16
---

The formalization depends on Refinery as the sole validation tool. Does it port to other constraint
toolchains (Alloy, USE/OCL), and what is lost (e.g. partial-model reasoning) when it does?

## Why it matters
Single-tool dependence is an acknowledged threat to validity. Demonstrating portability — or
characterizing precisely what Refinery's four-valued semantics provide that alternatives cannot — would
strengthen the tooling-justification argument.

## Status
Not assessed. Alloy and USE/OCL are the named candidate targets.

## Links
- [[C-006 partial-graph-modeling-refinery]] — what would be ported.
- [[S-022 jackson-alloy-2012]] — the main alternative formalism.

## Source
§5 limitations and future work.
