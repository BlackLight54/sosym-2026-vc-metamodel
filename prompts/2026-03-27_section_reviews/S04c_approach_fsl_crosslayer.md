# S04c: Approach — FSL + Cross-Layer Review

**Deadline: 2026-03-29 AoE (~2 days remaining). Emergency mode applies.**

## Section Assessment

- **Overall verdict:** NEEDS WORK — submittable with targeted fixes (1 blocking, 3 high-priority)
- **Reviewer A (Champion):** Weak Accept. The cross-layer insight lands clearly. The DCL restructuring worked example (lines 115–117) is the paper's most concrete demonstration of "FSL limitations propagate upward." The constraint table C1–C9 is well-organized and carries the argument. Risk: the "less mature" FSL admission may undercut the champion's enthusiasm for three-layer claims.
- **Reviewer B (Mathematician):** Borderline. `aligned` and `cross_cred_predicate_gap` are precisely defined. Target/source consistency rules are clearly stated. However, the six derived predicates (predicate proof support, selective disclosure, VCDM conformance, ZKP support, offline verification, multi-credential proof) are listed but not defined — the section says "full definitions are provided in the supplementary material" for everything. Reviewer B will want at least the two predicates that participate in headline results (`supports_predicate_proof`, `supports_multi_credential_proof`) defined in the body. The three governance annotation classes (`EidasMandate`, `PrivacyRequirement`, `VcdmConformance`) are named but structurally opaque — how do they attach? What references do they carry? This is below the rigor ceiling.
- **Reviewer C (Business Manager):** Weak Accept. The running example tables in each subsection make each layer tangible. The constraint table maps clearly to the scenario. The DCL restructuring paragraph is accessible. Risk: the FSL subsection is abstract — no concrete format assignment table appears until the end, and the governance annotations are unexplained.
- **Reviewer D (Adversarial):** Borderline Reject. Will execute attacks (1) and (4) from VENUE.md. Attack (4) — "PSM layer is empty classes" — is directly enabled by the admission that "this layer is less mature than DCL and CSL: format-internal structural constraints are not yet formalized." The section does not pre-empt this. Attack (1) — "just multi-level metamodeling for a new domain" — is partially pre-empted by the cross-layer constraint table and the DCL restructuring example, but the novelty defense is implicit, not explicit. No paragraph explicitly distinguishes this from standard multi-layer metamodeling.

## Critique

### BLOCKING

**B1. FSL "less mature" admission without defense (line 65)**
- **Severity:** Blocking — directly enables Reviewer D's attack (4).
- **Problem:** The sentence "This layer is less mature than DCL and CSL: format-internal structural constraints are not yet formalized" is honest but tactically disastrous. It tells Reviewer D that the three-layer claim is aspirational. The FSL subsection defines no intra-layer error predicates, no propagation rules, no structural well-formedness constraints. The only FSL content is: (a) five format subclasses, (b) six capability predicates referenced but not defined, (c) three governance annotation classes named but not specified.
- **Reviewer impact:** Reviewer D will argue the paper is a two-layer metamodel with a format enum. Reviewer B will note the asymmetry between the carefully formalized DCL/CSL and the sketch-level FSL.
- **Fix direction:** Do NOT remove the admission — dishonesty is worse. Instead: (1) Replace "less mature" with a precise scope statement: "The FSL does not formalize format-internal structural constraints (e.g., JSON-LD context resolution rules); its role in the metamodel is to carry capability predicates that participate in cross-layer constraints." (2) Add one concrete FSL error predicate — `governance_conflict` is already described in the cross-layer section and fires at FSL level. Promote it to an explicit FSL error predicate definition. (3) Note that format-internal constraints are orthogonal to cross-layer constraint detection, which is the contribution.

### HIGH PRIORITY

**H1. Six derived predicates undefined in body (line 67)**
- **Severity:** High — Reviewer B will flag.
- **Problem:** The six capability predicates are the primary interface between FSL and cross-layer constraints. Listing them without definitions makes the formalization incomplete in the body text. "Full definitions are provided in the supplementary material" is said four times in the approach section — once is fine, four times signals that the paper's core content has been externalized.
- **Fix direction:** Define at minimum `supports_predicate_proof` and `supports_multi_credential_proof` in the body — these two participate directly in C6 and C9. The other four can remain in supplementary. Two sentences each suffices: the predicate holds when the format class is a member of {classes with that capability}, derived via propagation rule over the class hierarchy.

**H2. Governance annotation classes structurally opaque (line 67)**
- **Severity:** High — Reviewer B and Reviewer C both affected.
- **Problem:** `EidasMandate`, `PrivacyRequirement`, `VcdmConformance` are named as "typed markers" that "attach regulatory and standards requirements to individual credentials." But: What metaclass do they specialize? How do they attach (containment? reference?)? What do they carry (a boolean? a reference to a governance source?)? How do error predicates consume them?
- **Fix direction:** One paragraph defining `GovernanceAnnotation` as an abstract metaclass with the three concrete subclasses, attached to `Credential` via containment. State that error predicates pattern-match on annotation type + format capability — e.g., `EidasMandate` on a credential whose format lacks `supports_vcdm_conformance` triggers a governance conflict. This is already implicit in the constraint table; make it explicit.

**H3. No explicit novelty defense paragraph (entire section)**
- **Severity:** High — Reviewer D's attack (1).
- **Problem:** The section never explicitly states what distinguishes this from standard multi-layer metamodeling applied to a new domain. The distinction IS present (multi-source governance constraints from independently governed sources, not top-down refinement; shadow predicates for ecosystem-level properties; cross-layer constraint propagation), but it is distributed across subsections and never synthesized.
- **Fix direction:** Add 2–3 sentences at the end of the cross-layer subsection (before the DCL restructuring example) that explicitly state: "The cross-layer constraints formalized above differ from standard multi-level well-formedness in two respects: (1) constraints originate from independent governance sources (W3C, EU regulation, domain rules) rather than a single refinement hierarchy, and (2) shadow predicates capture ecosystem-level properties (entity alignment, cross-credential predicate gaps) that have no analog in top-down metamodel instantiation."

### MEDIUM PRIORITY

**M1. @TODO A16 (line 113) — constraint application paragraph missing**
- **Severity:** Medium — the section works without it, but the worked example is incomplete.
- **Problem:** The TODO asks for a paragraph showing which propagation rules fire and what the generated model output looks like. This would strengthen the worked example but is not strictly necessary — the DCL restructuring paragraph (lines 115–117) already delivers the key insight.
- **Fix direction:** Given 2-day deadline, cut this TODO. The insight is delivered by the DCL restructuring paragraph. Add a sentence noting that Refinery's generation behavior on this specification is demonstrated in the evaluation (forward reference to Sec 5).

**M2. @TODO polish note (line 117) — tightening needed**
- **Severity:** Low-medium — the paragraph is good but slightly verbose.
- **Fix direction:** The paragraph is strong. The only cut candidate is the last sentence ("The format-specific limitation has forced a change...") which restates what the preceding sentences demonstrate. Keep it — it is the section's thesis sentence and worth the space.

**M3. Acyclicity constraint TODO (line 25)**
- **Severity:** Medium — Reviewer B may notice the claim "connected, acyclic information graph" is asserted but acyclicity is not enforced.
- **Fix direction:** Either add the `cyclic` error predicate to the Refinery model (preferred) or soften the claim to "connected information graph with clear directionality from subjects to values" (dropping "acyclic" if not enforced).

**M4. Cross-layer constraint table as figure (line 97)**
- **Severity:** Low — the @FIGURE marker suggests converting the table to a figure. This is a presentation choice.
- **Fix direction:** The table reads well as a table. If page budget allows, keep as table with a `\label{tab:constraints}`. The figure conversion is cosmetic and not worth time at this stage.

### OBSERVATIONS (non-blocking)

**O1. "Supplementary material" refrain.** The phrase "provided in the supplementary material" or equivalent appears 7 times in the approach section. This is excessive. Reviewer D will read it as "the actual formalization is not in the paper." Consolidate: state once at the section opening that complete Refinery encodings are in the supplement, then stop repeating it. Individual definitions can say "the full propagation rule set includes..." without the supplementary redirect.

**O2. DCL restructuring worked example is strong.** This is the section's best paragraph. It concretely shows format limitations propagating upward — exactly what Decision 11 requires. It connects directly to Headline 1 in the evaluation. No changes needed.

**O3. Cross-layer predicates are well-defined.** `aligned`, `common_parent`, and `cross_cred_predicate_gap` are precisely stated with formal conditions. `prop_t` and `prop_s` (target/source consistency) use negative elimination correctly per Refinery semantics. Reviewer B should be satisfied with these specific predicates.

**O4. Forward-reference check to evaluation.** The evaluation (Sec 5) correctly uses C8 (governance conflict) and C9 (cross-credential predicate gap) as headline results. The constraint table numbering is consistent. The anti-pattern catalog references the same predicates. No mismatch detected.

**O5. The FSL format capability table in the housing subsidy scenario (lines 69–77) is effective.** The "?" and "Conflict" markers make the problem visible at a glance. This is good figure-quality presentation in table form.

## @TODO Risk Assessment

| Marker | Location | Risk | Recommendation |
|--------|----------|------|----------------|
| @TODO: Acyclicity constraint | line 25 | Medium — claim-evidence gap | Soften claim or add predicate |
| @FORMAL: DCL definition | line 17 | Low — prose covers this adequately | Remove marker; prose IS the definition |
| @FORMAL: DCL constraints | line 23 | Low — constraints described in prose | Remove marker |
| @TODO: A16 constraint application | line 113 | Medium — incomplete worked example | Cut; forward-ref to Sec 5 |
| @TODO: Polish paragraph | line 117 | Low — paragraph is good | Keep as-is |
| @FIGURE: fig_constraint_taxonomy | line 97 | Low — table works fine | Keep as table |
| @FIGURE: fig_generated_model | line 111 | Low — optional | Cut for page budget |

## Fix-It Prompt

```
# S04c Fix-It: FSL + Cross-Layer Constraints

## Context
You are editing `sections/04_approach.md`, specifically the FSL subsection (Sec 4.3) and Cross-Layer Constraints subsection (Sec 4.4). This is a MODELS 2026 Foundations Track paper. Deadline is 2026-03-29 AoE. Emergency mode: fix only what blocks submission.

Read these files before editing:
- `sections/04_approach.md` (full file — you are editing it)
- `context/DECISIONS.md` (Decision 11: FSL restructuring as worked example; Decision 15: no code listings)
- `context/VENUE.md` (reviewer personas, especially Reviewer D attacks)

## Tasks (in priority order)

### 1. BLOCKING: Reframe FSL maturity admission (line 65)
Replace "This layer is less mature than DCL and CSL: format-internal structural constraints are not yet formalized" with a precise scope statement. Example direction:

"The FSL does not formalize format-internal structural constraints (e.g., JSON-LD context resolution, mdoc CBOR encoding rules); its role in the metamodel is to carry capability predicates and governance annotations that participate in cross-layer constraints. Format-internal well-formedness is orthogonal to cross-layer constraint detection — the contribution of this formalization."

Do NOT hide the limitation. Reframe it as a deliberate scope boundary.

### 2. HIGH: Define two key capability predicates in body (around line 67)
After the sentence listing the six derived predicates, add definitions for the two that participate in headline results:
- `supports_predicate_proof`: holds when `Formatted_Credential` is an instance of a format class whose cryptographic foundation includes predicate proof construction (in scope: AnonCreds only).
- `supports_multi_credential_proof`: holds when the format supports evaluating predicates over values from distinct credentials in a single proof (in scope: no deployed format; SNARK-based research prototypes only).

Keep to 2–3 sentences total. No code. Math notation for the predicate definitions. The other four predicates can remain referenced to supplementary material.

### 3. HIGH: Define governance annotation structure (around line 67)
Add one paragraph after the capability predicates defining `GovernanceAnnotation` as an abstract metaclass with three concrete subclasses (`EidasMandate`, `PrivacyRequirement`, `VcdmConformance`), attached to `Credential` via containment. State how error predicates consume them: an error fires when a governance annotation requires a capability that the credential's assigned format does not provide.

### 4. HIGH: Add explicit novelty defense (end of Sec 4.4, before DCL restructuring)
Add 2–3 sentences distinguishing this from standard multi-layer metamodeling:
- Constraints originate from independent governance sources, not a single refinement hierarchy
- Shadow predicates capture ecosystem-level properties with no analog in top-down instantiation
- Cross-layer constraint propagation (FSL → DCL restructuring) demonstrates bidirectional layer interaction, not unidirectional refinement

### 5. MEDIUM: Resolve acyclicity TODO (line 25)
If the `cyclic` error predicate exists in the Refinery model, keep the "acyclic" claim. If not, soften to "connected information graph with clear directionality from subjects to values" and remove the acyclicity claim. Remove the @TODO marker either way.

### 6. MEDIUM: Cut @TODO A16 (line 113)
Replace the TODO with a forward reference: "The evaluation (\autoref{sec:evaluation}) demonstrates Refinery's behavior on this specification, including the propagation rules that fire during consistency checking and design space exploration."

### 7. LOW: Consolidate "supplementary material" references
The phrase appears ~7 times. Keep one consolidated statement (e.g., at the start of Sec 4 or end of Sec 4.1): "Complete Refinery encodings for all metamodel elements, propagation rules, and constraint definitions are provided as supplementary material." Then remove or shorten subsequent occurrences to "the complete rule set" or similar without the supplementary redirect.

### 8. LOW: Remove resolved @FORMAL markers (lines 17, 23)
The prose already serves as the definition. Remove these markers.

## Constraints
- No code listings (Decision 15)
- Obsidian Markdown with Mathpix math conventions
- Do not exceed ~3.0 page budget for the full approach section
- Every new sentence must advance the argument or establish a definition
- After editing, list remaining @TODO markers and assess whether any are submission-blocking
```
