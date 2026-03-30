# X04: Decision and CFP Compliance Audit

**Date:** 2026-03-30
**Auditor:** Claude (automated)
**Scope:** All 33 decision files, CFP/venue requirements, cross-reference integrity

---

## Part 1: Decision Compliance

| # | Decision | Status | Compliant? | Violation / Drift | Location |
|---|----------|--------|------------|-------------------|----------|
| 1 | **decision_c5_claim_correction** — Do not claim "MDE has not been applied to VC/SSI"; instead scope gap to multi-level metamodeling + cross-layer constraints + VC credential design | active | YES | Related work (Sec 06) cites four MDE-SSI works and scopes gap: "none defines a multi-layer metamodel or formalizes cross-layer constraints connecting domain semantics to format-specific representation" (06_related_work.md:21). Final sentence: "No prior work combines multi-layer metamodeling with formalized cross-layer constraints for verifiable credential ecosystem design under multi-source governance" (06_related_work.md:32). Abstract does not overclaim. | 06_related_work.md:21, :32 |
| 2 | **decision_csok_naming** — Use "family housing subsidy" in body text; Hungarian name in footnote only | active | YES | Body text uses "housing subsidy" throughout. Hungarian name appears once in footnote: "Based on the Hungarian Family Housing Subsidy (Családi Otthonteremtési Kedvezmény, CSOK), simplified." (03_overview.md:15). No bare "CSOK" in body text. | 03_overview.md:15 (footnote) |
| 3 | **decision_csok_running_example** — Single running example based on CSOK | active | YES | The housing subsidy scenario is the sole running example, introduced in Sec 03 and carried through Sec 04 and 05. | 03_overview.md:15, 04_approach.md:17, 05_evaluation.md passim |
| 4 | **decision_dcl_rename** — Rename CPL to DCL (Domain Concept Layer) | active | YES | No occurrence of "Claim Property Layer" or "CPL" in any section file. DCL used consistently: "+DCL" acronym expanded as "Domain Concept Layer" throughout. Layer hierarchy reads DCL/CSL/FSL. | 04_approach.md:11, 07_conclusion.md:12 |
| 5 | **decision_domain_mde** — Primary domain is MDE, not formal methods | active | YES | Background covers multi-layer modeling (Sec 2.2) and Refinery (Sec 2.3), not logic/verification foundations. Register is MDE throughout. Atkinson & Kuhne cited in BG and related work. | 02_background.md:20-28, 06_related_work.md:25 |
| 6 | **decision_format_driven_restructuring** — FSL limitation propagates to DCL restructuring as worked example | active | YES | Cross-layer propagation example appears in Sec 04.4: "requiring predicate proof support on IncomeCred eliminates all formats except AnonCreds" and "the only workaround is restructuring the domain concept layer, replacing a numeric property with pre-computed boolean claims" (04_approach.md:171). Headline 1 develops this fully (05_evaluation.md:27-52). | 04_approach.md:171, 05_evaluation.md:37 |
| 7 | **decision_gap_analysis_confirmed** — Proceed with thesis; gap confirmed | active | YES | Paper proceeds with thesis as stated. Related work cites works across tiers. | 06_related_work.md passim |
| 8 | **decision_gdpr_two_tier** — eIDAS as hard mandate, GDPR as operationally binding with NAIH precedent | active | YES | Sec 03 distinguishes: "EU regulations mandate specific credential formats" (hard) vs. "data protection law's minimization principle, operationalized here as a credential-layer requirement" (operationalized). NAIH fine cited in footnote (03_overview.md:17). Headline 1 (05_evaluation.md:34) uses "operationalized as a credential-layer requirement" with autoref back to sec:motivation. | 03_overview.md:17, 05_evaluation.md:34 |
| 9 | **decision_mdoc_simplified** — Running example uses SD-JWT-VC only; mdoc in BG only | active | YES | BG mentions both SD-JWT-VC and mdoc (02_background.md:14-16). FSL section: "both formats mandated by the ARF (SD-JWT-VC and mdoc) lack predicate proof support; we use SD-JWT-VC as representative" (04_approach.md:76). Running example uses SD-JWT-VC only. | 02_background.md:14, 04_approach.md:76 |
| 10 | **decision_motivation_problem_statement** — Sec 03 ends with problem statement, not demonstrated detected error | active | YES | Sec 03.1 ends with "The remainder of this section defines a framework that captures constraints across these layers..." (03_overview.md:23). Detection results appear in Sec 05 only. | 03_overview.md:23 |
| 11 | **decision_no_mda_terminology** — No CIM/PIM/PSM or MDA terminology | active | YES | Zero occurrences of CIM, PIM, PSM, or "Model-Driven Architecture" in any section file. Layer names are DCL, CSL, FSL throughout. | All section files (grep confirmed) |
| 12 | **decision_teaser_figure** — ACM sigconf teaser figure showing three-layer CSOK scenario | active | YES | Teaser figure placed in Sec 03 with `\label{fig:teaser}` (03_overview.md:25-31). Caption describes "multi-layer modeling framework applied to a housing subsidy credential ecosystem across three metamodel layers." Referenced extensively via `\autoref{fig:teaser}` in Sec 01, 03, 04. | 03_overview.md:25-31 |
| 13 | **decision_two_headline_results** — Income governance conflict (vertical) + floor area cross-credential gap (horizontal) | active | YES | Both headline results present in Sec 05.1.3: Headline 1 "Income governance conflict (vertical)" (05_evaluation.md:27) and Headline 2 "Cross-credential predicate gap (horizontal)" (05_evaluation.md:54). Abstract mentions both: "a governance conflict and a format expressiveness gap" (00_abstract.md:26). | 05_evaluation.md:27, :54; 00_abstract.md:26 |
| 14 | **decision_emergent_constraint_interactions** — Constraints show emergent behaviour; interaction effects unpredictable without joint analysis | active | YES | Sec 01: "governance frameworks impose requirements that conflict across abstraction layers" (01_introduction.md:12). Sec 03: "their combined effect is not predictable from any individual source" appears in abstract (00_abstract.md:24). Sec 03.1: "Neither problem is visible when any single layer is inspected alone" (03_overview.md:19). | 00_abstract.md:24, 01_introduction.md:12, 03_overview.md:19 |
| 15 | **decision_competing_peer_requirements** — VC ecosystems have competing peer stakeholder requirements, not hierarchical | active | YES | Sec 01: "Unlike hierarchical requirement systems where constraints decompose top-down, credential governance sources are non-cooperating peers with competing goals; their requirements cannot necessarily be brought into a coherent whole" (01_introduction.md:12). | 01_introduction.md:12 |
| 16 | **decision_novel_tooling_justification** — Must justify why existing tools are insufficient, identify specific challenges | active | YES | Baseline comparison (05_evaluation.md:70-72): "Single-layer metamodeling (a UML class diagram with OCL constraints per layer) detects intra-layer violations but cannot express cross-layer trace predicates." Related work (06_related_work.md:27-28) compares Alloy (bounded, fully concrete) and OCL (no partial models). Sec 02.3 closing paragraph motivates partial specifications. | 05_evaluation.md:70-72, 06_related_work.md:27-28 |
| 17 | **decision_sec03_overview_restructure** — Sec 03 renamed to Overview with 3.1 Motivation, 3.2 Functional Overview, 3.3 Usage Workflow | active | PARTIAL | Sec 03 is titled "Overview" with 3.1 Motivation and 3.2 Functional Overview present. **3.3 Usage Workflow is missing.** The section frontmatter budget mentions it ("Usage Workflow ~0.3p") but no subsection 3.3 exists in the file. The decision notes 3.3 is "most compressible" and the closing sentence of 3.2 contains a brief workflow sketch ("A typical workflow chains these modes..."), but this is not a distinct subsection. | 03_overview.md (missing subsection) |
| 18 | **decision_evaluation_measurement_schema** — Evaluation >= 2 pages with fixed schema: RQs, domains, setup, results (2 diagrams), analysis, threats | active | PARTIAL | Sec 05 has RQs (lines 78-79), measurement setup (line 83), results table (tab:scalability), analysis (lines 117-121), threats (sec:threats). **Missing: 2 full-width diagrams (`figure*`).** The runtime figure is commented out (lines 106-115: "Runtime figure removed; data already in tab:scalability"). Only one table exists. The decision requires "2 full-width diagrams at page top." Also: the "selected domains" subsection is implicit (line 81 describes instances) rather than a separate labeled discussion. | 05_evaluation.md:106-115 (commented out figure) |
| 19 | **decision_vcdm_coverage_elaboration** — VCDM coverage is elaboration/soundness-completeness, not measurement | active | YES | Sec 05.1.1 titled "Metamodel Coverage" under "Elaboration" subsection (05_evaluation.md:14). Framed as soundness-completeness pair, not quantitative metric. Actual measurement in Sec 05.2. | 05_evaluation.md:14-16 |
| 20 | **decision_formal_claims_required** — Paper needs explicit formalizable claims about why the approach works | active | PARTIAL | Sec 04 makes structural claims (connectivity, acyclicity, trace consistency) with predicate definitions. The governance conflict is stated as unsatisfiability (05_evaluation.md:37). However, the three formal placeholders in Sec 02.3 (`::: {.formal}` blocks at lines 47-49, 85-87, 109-111) remain unfilled: refinement ordering, propagation rule semantics, and soundness/completeness guarantees are still marked as "Oscar: [description]. Target length: N sentences." | 02_background.md:47-49, :85-87, :109-111 |
| 21 | **decision_soundness_completeness** — Explicit soundness and completeness claims for Refinery-based formalization | active | PARTIAL | Sec 02.3 contains prose stating "Generation is refinement-based: every generated model is guaranteed to satisfy all specified constraints (soundness), and if a constraint is violated in every possible completion, the tool detects the violation (completeness)" (02_background.md:107). However, the formal statement is still a placeholder: `::: {.formal} Oscar: formal statement of soundness and completeness guarantees...` (02_background.md:109-111). The guarantees are stated informally but not formalized. | 02_background.md:107, :109-111 |
| 22 | **decision_core_disc_properties** — Map approach to Refinery's CORE-DISC properties: Consistency (primary), Diversity/Scalability (addressed), Realistic (out of scope) | active | PARTIAL | Consistency is the primary focus throughout Sec 05. Scalability is addressed in Sec 05.2. **Diversity gets one sentence** in Sec 03.2: "Refinery guarantees diversity among generated graph completions" (03_overview.md:38 footnote). **Realistic is never explicitly acknowledged as out of scope.** The decision requires at least a sentence for each. | 03_overview.md:38 (diversity, footnote only); Realistic: not addressed |
| 23 | **decision_range_proofs_future_work** — Range proofs vs. predicate proofs as future work | active | NO | No mention of "range proofs" in any section file. The decision requires a mention in Sec 07 (conclusion/future work). Sec 07 is only two paragraphs and does not mention range proofs. Sec 05.4 (Limitations and Future Work) lists four future directions but none mentions range proofs. | 07_conclusion.md (absent); 05_evaluation.md:127-131 (absent) |
| 24 | **decision_error_detection_vs_dse** — Three distinct usage modes: consistency checking, error identification, DSE | active | YES | Three modes defined in Sec 03.2: "Consistency checking confirms that a complete design satisfies all constraints. Error identification pinpoints which constraints conflict... design space exploration generates diverse valid completions" (03_overview.md:38). Sec 01 also lists all three (01_introduction.md:22). | 03_overview.md:38, 01_introduction.md:22 |
| 25 | **decision_three_axis_validation** — Evaluation structured as coverage, expressiveness, error detection | active | YES | Abstract: "We validate coverage against the W3C specification, expressiveness against EU regulatory sources, and error detection against known anti-patterns" (00_abstract.md:26). Introduction contribution 3 (01_introduction.md:20). Evaluation structure mirrors axes: sec:coverage, sec:expressiveness, sec:headlines + sec:anti-patterns. | 00_abstract.md:26, 01_introduction.md:20, 05_evaluation.md:10 |
| 26 | **decision_fsl_elaboration** — Add format-internal constraint to FSL (DEFERRED) | deferred | N/A | Decision is explicitly deferred. Sec 04.3 does not carry intra-layer constraints but the section acknowledges FSL's role through capability predicates and governance annotations (04_approach.md:78). However, the explicit acknowledgment text mentioned in the decision ("Unlike DCL and CSL, the format-specific layer does not yet carry intra-layer structural constraints") does not appear in the current prose. Sec 07 does not list FSL maturity as a limitation (the conclusion is only 2 paragraphs). The limitations paragraph in 05_evaluation.md:127-131 does not mention FSL maturity either. **The defense the decision claims exists is not in the prose.** | 04_approach.md:78 (partial); 07_conclusion.md (absent) |
| 27 | **decision_refinery_code_in_paper** — Add Refinery code listings to BG and approach sections | active | YES | Sec 02.3 has two code listings: `lst:refinery-metamodel` (02_background.md:65-81) and `lst:refinery-mechanisms` (02_background.md:91-104). Sec 04 has three: `lst:dcl-instance` (04_approach.md:19-24), `lst:trace-consistency` (04_approach.md:122-140), `lst:cross-layer-shadow` (04_approach.md:150-169). Sec 05 has `lst:governance-conflict` (05_evaluation.md:39-52). | 02_background.md, 04_approach.md, 05_evaluation.md |
| 28 | **decision_bg_notation_consistency** — All Refinery terms defined in Sec 2.3; later sections reference via autoref | active | YES | Sec 02.3 defines: error predicate, propagation rule, shadow predicate, scope constraint, four-valued interpretation, partial model. Sec 04 uses `\autoref{sec:refinery}` at multiple points (04_approach.md:11, :28, :54, :117). Sec 05 also backrefs (05_evaluation.md:68, :76). | 04_approach.md:11, :28, :54, :117; 05_evaluation.md:68, :76 |
| 29 | **decision_conclusion_shortened** — Conclusion ~2 paragraphs; limitations + future work move to Sec 05 | active | YES | Conclusion is exactly 2 paragraphs (07_conclusion.md:10-12). Limitations and future work appear in Sec 05 (05_evaluation.md:123-131, sec:threats and sec:limitations). | 07_conclusion.md:10-12, 05_evaluation.md:123-131 |
| 30 | **decision_type_graph_rename** — fig:metamodel caption says "type graph" not "metamodel"; move figure near constraint table | active | PARTIAL | Caption reads "The three-layer type graph" (04_approach.md:95), which is correct. However, the decision also requires moving the figure from top of Sec 4.1 to near the constraint taxonomy table (Sec 4.4). The figure is currently at line 95 of 04_approach.md, which is the opening of Sec 4.4 (Cross-Layer Constraints). **The placement appears correct** (near constraint table). However, the inline Markdown image syntax `![...](pandoc/assets/fig_metamodel.pdf){#fig:metamodel width=100%}` places it at the start of sec:cross-layer, which is near tab:constraint_taxonomy (line 111). Compliant. | 04_approach.md:95 |
| 31 | **decision_modeling_first_framing** — Paper framed around multi-level metamodeling, not error detection | active | YES | Title candidates lead with "metamodel" (00_abstract.md:18-20). Abstract: "We present a three-layer metamodel and formalized constraint set" (00_abstract.md:25). Introduction contributions lead with metamodel (01_introduction.md:17-20). "Detects" used only for predicate subjects (05_evaluation.md:25: "the formalization detects"). | 00_abstract.md:25, 01_introduction.md:17-20 |
| 32 | **decision_gap_framing_formalized** — "We collected and formalized" instead of "scattered across" | completed | YES | Abstract: "Constraints from W3C standards, EU regulations, and community guidelines interact across layers" (00_abstract.md:24). Introduction P2 frames it as governance sources imposing constraints, not scattering. No "scattered across" language found. | 00_abstract.md:24-26 |
| 33 | **decision_no_code_listings** — SUPERSEDED by decision_refinery_code_in_paper | superseded | N/A | Superseded. Code listings now in body per newer decision. Full encoding still referenced as supplementary (04_approach.md:11: "Full Refinery encodings... are provided in the supplementary material"). | 04_approach.md:11 |

### Decision Compliance Summary

- **YES:** 23 decisions
- **PARTIAL:** 6 decisions (#17, #18, #20, #21, #22, #26)
- **NO:** 1 decision (#23 — range proofs future work)
- **N/A:** 3 decisions (#26 deferred, #33 superseded, #32 completed)

### Critical Violations

1. **#23 (decision_range_proofs_future_work): NO.** Range proofs are not mentioned anywhere in the paper. The decision requires at least a future work mention in Sec 07 or Sec 05.4.

2. **#17 (decision_sec03_overview_restructure): PARTIAL.** Section 3.3 Usage Workflow is missing. The frontmatter acknowledges it but no subsection exists. The decision notes this is "most compressible," so its absence may be intentional but was never formally recorded as cut.

3. **#18 (decision_evaluation_measurement_schema): PARTIAL.** The requirement for 2 full-width `figure*` diagrams is not met. The runtime figure is commented out. Only a table exists.

4. **#20/#21 (formal_claims_required + soundness_completeness): PARTIAL.** Three `::: {.formal}` placeholder blocks remain in Sec 02.3 (lines 47-49, 85-87, 109-111). Soundness/completeness stated informally but not formalized.

5. **#22 (decision_core_disc_properties): PARTIAL.** "Realistic" property never acknowledged as out of scope. "Diverse" only in a footnote.

6. **#26 (decision_fsl_elaboration): DEFERRED but defense text missing.** The decision claims the prose acknowledges FSL's gap ("Unlike DCL and CSL...") and that Sec 07 lists FSL maturity as first limitation. Neither text exists in the current draft.

---

## Part 2: CFP/Format Compliance

### Double-Blind Anonymization

| Check | Status | Detail |
|-------|--------|--------|
| No author names in submission | PASS | No names (Martin, Oszkar, Imre, Semerath, etc.) found in any section file. |
| Own prior work in third person | PASS | Refinery cited as third-party work: "Refinery [@marussy_refinery_2024]" throughout. No "our tool," "our previous work," or first-person references to Refinery development. |
| No preprint links | PASS | No arXiv or preprint URLs found in section files. |
| No identifying info in supplementary refs | PASS (sections) | No GitHub URLs or institutional identifiers in section files. Supplementary material not audited (out of scope). |
| No institutional identifiers | PASS | No university names, lab names, or funding identifiers in section files. |

**Anonymization verdict: CLEAN.** No anonymization violations detected.

### Page Limit Readiness

Estimating ACM sigconf rendering from section file lengths (sigconf typically renders ~750-850 words per page with figures/tables):

| Section | Lines (approx) | Est. words | Est. pages |
|---------|----------------|------------|------------|
| Abstract | 5 lines body | ~150 | 0.2 |
| Sec 01 Introduction | 17 lines body | ~650 | 0.9 |
| Sec 02 Background | ~105 lines body | ~1350 | 1.6 |
| Sec 03 Overview | ~30 lines body + teaser figure | ~500 + figure | 1.0 |
| Sec 04 Approach | ~165 lines body + 3 code listings + 2 tables + 1 figure | ~1800 | 3.0 |
| Sec 05 Evaluation | ~130 lines body + 1 code listing + 1 table | ~1400 | 2.2 |
| Sec 06 Related Work | ~25 lines body | ~550 | 0.7 |
| Sec 07 Conclusion | ~5 lines body | ~150 | 0.2 |
| **Total** | | | **~9.8** |

**Estimate: ~9.8 pages main text.** This is within the 10-page limit but leaves minimal margin. The three unfilled `::: {.formal}` blocks in Sec 02.3 would add ~0.3-0.5 pages if filled. The commented-out scalability figure would add ~0.3 pages.

**Risk:** If formal placeholders are filled AND the figure is re-added, the paper likely exceeds 10 pages. One or both may need to be cut or compressed.

### Format Compliance

| Check | Status | Detail |
|-------|--------|--------|
| ACM sigconf format | ASSUMED | Section files are Markdown; LaTeX output handled by pandoc pipeline. Not auditable from section files alone. |
| Section numbering | PASS | Standard sequential sections 1-7 with subsections. |
| Citation format | PASS | All citations use `[@key]` Pandoc syntax mapping to natbib. |
| Figure/table placement | PASS | Figures use `\begin{figure*}` or Pandoc image syntax. Tables use Markdown or raw LaTeX. |
| References section | N/A | References are generated by BibTeX; not part of section files. |

### Required Elements

| Element | Status | Detail |
|---------|--------|--------|
| Abstract | PRESENT | 00_abstract.md, well-formed. |
| All sections complete | PARTIAL | All 8 section files exist. Three `::: {.formal}` placeholder blocks remain in Sec 02.3 (lines 47-49, 85-87, 109-111). These are visible placeholders that would render in the final document if not addressed. |
| References | ASSUMED | BibTeX-managed; not auditable from section files. |

---

## Part 3: Cross-Reference Integrity

### All `\autoref{}` targets

Collecting all `\autoref` references and checking against defined labels:

**Defined labels (from `{#...}` headers and `\label{}`)**:

| Label | File | Line |
|-------|------|------|
| `sec:introduction` | 01_introduction.md | 8 |
| `sec:background` | 02_background.md | 8 |
| `sec:vcdm` | 02_background.md | 10 |
| `sec:multi-layer` | 02_background.md | 20 |
| `sec:refinery` | 02_background.md | 30 |
| `sec:overview` | 03_overview.md | 9 |
| `sec:motivation` | 03_overview.md | 13 |
| `fig:teaser` | 03_overview.md | 30 |
| `sec:functional-overview` | 03_overview.md | 34 |
| `sec:approach` | 04_approach.md | 9 |
| `sec:dcl` | 04_approach.md | 13 |
| `sec:csl` | 04_approach.md | 44 |
| `sec:fsl` | 04_approach.md | 72 |
| `tab:format_capabilities` | 04_approach.md | 89 |
| `sec:cross-layer` | 04_approach.md | 93 |
| `tab:constraint_taxonomy` | 04_approach.md | 111 |
| `fig:metamodel` | 04_approach.md | 95 |
| `lst:dcl-instance` | 04_approach.md | 19 |
| `lst:trace-consistency` | 04_approach.md | 122 |
| `lst:cross-layer-shadow` | 04_approach.md | 150 |
| `sec:evaluation` | 05_evaluation.md | 8 |
| `sec:elaboration` | 05_evaluation.md | 12 |
| `sec:coverage` | 05_evaluation.md | 14 |
| `sec:expressiveness` | 05_evaluation.md | 18 |
| `sec:headlines` | 05_evaluation.md | 23 |
| `sec:headline-income-conflict` | 05_evaluation.md | 27 |
| `sec:headline-predicate-gap` | 05_evaluation.md | 54 |
| `sec:anti-patterns` | 05_evaluation.md | 66 |
| `sec:baseline` | 05_evaluation.md | 70 |
| `sec:scalability` | 05_evaluation.md | 74 |
| `tab:scalability` | 05_evaluation.md | 88 |
| `fig:scalability` | 05_evaluation.md | 112 (INSIDE COMMENT) |
| `sec:threats` | 05_evaluation.md | 123 |
| `sec:limitations` | 05_evaluation.md | 127 |
| `sec:related-work` | 06_related_work.md | 9 |
| `sec:rw-credential` | 06_related_work.md | 11 |
| `sec:rw-mde` | 06_related_work.md | 17 |
| `sec:rw-multilevel` | 06_related_work.md | 23 |
| `sec:conclusion` | 07_conclusion.md | 8 |

**All `\autoref` references found and their resolution:**

| Reference | Used in | Resolves? |
|-----------|---------|-----------|
| `\autoref{fig:teaser}` | 01_introduction.md:22, 03_overview.md:11,17, 04_approach.md:17,115 | YES (03_overview.md:30) |
| `\autoref{sec:background}` | 01_introduction.md:24 | YES |
| `\autoref{sec:overview}` | 01_introduction.md:24, 02_background.md:28 | YES |
| `\autoref{sec:approach}` | 01_introduction.md:24, 02_background.md:22, 04_approach.md:11,28 (indirect via sec:multi-layer ref) | YES |
| `\autoref{sec:evaluation}` | 01_introduction.md:24, 02_background.md:18, 04_approach.md:148 | YES |
| `\autoref{sec:related-work}` | 01_introduction.md:24 | YES |
| `\autoref{sec:conclusion}` | 01_introduction.md:24, 05_evaluation.md:21 | YES |
| `\autoref{sec:vcdm}` | 02_background.md:28, 04_approach.md:78 | YES |
| `\autoref{sec:multi-layer}` | 02_background.md:28, 04_approach.md:11 | YES |
| `\autoref{sec:refinery}` | 02_background.md:28, 04_approach.md:11,28,54,117, 05_evaluation.md:68,76 | YES |
| `\autoref{sec:motivation}` | 03_overview.md:11, 04_approach.md:26, 05_evaluation.md:34 | YES |
| `\autoref{sec:headlines}` | 03_overview.md:11, 04_approach.md:91,113, 05_evaluation.md:121 | YES |
| `\autoref{sec:functional-overview}` | 03_overview.md:11, 04_approach.md:11,42 | YES |
| `\autoref{fig:metamodel}` | 04_approach.md:11,50 | YES (04_approach.md:95) |
| `\autoref{sec:csl}` | 04_approach.md:28 | YES |
| `\autoref{sec:anti-patterns}` | 04_approach.md:70 | YES |
| `\autoref{sec:cross-layer}` | 06_related_work.md:30, 04_approach.md:76 | YES |
| `\autoref{sec:rw-multilevel}` | 02_background.md:113 | YES |
| `\autoref{tab:scalability}` | 05_evaluation.md:81 | YES |
| `\autoref{sec:coverage}` | 05_evaluation.md:125 | YES |
| `\autoref{lst:refinery-metamodel}` | 02_background.md:51 | YES (02_background.md:65) |
| `\autoref{lst:refinery-mechanisms}` | 02_background.md:89 | YES (02_background.md:91) |
| `\autoref{lst:dcl-instance}` | 04_approach.md:17 | YES (04_approach.md:19) |
| `\autoref{lst:trace-consistency}` | 04_approach.md:120 | YES (04_approach.md:122) |
| `\autoref{lst:cross-layer-shadow}` | 04_approach.md:143,146, 05_evaluation.md:62 | YES (04_approach.md:150) |
| `\autoref{lst:governance-conflict}` | 05_evaluation.md:37 | YES (05_evaluation.md:39) |
| `\autoref{sec:scalability}` | 05_evaluation.md:10,37 | YES |

**Cross-reference verdict: ALL REFERENCES RESOLVE.** No broken `\autoref` references found.

### Labels Defined But Never Referenced

| Label | File | Referenced? |
|-------|------|-------------|
| `sec:introduction` | 01_introduction.md:8 | NO (never autoreferenced; this is normal for the first section) |
| `sec:dcl` | 04_approach.md:13 | NO |
| `sec:fsl` | 04_approach.md:72 | NO |
| `tab:format_capabilities` | 04_approach.md:89 | NO |
| `tab:constraint_taxonomy` | 04_approach.md:111 | NO |
| `sec:elaboration` | 05_evaluation.md:12 | NO |
| `sec:expressiveness` | 05_evaluation.md:18 | NO |
| `sec:headline-income-conflict` | 05_evaluation.md:27 | NO |
| `sec:headline-predicate-gap` | 05_evaluation.md:54 | NO |
| `sec:baseline` | 05_evaluation.md:70 | NO |
| `fig:scalability` | 05_evaluation.md:112 | NO (inside HTML comment; figure removed) |
| `sec:threats` | 05_evaluation.md:123 | NO |
| `sec:limitations` | 05_evaluation.md:127 | NO |
| `sec:rw-credential` | 06_related_work.md:11 | NO |
| `sec:rw-mde` | 06_related_work.md:17 | NO |

Of these, `sec:introduction`, `sec:dcl`, `sec:fsl`, and the subsection-level evaluation labels are likely referenced implicitly via parent autorefs or are available for future use. The table labels (`tab:format_capabilities`, `tab:constraint_taxonomy`) are notable: these tables exist but are never cross-referenced from outside their immediate context.

### Sections Promised But Missing

The introduction's structure paragraph (01_introduction.md:24) promises all sections and they all exist:
- `\autoref{sec:background}` — exists
- `\autoref{sec:overview}` — exists
- `\autoref{sec:approach}` — exists
- `\autoref{sec:evaluation}` — exists
- `\autoref{sec:related-work}` — exists
- `\autoref{sec:conclusion}` — exists

**Sec 03.3 Usage Workflow** is promised in the frontmatter but missing (see Decision #17 above).

### Unfilled Placeholders

Three `::: {.formal}` blocks in 02_background.md remain as visible placeholders:

1. **Line 47-49:** "Oscar: refinement ordering definition..." — would render as a formal div in output
2. **Line 85-87:** "Oscar: propagation rule semantics..." — same
3. **Line 109-111:** "Oscar: formal statement of soundness and completeness guarantees..." — same

These will render as visible content in the final PDF unless the annotation filter strips `.formal` class divs. **If the filter does NOT strip them, these are submission-blocking.**

---

## Summary of Action Items (Priority Order)

1. **CRITICAL:** Verify that `.formal` annotation divs are stripped by `annotations.lua` in submission mode. If not, the three placeholder blocks in 02_background.md will appear in the PDF.
2. **HIGH:** Add range proofs mention to Sec 05.4 (Limitations and Future Work) per decision #23.
3. **HIGH:** Decide whether the commented-out scalability figure (05_evaluation.md:106-115) should be restored or the decision (#18) updated to accept a table-only presentation.
4. **MEDIUM:** Add explicit acknowledgment of FSL's intra-layer constraint gap in Sec 04.3 prose, and FSL maturity as a limitation in Sec 05.4, per decision #26's claimed defense text.
5. **MEDIUM:** Add at least a sentence about "Realistic" being out of scope for CORE-DISC properties, per decision #22.
6. **MEDIUM:** Decide on Sec 03.3 Usage Workflow: either add it or formally record its removal.
7. **LOW:** Consider adding cross-references to `tab:format_capabilities` and `tab:constraint_taxonomy` from other sections for stronger integration.
