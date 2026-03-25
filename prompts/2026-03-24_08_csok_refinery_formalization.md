# Prompt: CSOK Refinery formalization (Pass 2)

**Task type:** Formal modeling
**Target:** New `.problem` file for the CSOK running example
**Priority:** Blocks Section 04 code listings and evaluation
**Depends on:** Pass 1 conceptual design (`prompts/2026-03-24_06_csok_running_example.md`) and Refinery guide (`guides/refinery/SKILL.md`)

## Context

Pass 1 produced a conceptual design for the CSOK running example: entities, credentials, format assignments, and the governance conflict. This prompt formalizes that design as a Refinery `.problem` file.

The existing metamodel at `prior_work/dse-vc-refinery/vc_model.new.problem` provides the starting point. The metamodel needs evolution — extensions and modifications — to support the CSOK scenario and the format-based governance conflict.

**Read first:**
- `guides/refinery/SKILL.md` — Refinery language reference
- Pass 1 deliverables (scenario description, three-layer table, governance conflict, metamodel extensions list)
- `prior_work/dse-vc-refinery/vc_model.new.problem` — current metamodel

## Instruction

### 1. Evolve the metamodel

Starting from the existing metamodel structure (`prior_work/dse-vc-refinery/vc_model.new.problem`), add or modify what Pass 1 identified as needed. **Consult Oszkár on encoding choices — the tool has evolved since the prior work.**

#### Required extensions (conceptual — Refinery encoding TBD with Oszkár):

1. **Add `SdJwtVcSchema` class** extending `Formatted_Credential` — the existing `JwtVCCredentialSchema` is not the same as SD-JWT-VC (SD-JWT-VC uses hash-based selective disclosure, distinct from plain JWT-VC).
2. **Add `MdocSchema` class** extending `Formatted_Credential` — even if simplified away in the running example, the metamodel should support it.
3. **Format capability predicates:**
   - `supports_predicate_proof(Formatted_Credential f)` — true only for `AnoncredsCredentialSchema`
   - `supports_selective_disclosure(Formatted_Credential f)` — true for `SdJwtVcSchema`, `JsonLdCredentialSchema`
   - `conforms_vcdm(Formatted_Credential f)` — true for `SdJwtVcSchema`, `JsonLdCredentialSchema`, `MdocSchema`; false for `AnoncredsCredentialSchema`
   - `supports_cross_credential_predicate(Formatted_Credential f)` — false for all deployed formats (only SNARK-based research prototypes support this)
4. **Governance constraint predicates** (instance-level assertions for CSOK):
   - `requires_eidas_format(Credential c)` — marks EU wallet attestations
   - `requires_predicate_proof(Credential c, Claim cl)` — marks privacy-sensitive claims
5. **Cross-governance conflict error predicate:** fires when a credential requires both an eIDAS-mandated format and predicate proof capability, and no format satisfies both.
6. **Format containment architecture:** the current model uses `[1]` multiplicity (every credential must have all three formats). CSOK needs selective format assignment. **Ask Oszkár:** change to `[0..1]` with a `no_format_assigned` error predicate, or use an alternative encoding?
7. **Cross-credential predicate flag:** mechanism to mark that a domain constraint (C4: property_area ≥ f(num_children)) spans credentials and no format supports ZK enforcement — **design question for Oszkár**.

Keep metamodel changes generic — CSOK-specific details go in the instance, not the metamodel classes.

### 2. Write the CSOK instance

Using the entities, credentials, and format assignments from Pass 1

**Claim Property Layer (7 elements):**
- `Subject(Applicant).`
- `statement(Applicant, has_children, num_children).`
- `statement(Applicant, owns_property, property_area).`
- `statement(Applicant, earns, monthly_income).`

**Credential Schema Layer (3 credentials):**
- FamilyStatusCred: CS_Applicant₁ → has_children₁ → num_children₁
- PropertyCred: CS_Applicant₂ → owns_property₁ → property_area₁
- IncomeCred: CS_Applicant₃ → earns₁ → monthly_income₁
- All CS_Applicantᵢ trace to Applicant (entity alignment)

**Format-Specific Layer:**
- FamilyStatusCred → SD-JWT-VC (eIDAS compliant)
- PropertyCred → SD-JWT-VC (eIDAS compliant)
- IncomeCred → conflict site (assign SD-JWT-VC for eIDAS compliance; assert requires_predicate_proof for income claim)

**Scope:** `Entity = 4, Prop = 3, Credential = 3` (or as Refinery requires)

### 3. Encode both headline results

**Headline 1 — Income governance conflict (vertical):** The format conflict (eIDAS SD-JWT-VC vs. GDPR predicate proof vs. W3C VCDM conformance on IncomeCred) must be expressible as contradictory constraints. When Refinery attempts to generate with all three governance constraints active, it should either produce no valid models (UNSAT) or produce models that violate at least one governance source. The specific encoding depends on how format capability predicates interact with governance error predicates — **this is the paper's primary headline result**.

**Headline 2 — Cross-credential predicate gap (horizontal):** The constraint `property_area ≥ f(num_children)` spans two credentials. No deployed format supports cross-credential arithmetic predicates in zero-knowledge. Encode this as: a domain constraint (C4) that requires values from two credentials, combined with `supports_cross_credential_predicate(f) = false` for all deployed formats. The metamodel should flag that this constraint cannot be enforced privacy-preservingly at the format-specific layer.

### 4. Surface Martin's FCA results

Memory note: Martin has FCA (formal concept analysis) results relevant to the Format-Specific Layer (Sec 04.3). During this formalization, identify where FCA-derived constraints apply and incorporate 2-3 of them. Ask Martin for the specific FCA results if not already provided.

### 5. Test in Refinery

Run the model in Refinery and verify:
- Without the governance conflict constraints: valid models are generated
- With the governance conflict constraints: the conflict manifests (UNSAT or forced violation)
- Entity alignment works correctly across CSOK credentials
- Scope is reasonable (not too tight, not combinatorially explosive)

## Deliverables

1. **CSOK `.problem` file** — complete Refinery model with evolved metamodel + CSOK instance
2. **Test report** — what Refinery generates, whether the conflict manifests as expected
3. **Metamodel diff summary** — what changed from the existing model and why
4. **Code listings for Sec 04** — key fragments suitable for inclusion in the paper (constraint definitions, propagation rules, governance predicates)

## Constraints

- Follow the Refinery guide (`guides/refinery/SKILL.md`) for syntax.
- Metamodel changes must remain generic — don't hardcode CSOK-specific entities into the metamodel classes.
- Flag any Refinery syntax you're uncertain about.
- If Refinery can't express the governance conflict directly, document the limitation and propose a workaround.
