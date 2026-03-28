---
name: "Format-driven DCL restructuring"
description: "FSL limitation propagates to DCL restructuring — key worked example in Sec 04.4"
type: project
date: 2026-03-24
status: active
affects: "Sec 04.4 (worked example), Sec 05.1.3 (remark after conflict)"
revisit_when: "If page budget forces cuts — could move to supplementary"
tags: approach, cross-layer, worked-example
---

**Decision:** Present in Sec 04.4 as cross-layer constraint propagation example. AnonCreds: integer encoding + predicate proof. SD-JWT-VC: pre-computed boolean claims because format lacks predicate proofs. DCL restructuring forced by FSL limitation.
**Rationale:** Key insight identified by Martin. Concretely demonstrates thesis: format-specific limitations propagate upward through metamodel layers. Workaround doesn't fully resolve conflict.
**Why:** Best concrete demonstration of the paper's core thesis.
**How to apply:** Must appear as worked example showing upward propagation. Note that workaround is incomplete (issuer must anticipate thresholds, static, leaks information).