---
id: C-003
title: Credential Schema Layer (CSL)
type: concept
maturity: permanent
tags: [layer/csl, kind/metamodel]
sources: ["sections/04_approach.md §4.2", ".claude/memory/decision_dcl_rename.md"]
related: ["[[C-001 three-layer-metamodel-overview]]", "[[C-002 domain-concept-layer]]", "[[C-014 trace-reference]]", "[[C-012 error-predicate]]"]
created: 2026-06-16
---

The second layer models how domain facts are partitioned into credentials, each issued by a different
authority and carrying a subset of the domain's properties as claimed by the issuer. The CSL mirrors
the DCL type structure: credential entities parallel domain entities, claims parallel properties,
credential subjects parallel subjects. **Every CSL element carries a mandatory `trace` reference to
its DCL origin**, so CSL types are consequences of domain-layer origin, not independent design
choices: two propagation rules (`subject_traces_to_subject`, `root_is_cred_subj`) infer credential-layer
types from domain-layer structure.

Four predicates enforce well-formedness: `credential_statement` and `Root_cred_entity` (derived) mirror
DCL structure; `no_empty_cred` (error: a credential subject with no outgoing claims) and
`root_ent_doesnt_have_cred` (error: a root credential entity without an associated credential) catch
violations before format assignment.

In the running example three credentials partition the domain: FamilyStatusCred (civil registry),
PropertyCred (land registry), IncomeCred (employer).

## Links
- [[C-002 domain-concept-layer]] — what it is derived from.
- [[C-014 trace-reference]] — the trace mechanism.
- [[C-012 error-predicate]] — `no_empty_cred`, `root_ent_doesnt_have_cred`.

## Source
`sections/04_approach.md §4.2`. Named "Credential Schema Layer" (DCL→CPL→CSL rename history in decision memory).
