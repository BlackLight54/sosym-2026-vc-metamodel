# Section 04 (Approach) Audit

**Auditor:** Claude Opus 4.6 (1M context)
**Date:** 2026-03-30
**Files reviewed:** `sections/04_approach.md` (172 lines), `models/vc_metamodel.refinery`, `models/governance_conflict.refinery`, `models/csok_instance.refinery`, `models/csok.problem`, 10 claim files, 29 decision files, `context/VENUE.md`.

---

## 1. Binding Claim Delivery

### Claim #1: Three-layer metamodel (status: delivered)

**Evidence present.** All three layers have dedicated subsections (4.1 DCL, 4.2 CSL, 4.3 FSL) with metaclass definitions and running example instances. The opening paragraph (L9-11) explicitly names the three layers:

> "The metamodel separates these concerns into three layers: the DCL, the CSL, and the FSL."

Each subsection defines metaclasses, predicates, and connects to the running example. The constraint taxonomy (Table 2, L99-111) and fig:metamodel (L95) provide the structural overview.

**Assessment: Delivered.** The three layers are defined, populated with predicates, and exercised on the CSOK scenario. The asymmetry between FSL and the upper layers is the main weakness (see Section 6 below).

### Claim #2: VCDM grounding (status: delivered)

**Evidence in Sec 04 is indirect.** The section references VCDM concepts (credential, credentialSubject, claim) via CSL metaclass names that mirror VCDM terminology. Line 50 states:

> "the +CSL mirrors the +DCL type structure (fig:metamodel): credential entities parallel domain entities, claims parallel properties, and credential subjects parallel subjects."

However, the explicit VCDM mapping (soundness/completeness) is in Sec 05, not Sec 04. Sec 04 does reference `\autoref{sec:vcdm}` at L78 for the capability analysis.

**Assessment: Partially delivered in Sec 04.** The grounding is implicit in naming and structure; the formal mapping lives in Sec 05. This is acceptable given claim_02 lists evidence_section as Sec 04 AND Sec 05.

### Claim #3: Cross-layer constraints as graph predicates (status: delivered)

**Evidence present and substantial.** Sec 04.4 (L93-171) delivers:
- Constraint taxonomy table (C1-C9, Table 2, L99-111)
- Three cross-layer predicate definitions: `prop_t`/`prop_s` (propagation rules, C2), `aligned` (shadow predicate, C1), `cross_cred_predicate_gap` (shadow predicate, C9)
- Refinery code listings for trace consistency (L122-140) and shadow predicates (L150-169)
- Usage mode exercise (L115): consistency checking -> error identification -> DSE

The critical passage linking predicates to usage modes (L115):

> "Fixing IncomeCred to SD-JWT-VC triggers error identification: the framework returns NOT_OK(governance_conflict), naming the conflict site where C5, C6, and C7 cannot be simultaneously satisfied."

**Assessment: Delivered.** The constraint taxonomy is well-structured, cross-layer predicates are formally defined with code, and the running example exercises all three usage modes.

---

## 2. Decision Compliance

### decision_dcl_rename (active)

**Compliant.** All references use "Domain Concept Layer" / "DCL". No remnant "Claim Property Layer" or "CPL" found.

### decision_no_mda_terminology (active)

**Compliant.** No CIM/PIM/PSM/MDA terminology appears. Line 11 uses "multi-layer modeling principles" which aligns with the prescribed terminology.

### decision_format_driven_restructuring (active)

**Compliant.** Line 171 delivers the upward propagation:

> "the only workaround is restructuring the domain concept layer, replacing a numeric property with pre-computed boolean claims, a cross-layer design consequence"

The worked example appears at L171 (final paragraph of Sec 04.4). However, the decision specifies this should be a worked example in Sec 04.4 — the current treatment is a single sentence, not a developed example. The full development is deferred to `\autoref{sec:headlines}` (Sec 05). This is a borderline compliance issue: the decision says "present in Sec 04.4 as cross-layer constraint propagation example" but the actual example lives in Sec 05.

### decision_fsl_elaboration (deferred)

**Status acknowledged.** The decision memo records that Sec 04.3 should "explicitly acknowledge the gap" with a defensive statement. However, the current Sec 04.3 text (L72-91) does NOT contain the quoted defense ("Unlike DCL and CSL, the format-specific layer does not yet carry intra-layer structural constraints"). Line 78 says:

> "The FSL does not carry intra-layer structural constraints like the upper layers. Its role is to carry capability predicates that governance frameworks demand or prohibit, and governance annotations that attach regulatory requirements to individual credentials."

This is a factual statement of the design, not an argumentative defense. The decision memo's claim that the defense is present appears to be stale — the quoted text may have been cut or rewritten. See Section 6 for detailed FSL assessment.

### decision_no_code_listings -> decision_refinery_code_in_paper (superseded/active)

**Compliant with new policy.** Three Refinery code listings appear in Sec 04:
- `lst:dcl-instance` (L19-24): DCL partial specification
- `lst:trace-consistency` (L122-140): Cross-layer trace consistency rules
- `lst:cross-layer-shadow` (L150-169): Shadow predicates

These are selective illustrative listings, not the full encoding. Consistent with the "body gets illustrative listings" policy.

### decision_formal_claims_required (active)

**Partially compliant.** The section defines predicates formally and states what they guarantee (e.g., L42: "Together, these constraints ensure that every DCL instance is a connected, directed acyclic information graph"). However, no boxed or explicitly labeled formal claims appear. The soundness/completeness guarantees (per `decision_soundness_completeness`) are not stated in Sec 04. The decision says "Sec 04: State the guarantees when presenting cross-layer constraints" — this has not been done.

### decision_modeling_first_framing (active)

**Compliant.** The section uses modeling language throughout. Line 42: "constraints ensure that every DCL instance is a connected, directed acyclic information graph." Line 115: "the framework returns NOT_OK(governance_conflict)." No detection-algorithm framing.

### multi_layer_rename (from MEMORY.md)

**Compliant.** The section uses "multi-layer" consistently (L11: "multi-layer modeling principles"). No "multi-level" appears except in the `\autoref{sec:multi-layer}` cross-reference, which correctly points to BG.

### decision_type_graph_rename (active)

**Compliant.** The fig:metamodel caption (L95) reads "The three-layer type graph" — matches the decision. Figure placement is in Sec 04.4 near the constraint table, as prescribed.

### decision_bg_notation_consistency (active)

**Compliant.** Refinery terms carry `\autoref{sec:refinery}` backreferences: L11 ("Refinery framework (\autoref{sec:refinery})"), L28 ("propagation rule (\autoref{sec:refinery})"), L54 ("two shadow, two error; \autoref{sec:refinery}"), L117 ("three categories defined in \autoref{sec:refinery}").

---

## 3. Marker Census

| Line | Type | Content |
|------|------|---------|
| — | — | **No annotation markers found.** |

The section contains zero `.todo`, `.cite`, `.formal`, `.figure`, `.scaffold`, or `.meta` annotation markers. All figures are placed as standard Markdown images. This is clean for submission.

---

## 4. Prose-Model Consistency

### Classes: prose vs. model

| Prose element | Model element | Match? |
|---|---|---|
| Entity (abstract) | `abstract class Entity` | Yes |
| Subject | `class Subject extends Entity` | Yes |
| Value | `class Value extends Entity` | Yes |
| Prop | `class Prop` | Yes |
| CredEntity (abstract) | `abstract class CredEntity` | Yes |
| CredentialSubject | `class CredentialSubject extends CredEntity` | Yes |
| CredentialValue | `class CredentialValue extends CredEntity` | Yes |
| Claim | `class Claim` | Yes |
| Credential | `class Credential` | Yes |
| Formatted_Credential (abstract) | `abstract class Formatted_Credential` | Yes |
| AnoncredsCredentialSchema, etc. | Five format subclasses | Yes |
| EidasMandate, PrivacyRequirement, VcdmConformance | Three governance annotation classes | Yes |
| GovernanceAnnotation (abstract) | `abstract class GovernanceAnnotation` | Yes |

**Classes match.** All prose-described metaclasses exist in the model.

### Predicates: prose vs. model

| Prose predicate | Model predicate | Match? |
|---|---|---|
| `statement(s, p, v)` | `pred statement(Entity, Prop, Entity)` | Yes |
| `non_connected(e1, e2)` | `error non_connected(Entity, Entity)` | Yes |
| `no_self_loop` | `propagation rule no_self_loop(Prop, Entity)` | Yes |
| `cyclic` | `error cyclic(Entity)` | Yes |
| `credential_statement` | `pred credential_statement(CredEntity, Claim, CredEntity)` | Yes |
| `Root_cred_entity` | `pred Root_cred_entity(CredEntity)` | Yes |
| `no_empty_cred` | `error no_empty_cred(CredentialSubject)` | Yes |
| `root_ent_doesnt_have_cred` | `error root_ent_doesnt_have_cred(Root_cred_entity)` | Yes |
| `prop_t`, `prop_s` | propagation rules in model | Yes |
| `aligned` | `shadow pred aligned(CredEntity, CredEntity)` | Yes |
| `cross_cred_predicate_gap` | `shadow pred cross_cred_predicate_gap(Credential, Credential)` | Yes |
| `governance_conflict` | In `governance_conflict.refinery` | Yes (separate file) |

### Inconsistencies found

**CRITICAL: `conforms_vcdm` and mdoc.** The capability table (L80-88) shows mdoc does NOT conform to VCDM (`—` in the mdoc column for `conforms_vcdm`). The model (`vc_metamodel.refinery` L222-226) defines:

```
pred conforms_vcdm(Formatted_Credential f) <->
    SdJwtVcSchema(f);
    JsonLdCredentialSchema(f);
    JwtVCCredentialSchema(f);
    MdocSchema(f).
```

The model says mdoc **does** conform to VCDM. The table says it does **not**. One of these is wrong. This affects the governance conflict logic: if mdoc conforms to VCDM, it becomes a candidate format for credentials under eIDAS+VCDM conformance requirements.

**CRITICAL: `supports_offline_verification` table vs. model.** The table (L86) shows offline verification only for mdoc (`$\checkmark$` only in mdoc column). The model (L233-236) defines:

```
pred supports_offline_verification(Formatted_Credential f) <->
    AnoncredsCredentialSchema(f);
    JsonLdCredentialSchema(f);
    MdocSchema(f).
```

The model gives offline verification to AnonCreds, JSON-LD, AND mdoc. The table gives it only to mdoc. Discrepancy on two formats.

**MINOR: `credential_statement` and `Root_cred_entity` described as shadow predicates in prose (L54-60) but defined as `pred` in the model.** The prose says "two shadow predicates" (L54), but `credential_statement` is `pred` (not `shadow pred`) in the model (L116), and `Root_cred_entity` is `pred` (not `shadow pred`) in the model (L136). Only `aligned` and `cross_cred_predicate_gap` are actual `shadow pred` in the model. The prose misclassifies these as shadow predicates.

**MINOR: `Leaf` predicate in model not mentioned in prose.** `pred Leaf(Value e)` (model L41) appears in the model but is never described in Sec 04.

**MINOR: `common_parent` shadow predicate.** Mentioned once at L148 ("defined in supplementary material") but actually defined in `vc_metamodel.refinery` L183-189, not in supplementary. Either the prose is wrong about its location, or the model includes it while supplementary was the intended canonical location.

**MINOR: `statement_rule`, `statement_rule_bw`, `credential_statement_rule`, `credential_statement_rule_opp` propagation rules in model.** These structural propagation rules exist in the model but are not described in prose. Acceptable as implementation detail, but a completeness-minded reviewer may note the gap.

### Instance consistency

The DCL listing at L19-24 matches the structure in `csok_instance.refinery` L28-40. The CSL description at L47-52 matches `csok_instance.refinery` L50-97. The FSL assignments at L76 match `csok_instance.refinery` L100-119.

---

## 5. Argument Quality

### 4.1 DCL (L13-42)

**Strengths:**
- Clean progression: running example first (L17-26), then formal definitions (L28-41), then summary guarantee (L42).
- The "example before formalism" pattern is well-executed and matches the Business Manager reviewer's needs.
- Four predicates are clearly defined with definition-list formatting.
- The usage mode connection at L42 is effective: shows how `non_connected` yields `NOT_OK` output.

**Weaknesses:**
- The `Subject`/`Value` distinction is described as structurally inferred (L28: "a propagation rule classifies any Entity with no incoming value reference as a Subject") — this is good but the propagation rule is not named. The model calls it `root_is_subj`. Minor gap.
- L28 says "each Prop holds exactly one Value and carries a trace link to the credential schema layer" — the trace is described before CSL is introduced. A forward reference to Sec 4.2 exists but the reader encounters the concept cold.

### 4.2 CSL (L44-70)

**Strengths:**
- The "three credentials partition the facts" paragraph (L48-52) is an effective concrete grounding.
- Trace semantics are well-motivated (L50): "when a trace is broken, the metamodel names the specific design error."
- The two propagation rules (`subject_traces_to_subject`, `root_is_cred_subj`) that infer CSL types from DCL structure are named and their role is clear.
- The shadow/error predicate distinction (L54-69) is cleanly organized.

**Weaknesses:**
- L70 references "all five predicates" classified in the anti-pattern catalog. Count check: `credential_statement` (shadow), `Root_cred_entity` (shadow), `no_empty_cred` (error), `root_ent_doesnt_have_cred` (error) = four predicates, not five. The fifth may be `cred_neighbors` from the model but it is not described in prose. This is either a counting error or an undescribed predicate.

### 4.3 FSL (L72-91)

**Strengths:**
- The capability matrix (Table 1) is information-dense and useful.
- The governance annotation classes are named and their role is clear.
- The connection to the headline conflict is explicit (L91).

**Weaknesses:**
- No intra-layer predicates. See Section 6 below.
- The paragraph at L78 tries to do too much: it covers capability predicates, governance annotations, format classes, and the capability matrix in one block. Could be structurally clearer.
- No formal predicate definitions appear for the FSL. The capability predicates are shown in a table but not defined as definition-list items the way DCL and CSL predicates are. This structural asymmetry is visible.

### 4.4 Cross-Layer (L93-171)

**Strengths:**
- The constraint taxonomy (Table 2) is the section's strongest artifact. It classifies C1-C9 by source and layer scope, making the multi-layer argument visually concrete.
- The usage mode exercise at L115 is the argumentative high point: one paragraph demonstrates all three modes on the same design.
- The code listings for `prop_t`/`prop_s` (L122-140) and `aligned`/`cross_cred_predicate_gap` (L150-169) are well-chosen. They show negative elimination — the core Refinery mechanism — in action.
- The final paragraph (L171) connects format limitations to DCL restructuring, delivering the cross-layer insight.

**Weaknesses:**
- C8 ("Governance conflict") is listed in the taxonomy table as "C5+C6+C7" but the `governance_conflict` error predicate from `governance_conflict.refinery` is never shown as a code listing in Sec 04. It is referenced at L115 (`governance_conflict`) but only as a result, not defined. Given decision_refinery_code_in_paper says "governance_conflict" should be in Sec 04, this may be a gap.
- The constraint taxonomy table caption (L111) says "C1-C3 are metamodel-enforced" but C3 (`no_empty_cred`) is an intra-layer CSL constraint, not cross-layer. Including it in a "cross-layer constraint taxonomy" is categorically confusing. The table mixes intra-layer and cross-layer constraints without flagging the distinction. C4 ("Cross-credential value dep.") is labeled "DCL horiz." — also intra-layer.
- The transition from the figure inclusion (L95) to the taxonomy table (L97) is abrupt. A connecting sentence would help.

### Constraint taxonomy (C1-C9) motivation

The taxonomy is well-structured but its motivation could be stronger. The reader learns the nine constraints but not *why these nine and not others*. Are they exhaustive for the CSOK scenario? Are they representative of the broader design space? The prose at L113 ("C8 and C9 are cross-layer results") gestures at the distinction between derived and primitive constraints but does not develop it.

---

## 6. FSL Assessment

### Current state

FSL (Sec 4.3) is 20 lines of prose (L72-91) plus the capability matrix table. It defines:
- Five format subclasses of `Formatted_Credential`
- Six capability predicates (shown in table, not as definition-list items)
- Three governance annotation classes
- Format capability propagation (described in one sentence at L91, no code)

### What is missing

Per `decision_fsl_elaboration`:
- **No intra-layer structural constraints.** DCL has four predicates (statement, non_connected, no_self_loop, cyclic). CSL has four predicates (credential_statement, Root_cred_entity, no_empty_cred, root_ent_doesnt_have_cred). FSL has zero intra-layer predicates. The capability predicates are derived from class membership, not structural constraints.
- **No explicit defense.** The decision memo claims Sec 04.3 "explicitly acknowledges the gap" with "Unlike DCL and CSL, the format-specific layer does not yet carry intra-layer structural constraints." This sentence does not appear in the current text. Line 78 says "The FSL does not carry intra-layer structural constraints like the upper layers" — which is a flat assertion, not a defense with justification for why the layer is still genuine.
- **No code listings.** DCL has one listing, cross-layer has two. FSL has none.

### Argumentative sufficiency

The FSL's defense rests on three implicit arguments:
1. It carries capability predicates (table).
2. It carries governance annotations (three classes named).
3. Its capability predicates feed cross-layer propagation rules (L91, L171).

These are stated but not developed. The Adversarial reviewer's attack #4 (VENUE.md L44: "PSM layer is empty classes — three-layer claim is aspirational, paper delivers two") maps directly onto this subsection. The current text provides the Adversarial reviewer with ammunition: five format classes with no structural constraints, a capability table derivable from a lookup, and governance annotations that are typed markers with no format-internal semantics.

**Verdict:** The FSL is thin enough to be a credible attack surface. The defense in Sec 04.3 is implicit where it needs to be explicit. The limitation acknowledgment referenced in `decision_fsl_elaboration` is either missing or was rewritten into a weaker form.

---

## 7. Reviewer Persona Vulnerability Analysis

### Mathematician (Reviewer B)

**Primary targets:**
1. **`credential_statement` and `Root_cred_entity` misclassified as shadow predicates** (L54). The model defines these as `pred`, not `shadow pred`. The Mathematician will check Refinery semantics and flag this: shadow predicates have specific 3-valued interpretation behavior; `pred` and `shadow pred` are not interchangeable.
2. **Capability matrix inconsistencies** (see Section 4 above). `conforms_vcdm` and `supports_offline_verification` disagree between prose table and model. The Mathematician will verify the governance conflict logic and find that the conflict proof depends on which version is correct.
3. **No soundness/completeness statement.** Per `decision_soundness_completeness`, Sec 04 should state the guarantees. It does not. The Mathematician will want to know: what does the metamodel guarantee?
4. **"Five predicates" count at L70.** Only four are described. Imprecision.

### Adversarial (Reviewer D)

**Primary attack: FSL as empty layer.** The FSL subsection (20 lines, no code, no intra-layer constraints) supports the "paper delivers two layers, not three" argument. The capability table could be a static lookup; the governance annotations are typed markers. The Adversarial reviewer will argue the FSL does not constitute a genuine metamodel layer because it has no well-formedness conditions of its own.

**Secondary attack: constraint taxonomy mixes levels.** C3 (no_empty_cred) and C4 (cross-credential value dep.) are intra-layer constraints in a table titled "Cross-layer constraint taxonomy." The Adversarial reviewer will argue the taxonomy inflates the cross-layer contribution count.

### Champion (Reviewer A)

**The cross-layer insight is clear.** The usage mode exercise at L115 and the constraint taxonomy at L99-111 make the "invisible to single-layer inspection" argument concrete. The Champion can recover:
- "C8 emerges only when C5+C6+C7 are checked jointly" (L113)
- Three usage modes demonstrated on one scenario (L115)
- DCL restructuring as cross-layer consequence (L171)

**Risk:** The Champion needs the FSL to be defensible to argue "three layers" in the PC meeting. If the Adversarial reviewer's attack lands, the Champion loses the "three-layer metamodel" framing and must fall back to "two-layer metamodel with format annotation."

### Business Manager (Reviewer C)

**Example-first pattern is good.** Each subsection opens with a CSOK instance before formal definitions. The capability matrix is accessible. The constraint taxonomy table is information-dense but readable.

**Risk:** The DCL definition-list items (L30-41) use Refinery-specific terminology ("error predicate," "propagation rule," "shadow predicate") without inline explanation. These are defined in BG (\autoref{sec:refinery}) but the Business Manager may not track cross-references. The `\autoref` backreferences are present but may not be sufficient for a reader who did not fully absorb Sec 2.3.

---

## Summary of Critical Issues

| # | Severity | Issue | Location |
|---|---|---|---|
| 1 | **CRITICAL** | `conforms_vcdm`: table says mdoc=no, model says mdoc=yes | L84 vs. vc_metamodel.refinery L222-226 |
| 2 | **CRITICAL** | `supports_offline_verification`: table says mdoc-only, model says AC+JLD+mdoc | L86 vs. vc_metamodel.refinery L233-236 |
| 3 | **HIGH** | `credential_statement` and `Root_cred_entity` called "shadow predicates" in prose but are `pred` in model | L54-60 vs. vc_metamodel.refinery L116, L136 |
| 4 | **HIGH** | Soundness/completeness guarantees not stated in Sec 04 (per decision_soundness_completeness) | Missing |
| 5 | **HIGH** | FSL defense sentence from decision_fsl_elaboration missing or weakened | L78 |
| 6 | **MEDIUM** | "Five predicates" at L70 — only four described | L70 |
| 7 | **MEDIUM** | `governance_conflict` predicate referenced but not shown as code listing | L115 |
| 8 | **MEDIUM** | C3, C4 are intra-layer constraints in a "cross-layer" taxonomy table | L99-111 |
| 9 | **LOW** | `common_parent` described as "in supplementary" but exists in vc_metamodel.refinery | L148 |
| 10 | **LOW** | Format-driven DCL restructuring is one sentence, not a worked example per decision | L171 |
| 11 | **LOW** | `Leaf` predicate in model, undescribed in prose | Model L41 |
| 12 | **LOW** | Multiple propagation rules in model not mentioned in prose (implementation detail, acceptable) | Model L53-64, L122-133, L139-147 |
