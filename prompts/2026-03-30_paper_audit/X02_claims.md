# X02: Claim-Evidence Audit

**Date:** 2026-03-30
**Scope:** All 10 binding claims mapped against sections 00--07.

---

## Claim 1: Three-Layer Metamodel

| Field | Content |
|-------|---------|
| **Promise** | A three-layer metamodel (DCL, CSL, FSL) for credential ecosystem design. |
| **Where introduced** | Abstract (00_abstract.md:26): "We present a three-layer metamodel and formalized constraint set for credential ecosystem design" |
| | Introduction (01_introduction.md:18): contribution item 1: "A **three-layer metamodel** for credential ecosystem design" |
| **Where evidenced** | Approach (04_approach.md:9--11): opening paragraph defines the three layers and references fig:metamodel. |
| | Approach (04_approach.md:13--42): Sec 4.1 DCL definitions with metaclasses, predicates, running example instance. |
| | Approach (04_approach.md:44--70): Sec 4.2 CSL definitions with trace references, shadow/error predicates. |
| | Approach (04_approach.md:72--91): Sec 4.3 FSL with format classes, capability matrix (tab:format_capabilities). |
| | Approach (04_approach.md:93--171): Sec 4.4 cross-layer constraint taxonomy (tab:constraint_taxonomy, C1--C9). |
| | Conclusion (07_conclusion.md:12): "The three-layer metamodel (+DCL, +CSL, +FSL), grounded in +VCDM 2.0 and formalized as graph predicates in Refinery" |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **STRONG** — All three layers have metaclass definitions, running example instances, predicate catalogs, and a full metamodel figure. |
| **Overclaim risk** | None. |
| **Specific gap** | None. |

---

## Claim 2: W3C VCDM 2.0 Grounding

| Field | Content |
|-------|---------|
| **Promise** | Metamodel grounded in W3C VCDM 2.0 with explicit mapping. |
| **Where introduced** | Abstract (00_abstract.md:26): "grounded in the W3C Verifiable Credentials Data Model 2.0" |
| | Introduction (01_introduction.md:18): "grounded in the W3C Verifiable Credentials Data Model 2.0" (contribution 1) |
| **Where evidenced** | Background (02_background.md:10--18): Sec 2.1 covers VCDM 2.0 concepts and format asymmetry. |
| | Evaluation (05_evaluation.md:16--17): Sec 5.1.1 soundness--completeness framing: "every metaclass and capability predicate traces to a +VCDM concept" and three excluded concept families justified. |
| | Conclusion (07_conclusion.md:12): "grounded in +VCDM 2.0" |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **ADEQUATE** — The soundness direction (every metaclass traces to VCDM) is asserted in prose. The completeness direction (three excluded families) is explicitly justified with a design-time vs. usage-time distinction. No formal mapping table is provided; the evidence is argumentative rather than tabular. |
| **Overclaim risk** | Low. The prose says "grounded in" not "formally derived from." The argumentative framing is proportionate. |
| **Specific gap** | A metaclass-to-VCDM-concept mapping table (even in supplementary) would strengthen the soundness argument from assertion to enumeration. The claim file notes a coverage figure placeholder (T11) not yet produced. |

---

## Claim 3: Cross-Layer Constraints as Graph Predicates

| Field | Content |
|-------|---------|
| **Promise** | Cross-layer constraints formalized as graph predicates in Refinery. |
| **Where introduced** | Abstract (00_abstract.md:26): "with cross-layer constraints formalized as graph predicates in the Refinery partial graph modeling framework" |
| | Introduction (01_introduction.md:19): contribution item 2: "A **formalization of cross-layer constraints** as predicates in the Refinery partial graph modeling framework" |
| **Where evidenced** | Approach (04_approach.md:93--171): Sec 4.4 defines nine constraints (C1--C9) in tab:constraint_taxonomy, classified by source and layer scope. Three predicate categories (propagation, shadow, error) defined. Refinery code listings present for trace consistency (lst:trace-consistency), shadow predicates (lst:cross-layer-shadow), and governance conflict (lst:governance-conflict in 05_evaluation.md). |
| | Approach (04_approach.md:117--170): Cross-layer predicates prop_t, prop_s, aligned, cross_cred_predicate_gap with Refinery code. |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **STRONG** — Constraint taxonomy table, three predicate category definitions, Refinery code listings, running example traces for each. |
| **Overclaim risk** | None. |
| **Specific gap** | None. |

---

## Claim 4: Automated Consistency Checking

| Field | Content |
|-------|---------|
| **Promise** | Automated consistency checking demonstrated through Refinery design space exploration. |
| **Where introduced** | Introduction (01_introduction.md:22): "Refinery's solver reveals when constraints from different governance frameworks are formally contradictory and generates valid alternative designs" |
| | Overview (03_overview.md:36--38): Three usage modes defined: consistency checking, error identification, DSE. |
| **Where evidenced** | Approach (04_approach.md:114--115): All three usage modes traced on the constraint taxonomy: consistency checking returns OK, error identification returns NOT_OK(governance_conflict), DSE returns UNVIABLE. |
| | Evaluation (05_evaluation.md:76--121): Sec 5.2 benchmarks three solver operations (check, check -k, generate) across N=1 to N=30. Constraint sensitivity analysis (G0--G7). |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **STRONG** — Three usage modes defined, all three exercised on running example, quantitative benchmarks with scalability data (tab:scalability). |
| **Overclaim risk** | None. |
| **Specific gap** | None. |

---

## Claim 5: Coverage Validation vs. W3C

| Field | Content |
|-------|---------|
| **Promise** | Validate metamodel coverage against W3C VCDM specification (soundness/completeness). |
| **Where introduced** | Abstract (00_abstract.md:26): "We validate coverage against the W3C specification" |
| | Introduction (01_introduction.md:20): contribution item 3: "metamodel coverage against the W3C specification" |
| **Where evidenced** | Evaluation (05_evaluation.md:14--17): Sec 5.1.1 delivers the soundness--completeness framing. Soundness: "every metaclass and capability predicate traces to a +VCDM concept." Completeness: three excluded concept families (proof mechanisms, verifiable presentations, credential status) justified as out of design-time scope. |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **ADEQUATE** — The argument is well-structured (soundness + completeness with justified exclusions). However, the soundness claim is asserted rather than enumerated. The claim file notes a coverage figure (T11) not yet produced. |
| **Overclaim risk** | Low. The prose correctly frames this as "coverage characterization" not "formal proof of coverage." |
| **Specific gap** | Coverage figure not yet produced (claim file flags T11). The soundness argument would benefit from an explicit metaclass-to-VCDM mapping, even if placed in supplementary material. |

---

## Claim 6: Expressiveness Validation vs. EU Regulatory

| Field | Content |
|-------|---------|
| **Promise** | Constraint expressiveness validated against EU regulatory sources (ARF v2.7.3). |
| **Where introduced** | Abstract (00_abstract.md:26): "expressiveness against EU regulatory sources" |
| | Introduction (01_introduction.md:20): "constraint expressiveness against W3C and EU regulatory sources" |
| **Where evidenced** | Evaluation (05_evaluation.md:19--21): Sec 5.1.2 classifies eight eIDAS ARF constraints. Three fully expressible (ARF-C1, ARF-C4, ARF-C7) with metamodel predicate mappings. Five partially expressible with two root causes identified (attestation subtypes, claim-granularity privacy). None outside metamodel capacity. ARF-C7 significance for layer architecture noted. |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **ADEQUATE** — Eight constraints classified with clear criteria (fully/partially/not expressible). Root cause analysis for partial expressibility is specific and actionable. |
| **Overclaim risk** | The introduction says "W3C and EU regulatory sources" but the evaluation only analyzes EU ARF constraints. The W3C coverage validation (Claim 5) is separate. The "and" in the introduction could read as a single joint analysis when they are separate subsections. This is a minor framing issue, not an overclaim. |
| **Specific gap** | Extended expressiveness figure not yet produced (claim file flags T11). The expressiveness table itself is described in prose but a tabular rendering would strengthen the evidence. |

---

## Claim 7: Anti-Pattern Detection

| Field | Content |
|-------|---------|
| **Promise** | Error detection against known credential design anti-patterns via formalized graph predicates. |
| **Where introduced** | Abstract (00_abstract.md:26): "error detection against known anti-patterns" |
| | Introduction (01_introduction.md:20): "error detection against known credential design anti-patterns" |
| **Where evidenced** | Evaluation (05_evaluation.md:66--68): Sec 5.1.4 defines five anti-patterns: three intra-layer (disconnected domain graph, empty credential, orphaned root entity) and two cross-layer (trace misalignment, cross-credential predicate gap). Each maps to a predicate with kind classification (error/propagation/shadow). Graduated visibility argument: intra-layer → cross-layer → ecosystem-level. Extensibility noted. |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **ADEQUATE** — Five anti-patterns defined with predicate mappings and visibility classification. The catalog is grounded in the metamodel. |
| **Overclaim risk** | The phrase "known credential design anti-patterns" implies these are established in the literature. The text does not cite a source for the anti-pattern catalog; these appear to be derived from the metamodel analysis rather than drawn from an existing catalog. This is a mild overclaim risk. |
| **Specific gap** | The anti-patterns are not sourced from external literature. If "known" means "known from practice," the basis for knowing them should be stated. If they are derived from the metamodel, calling them "known" is imprecise. Anti-pattern figure not yet produced (T11). |

---

## Claim 8: Contradictory Cross-Framework Constraints (Headline 1)

| Field | Content |
|-------|---------|
| **Promise** | Constraints from different governance frameworks can be formally contradictory. |
| **Where introduced** | Abstract (00_abstract.md:26): "identifies two cross-layer design errors, a governance conflict and a format expressiveness gap, that no single-layer analysis detects" |
| | Introduction (01_introduction.md:14): "the income credential's format assignment, structural conformance, and privacy requirement each pass their respective single-layer checks, yet their combination is unsatisfiable" |
| **Where evidenced** | Overview (03_overview.md:19): Preview of both errors in the motivation: "The income credential cannot simultaneously satisfy the eIDAS +ARF format mandate...and +GDPR data minimization" |
| | Evaluation (05_evaluation.md:27--52): Sec 5.1.3.1 fully formalized. Three governance sources (eIDAS, GDPR, VCDM) shown jointly unsatisfiable on IncomeCred. Refinery code listing (lst:governance-conflict) with two disjunctive clauses partitioning the format space. |
| | Evaluation (05_evaluation.md:121): Constraint sensitivity analysis confirms: "only the full conjunction $G_7$ yields unsatisfiability; all seven proper subsets are satisfiable." |
| | Conclusion (07_conclusion.md:10--11): "the metamodel revealed that no credential format simultaneously satisfies the eIDAS ARF format mandate, GDPR data minimization, and W3C VCDM 2.0 conformance" |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **STRONG** — Formally encoded as error predicate, exhaustive constraint sensitivity analysis (G0--G7), running example fully worked through. |
| **Overclaim risk** | None. The evidence fully supports the claim. |
| **Specific gap** | None. |

---

## Claim 9: Multi-Layer Invisibility

| Field | Content |
|-------|---------|
| **Promise** | Multi-layer design errors invisible to single-layer inspection become visible through the integrated model. |
| **Where introduced** | Abstract (00_abstract.md:26): "that no single-layer analysis detects" |
| | Introduction (01_introduction.md:12): "Credential ecosystem designs can contain errors undetectable by single-layer inspection" |
| **Where evidenced** | Overview (03_overview.md:19): "Neither problem is visible when any single layer is inspected alone." |
| | Evaluation (05_evaluation.md:25--26): Headline framing: "Neither error is visible when any single layer or governance source is inspected alone." |
| | Evaluation (05_evaluation.md:37): "The only available workaround...requires changing the domain concept layer's information model...a cross-layer design consequence visible only under multi-layer analysis." |
| | Evaluation (05_evaluation.md:64): "No layer-internal check reveals the gap: the +DCL constraint is well-defined, both credentials are well-formed at the +CSL, and each format is individually valid at the +FSL." |
| | Evaluation (05_evaluation.md:68): Graduated visibility argument in anti-pattern section: "central argument for multi-layer formalization." |
| | Evaluation (05_evaluation.md:72): Baseline comparison: "Single-layer metamodeling...detects intra-layer violations but cannot express cross-layer trace predicates...or capability checks." |
| | Conclusion (07_conclusion.md:12--13): "no single-layer formalization can express them without collapsing the governance-source distinction that makes the constraints meaningful" |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **STRONG** — Demonstrated on both headline results (vertical and horizontal), reinforced by anti-pattern graduated visibility, baseline comparison, and conclusion. |
| **Overclaim risk** | None. The claim is consistently stated and evidenced across multiple sections. |
| **Specific gap** | None. |

---

## Claim 10: Necessity of Multi-Layer Modeling

| Field | Content |
|-------|---------|
| **Promise** | Multi-layer formal modeling is a prerequisite for rigorous credential ecosystem design. |
| **Where introduced** | Introduction (01_introduction.md:14): "Detecting such errors requires a formalization that spans all three concern spaces." |
| **Where evidenced** | Evaluation (05_evaluation.md:68): "This graduated visibility...is the central argument for multi-layer formalization." |
| | Evaluation (05_evaluation.md:72): Baseline comparison: "The integrated multi-layer formalization detects all five anti-pattern categories...including both headline results...that single-layer approaches cannot express." |
| | Conclusion (07_conclusion.md:12--13): "no single-layer formalization can express them without collapsing the governance-source distinction that makes the constraints meaningful...detecting them requires a formalization that preserves governance-source boundaries as first-class structural elements, which the multi-layer metamodel provides." |
| **Delivery verdict** | **YES** |
| **Evidence quality** | **ADEQUATE** — The argument is structural (single-layer collapses governance-source distinction) and is well-calibrated as a conditional/sufficiency argument rather than a formal necessity proof. The claim file correctly notes this calibration. |
| **Overclaim risk** | Low. The claim file notes the claim is calibrated as "sufficiency + structural prerequisite," not necessity proof. The conclusion prose matches this calibration. The word "prerequisite" in the claim file is slightly stronger than the prose warrants; the prose says "requires a formalization that preserves governance-source boundaries," which is the right framing. |
| **Specific gap** | The baseline comparison (05_evaluation.md:72) notes "We are not aware of an alternative multi-layer credential ecosystem formalization in the literature" which establishes the gap but makes the "necessity" argument rest on absence of alternatives rather than impossibility. This is acknowledged in the claim file. |

---

## Summary Table

| # | Claim | Verdict | Evidence | Overclaim? | Key gap |
|---|-------|---------|----------|------------|---------|
| 1 | Three-layer metamodel | YES | STRONG | No | — |
| 2 | VCDM grounding | YES | ADEQUATE | No | Coverage figure T11; mapping table in supp. would help |
| 3 | Cross-layer constraints | YES | STRONG | No | — |
| 4 | Automated checking | YES | STRONG | No | — |
| 5 | Coverage validation | YES | ADEQUATE | No | Coverage figure T11; soundness is asserted not enumerated |
| 6 | Expressiveness validation | YES | ADEQUATE | Minor framing | Extended figure T11; "W3C and EU" in intro conflates two analyses |
| 7 | Anti-pattern detection | YES | ADEQUATE | Mild | "Known" anti-patterns not sourced from literature; figure T11 |
| 8 | Contradictory constraints | YES | STRONG | No | — |
| 9 | Multi-layer invisibility | YES | STRONG | No | — |
| 10 | Necessity argument | YES | ADEQUATE | Low | Structural argument, not formal proof; calibration is correct |

**Overall:** All 10 claims are delivered. Four have STRONG evidence; six have ADEQUATE evidence. No claim is WEAK or missing. The recurring gap across claims 2, 5, 6, and 7 is the T11 figure set (coverage, expressiveness, anti-pattern figures) which would elevate prose-based arguments to visual evidence.

---

## Cross-Checks

### Prose claims NOT among the 10 binding claims (scope creep)

1. **Scalability claim** (05_evaluation.md:117--119): "Concretizability checking scales sublinearly, reaching 1.09s at N=30...well within interactive use for ecosystem sizes exceeding current EU wallet specifications." This is a supporting measurement, not a binding claim. It does not appear in the 10 claims but is proportionate to its role (evidence for Claim 4). **No scope creep.**

2. **Governance-source attribution** (02_background.md:26): "A single-layer model that merges them cannot attribute a constraint to its source, so conflicts between governance sources become undetectable." This motivates the layering but does not introduce a new binding claim. **No scope creep.**

3. **Refinery soundness/completeness** (02_background.md:107): "every generated model is guaranteed to satisfy all specified constraints (soundness), and if a constraint is violated in every possible completion, the tool detects the violation (completeness)." This is a tool property attributed to prior work, not a paper claim. **No scope creep.**

4. **Portability** (05_evaluation.md:131): "portability to other constraint-based toolchains (Alloy, USE/OCL) merits consideration." Framed as future work, not a claim. **No scope creep.**

**Verdict: No scope creep detected.** All prose claims are either among the 10 binding claims or are supporting statements proportionate to their role.

### Orphaned evidence (evidence not connected to any binding claim)

1. **Format-capability matrix** (04_approach.md:80--89, tab:format_capabilities): Directly supports Claims 1 (FSL layer definition), 3 (capability predicates), and 8 (headline governance conflict). **Connected.**

2. **Constraint sensitivity experiment G0--G7** (05_evaluation.md:121): Supports Claim 8 (contradictory constraints). **Connected.**

3. **Threats to validity** (05_evaluation.md:123--125): Does not deliver evidence for a claim but is a required section. **Not orphaned; structural.**

4. **Limitations and future work** (05_evaluation.md:127--131): Structural section. **Not orphaned.**

**Verdict: No orphaned evidence detected.** All evidence passages connect to at least one binding claim.

### Abstract--Introduction--Conclusion consistency

| Element | Abstract (00) | Introduction (01) | Conclusion (07) |
|---------|--------------|-------------------|-----------------|
| Three-layer metamodel | "three-layer metamodel" | Contribution 1: "three-layer metamodel" | "three-layer metamodel (+DCL, +CSL, +FSL)" |
| VCDM grounding | "grounded in W3C VCDM 2.0" | "grounded in W3C VCDM 2.0" | "grounded in +VCDM 2.0" |
| Cross-layer constraints | "cross-layer constraints formalized as graph predicates in Refinery" | Contribution 2: "formalization of cross-layer constraints as predicates in Refinery" | "formalized as graph predicates in Refinery" |
| Three-axis validation | "coverage...expressiveness...error detection" | Contribution 3: "three-axis validation" | "coverage...expressiveness...error visibility" |
| Headline results | "governance conflict and format expressiveness gap" | "governance conflict...format expressiveness gap" (in validation text) | "no credential format simultaneously satisfies..." + "cross-credential predicate evaluation...exceeds the capabilities" |
| Invisibility | "no single-layer analysis detects" | "errors undetectable by single-layer inspection" | "no single-layer formalization can express them" |

**Verdict: Consistent.** The abstract, introduction contribution list, and conclusion summary are aligned. Minor wording variation is natural and non-contradictory. One observation: the abstract uses "two cross-layer design errors" while the conclusion uses "both headline results" -- these refer to the same pair. The conclusion's closing sentence about "governance-source boundaries as first-class structural elements" is the strongest formulation of Claim 10 and does not appear in the abstract; this is acceptable as the conclusion's synthetic role warrants it.

---

## Actionable Findings

1. **T11 figures** are the single largest evidence quality gap, affecting Claims 2, 5, 6, and 7. Producing these would elevate four claims from ADEQUATE to STRONG.

2. **Claim 7 ("known anti-patterns"):** The word "known" implies external provenance. If the five anti-patterns are derived from the formalization rather than drawn from a published catalog, the introduction and abstract should say "structural anti-patterns" or "design anti-patterns" without "known." If they are drawn from practice, cite the source.

3. **Claim 6 framing:** The introduction (01_introduction.md:20) says "constraint expressiveness against W3C and EU regulatory sources." The W3C coverage (Claim 5) and EU expressiveness (Claim 6) are separate analyses in separate subsections. The "and" in the introduction's contribution 3 is technically correct (both are validated) but could mislead a reader into expecting a single joint analysis. Consider: "metamodel coverage against the W3C specification and constraint expressiveness against EU regulatory sources" to match the evaluation's actual structure. (This phrasing is in fact already used in 05_evaluation.md:10.)

4. **Claim 2 / Claim 5 overlap:** Both concern VCDM grounding/coverage. The distinction is clear (Claim 2 = the metamodel is grounded in VCDM; Claim 5 = coverage is validated), but a metaclass-to-VCDM mapping table in supplementary material would serve both claims simultaneously.
