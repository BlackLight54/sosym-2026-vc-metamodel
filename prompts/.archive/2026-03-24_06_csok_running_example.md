# Prompt: Design simplified CSOK running example

**Task type:** Research + conceptual modeling (Pass 1 of 2)
**Target:** Running example design for all sections (03–05), teaser figure
**Priority:** Critical path — blocks Section 03 and 04 drafting
**Pass 2:** Refinery formalization (separate prompt, after this design stabilizes)

## Context

The advisor (Oszkár) directed that the paper use the Hungarian CSOK (Családi Otthonteremtési Kedvezmény / Family Housing Subsidy) scenario as the running example, heavily simplified. This replaces the previously planned Diploma+Alice hybrid.

**CSOK domain context:** CSOK is a Hungarian government subsidy for families purchasing or building a home. Applicants must prove eligibility through multiple credentials from different issuers, under constraints from Hungarian law, EU regulations (eIDAS 2.0), and W3C VCDM structural requirements.

**Paper context:**
- **Venue:** MODELS 2026 Foundations Track, 10 pages ACM sigconf
- **Thesis:** Multi-level metamodel for VC ecosystem design with formalized cross-layer constraints
- **Three layers:** Claim Property Layer (information graph), Credential Schema Layer (abstract VC schemas), Format-Specific Layer (AnonCreds, JSON-LD, SD-JWT-VC)
- **The example must exercise:** (a) entity alignment across credentials (horizontal), (b) format→claim dependency (vertical), (c) at least one cross-layer constraint violation invisible to single-layer inspection

**Prior work:** The existing Refinery model (`prior_work/dse-vc-refinery/vc_model.new.problem`) provides the starting metamodel structure (Entity/Prop/Value at CIM, CredentialSubject/Claim/Credential at PIM, format schemas at PSM) with the Tom/owns_plot/id_number instance. The CSOK example requires a substantially new instance and metamodel extensions — not a rename of Tom.

## Instruction

Design a simplified CSOK running example that:

1. **Fits in ~1 paragraph of setup** (Sec 03, M1-M2). The reader must understand the scenario in 3-5 sentences.
2. **Uses at most 4-5 entities at the claim property layer** and **2-3 credentials at the credential schema layer**. More than this won't fit in figures or 10 pages.
3. **Exercises all three metamodel layers** with at least one meaningful constraint at each.
4. **Demonstrates both vertical and horizontal cross-layer constraints.**
5. **Provides a format-based governance conflict** (see Governance Conflict section below). This is binding claim #8 (headline result).

## Decided: Governance conflict direction

The governance conflict is a **format conflict at the PSM layer** driven by contradictory governance requirements:

| Governance source | Constraint | Layer |
| --- | --- | --- |
| eIDAS 2.0 ARF | EU Digital Identity Wallet attestations must use SD-JWT-VC | PSM |
| Privacy / data minimization | Income proof should reveal only "above threshold" → requires ZKP range proof | PSM |
| W3C VCDM 2.0 | credentialSubject must conform to VCDM data model | PIM↔PSM |

**The conflict:** An IncomeCredential needs SD-JWT-VC format (eIDAS compliance) AND ZKP capability (privacy-preserving income proof). AnonCreds provides ZKP but doesn't conform to W3C VCDM. SD-JWT-VC conforms to VCDM but doesn't support ZKP range proofs natively.

- At PIM: one IncomeCredential — valid.
- At PSM: no single format satisfies both eIDAS (SD-JWT-VC) and privacy (AnonCreds) — contradictory.
- **Invisible to single-layer inspection.** Surfaces only through cross-governance, cross-layer constraint checking.

**Research needed:** Verify that eIDAS ARF actually mandates SD-JWT-VC (not just recommends). Verify that SD-JWT-VC cannot express ZKP range proofs. Verify the privacy requirement is grounded in real regulation (GDPR data minimization, or CSOK-specific rules). Flag anything uncertain for Martin.

## Candidate CSOK scenario design

### Claim Property Layer (CIM) — 4 entities

- `Applicant` (Subject) — the person applying for the housing subsidy
- `num_children` (Value) — family size, determines subsidy tier
- `property_value` (Value) — value of home being purchased
- `monthly_income` (Value) — income, must exceed eligibility threshold

Relationships:
- `statement(Applicant, has_children, num_children)`
- `statement(Applicant, owns_property, property_value)`
- `statement(Applicant, earns, monthly_income)`

### Credential Schema Layer (PIM) — 3 credentials

- `FamilyStatusCredential` — issued by government registry → has_children claim
- `PropertyCredential` — issued by land registry → owns_property claim
- `IncomeCredential` — issued by employer → earns claim

Entity alignment: `Applicant` appears as credentialSubject in all three credentials. The three CredentialSubjects must trace back to the same CIM entity (aligned).

### Format-Specific Layer (PSM) — format assignments

- `FamilyStatusCredential` → SD-JWT-VC (eIDAS-compliant, EU wallet)
- `PropertyCredential` → JSON-LD (linked data, property registry interop)
- `IncomeCredential` → **conflict site** — needs both SD-JWT-VC (eIDAS) and AnonCreds (ZKP)

### Cross-layer constraints exercised

1. **Entity alignment** (horizontal, CIM↔PIM): Applicant's CredentialSubjects across 3 credentials must align
2. **Trace consistency** (vertical, CIM→PIM): Each claim traces to exactly one CIM property
3. **Format governance** (vertical, PSM): eIDAS requires SD-JWT-VC for EU wallet credentials
4. **Privacy governance** (vertical, PSM): Income threshold check requires ZKP range proof
5. **Cross-governance conflict** (PSM, multi-source): Requirements 3 and 4 contradict on IncomeCredential

## Research questions (remaining)

- What are the actual CSOK eligibility requirements that map to these entities? (Martin to verify)
- Does eIDAS 2.0 ARF mandate or recommend SD-JWT-VC? (Need to verify strength of claim)
- Can SD-JWT selective disclosure approximate ZKP range proofs? (If yes, conflict weakens)
- What CSOK-specific rules exist for income verification? (Threshold, documentation requirements)
- Is the 3-credential design realistic, or would CSOK combine family status and income?

## Constraints

- The example must be self-contained — no Hungarian legal expertise required. Frame in terms familiar to a MODELS audience.
- Generalize domain terms for readability (e.g., "family housing subsidy" rather than "CSOK" in body; CSOK in footnote).
- The simplified version must be *accurate* — don't fabricate regulatory requirements. Flag uncertainties for Martin.
- This is Pass 1 (conceptual design). Do not attempt Refinery formalization in this prompt.

## Deliverables

1. **Scenario description** — 1 paragraph, suitable for Sec 03 M1.
2. **Claim property layer** — entity list with relationships (Subject, Props, Values).
3. **Credential schema layer** — credential list with claims and trace mappings.
4. **Format-specific layer** — format assignments with governance rationale.
5. **Cross-layer constraints exercised** — which constraints apply and how.
6. **Governance conflict** — the format conflict described formally, with governance sources cited.
7. **Teaser figure sketch** — text description of the three-layer visual.
8. **Metamodel extensions needed** — what the existing metamodel lacks for this scenario (for Pass 2).

## After

- Update section scaffolds (Sec 03, 04) to reference the CSOK example instead of Diploma/Alice.
- Create Pass 2 prompt for Refinery formalization.
- Record final example design in DECISIONS.md.
