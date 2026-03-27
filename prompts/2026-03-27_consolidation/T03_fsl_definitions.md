# T03: Format-Specific Layer Definitions

**Wave:** 1 (parallel with T01, T02, T04-T06)
**Execution:** Single agent. Drafts prose + Refinery code listing.
**Dependencies:** T00b (clean `@TODO` blocks must be in place).
**Target file:** `sections/04_approach.md` — paragraphs A8, A9 only.
**Downstream:** T08 (evaluation) uses FSL definitions for coverage mapping.

---

## Context

The Format-Specific Layer is the least mature of the three layers. This task drafts the metaclass definitions and format-specific constraints, including FCA-derived propagation rules. The running example at A10 is already drafted — do NOT touch it.

**Binding claims delivered:** #1 (three-layer metamodel).

## Read Before Writing

1. `sections/04_approach.md` — current state, especially existing prose at A10
2. `models/vc_metamodel.refinery` — authoritative source (FSL section, approximately lines 171-303)
3. `models/governance_conflict.refinery` — governance conflict predicates
4. `archive/fca_export.md` — FCA results (if exists; otherwise use model file)
5. `DECISIONS.md` — mdoc simplified away, FCA results surfaced

## What to Draft

### A8 — FSL Metamodel Definition (~4 sentences)
- Define: `Formatted_Credential` (abstract) with concrete subclasses: `AnoncredsCredentialSchema`, `JsonLdCredentialSchema`, `SdJwtVcCredentialSchema`, `MdocCredentialSchema`
- Each Credential contains one `Formatted_Credential` instance
- Acknowledge explicitly: this layer is less mature than DCL and CSL — fewer constraints formalized, fewer format-specific properties captured
- Brief — one paragraph

### A9 — Format-Specific Constraints (~4-5 sentences + Refinery code listing)
- Surface format capability predicates from the Refinery model: `supports_predicate_proof`, `supports_selective_disclosure`, `conforms_vcdm`, `supports_zkp`, `supports_offline_verification`
- Surface FCA-derived propagation rules (at least 2-3): e.g., predicate proof requires ZKP support, offline verification requires specific format
- Surface governance annotation classes: `EidasMandate`, `PrivacyRequirement`
- Include Refinery code listing showing key capability predicates and propagation rules
- **Mode annotation**: governance annotations at FSL are primary input for error identification (format-governance conflicts) and design space exploration (generating valid format assignments)

### DO NOT TOUCH
- A10 (running example table + prose) — already drafted
- All other paragraphs

## Constraints

- Refinery code listings MUST match `models/vc_metamodel.refinery` exactly
- Use `\ref{sec:...}` for cross-references
- Acknowledge FSL maturity limitation honestly
- Budget: A8 + A9 should use ~0.4 pages
- No LLM tells. Obsidian Markdown with Mathpix math.
