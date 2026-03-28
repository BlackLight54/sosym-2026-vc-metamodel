# Full Paper Audit: Content ↔ Commitments ↔ Accumulated Knowledge

**Date:** 2026-03-28 | **Deadline:** 2026-03-29 AoE (~1.5 days) | **Status:** First complete draft exists; scalability data missing

---

## 1. Binding Claim Delivery Matrix

| # | Claim | Delivered? | Where? | Evidence quality | Gap / Risk |
|---|---|---|---|---|---|
| 1 | Three-layer metamodel with defined layers | **YES** | Sec 04.1–04.3 | STRONG — DCL, CSL, FSL each have metaclass definitions, tables, running example | None |
| 2 | Grounding in W3C VCDM 2.0 | **YES** | Sec 02.1, 05.1.1 | STRONG — coverage characterization with soundness/completeness pair, explicit scope exclusions | Coverage fraction is TBD placeholder in Sec 07 |
| 3 | Cross-layer constraints as Refinery graph predicates | **YES** | Sec 04.4 | STRONG — C1–C9 table, trace consistency rules (prop_t/prop_s), aligned, cross_cred_predicate_gap all defined with formal notation | @TODO A16 (worked example paragraph) still scaffolded |
| 4 | Automated consistency checking demonstration | **PARTIAL** | Sec 04.4 (prose walkthrough), Sec 03.3 (usage workflow) | ADEQUATE — prose describes OK/NOT_OK/UNVIABLE modes applied to CSOK; no screenshot or concrete tool output | @TODO at 05:62 — "show error predicates firing." Prose argument works without this, but Reviewer B will want to see it |
| 5 | Coverage validation vs. W3C specification | **PARTIAL** | Sec 05.1.1 | ADEQUATE — prose characterization exists; fig_coverage_table is @FIGURE placeholder | The table itself would strengthen this substantially. Without it, the claim rests on a prose assertion |
| 6 | Expressiveness validation vs. EU regulatory sources | **YES** | Sec 05.1.2 | STRONG — 3 fully expressible ARF constraints in table with predicate mappings; 5 partially expressible characterized with root causes; ARF-C7 architectural validation remark | HIGH RISK label from abstract is now resolved — this section delivers |
| 7 | Error detection vs. known anti-patterns | **YES** | Sec 05.1.3 | STRONG — 5 anti-patterns in table with predicate names, layer scope, and kind classification; graduated visibility argument explicit | None |
| 8 | Formally contradictory cross-framework constraints | **YES** | Sec 05.1.4 Headline 1 | STRONG — three governance sources enumerated, unsatisfiability argued per-format, NAIH enforcement precedent cited, single-layer invisibility explicitly demonstrated | Headline result. Well-delivered |
| 9 | Multi-layer errors invisible to single-layer inspection | **YES** | Sec 05.1.4 Headlines 1+2, Sec 05.1.3 anti-pattern graduated visibility | STRONG — both headlines explicitly argue single-layer invisibility; complementarity paragraph ties them together | None |
| 10 | Necessity/effectiveness argument for multi-layer modeling | **PARTIAL** | Sec 05.1.5 baseline comparison, Sec 07 final sentence | ADEQUATE — analytical baseline comparison (manual / single-layer / multi-layer) present; no empirical comparison | Reviewer D will call this "just an analytical argument." Acceptable for Foundations Track but not bulletproof |

**Summary:** 7/10 YES, 3/10 PARTIAL. No binding claim is undelivered. The three PARTIAL claims (#4, #5, #10) are all defensible in their current state — they have prose arguments but lack either concrete tool output (#4), a formatted table (#5), or empirical evidence (#10). None blocks submission.

**Critical gap:** The TBD coverage fraction in Sec 07 line 11 must be populated — it's the only place where a binding claim (#2) has a literal placeholder in delivered prose.

---

## 2. Decision Compliance Check

| # | Decision | Compliant? | Violation / Drift | Location |
|---|---|---|---|---|
| 1 | Modeling-first framing, not detection-first | **YES** | No violations. Title leads with "Multi-Level Metamodeling." Abstract says "become visible through the integrated model." | Throughout |
| 2 | MDE domain, not formal methods | **YES** | No theorem-proof structure. Definitions are metamodel-style | Throughout |
| 3 | No MDA terminology (CIM/PIM/PSM) | **YES** | Grep confirms zero occurrences of CPL, CIM, PIM, PSM in sections/ | All sections |
| 4 | Running example: simplified CSOK | **YES** | CSOK used throughout. No Diploma/Alice remnants | All sections |
| 5 | Motivation ends with problem statement | **YES** | Sec 03.1 ends with "no existing tool or methodology checks" — problem statement, not result | Sec 03 line 21 |
| 6 | Teaser figure: simplified CSOK | **PARTIAL** | @FIGURE placeholder exists at Sec 01 line 9 with full description. No actual figure yet | Sec 01. **Blocks submission** — teaser figure is the first thing reviewers see |
| 7 | CSOK naming: "family housing subsidy" in body | **MINOR VIOLATION** | "CSOK instance" appears as a table column header in Sec 04 line 118. Sec 03 footnote correctly introduces the Hungarian name. Sec 05 line 179 uses "(CSOK housing subsidy)" | Sec 04:118, Sec 05:179 |
| 8 | GDPR two-tier framing | **YES** | Sec 05.1.4 Headline 1 carefully hedges: "We interpret the data minimization principle as requiring that..." and "Neither inferential step is self-evident." NAIH precedent cited for operational weight | Sec 05:55 |
| 9 | Format-driven DCL restructuring as worked example | **YES** | Sec 04 lines 148–150 present the SD-JWT-VC workaround (pre-computed booleans). Sec 05:64 remark references it | Sec 04:148, Sec 05:64 |
| 10 | mdoc simplified away | **YES** | Sec 02 line 14: "since both formats lack predicate proof support, subsequent sections use SD-JWT-VC as the representative format." Sec 04:110 parenthetical justification | Sec 02:14, Sec 04:110 |
| 11 | Two orthogonal headline results | **YES** | Headlines 1 (vertical) and 2 (horizontal) both present. Complementarity paragraph at Sec 05:87 ties them together | Sec 05:48–87 |
| 12 | DCL rename from CPL | **YES** | Zero CPL/Claim Property Layer occurrences. "Domain Concept Layer" / DCL used consistently | All sections |
| 13 | No code listings in paper | **YES** | No lstlisting, no fenced code blocks rendered as figures. All formal definitions in prose+math. "Full Refinery encoding provided in supplementary material" used consistently | All sections |

**Action needed:**
- Sec 04:118 — rename column "CSOK instance" → "Housing subsidy instance" (trivial fix, Decision #7)
- Sec 05:179 — check phrasing around "(CSOK housing subsidy)" (trivial fix)
- Teaser figure must be produced (Decision #6) — **submission blocker**

---

## 3. Gap Analysis Integration Check

### Tier 1 Papers — Must Cite

| Paper | Cited? | Where? | Differentiation correct? |
|---|---|---|---|
| Braun, Horne, Kafer, Mauw 2024 (SSI protocol verification) | **YES** | Sec 06:14 (`braun_ssi_2024`) | YES — "verify SSI protocol security properties using ProVerif" vs. cross-layer structural constraints |
| Cippitelli et al. 2023 (ChorSSI) | **YES** | Sec 06:23 (`cippitelli_chorssi_2024`) | YES — "BPMN choreographies... protocol execution flow, not structure of credentials" |
| Ding & Sato 2023 (SecureSSI) | **YES** | Sec 06:23 (`ding_model-driven_2023`) | YES — "model-driven security analysis to SSI architectural patterns" |
| Pattiyanon et al. 2022 (MODELSWARD) | **YES** | Sec 06:23 (`pattiyanonMethodDetectingCommon2022`) | YES — "domain-specific modeling languages and knowledge graphs" |
| Yamamoto et al. 2022 (EuroS&PW) | **YES** | Sec 06:14 (`yamamoto_formalising_2022`) | YES — "formalize selective disclosure specifically for linked-data credentials" |
| Braun & Kafer 2025 (RDF semantics) | **YES** | Sec 06:14 (`curry_rdf-based_2025`) | YES — "RDF-based semantics for selective disclosure and zero-knowledge proofs" |
| Davie/Gisolfi 2019 (ToIP stack) | **NOT FOUND** | Should be in Sec 02 or 06 | **MISSING** — gap analysis says Tier 1. ToIP stack is the informal governance layering reference |
| Semerath et al. 2017 (formal validation DSLs) | **YES** | Sec 06:32 (`farkas_prolog-based_2024` references prior work) + Sec 02:32 (`semerath_graph_2018`) | Indirect — cited via Refinery references. Could be more explicit as methodological antecedent |
| Atkinson & Kühne 2001 (essence of MLM) | **YES** | Sec 02:23 (`goos_essence_2001`), Sec 06:30 | YES — established as foundational MLM reference |

**Missing Tier 1 citation:** Davie et al. 2019 (Trust over IP stack). This is the informal governance layering reference that the paper should acknowledge and differentiate from.

### Tier 2 Papers — Should Cite

| Paper | Cited? | Where? |
|---|---|---|
| Tith & Colin 2025 (trust policy) | **YES** | Sec 06:16 |
| Turkanović et al. 2025 (delegation) | **YES** | Sec 06:16 |
| Braun, Papanchev, Kafer 2023 (SISSI) | Not found | Not cited — acceptable omission (single-layer interoperability) |
| Pattiyanon & Aoki 2022 (ICISSP) | Not found | Subsumed by MODELSWARD citation — acceptable |
| Naghmouchi & Laurent 2025 | **YES** | Sec 06:16 (`naghmouchi_systematic_2025`) |
| King et al. 2017 (governance compliance) | **YES** | Sec 06:23 |
| Biedermann et al. 2024 | Not found | Not cited — gap analysis says Sec 03. Acceptable omission for budget |
| Schwalm & Alamillo-Domingo 2022 | Not found | Not cited — acceptable omission |
| de Lara & Guerra 2010 (MetaDepth) | **YES** | Sec 06:30 (`hutchison_deep_2010`) |
| Barclay et al. 2020 (iStar for SSI) | **YES** | Sec 06:23 |
| Garcia-Rodriguez et al. 2021 | **YES** | Sec 06:16 (in .cutcandidate) |
| Mazzocca et al. 2025 (survey) | **YES** | Sec 01:11, Sec 03:21, Sec 06:14 |

### Differentiation Arguments D1–D5

| Arg | Target | Delivered? | Prose |
|---|---|---|---|
| D1 | vs. ChorSSI | **YES** | Sec 06:23: "protocol execution flow between participants, not the structure of credentials exchanged" |
| D2 | vs. SecureSSI + Pattiyanon | **YES** | Sec 06:23: "threats in system configurations" / "common SSI implementation weaknesses" — neither does multi-layer metamodel |
| D3 | vs. Braun et al. 2024 | **YES** | Sec 06:14: "verify SSI protocol security properties using ProVerif" — protocol vs. structural |
| D4 | vs. King et al. 2017 | **YES** | Sec 06:23: "formal objects (normative rules governing agent actions) differ from the structural constraints over model elements" |
| D5 | vs. "just MLM applied to new domain" | **YES** | Sec 06:34: "layers... represent independently governed concern spaces... connected by coverage and capability constraints... not by instantiation relationships. The contribution is therefore the formalization of governance constraints across independently governed layers, not the layering technique itself" |

### C5 Claim Correction

**Original (too broad):** "MDE/metamodeling has not been applied to the VC/SSI domain"
**Corrected (defensible):** "No prior work applies multi-level metamodeling to VC credential design with formalized cross-layer constraints"

**Status:** Grep for "MDE has not been applied" / "metamodeling has not been applied" returns zero hits. The abstract uses the corrected framing: "no existing tool checks their cross-layer consistency." Sec 06:25 explicitly acknowledges MDE has been applied to SSI: "Model-driven engineering has thus been applied to SSI for choreography, security analysis, weakness detection, and governance requirements." Corrected claim is delivered. **Compliant.**

---

## 4. Reviewer Persona Attack Simulation

### Reviewer A — Champion (MDE-for-New-Domains)

**Champion argument recoverable?** YES. Abstract final sentence: "These results establish multi-layer formal modeling as a prerequisite for rigorous credential ecosystem design." Intro P2 (line 15): "Design errors that span multiple layers go unnoticed — not because they are difficult to detect algorithmically, but because no model makes them expressible in the first place."

**So-what clear?** YES. The governance conflict (Headline 1) is the "so-what" — independent governance sources impose formally contradictory constraints invisible to single-layer inspection. This is clear in both the abstract and Sec 05.

**What would prevent championing?**
1. Missing teaser figure — the visual "aha" moment is absent. The champion needs to show this figure in the PC meeting.
2. Scalability data missing — champion cannot say "and it scales" without numbers.
3. TBD coverage fraction in conclusion weakens the "solid work" impression.

**Predicted score:** Weak accept → Accept (if teaser figure and scalability data are filled in)

**Single highest-impact change:** Produce the teaser figure.

### Reviewer B — Mathematician (Graph Modeling Expert)

**Definition precision check:**
- DCL: `Entity`, `Subject`, `Value`, `Prop`, `statement(s,p,v)` — well-defined, consistent with model. `root_is_subj` propagation rule correctly described.
- CSL: `CredEntity`, `CredentialSubject`, `CredentialValue`, `Claim`, `Credential` — well-defined. Trace mappings (`Prop::trace`, `CredEntity::trace`) correctly described. Propagation rules `subject_traces_to_subject` and `root_is_cred_subj` match model.
- FSL: `Formatted_Credential` subclasses match model (5 formats). Six capability predicates match model definitions exactly.
- Cross-layer: `prop_t`/`prop_s` trace consistency rules match model. `aligned` shadow predicate matches. `cross_cred_predicate_gap` matches. `governance_conflict` error predicate matches governance_conflict.refinery.

**Refinery mechanism characterization (Sec 02.3):** Error predicate, propagation rule, shadow predicate, scope constraint — all four correctly described. Three-valued interpretation (must/must not/unknown) correctly stated. Open-world assumption correctly noted.

**Related work adequacy:**
- Atkinson/Kühne: Cited in Sec 02 and 06. ✓
- Chechik/Famelis (partial models): **NOT CITED.** Gap analysis does not flag this, but Reviewer B from the VENUE.md persona explicitly "could be aligned with Semerath/Varro/Chechik/Famelis." Missing related work on partial model theory.
- Diskin (multi-view consistency): **CITED** in Sec 06:30 (`dingel_specifying_2011`). ✓
- de Lara/Guerra (MetaDepth): Cited in Sec 06:30. ✓

**Top 3 technical objections:**
1. **Acyclicity constraint missing.** Sec 04:25 has @TODO: "Acyclicity constraint (error cyclic) not yet in vc_metamodel.refinery." The model file (line 74) confirms this. The prose claims "connected, acyclic information graph" but acyclicity is not enforced. This is a precision gap Reviewer B will catch.
2. **FSL admitted as less mature.** Sec 04:85: "This layer is less mature than DCL and CSL: format-internal structural constraints are not yet formalized." Honest, but Reviewer B may question whether a three-layer claim holds when one layer has no intra-layer constraints.
3. **Chechik/Famelis not cited.** Partial model theory is foundational to the approach; omitting key references in this space is a risk.

**Predicted score:** Weak accept (precise definitions, but acyclicity gap and FSL maturity concern)

**Single highest-impact change:** Add the acyclicity constraint to the model and remove the @TODO, or explicitly scope it out with justification.

### Reviewer C — Business Manager (MDE Practitioner)

**Can a non-VC reader follow?**
- VC, credential schema, issuer/holder/verifier: Defined in Sec 02.1 lines 12 — "A *claim* is a subject–property–value triple... The *issuer* is the entity asserting the claims; the *holder* possesses the credential and presents it to a *verifier*." ✓
- Selective disclosure: Defined in Sec 02 line 14 — "hash-based *selective disclosure*, allowing a holder to reveal a chosen subset of claims while withholding others." ✓
- Predicate proofs: Defined in Sec 02 line 14 — "zero-knowledge proofs that a claim value satisfies a given predicate (e.g., income ≥ threshold) without disclosing the value itself." ✓
- Explanation floor: **MET.** All key VC concepts defined in 1–2 sentences.

**Running example before formalism?** YES. Sec 03.1 presents the full housing subsidy motivation with all three layers before Sec 04 formalizes anything. Each layer in Sec 04 also starts with informal description before formal definition.

**Can reader follow from prose + example alone?** YES. Tables in Sec 04 (DCL elements, CSL credentials, FSL format assignments, C1–C9 constraints) are self-contained. Running example carries through all sections.

**Predicted score:** Weak accept (accessible, practical example, clear contribution)

**Single highest-impact change:** Add the teaser figure — this reviewer relies heavily on figures to understand.

### Reviewer D — Adversarial (Competing Formalism)

**Attack D1: "just MLM applied to new domain"**
Pre-empted? **YES.** Sec 06:34 explicitly addresses this: "Unlike standard multi-level modeling applications where layers represent successive instantiation... the three layers... represent independently governed concern spaces... connected by coverage and capability constraints... not by instantiation relationships." D5 differentiation argument is well-executed.

**Attack D2: "tool dependency — remove Refinery and what remains?"**
Pre-empted? **PARTIALLY.** Sec 07:13: "portability to other partial-model solvers or constraint-based toolchains has not been assessed." Sec 05:167: "The contribution is the metamodel and its cross-layer constraints, with Refinery as the validation vehicle." The separation is stated but not demonstrated. No alternative tool encoding exists.

**Attack D3: "synthetic evaluation with hand-crafted anti-patterns"**
Pre-empted? **PARTIALLY.** Anti-patterns are named with predicate references and typed by kind, but they are derived from the metamodel, not from independently documented credential design failures. The NAIH enforcement precedent (Sec 05:55) grounds the governance conflict in a real case. The floor area constraint is grounded in government decree citations. But the five anti-patterns in Sec 05.1.3 are structural patterns, not cited from external literature on credential design failures.

**Attack D4: "FSL is thin — three-layer claim aspirational"**
Pre-empted? **PARTIALLY.** Sec 04:85 honestly admits FSL is less mature. Sec 07:13 lists it as a limitation. But the paper claims a three-layer metamodel in the title and abstract. Reviewer D will argue the paper delivers 2.5 layers. The FSL does have 5 format subclasses, 6 capability predicates, and 3 governance annotation classes — this is not nothing. But no FSL intra-layer structural constraints are formalized, which is the gap.

**Predicted score:** Borderline reject → Borderline accept

**Top 3 concerns:**
1. FSL maturity undercuts the "three-layer" headline claim
2. Anti-patterns are self-defined, not grounded in external failure catalogs
3. Single-domain evaluation (EU only) limits generalizability

**Single highest-impact change:** Formalize at least one FSL intra-layer constraint (e.g., format-internal well-formedness) to demonstrate that FSL is a real modeling layer, not just an enum.

---

## 5. Argument Flow Audit

| Transition | Coherent? | Issue |
|---|---|---|
| Abstract → Introduction | **YES** | Intro expands abstract without contradicting. Same three contributions, same framing |
| Intro P1 (problem) → P2 (gap) | **YES** | P1 establishes multi-layer constraints; P2 shows no tool checks them. Gap motivated by P1. "Independent peers whose design goals may be formally irreconcilable" adds the governance dimension |
| Intro P3 (contributions) → Sec 04–05 | **YES** | Three contributions map to: (1) Sec 04.1–04.3, (2) Sec 04.4, (3) Sec 05. Clean mapping |
| Sec 03 → Sec 04 | **YES** | Same entities (Applicant, num_children, property_area, monthly_income), same credentials (FamilyStatusCred, PropertyCred, IncomeCred), same constraints used |
| Sec 04 → Sec 05 | **YES** | Evaluation evaluates what approach claims. C1–C9 from Sec 04 appear in Sec 05 headlines. Anti-patterns reference predicates defined in Sec 04 |
| Sec 05 → Sec 06 | **WEAK** | Related work does not reference evaluation results to strengthen differentiation. Sec 06 positions the contribution but doesn't say "and our evaluation demonstrates X that none of these works can." This is a missed opportunity, not a logical break |
| Sec 06 → Sec 07 | **YES** | Conclusion references positioning established in related work indirectly through limitations |
| Sec 07 → Abstract | **YES** | Conclusion delivers what abstract promised. Limitations honestly stated. No over-claiming. One under-delivery: TBD coverage fraction |

**Argument orphan:** The ARF-C7 architectural validation remark (Sec 05:42) — "the EU governance framework independently mandates the same DCL→CSL→FSL separation" — is a strong external validation point that is not referenced in the introduction, abstract, or conclusion. This finding should be elevated.

**Argument gap:** Sec 04:25 claims "connected, acyclic information graph" but acyclicity is not enforced (see @TODO). Either add the constraint or weaken the claim to "connected information graph."

---

## 6. Running Example Consistency

| Element | Consistent? | Issue |
|---|---|---|
| **Entities:** Applicant, num_children, property_area, monthly_income | **YES** | Same names in Sec 03, 04, 05, model files |
| **Props:** has_children, owns_property, earns | **YES** | Consistent across prose and csok_instance.refinery |
| **Credentials:** FamilyStatusCred, PropertyCred, IncomeCred | **YES** | Same names everywhere, match model |
| **Constraints C1–C9** | **YES** | Introduced in Sec 04:118, referenced in Sec 05 by number |
| **Format assignments** | **YES** | SD-JWT-VC for FamilyStatus/Property, conflict on Income — consistent across Sec 03, 04, 05 |
| **Governance sources** | **YES** | eIDAS, GDPR, VCDM 2.0 — same characterization everywhere. Two-tier framing consistent |
| **Notation** | **YES** | $\text{statement}(s,p,v)$, $\text{trace}(\cdot)$, $\text{aligned}(\cdot)$ used consistently |
| **CSOK naming** | **MINOR** | "CSOK instance" in Sec 04 table header (Decision #7 violation). Fix: rename to "Housing subsidy instance" |

**Running example threading:** Exemplary. The CSOK scenario appears in every section from Sec 03 through Sec 07, with consistent naming and progressive elaboration. Each Sec 04 subsection ends with a running example table/paragraph applying the layer's definitions.

---

## 7. Prose–Model Consistency

| Prose element | Model element | Match? | Issue |
|---|---|---|---|
| DCL: Entity, Subject, Value, Prop | `vc_metamodel.refinery` lines 27–47 | **YES** | All metaclasses match |
| `statement(s,p,v)` predicate | Line 49–52 | **YES** | Exact match |
| `root_is_subj` propagation rule | Lines 34–37 | **YES** | Match |
| `non_connected` error predicate | Line 69 | **YES** | Match |
| `no_self_loop` propagation rule | Lines 71–72 | **YES** | Match |
| CSL: CredEntity, CredentialSubject, CredentialValue, Claim, Credential | Lines 84–179 | **YES** | All match |
| `prop_t`, `prop_s` trace consistency | Lines 152–167 | **YES** | Match |
| `aligned` shadow predicate | Lines 170–173 | **YES** | Match |
| `common_parent` shadow predicate | Lines 182–188 | **YES** | Match |
| `no_empty_cred` error predicate | Line 113 | **YES** | Match |
| `root_ent_doesnt_have_cred` error predicate | Lines 148–149 | **YES** | Match |
| FSL: 5 format subclasses | Lines 200–204 | **YES** | AnoncredsCredentialSchema, JsonLdCredentialSchema, JwtVCCredentialSchema, SdJwtVcSchema, MdocSchema |
| 6 capability predicates | Lines 210–239 | **YES** | All match prose table in Sec 04:89–97 |
| 3 governance annotations | Lines 290–306 | **YES** | EidasMandate, PrivacyRequirement, VcdmConformance |
| `governance_conflict` error predicate | governance_conflict.refinery lines 12–23 | **YES** | Two-clause disjunction matches prose description |
| `cross_cred_predicate_gap` shadow predicate | Lines 314–323 | **YES** | Match |
| Acyclicity constraint | **NOT IN MODEL** | **MISMATCH** | Prose claims "acyclic" (Sec 04:25) but model has @TODO at line 74. Constraint not implemented |

**Model elements NOT described in prose:**
- `DCL` shadow predicate (line 25) — aggregation helper, not load-bearing
- `CSL` shadow predicate (line 82) — aggregation helper
- `FSL` shadow predicate (line 195) — aggregation helper
- `Leaf` predicate (line 42) — not discussed in prose
- `statement_rule` and `statement_rule_bw` propagation rules (lines 54–65) — implementation details deferred to supplementary
- `credential_statement_rule` and `credential_statement_rule_opp` (lines 121–132) — implementation details
- Various negative elimination rules (lines 138–146, 249–285) — format capability propagation, described generically in prose

**Prose claims NOT reflected in model:**
- Acyclicity (discussed above)
- Sec 04:39 domain constraint "$\text{property\_area} \geq \text{min\_area}(\text{num\_children})$" — this is a domain-level constraint described in prose but not encoded as a graph predicate in the model. This is intentional: it's a numerical constraint outside Refinery's expressiveness, which is precisely Headline 2's point.

**SAT variant correspondence:**
| Variant | Prose claim | Model behavior | Match? |
|---|---|---|---|
| csok.problem (full) | Unsatisfiable under joint governance | UNSAT (governance_conflict fires) | **YES** |
| csok_no_conflict.problem | No conflict checking | SAT (governance_conflict not imported) | **YES** |
| csok_no_eidas.problem | Remove eIDAS → AnonCreds viable | SAT (AnonCreds satisfies privacy + VCDM not required) | **YES** |
| csok_no_gdpr.problem | Remove GDPR → SD-JWT-VC viable | SAT (SD-JWT-VC satisfies eIDAS + VCDM) | **YES** |

These correspond exactly to the constraint sensitivity analysis in Sec 05. The three SAT variants demonstrate that only the conjunction of all three governance sources produces unsatisfiability.

---

## 8. Unresolved Markers Census

| Marker type | Count | Critical? | Sections |
|---|---|---|---|
| @TODO | 12 | Mixed | See below |
| @FIGURE | 7 | Mixed | See below |
| @FORMAL | 2 | No | Sec 04 (documentation markers, content already written) |
| @CITE | 0 | — | None remaining |
| @SCAFFOLD | 0 | — | None remaining |

### Critical @TODOs (block submission)

| Location | Content | Effort | Binding claim |
|---|---|---|---|
| Sec 05:146 | Populate scalability table with measurement results | **SIGNIFICANT** — requires running measurements | #4, #10 |
| Sec 05:152 | Populate constraint sensitivity table | **MODERATE** — requires running sensitivity measurements | #8 |
| Sec 07:11 | Replace TBD coverage fraction | **TRIVIAL** — count from coverage analysis | #2 |
| Sec 05:121–123 | Node counts, hardware specs | **TRIVIAL** — fill from environment after measurements | #4 |

### Non-critical @TODOs (defensible without resolution)

| Location | Content | Effort |
|---|---|---|
| Sec 01:13 | Verify gap claim | TRIVIAL — gap analysis confirms it; can be removed |
| Sec 01:17 | Finalize contribution list | TRIVIAL — contributions already finalized and aligned |
| Sec 02:27 | Review B5 with Oscar | Non-blocking — prose is correct per model check |
| Sec 04:25 | Acyclicity constraint | MODERATE — add to model or weaken prose claim |
| Sec 04:146 | A16 worked example | MODERATE — would strengthen #4 but prose walkthrough in Sec 04:134 already demonstrates |
| Sec 04:150 | Polish paragraph | TRIVIAL |
| Sec 05:62 | Show error predicates firing | MODERATE — strengthens #4 but prose argument stands |
| Sec 05:148 | Extend measurement script for plain `check` | MODERATE — needed for scalability data |
| Sec 05:150 | RQ answer paragraph | MODERATE — needed after data |

### @FIGURE status

| Figure | Critical? | Status | Effort |
|---|---|---|---|
| fig_teaser (Sec 01) | **YES — submission blocker** | Placeholder with full description | SIGNIFICANT — Excalidraw → TikZ |
| fig_functional_overview (Sec 03) | Medium | Placeholder | MODERATE — box diagram |
| fig_metamodel (Sec 04) | **YES — included as PNG** | `pandoc/assets/fig_metamodel.png` exists | Done (verify quality) |
| fig_constraint_taxonomy (Sec 04) | Low | Table exists in prose; figure formatting optional | TRIVIAL if using table |
| fig_coverage_table (Sec 05) | Medium | Placeholder | MODERATE |
| fig_expressiveness_table (Sec 05) | Low | Table exists in prose | TRIVIAL |
| fig_antipattern_table (Sec 05) | Low | Table exists in prose | TRIVIAL |
| fig_scalability (Sec 05) | **YES — needs data** | Placeholder | SIGNIFICANT — requires measurements first |

---

## 9. Cross-Reference Integrity

All cross-references use `\autoref{}` (compliant with feedback memory). Labels verified:

| Reference | Label exists? | Points to correct content? |
|---|---|---|
| `\autoref{sec:approach}` | YES (Sec 04:9) | YES |
| `\autoref{sec:cross-layer}` | YES (Sec 04:114) | YES |
| `\autoref{sec:evaluation}` | YES (Sec 05:8) | YES |
| `\autoref{sec:background}` | YES (Sec 02:7) | YES |
| `\autoref{sec:overview}` | YES (Sec 03:8) | YES |
| `\autoref{sec:motivation}` | YES (Sec 03:11) | YES |
| `\autoref{sec:functional-overview}` | YES (Sec 03:24) | YES |
| `\autoref{sec:usage-workflow}` | YES (Sec 03:33) | YES |
| `\autoref{sec:multi-level}` | YES (Sec 02:21) | YES |
| `\autoref{sec:refinery}` | YES (Sec 02:30) | YES |
| `\autoref{sec:vcdm}` | YES (Sec 02:10) | YES |
| `\autoref{sec:dcl}` | YES (Sec 04:15) | YES |
| `\autoref{sec:csl}` | YES (Sec 04:43) | YES |
| `\autoref{sec:fsl}` | YES (Sec 04:83) | YES |
| `\autoref{sec:headlines}` | YES (Sec 05:46) | YES |
| `\autoref{sec:anti-patterns}` | YES (Sec 05:91) | YES |
| `\autoref{sec:elaboration}` | YES (Sec 05:14) | YES |
| `\autoref{sec:scalability}` | YES (Sec 05:117) | YES |
| `\autoref{sec:coverage}` | YES (Sec 05:18) | YES |
| `\autoref{sec:expressiveness}` | YES (Sec 05:26) | YES |
| `\autoref{sec:baseline}` | YES (Sec 05:111) | YES |
| `\autoref{sec:threats}` | YES (Sec 05:171) | YES |
| `\autoref{sec:related-work}` | YES (Sec 06:9) | YES |
| `\autoref{sec:conclusion}` | YES (Sec 07:7) | YES |
| `\autoref{fig:metamodel}` | YES (Sec 04:19) | YES — figure exists as PNG |
| `\autoref{tab:expressiveness}` | YES (Sec 05:30) | YES |
| `\autoref{tab:antipatterns}` | YES (Sec 05:103) | YES |
| `\autoref{tab:scalability}` | YES (Sec 05:127) | YES |
| `\autoref{tab:sensitivity}` | YES (Sec 05:154) | YES |

**No broken or stale references found.** All labels exist and point to correct content.

---

## 10. Critical Path to Submission

### Blockers (must resolve before submission)

| Priority | Task | Target | Effort | Claims/Reviewers affected | Maps to |
|---|---|---|---|---|---|
| **B1** | Run scalability measurements and populate tables | Sec 05 (tab:scalability, tab:sensitivity) | SIGNIFICANT (Martin) | #4, #10; all reviewers | T09 |
| **B2** | Produce teaser figure (at minimum Excalidraw draft) | Sec 01 (fig_teaser) | SIGNIFICANT (Martin) | All reviewers, especially A and C | O05 |
| **B3** | Fill TBD coverage fraction in conclusion | Sec 07:11 | TRIVIAL | #2 | T10 |
| **B4** | Draft RQ answer paragraph after measurements | Sec 05:150 | MODERATE | #4, #10 | T09 |
| **B5** | Fill hardware specs after measurements | Sec 05:123 | TRIVIAL | Reproducibility | T09 |

### High-Value Fixes (impact/effort ratio)

| Priority | Task | Target | Effort | Impact |
|---|---|---|---|---|
| **H1** | Fix acyclicity: either add `error cyclic` to model OR weaken prose from "acyclic" to "connected" | Sec 04:25, model | TRIVIAL (weaken prose) or MODERATE (add constraint) | Prevents Reviewer B attack on precision |
| **H2** | Add Trust over IP stack citation | Sec 02 or 06 | TRIVIAL | Closes Tier 1 gap |
| **H3** | Rename "CSOK instance" column header → "Housing subsidy instance" | Sec 04:118 | TRIVIAL | Decision #7 compliance |
| **H4** | Remove resolved @TODOs (Sec 01:13, 01:17) | Sec 01 | TRIVIAL | Clean up |
| **H5** | Elevate ARF-C7 architectural validation to abstract or conclusion | Abstract or Sec 07 | TRIVIAL | Strengthens external validation argument |

### Acceptable Risks (defensible in rebuttal)

| Risk | Reviewer | Defense |
|---|---|---|
| FSL less mature than DCL/CSL | B, D | Explicitly acknowledged in Sec 04:85 and Sec 07:13. FSL has 5 format classes + 6 predicates + 3 governance annotations — functional for conflict detection even without intra-layer constraints |
| Single-domain evaluation (EU) | D | GovernanceAnnotation mechanism is governance-agnostic (Sec 05:183). Acknowledged as limitation. Foundations Track accepts domain-scoped contributions |
| No empirical evaluation with designers | C, D | Explicitly listed as future work (Sec 07:15). Appropriate for Foundations Track where contribution is the formalization |
| Anti-patterns self-defined | D | Three of five are standard structural well-formedness (connectivity, empty credential, orphaned entity). Two cross-layer patterns are novel contributions of this paper — they cannot come from prior literature because no prior work defines cross-layer constraints |
| Chechik/Famelis partial models not cited | B | Semerath et al. (Refinery) builds on this work; the citation chain exists. Adding the citation would be ideal but not blocking |

### Cut Candidates (if over 10 pages)

| Candidate | Location | Savings | Argument damage |
|---|---|---|---|
| .cutcandidate: B3 governance context | Sec 02:16–18 | ~0.15 pages | LOW — eIDAS/GDPR introduced elsewhere |
| .cutcandidate: Mazzocca survey sentence | Sec 06:14 | ~0.05 pages | NONE — supplementary reference |
| .cutcandidate: Garcia-Rodriguez sentence | Sec 06:16 | ~0.05 pages | NONE — supplementary conceptual model |
| Constraint sensitivity table (Sec 05:154–165) | Sec 05 | ~0.2 pages | LOW — result stated in prose at Sec 05:167; table is confirmation |
| DCL restructuring worked example | Sec 04:148 | ~0.15 pages | MEDIUM — demonstrates FSL→DCL propagation but is referenced from Sec 05:64 |
| Baseline comparison section | Sec 05:109–113 | ~0.15 pages | LOW — analytical comparison, main argument carried by headlines |

---

## Summary Assessment

**Paper state:** First complete draft with strong argument structure. All 10 binding claims are addressed (7 fully, 3 partially). The argument flows coherently from abstract through conclusion. Running example threading is exemplary. Prose–model consistency is verified with one exception (acyclicity). Decision compliance is near-perfect. Gap analysis integration is thorough with one missing Tier 1 citation (ToIP).

**Submission readiness:** NOT YET READY. Two blockers require Martin's execution:
1. Scalability measurements (B1) — the evaluation section has the infrastructure (instances exist, script exists) but no data
2. Teaser figure (B2) — the paper's first impression is missing

**With ~1.5 days remaining:** Focus exclusively on B1–B5 (blockers) and H1–H4 (trivial high-value fixes). Everything else is acceptable risk for a Foundations Track submission.

**Predicted outcome with current state + blockers resolved:** Borderline accept. The paper has a clear contribution, precise definitions, a compelling headline result, and honest limitations. Reviewer A (champion) can recover the argument. Reviewer B will be satisfied if acyclicity is fixed. Reviewer C can follow the paper. Reviewer D's attacks are pre-empted but not fully neutralized (FSL maturity remains the weakest point).
