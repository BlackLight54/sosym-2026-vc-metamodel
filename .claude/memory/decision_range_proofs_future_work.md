---
name: "Range proofs are future work"
description: "Range proofs vs predicate proofs out of scope — mention as future work unless already implemented in a VC format"
type: project
status: active
date: "2026-03-28"
source: "Oszkár (consultation notes, Konzi w oszkár.md)"
affects: ["Sec 07 (conclusion, future work)"]
revisit_when: "if range proofs are found to be implemented in a non-VCDM-v2 format during related work review"
---

Range proofs (proving a value falls within a range without revealing it) versus predicate proofs (proving arbitrary boolean predicates) is an important distinction for verifiable credential selective disclosure. However, range proof support is not yet widely implemented in VC formats.

**Decision:** Treat as future work. Mention in Sec 07 (conclusion/future work) that the metamodel could be extended to distinguish range-provable attributes from predicate-provable ones once format support matures.

**Exception:** If range proofs are already implemented in a non-VCDM-v2 format (e.g., AnonCreds, some BBS+ implementations), then the evaluation should assess whether the metamodel can express the distinction. Check before finalizing.
