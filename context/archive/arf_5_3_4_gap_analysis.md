# ARF Gap Analysis — Attestation Formats and W3C Verifiable Credentials

## Source

**Document:** European Digital Identity Wallet Architecture and Reference Framework (ARF), version 2.7.3
**URL:** https://eudi.dev/2.7.3/architecture-and-reference-framework-main/
**Sections analyzed:**
- Section 5.3 "Attestation formats and proof mechanisms" (5.3.1–5.3.4)
- Annex 2, Topic 3 "PID Rulebook" (PID_01–PID_21)
- Annex 2, Topic 12 "Attestation Rulebooks" (ARB_01–ARB_31)

**Accessed:** 2026-03-26

## Note on ARF versioning

Imre referenced "ARF 5.3.4." Section 5.3.4 ("W3C Verifiable Credentials") exists in ARF v2.7.3 but did not exist under that number in earlier versions (e.g., v1.4.0, where the equivalent content was in sections 5.2 and Annex 2). The paper should cite ARF v2.7.3 (or later) to match the section reference.

## Overview of ARF 5.3 structure

The ARF defines three attestation formats for the EUDI Wallet ecosystem:

| Feature | ISO/IEC 18013-5 / 23220-2 | SD-JWT VC | W3C VCDM v2.0 |
|---|---|---|---|
| Data format | CBOR (binary) | JSON Web Token (JSON) | JSON-LD (Linked Data) |
| Proof type | Embedded (salted hashes) | Embedded (salted hashes) | Detached or embedded |
| Key use case | Proximity (e.g., mDL) | Remote (e.g., identification) | General (requires profiling) |
| Wallet support | Mandatory | Mandatory | Optional |

Key architectural facts from ARF 5.3:
- Wallet Units **must** support ISO 18013-5 and SD-JWT VC. W3C VCDM support is **optional** and restricted to **non-qualified EAAs only** (5.3.1).
- SD-JWT VC and ISO 18013-5 use conceptually identical selective disclosure via **salted hashes** (5.3.3). Neither provides ZKP-based unlinkability.
- W3C VCDM is a general data model that leaves security mechanisms, signature formats, and transport protocols **unspecified** — separate specs (VC-JOSE-COSE, VC Data Integrity) are needed (5.3.4).
- Attestation schemes for specific types are defined in **Attestation Rulebooks** (Section 5.4), which specify attributes encoding-independently and then per-format.

## Constraint Table

### Recommended 8 for Sec 05 expressiveness table

| # | Constraint description | ARF reference | Constraint type | Layer(s) affected | Expressible? | Predicate name (if yes) | Notes |
|---|---|---|---|---|---|---|---|
| C1 | PID must be issued in BOTH ISO 18013-5 AND SD-JWT VC formats | PID_02 (Topic 3) | format / governance | FSL | **Yes** | `EidasMandate` + format class membership | Can write propagation rule: PID credential → must instantiate both format classes. Aligns with existing `EidasMandate` governance annotation. |
| C2 | QEAA/PuB-EAA restricted to ISO 18013-5 or SD-JWT VC — no W3C VCDM | ARB_01 (Topic 12) | format / governance | FSL + CSL | **Partial** | — | Metamodel has `VcdmConformance` and format classes but lacks credential qualification level (PID vs QEAA vs EAA). Need attestation-type hierarchy to express format eligibility per qualification. |
| C3 | Non-qualified EAA may additionally use W3C VCDM v2.0 | ARB_01a (Topic 12) | format / governance | FSL + CSL | **Partial** | — | Complementary to C2. Same gap: requires attestation-type modeling to distinguish qualified from non-qualified. |
| C4 | Proximity presentation requires ISO 18013-5 mdoc format (SD-JWT VC lacks internet-free protocol) | ARB_02 (Topic 12) | interoperability | FSL | **Yes** | `supports_offline_verification(f)` | FCA-derived rule `fca_offline_not_sdjwt` already eliminates SD-JWT VC when offline verification required. Direct match. |
| C5 | All SD-JWT VC PID claims must be individually selectively disclosable | PID_21 (Topic 3) | privacy / capability | FSL + CSL | **Partial** | `supports_selective_disclosure(f)` (format-level only) | Format-level predicate exists. Per-claim granularity not modeled: CSL `Claim` has no selective-disclosure annotation. |
| C6 | W3C VCDM requires separate security/signature specifications; not self-contained | Section 5.3.4 | structural | FSL | **Partial** | `conforms_vcdm(f)` (conformance only) | Captures VCDM conformance but not the incompleteness/profiling requirement. The constraint that additional specs are needed is a meta-level property not representable as a graph predicate. |
| C7 | Attributes must be defined encoding-independently first, then per-format | ARB_06 (Topic 12) | structural | CPL → CSL → FSL | **Yes** | Three-layer trace architecture | This IS the metamodel's core architecture. CPL defines domain semantics, CSL credential structure, FSL format-specific encoding. ARB_06 mandates exactly this separation. **Direct architectural validation.** |
| C8 | SD-JWT VC and mdoc selective disclosure uses salted hashing — enables RP linkability; only ZKP provides full unlinkability | Section 5.3.3 | privacy | FSL | **Partial** | `supports_selective_disclosure(f)` + `supports_zkp(f)` | Two separate predicates exist but the distinction between salted-hash SD (linkable) and ZKP-based SD (unlinkable) is not encoded as a graduated predicate. Directly relevant to Headline 1 governance conflict. |

### 2 additional (not recommended for table — outside metamodel scope)

| # | Constraint description | ARF reference | Constraint type | Layer(s) affected | Expressible? | Notes |
|---|---|---|---|---|---|---|
| C9 | SD-JWT VC attestations must comply with HAIP profile for interoperability | ARB_01b (Topic 12) | interoperability | FSL | **No** | Profile-level constraints (specific JWT header choices, algorithm selections) are below the metamodel's abstraction level. |
| C10 | W3C VCDM attestations need EU-approved additional specs for request/selective disclosure | ARB_04 (Topic 12) | governance | FSL | **No** | Regulatory approval of companion specifications is a process-level constraint outside the scope of a design-time metamodel. |

## Coverage Summary

| Metric | Count |
|---|---|
| Total constraints extracted | 10 |
| Expressible (Yes) | 3 (C1, C4, C7) |
| Partially expressible | 5 (C2, C3, C5, C6, C8) |
| Not expressible | 2 (C9, C10) |

**Categories outside scope:**
- Profile-level interoperability (HAIP compliance — C9)
- Regulatory approval processes (EU standardization body approval — C10)

**Key insight:** C7 (ARB_06) provides direct architectural validation — the ARF itself mandates encoding-independent attribute definition followed by format-specific encoding, which is precisely the CPL→CSL→FSL layering our metamodel implements.

## Metamodel Gaps Identified

### Gap 1: Attestation qualification level (C2, C3)

The metamodel does not distinguish PID, QEAA, PuB-EAA, and non-qualified EAA. ARB_01 restricts qualified attestations to ISO 18013-5 / SD-JWT VC, while ARB_01a permits W3C VCDM only for non-qualified EAAs. Expressing this requires a credential-type hierarchy in CSL (e.g., `QualifiedCredential`, `NonQualifiedCredential` subclasses of `Credential`) with format-eligibility propagation rules.

**Severity:** Medium. The CSOK running example uses government-issued credentials (effectively PID/QEAA), so the format restriction applies implicitly. A future extension could make this explicit.

### Gap 2: Per-claim selective disclosure (C5)

`supports_selective_disclosure(f)` captures whether a format supports SD at all, but PID_21 requires per-claim granularity. The CSL `Claim` metaclass has no `selectively_disclosable` annotation. Adding a boolean property to `Claim` and a propagation rule linking it to the format's SD mechanism would close this gap.

**Severity:** Low for current paper scope. The format-level predicate suffices for the governance conflict analysis.

### Gap 3: SD mechanism distinction (C8)

Both SD-JWT VC and mdoc use salted-hash selective disclosure, which enables relying party linkability. Only ZKP-based mechanisms (AnonCreds) provide full unlinkability. The predicates `supports_selective_disclosure(f)` and `supports_zkp(f)` are separate, but their interaction (salted-hash SD ≠ ZKP SD in privacy properties) is not encoded. The governance conflict error predicate implicitly captures this via the disjointness of `conforms_vcdm(f)` and `supports_predicate_proof(f)`.

**Severity:** Low. The existing predicate structure already drives the correct UNSAT result in Headline 1. Making the distinction explicit would improve documentation, not correctness.

## Recommended Constraints for Sec 05 Expressiveness Table

The following 8 constraints (C1–C8) are recommended for the expressiveness table. Selection criteria:
1. **Diversity of constraint types:** format, governance, interoperability, privacy, structural
2. **Mix of expressibility:** 3 Yes / 5 Partial (demonstrates both coverage and honest limitation)
3. **Relevance to headline results:** C1, C4, C8 feed Headline 1 (governance conflict); C7 validates the architecture
4. **Multiple governance sources:** ARF Topic 12 (ARB_*), ARF Topic 3 (PID_*), ARF Section 5.3 prose
5. **Architectural validation:** C7 (ARB_06) is the strongest finding — the EU governance framework independently mandates the separation our metamodel provides

## Source Text Excerpts (for verification)

### PID_02 (C1)
> "A PID Provider SHALL issue any PID in both the format specified in ISO/IEC 18013-5 and the format specified in [SD-JWT VC]."

### ARB_01 (C2)
> "The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL specify that one or more of the following two common format(s) must be used for these attestations: The format specified in ISO/IEC 18013-5 [...] The format specified in [SD-JWT VC]."

### ARB_01a (C3)
> "The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHALL specify that one or more of the following three common format(s) must be used for these attestations: [ISO 18013-5, SD-JWT VC, W3C VCDM v2.0]."

### ARB_02 (C4)
> "If proximity presentation is required [...] the Attestation Rulebook SHALL specify that the attestations must be issued in the ISO/IEC 18013-5-compliant mdoc format. Note: [...] the only protocol available to request and release SD-JWT VC-compliant attestations between a Wallet Unit and a Relying Party Instance is OpenID4VP. That protocol cannot be used without internet connectivity."

### PID_21 (C5)
> "When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL make all claims (i.e., all top-level properties, all nested properties, and all array entries) selectively disclosable individually, except those claims defined as non-selectively disclosable in [SD-JWT VC]."

### ARB_06 (C7)
> "The Scheme Provider for an Attestation Rulebook SHALL define all attributes that an attestation of that type may contain. This definition SHALL first describe the semantics of each attribute in an encoding-independent manner and SHALL subsequently for each attribute specify an ISO/IEC 18013-5-compliant format, an SD-JWT VC-compliant format, or both."

### Section 5.3.3 (C8)
> "'SD-JWT' here stands for 'Selectively Disclosable JSON Web Token'. [...] The mechanisms used to make them selectively disclosable is often described as using 'salted hashes', and is conceptually identical to the mechanism used for the same purpose in [ISO/IEC 18013-5]."

### Section 5.3.4 (C6)
> "The W3C Verifiable Credentials Data Model [W3C VCDM 2.0] defines a general data model, offering a high-level structure but leaving many technical aspects open for further definition, including: Security mechanisms, Signature formats, Transport protocols."
