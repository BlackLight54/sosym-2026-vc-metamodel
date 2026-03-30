# CUT: Constraint Expressiveness narrative (Sec 5.1.2)

**Source:** `sections/05_evaluation.md` lines 20–21
**Date:** 2026-03-30
**Reason:** Compressed prose to save ~70 words. All constraint IDs and findings preserved.

## Original paragraph 1 (line 20)

We collected eight normative constraints from the eIDAS +ARF v2.7.3 [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026] governing credential format assignment, and classified each as *fully expressible*, *partially expressible*, or *not expressible*. Three are fully expressible, each mapping directly to metamodel predicates: ARF-C1 (PID dual-format issuance, PID\_02) maps to [EidasMandate]{.refi} annotation and format class membership; ARF-C4 (proximity presentation requires mdoc, ARB\_02) maps to [supports_offline_verification]{.refi} with a propagation rule eliminating SD-JWT-VC; ARF-C7 (encoding-independent attribute definition, ARB\_06) maps to the DCL$\to$CSL$\to$FSL layer architecture. Five are partially expressible and none falls entirely outside the metamodel's capacity.

## Original paragraph 2 (line 21)

The five partially expressible constraints share two root causes. Three constraints (ARF-C2, C3: qualified vs. non-qualified attestation format restrictions; ARF-C6: +VCDM completeness as a meta-level property) condition format eligibility on the credential qualification level (PID, QEAA, or non-qualified EAA in eIDAS terminology), but the metamodel does not yet distinguish these attestation subtypes. Two constraints (ARF-C5: per-claim selective disclosability; ARF-C8: salted-hash vs. [+ZKP]{.short}-based selective disclosure) require privacy annotations at claim granularity rather than format level. Both gaps are closable by extending the metaclass hierarchy; neither requires changing the constraint formalization approach. A constraint falls outside the metamodel's capacity only when it governs runtime behavior (revocation timing, holder-binding protocols) with no design-time structural counterpart; none of the eight falls into this category.
