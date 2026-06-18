---
id: A-002
title: Governance-conflict error predicate (governance_conflict.refinery)
type: artifact
maturity: permanent
tags: [topic/refinery, topic/governance, kind/predicate, prov/self]
sources: ["models/governance_conflict.refinery", "models/README.md"]
related: ["[[C-012 error-predicate]]", "[[C-025 governance-conflict-vertical]]", "[[K-008 contradictory-cross-framework-constraints]]", "[[A-001 vc-metamodel-refinery]]"]
created: 2026-06-17
---

**Artifact:** `models/governance_conflict.refinery` (~0.9 KB) — the error predicate that detects
Headline 1. Fires when a credential is subject to both an eIDAS mandate (requiring VCDM-conformant
formats) and a privacy requirement (requiring predicate-proof support) and no single format satisfies
both.

## What it provides
The mechanized form of the vertical governance conflict. Imported by `csok.problem`; under a
concretizability check (`refinery check -k`) it renders the full-governance CSOK instance UNSAT. This is
the executable evidence behind [[K-008 contradictory-cross-framework-constraints]].

## Links
- [[C-012 error-predicate]] — the predicate role it instantiates.
- [[C-025 governance-conflict-vertical]] — the result it detects.
- [[A-001 vc-metamodel-refinery]] — the metamodel it extends.

## Source
`models/governance_conflict.refinery`; `models/README.md` (Key files).
