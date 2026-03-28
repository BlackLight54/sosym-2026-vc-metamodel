---
id: "X10"
short: "fsl-defense"
title: "Defend FSL as metamodel layer beyond lookup table"
status: done
priority: medium
depends_on: []
binding_claims: [1]
target: "sections/04_approach.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

Adversarial reviewer attack (X03 Reviewer D, weakness 3, Q2): "The FSL has five format subclasses with boolean capability predicates. How is this different from a lookup table? What structural properties of formats does the metamodel capture that a simple feature matrix does not?"

The current FSL (Sec 4.3) has:
- Five format subclasses (one per VC format): SD-JWT-VC, AnonCreds, etc.
- Six derived boolean predicates: `supports_predicate_proof`, `supports_multi_credential_proof`, etc.
- Governance annotations attached to formats
- "Format-internal structural constraints are not yet formalized" (acknowledged)

Z01 item T09 reframes the "less mature" language as a scope boundary. Z01 items T16/T17 add predicate definitions and governance annotation descriptions. But none of these address the structural critique: **what makes FSL a metamodel layer rather than a feature matrix?**

## Goal

Add 2-3 sentences in Sec 4.3 (after the FSL definition, near or replacing the "less mature" admission) that defend the FSL's metamodel status:

1. **Containment structure:** FSL format classes contain `FormattedCredential` instances that are connected to CSL `Credential` instances via typed references. This containment hierarchy is a structural metamodel property absent from a flat feature matrix.
2. **Cross-layer predicate participation:** FSL capability predicates are not standalone booleans — they participate in cross-layer graph predicates (e.g., `cross_cred_predicate_gap` in C9 queries `supports_multi_credential_proof` across a format assignment trace). A feature matrix cannot express predicates that span the format layer and the credential schema layer.
3. **Governance annotation attachment:** `GovernanceAnnotation` instances attach to format classes and are consumed by error predicates. This makes governance constraints structurally part of the metamodel, not external metadata.

The key distinction: a feature matrix is a static table; the FSL participates in graph predicates that constrain partial models across layers.

## Constraints

- Do not claim FSL is as mature as DCL or CSL — the scope limitation (format-internal constraints not formalized) is honest and should remain.
- The defense should be structural (what makes it a metamodel layer) not aspirational (what it could become).

## Acceptance criteria

- Sec 4.3 contains an explicit argument for why FSL is a metamodel layer, not a lookup table
- The argument cites concrete structural properties (containment, cross-layer predicate participation, governance attachment)
- The "less mature" / scope limitation is preserved but contextualized
- Binding Claim #1 (three-layer metamodel) is strengthened
