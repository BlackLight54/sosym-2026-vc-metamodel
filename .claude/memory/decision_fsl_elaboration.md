---
name: "FSL elaboration: format-internal constraint"
description: "Add format-internal constraint (e.g., SD-JWT-VC disclosure) to demonstrate FSL is a genuine layer, not a lookup table"
type: project
status: deferred
date: "2026-03-28"
source: "decision_format_driven_restructuring.md extension"
affects: ["Sec 04.3 (FSL)"]
revisit_when: "post-submission revision or if Mathematician reviewer objects to FSL asymmetry"
---

The FSL should ideally carry at least one intra-layer structural constraint (e.g., SD-JWT-VC disclosure granularity) to demonstrate it is a genuine metamodel layer with its own well-formedness conditions, paralleling DCL's `non_connected`/`cyclic` and CSL's `no_empty_cred`/`root_ent_doesnt_have_cred`.

**Current status (2026-03-30):** Deferred but defended. §4.3 now explicitly contrasts FSL with DCL/CSL error predicates and argues FSL is load-bearing via cross-layer predicates C5--C9, governance annotations, and propagation rules. §7 lists FSL scope as the primary limitation with format-internal constraints as the extension point.

**Why deferred:** Deadline pressure. The argumentative defense is coherent and the limitation is honestly acknowledged. Adding a concrete intra-layer constraint would strengthen the paper but is not critical for submission.

**Risk:** The Mathematician reviewer may note the asymmetry. The defense in §4.3 and §7 should be sufficient but is weaker than a demonstrative constraint would be.