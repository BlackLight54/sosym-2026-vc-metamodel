---
id: D-012
title: Format limitations propagate upward (format-driven restructuring)
type: decision
maturity: permanent
tags: [topic/format, layer/cross, prov/self]
sources: [".claude/memory/decision_format_driven_restructuring.md", ".claude/memory/decision_fsl_elaboration.md"]
related: ["[[C-017 capability-driven-format-elimination]]", "[[C-004 format-specific-layer]]", "[[Q-002 fsl-intra-layer-constraints]]"]
created: 2026-06-16
---

A limitation at the FSL (no format provides a required capability) forces a change two layers up: the
DCL information model is restructured (a numeric property replaced by pre-computed boolean claims). The
FSL therefore carries no intra-layer constraints of its own but propagates consequences upward.

## Rationale
This upward propagation is the concrete demonstration that the layers are coupled by capability
constraints, not instantiation — the workaround to Headline 1 is a *cross-layer* design change, which is
exactly the phenomenon the metamodel is built to expose.

## Links
- [[C-017 capability-driven-format-elimination]] — the elimination that triggers restructuring.
- [[C-004 format-specific-layer]] — why the FSL has no intra-layer constraints.
- [[Q-002 fsl-intra-layer-constraints]] — the deferred FSL elaboration.

## Source
format-driven-restructuring; fsl-elaboration decisions.
