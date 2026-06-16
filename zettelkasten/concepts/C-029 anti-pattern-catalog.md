---
id: C-029
title: Anti-pattern catalog (five structural anti-patterns)
type: concept
maturity: permanent
tags: [topic/evaluation, kind/predicate, kind/result]
sources: ["sections/05_evaluation.md §5.1.4", ".claude/memory/claim_07_antipattern_detection.md"]
related: ["[[C-012 error-predicate]]", "[[C-011 shadow-predicate]]", "[[C-027 multilayer-invisibility]]", "[[K-007 antipattern-detection]]"]
created: 2026-06-16
---

Five structural anti-patterns encoded as graph predicates over the partial model. Three need only
single-layer inspection: disconnected domain graph (`non_connected`, DCL error), empty credential
(`no_empty_cred`, CSL error), orphaned root entity (`root_ent_doesnt_have_cred`, CSL error). Two require
cross-layer analysis: trace misalignment (`prop_t`/`prop_s`, DCL↔CSL propagation) and the
cross-credential predicate gap (`cross_cred_predicate_gap`, DCL↔FSL shadow).

This **graduated visibility** — intra-layer errors through cross-layer trace inconsistencies to
ecosystem-level capability gaps — is the central argument for multi-layer formalization. The catalog is
extensible: adding an anti-pattern requires a new graph predicate over the existing metamodel, not
structural changes to layers or trace links.

## Links
- [[C-012 error-predicate]], [[C-011 shadow-predicate]] — the predicate kinds used.
- [[C-027 multilayer-invisibility]] — graduated visibility is the necessity argument.
- [[K-007 antipattern-detection]] — the binding claim.

## Source
`sections/05_evaluation.md §5.1.4`; claim_07.
