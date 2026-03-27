# Full ARF Constraint Expressiveness Analysis

Moved from the paper body to supplementary material. The paper's \autoref{tab:expressiveness} shows only the three fully expressible constraints; this file contains all eight.

**Source:** `archive/arf_5_3_4_gap_analysis.md`

## Full Table

| ID | Constraint | Source | Expr. | Predicate / Mechanism |
|----|-----------|--------|-------|----------------------|
| ARF-C1 | PID must be issued in both ISO 18013-5 and SD-JWT-VC | PID_02 | Full | `EidasMandate` annotation + format class membership |
| ARF-C2 | Qualified attestations restricted to ISO 18013-5 or SD-JWT-VC | ARB_01 | Partial | Requires attestation qualification hierarchy not in metamodel |
| ARF-C3 | Non-qualified attestations may additionally use W3C VCDM | ARB_01a | Partial | Complement of ARF-C2; same gap |
| ARF-C4 | Proximity presentation requires mdoc format | ARB_02 | Full | `supports_offline_verification`; `fca_offline_not_sdjwt` eliminates SD-JWT-VC |
| ARF-C5 | All PID claims individually selectively disclosable | PID_21 | Partial | `supports_selective_disclosure` at format level; per-claim annotation absent |
| ARF-C6 | W3C VCDM leaves security mechanisms unspecified | Section 5.3.4 | Partial | `conforms_vcdm` captures conformance; profiling requirement is meta-level |
| ARF-C7 | Attributes defined encoding-independently, then per-format | ARB_06 | Full | DCL->CSL->FSL layer architecture; direct architectural validation |
| ARF-C8 | Salted-hash SD vs. ZKP SD differ in unlinkability | Section 5.3.3 | Partial | `supports_selective_disclosure` + `supports_zkp` exist separately; not graduated |

## Summary

- **Fully expressible:** 3/8 (ARF-C1, ARF-C4, ARF-C7)
- **Partially expressible:** 5/8 (ARF-C2, ARF-C3, ARF-C5, ARF-C6, ARF-C8)
- **Not expressible:** 0/8

## Root causes of partial expressibility

1. **Missing attestation qualification hierarchy (ARF-C2, ARF-C3):** The metamodel does not distinguish PID, QEAA, PuB-EAA, and non-qualified EAA. Adding a credential qualification subtype hierarchy would close this gap.

2. **Format-level rather than claim-level granularity (ARF-C5, ARF-C8):** Privacy predicates operate at the format level. Per-claim selective disclosure annotation and graduated unlinkability encoding would require extending the `Claim` metaclass.

3. **Meta-level property (ARF-C6):** The constraint that W3C VCDM requires additional specifications for completeness is a meta-level observation about the standard, not a structural property representable as a graph predicate.
