---
id: "A-CODE"
short: "refinery-approach-code"
title: "Add Refinery code listings to Sec 04 approach"
status: pending
priority: high
depends_on: ["A-LST", "A-BG1"]
binding_claims: [3, 4, 5]
target: "sections/04_approach.md"
pipeline: "advisor-2026-03-29"
assigned: "claude"
created: "2026-03-29"
---

## Goal

Add Refinery `.problem` code listings in Sec 04 alongside the key predicate definitions. The advisor said "mehet bele refinery kód példaként, backgroundba meg máshova is" (code examples in background and elsewhere). The prose-only approach descriptions are what makes the paper feel "shallow."

## Context

Advisor feedback (2026-03-29): "Shallow a cikk. Kellene bele refinery kód, hogy precízebb legyen." (The paper is shallow. Need Refinery code to make it more precise.)

Sec 04 currently describes all predicates in prose + math notation. The actual Refinery source is in `models/vc_metamodel.refinery` and `models/governance_conflict.refinery`. Adding the code makes the formalization concrete and verifiable.

## What to do

Add code listings for the most important predicates. Candidates (ranked by importance):

### Must include

1. **`governance_conflict`** (headline result 1) — from `models/governance_conflict.refinery`:
   ```refinery
   error governance_conflict(Credential c, Formatted_Credential f) <->
       EidasMandate::target(_, c),
       PrivacyRequirement::target(_, c),
       format(c, f),
       conforms_vcdm(f),
       !supports_predicate_proof(f)
     ;
       EidasMandate::target(_, c),
       PrivacyRequirement::target(_, c),
       format(c, f),
       supports_predicate_proof(f),
       !conforms_vcdm(f).
   ```

2. **`cross_cred_predicate_gap`** (headline result 2) — from `models/vc_metamodel.refinery` lines 316-325

3. **Trace consistency** (`prop_t` or `prop_s`) — from `models/vc_metamodel.refinery` lines 154-169. Key cross-layer mechanism.

### Nice to include (if space allows)

4. **Format capability propagation** (e.g., `cap_predicate_not_sdjwt`) — one example of negative elimination
5. **`aligned`** shadow predicate — short, illustrative

### Placement

Insert each listing immediately after or within the paragraph that describes the predicate. Use `lstlisting` with `language=refinery` (from A-LST).

**Page budget concern:** Each listing adds ~3-5 lines. Three listings ≈ 0.3 pages. This must be offset by the compression from A-SHORT. Coordinate: code replaces verbose prose description, not adds to it.

## Source material

- `models/vc_metamodel.refinery` — full metamodel
- `models/governance_conflict.refinery` — headline 1 error predicate
- `models/csok_instance.refinery` — instance definitions

## Acceptance criteria

- [ ] At least `governance_conflict` and one cross-layer predicate appear as code listings
- [ ] Listings use `lstlisting` with `language=refinery`
- [ ] Each listing has a brief lead-in connecting it to the surrounding prose
- [ ] The corresponding prose paragraphs are shortened to avoid redundancy with the code
