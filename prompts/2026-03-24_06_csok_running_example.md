# Prompt: Design simplified CSOK running example

**Task type:** Research + modeling
**Target:** Running example design for all sections (03–05), teaser figure, Refinery formalization
**Priority:** Critical path — blocks Section 03 and 04 drafting

## Context

The advisor (Oszkár) directed that the paper use the Hungarian CSOK (Családi Otthonteremtési Kedvezmény / Family Housing Subsidy) mortgage scenario as the running example, heavily simplified. This replaces the previously planned Diploma+Alice hybrid.

**CSOK domain context:** CSOK is a Hungarian government subsidy for families purchasing or building a home. Applicants must prove eligibility through multiple credentials from different issuers, under constraints from Hungarian law, EU regulations (eIDAS 2.0), and W3C VCDM structural requirements.

**Paper context:**
- **Venue:** MODELS 2026 Foundations Track, 10 pages ACM sigconf
- **Thesis:** Multi-level metamodel for VC ecosystem design with formalized cross-layer constraints
- **Three layers:** Claim Property Layer (information graph), Credential Schema Layer (abstract VC schemas), Format-Specific Layer (AnonCreds, JSON-LD, JWT-VC)
- **The example must exercise:** (a) entity alignment across credentials (horizontal), (b) format→claim dependency (vertical), (c) at least one cross-layer constraint violation invisible to single-layer inspection

## Instruction

Design a simplified CSOK running example that:

1. **Fits in ~1 paragraph of setup** (Sec 03, M1-M2). The reader must understand the scenario in 3-5 sentences.
2. **Uses at most 4-5 entities at the claim property layer** and **2-3 credentials at the credential schema layer**. More than this won't fit in figures or 10 pages.
3. **Exercises all three metamodel layers** with at least one meaningful constraint at each.
4. **Demonstrates both vertical and horizontal cross-layer constraints.**
5. **Provides a natural governance conflict** — constraints from Hungarian CSOK regulations vs. EU eIDAS/ARF vs. W3C VCDM that are formally in tension. This is binding claim #8 (headline result, currently does not exist).

## Research questions for the design

- What are the actual CSOK eligibility requirements? Which involve verifiable credentials?
- What entities and relationships exist in the CSOK domain? (Applicant, spouse, children, property, income, etc.)
- Which credentials would be involved? (Family status, property deed, income certificate, etc.)
- Which issuers? (Government registry, employer, bank, notary)
- Where do W3C VCDM, eIDAS 2.0, and Hungarian regulations impose potentially conflicting constraints?
- What is the minimum subset that still exercises all three layers and both constraint dimensions?

## Constraints

- The example must be self-contained — no Hungarian legal expertise required to understand it. Frame in terms familiar to a MODELS audience.
- Rename/generalize domain terms if needed for international readability (e.g., "family housing subsidy" rather than "CSOK" in the paper body; CSOK can appear in a footnote).
- The simplified version must still be *accurate* — don't fabricate regulatory requirements. If unsure, flag for Martin to verify.
- The existing Refinery model (`prior_work/dse-vc-refinery/vc_model.new.problem`) uses Tom/owns_plot/id_number. The CSOK example may reuse or extend this model structure but with CSOK-specific entities and credentials.

## Deliverables

1. **Scenario description** — 1 paragraph, suitable for Sec 03 M1.
2. **Claim property layer** — entity list with relationships (Subject, Props, Values).
3. **Credential schema layer** — credential list with claims and trace mappings.
4. **Format-specific layer** — format assignments with governance rationale.
5. **Cross-layer constraints exercised** — which constraints from Sec 04.4 apply.
6. **Governance conflict candidate** — at least one concrete example of formally contradictory cross-governance constraints (for binding claim #8).
7. **Teaser figure sketch** — text description of the three-layer visual.

## After

- Update section scaffolds (Sec 03, 04) to reference the CSOK example instead of Diploma/Alice.
- If a Refinery formalization is needed, create a separate prompt for that.
- Record final example design in DECISIONS.md.
