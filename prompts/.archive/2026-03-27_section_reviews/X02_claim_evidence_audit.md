# X02: Claim-Evidence Audit

## Contribution Mapping

| Contribution | Evidence sections | Evidence type | Delivery status |
|---|---|---|---|
| C1: Three-layer metamodel (DCL, CSL, FSL) | 04 (Approach): metamodel figure, layer definitions (4.1–4.3), running example tables | Definition + running example | **Delivered.** All three layers defined with metaclasses, references, and a running example instantiation. FSL acknowledged as less mature (fewer intra-layer constraints formalized). |
| C2: Cross-layer constraint formalization as Refinery graph predicates | 04.4 (Cross-Layer Constraints): constraint taxonomy table (C1–C9), predicate definitions (trace consistency, entity alignment, cross-cred predicate gap), usage mode walkthrough | Definition + running example walkthrough | **Partially delivered.** Predicates defined in math/prose. Supplementary Refinery encodings referenced but not shown in-paper. The actual Refinery `check -k` / `generate` output demonstrating the governance conflict is described narratively but not shown as tool output (@TODO at line 62 of sec 05). |
| C3: Three-axis validation (coverage, expressiveness, error detection) | 05 (Evaluation): 5.1.1 coverage characterization, 5.1.2 expressiveness table (3 full / 5 partial / 0 outside), 5.1.3 headline results, 5.1.4 anti-pattern catalog, 5.1.5 baseline comparison, 5.2 scalability measurement | Qualitative elaboration + quantitative measurement design | **Partially delivered.** Coverage characterization is prose-only (no mapping table figure yet). Expressiveness table covers 3/8 fully; partially-expressible analysis is prose. Anti-pattern catalog delivered (5 patterns). Scalability table entirely TBD — no measurement data populated. |

## Binding Claims Status

| # | Claim | Status | Evidence location | Gap |
|---|---|---|---|---|
| 1 | Three-layer metamodel with defined layers | **Delivered** | Sec 04.1–04.3; fig_metamodel | Layers defined, instantiated on running example. FSL less mature (acknowledged). |
| 2 | Grounding in W3C VCDM 2.0 (mapping) | **Partially delivered** | Sec 05.1.1 (coverage), Sec 02.1 (VCDM intro) | Coverage characterization is a prose soundness–completeness argument. No mapping table/figure yet (@FIGURE: fig_coverage_table placeholder). The TBD coverage fraction in Sec 07 line 11 is unfilled. |
| 3 | Cross-layer constraints as Refinery graph predicates | **Delivered** | Sec 04.4 (constraint taxonomy, predicate definitions) | Predicates defined in math. Refinery encoding deferred to supplementary. Sufficient for the paper if supplementary is delivered. |
| 4 | Automated consistency checking demonstration | **Partially delivered** | Sec 04.4 (walkthrough paragraph, lines 101–102), Sec 03.3 (usage workflow) | Described narratively. No actual Refinery tool output shown. @TODO at Sec 04 line 113 and Sec 05 line 62 call for this. |
| 5 | Coverage validation vs. W3C specification | **Partially delivered** | Sec 05.1.1 | Prose argument only. Missing: fig_coverage_table, concrete N/M fraction. |
| 6 | Expressiveness validation vs. EU regulatory sources [HIGH RISK] | **Partially delivered** | Sec 05.1.2 | 3/8 fully expressible shown in table. 5/8 partially expressible analyzed in prose with root causes. Full constraint analysis deferred to supplementary. The claim "constraint expressiveness against EU regulatory sources" in the abstract is adequately hedged only if the reader trusts the partial/full classification. |
| 7 | Error detection vs. known anti-patterns | **Delivered** | Sec 05.1.4 (anti-pattern catalog, 5 patterns) | Table with predicate names, layers, kinds. Graduated visibility argument made. |
| 8 | Formally contradictory cross-framework constraints [HIGH RISK — headline result] | **Delivered (argument), partially delivered (tool demonstration)** | Sec 05.1.3 Headline 1 | The logical argument is complete: C5 ∧ C6 ∧ C7 unsatisfiable, with each source traced. The constraint sensitivity experiment (Tab sensitivity, G0–G7) would confirm the three-way conjunction is necessary — but all cells are TBD. The Refinery `check -k` output is not shown. |
| 9 | Multi-layer errors invisible to single-layer inspection | **Delivered** | Sec 05.1.3 (both headlines), Sec 05.1.4 (graduated visibility), Sec 05.1.5 (baseline comparison) | Both headline results explicitly argued invisible to single-layer inspection. Baseline comparison reinforces. |
| 10 | Necessity/effectiveness argument for multi-layer modeling | **Partially delivered** | Sec 05.1.5 (baseline comparison), Sec 07 (conclusion final sentence) | Analytical comparison against three baselines. No empirical user study (acknowledged as future work in Sec 07). The abstract's final sentence ("establish multi-layer formal modeling as a prerequisite") is strong — "prerequisite" is a necessity claim supported only by analytical argument, not by proof of necessity. |

## Per-Claim Audit

### CRITICAL Issues

**C-1. Scalability measurements entirely missing.**
- **Claim (abstract):** "The evaluation classifies eight eIDAS regulatory constraints against the metamodel, formalizes five structural anti-patterns as graph predicates, and surfaces two cross-layer design errors."
- **Claim (Sec 05.2):** "We evaluate the scalability of the Refinery-based formalization across three solver operations of increasing cost."
- **Evidence:** Every cell in Tab:scalability is TBD. Every cell in Tab:sensitivity is TBD. RQ answer paragraphs are @TODO.
- **Diagnosis:** OVERCLAIM. The abstract and structure paragraph promise quantitative scalability results. The evaluation section frames two research questions. Zero data exists.
- **Severity:** CRITICAL. A MODELS Foundations track reviewer will note immediately that the entire quantitative evaluation is placeholder. This is the single largest delivery gap.

**C-2. Automated tool demonstration missing.**
- **Claim (abstract):** "enabling automated consistency checking through design space exploration"
- **Claim (Sec 01):** "which generates diverse model instances satisfying these constraints — or reveals that no consistent design exists"
- **Claim (Sec 04.4, line 101):** "Running consistency checking on the partial specification... returns OK"
- **Evidence:** All three usage modes are described narratively. No Refinery output, screenshot, or log is shown. @TODO markers at Sec 04 line 113 and Sec 05 Headline 1 line 62 explicitly flag this.
- **Diagnosis:** OVERCLAIM. The paper claims automated checking but shows only manual reasoning about what the tool *would* produce.
- **Severity:** CRITICAL. The "automated" qualifier is load-bearing in the contribution. Without tool output, the contribution reduces to "a metamodel that could be checked automatically if someone ran the tool."

**C-3. Coverage fraction unfilled.**
- **Claim (Sec 07):** "The coverage characterization shows that the metamodel captures TBD VCDM 2.0 concepts relevant to credential ecosystem design"
- **Evidence:** TBD placeholder.
- **Diagnosis:** UNSUPPORTED. Literal placeholder text in the conclusion.
- **Severity:** CRITICAL only if submitted as-is. Easy fix once coverage mapping is done, but currently the conclusion contains "TBD."

### IMPORTANT Issues

**I-1. GDPR → predicate proof operationalization is an authorial interpretation, not a regulatory mandate.**
- **Claim (Sec 05.1.3 Headline 1, item 2):** "We interpret the data minimization principle as requiring that, when a threshold comparison suffices, disclosing the exact value constitutes disproportionate data collection — and that enforcing this at the credential layer requires predicate proof capability."
- **Evidence:** NAIH enforcement action (bank fined for copying pregnancy booklets). The analogy is apt but indirect — it concerns physical document copying, not credential format selection.
- **Diagnosis:** PROPORTIONAL. The paper honestly flags both inferential steps as non-self-evident and provides a supporting enforcement case. This is well-hedged. However, the abstract says "constraint expressiveness against EU regulatory sources" without noting that C6 is an authorial operationalization. The abstract should not imply that GDPR directly mandates predicate proofs.
- **Severity:** IMPORTANT. A legal-literate reviewer could object that the governance conflict depends on an authorial reading of GDPR, not on a normative requirement. The Headline 1 result is only as strong as this operationalization.

**I-2. "No existing tool or methodology" gap claim unverified.**
- **Claim (Sec 03.1):** "To the best of our knowledge, no existing tool or methodology checks whether their constraints can be simultaneously satisfied for a given credential ecosystem design."
- **Evidence:** Two survey citations (Mazzocca et al., Naghmouchi and Laurent). @TODO at Sec 01 line 13 flags this for verification.
- **Diagnosis:** PROPORTIONAL hedging ("to the best of our knowledge"), but the @TODO indicates the authors themselves are not yet confident. Should be verified before submission.
- **Severity:** IMPORTANT. If a reviewer finds a counterexample, the gap claim collapses.

**I-3. "Prerequisite" in abstract final sentence is a necessity claim.**
- **Claim (abstract):** "These results establish multi-layer formal modeling as a prerequisite for rigorous credential ecosystem design."
- **Evidence:** Two headline results + analytical baseline comparison showing single-layer approaches miss cross-layer errors.
- **Diagnosis:** OVERCLAIM. "Prerequisite" means necessary condition. The paper shows multi-layer modeling is *sufficient* to detect certain errors and that single-layer approaches miss them. But it does not prove that no other approach (e.g., ad hoc cross-layer checks without a full metamodel) could detect the same errors. The evidence supports "enables" or "is needed for systematic detection," not "prerequisite."
- **Severity:** IMPORTANT. The final sentence of the abstract is high-visibility. Downgrade to "enables" or "is necessary for systematic."

**I-4. Acyclicity constraint not implemented.**
- **Claim (Sec 04.1):** "these constraints ensure that every DCL instance is a connected, acyclic information graph"
- **Evidence:** @TODO at the same location: "Acyclicity constraint (error cyclic) not yet in vc_metamodel.refinery — add before submission."
- **Diagnosis:** OVERCLAIM. The text asserts acyclicity is ensured, but the constraint is not implemented.
- **Severity:** IMPORTANT. The prose claims a property the formalization does not yet enforce.

**I-5. "Five partially expressible" constraints — root cause analysis is prose-only.**
- **Claim (Sec 05.1.2):** "five partially, and none falls entirely outside the metamodel's capacity"
- **Evidence:** Prose analysis naming two root causes. Full constraint analysis deferred to supplementary.
- **Diagnosis:** Borderline proportional/overclaim. The classification rests on judgment calls about what "partially expressible" means. The claim that "none falls entirely outside" is strong — it means every EU regulatory constraint has at least some metamodel foothold. This should be defended more precisely.
- **Severity:** IMPORTANT if supplementary is not delivered.

**I-6. FSL maturity gap acknowledged but not quantified.**
- **Claim (Sec 04.3):** "This layer is less mature than DCL and CSL: format-internal structural constraints are not yet formalized."
- **Evidence:** Honest acknowledgment in-text. Also in Sec 07 limitations.
- **Diagnosis:** PROPORTIONAL (good self-awareness). But the abstract and contributions make no distinction between layer maturity levels. A reviewer may ask why a layer with no intra-layer constraints formalized is presented as part of a "three-layer metamodel."
- **Severity:** IMPORTANT for framing. The abstract should not treat all three layers as equally mature.

**I-7. Constraint sensitivity experiment: all data TBD.**
- **Claim (Sec 05.2):** "The constraint sensitivity experiment confirms that only G7... yields unsatisfiability"
- **Evidence:** The text asserts the result. The table is entirely TBD.
- **Diagnosis:** OVERCLAIM. The text states a finding that has no supporting data.
- **Severity:** IMPORTANT. The logical argument in Headline 1 already establishes this, so the sensitivity experiment is confirmatory. But claiming it "confirms" when no data is shown is problematic.

### Hedging Issues

**H-1. Over-hedging: "To the best of our knowledge" used where surveys are cited.**
- Location: Sec 03.1 final paragraph.
- The paper cites two recent surveys that identify no such approach. "To the best of our knowledge" combined with survey evidence is redundant hedging — either the surveys cover the landscape or they don't. Recommend: keep the hedge (the surveys may not be exhaustive) but tighten to "Recent surveys [X, Y] identify no existing approach that provides this capability."
- **Status:** Already done — the current text does cite the surveys alongside the hedge. Acceptable.

**H-2. Under-hedging: abstract treats all evaluation axes as equally delivered.**
- Location: Abstract lines 5–6.
- "We validate metamodel coverage against the W3C specification, constraint expressiveness against EU regulatory sources, and error detection against known credential design anti-patterns."
- All three are stated as accomplished facts. Coverage is prose-only (no table). Expressiveness has 3/8 fully expressible. Error detection is delivered. The abstract should not present incomplete validation axes as if fully executed.
- **Severity:** POLISH if measurements are completed before submission; IMPORTANT if submitted as-is.

**H-3. Under-hedging: "surfaces two cross-layer design errors" presented as empirical finding.**
- Location: Abstract.
- The two errors (governance conflict, predicate gap) are constructed by design in the running example, not discovered empirically. "Surfaces" implies they were found, not placed. More precise: "demonstrates detection of two cross-layer design errors."
- **Severity:** POLISH.

**H-4. Under-hedging: "formally contradictory" for the governance conflict.**
- Location: Abstract, Sec 05.1.3.
- The contradiction depends on the GDPR operationalization (I-1). "Formally contradictory under our operationalization of GDPR data minimization" would be precise. The current text states "formally contradictory" without qualification in the abstract.
- **Severity:** IMPORTANT (same root as I-1).

**H-5. Over-hedging: conclusion downplays results.**
- Location: Sec 07 para 3 (limitations).
- "The approach has not been evaluated empirically with credential ecosystem designers in practice." This is honest and appropriate. Not over-hedging — just noting for completeness.

## Summary Statistics

- **Claims audited:** 28 (10 binding + 18 in-text)
- **Proportional:** 14
- **Overclaiming:** 8
  - C-1: Scalability data entirely TBD
  - C-2: Automated tool demonstration missing
  - C-3: Coverage fraction TBD in conclusion
  - I-1: Abstract under-hedges GDPR operationalization (partial)
  - I-3: "Prerequisite" exceeds evidence
  - I-4: Acyclicity claimed but not implemented
  - I-5: "None falls entirely outside" strong without full defense
  - I-7: Sensitivity experiment claims result with TBD data
- **Underclaiming:** 2
  - The ARF-C7 external validation remark (Sec 05.1.2) is a stronger result than the paper treats it — independent convergence on the same layering is evidence for structural validity, worth elevating
  - The baseline comparison (Sec 05.1.5) undersells the graduated visibility argument, which is the most convincing framing for the necessity claim
- **Unsupported:** 4
  - Scalability RQ answers (no data)
  - Coverage fraction (TBD)
  - Constraint sensitivity results (TBD)
  - Acyclicity enforcement (not implemented)

## Risk Assessment

The paper's argument structure is sound: the three-layer metamodel is well-defined, the running example effectively demonstrates cross-layer problems, and the headline results are logically compelling. The critical gap is execution: measurement data is entirely missing, tool output is absent, and several placeholder values remain. If submitted as-is, a reviewer would likely score the paper as "interesting idea, incomplete evaluation" — a reject with encouragement to resubmit.

The **minimum viable submission** requires:
1. Populate scalability tables (C-1)
2. Show at least one Refinery tool output demonstrating automated checking (C-2)
3. Fill TBD coverage fraction (C-3)
4. Implement acyclicity constraint (I-4)
5. Soften "prerequisite" to "enables systematic" (I-3)

## Fix-It Prompt

```
# Fix: Claim-Evidence Alignment

## Target files
- sections/00_abstract.md
- sections/01_introduction.md
- sections/04_approach.md
- sections/05_evaluation.md
- sections/07_conclusion.md

## Goal
Resolve claim-evidence mismatches identified in X02_claim_evidence_audit.md.

## Prose fixes (can execute now)

### 1. Abstract final sentence: downgrade "prerequisite"
In 00_abstract.md, replace:
"These results establish multi-layer formal modeling as a prerequisite for rigorous credential ecosystem design."
With:
"These results establish that multi-layer formal modeling enables systematic detection of cross-layer design errors that no single-layer approach can express."

### 2. Abstract: hedge GDPR operationalization
In 00_abstract.md, after "constraint expressiveness against EU regulatory sources", consider adding "including an operationalization of GDPR data minimization as a predicate proof requirement" — or leave as-is if the body's hedging is deemed sufficient.

### 3. Abstract: "surfaces" → "demonstrates detection of"
Replace "surfaces two cross-layer design errors" with "demonstrates detection of two cross-layer design errors" to avoid implying empirical discovery.

### 4. Acyclicity claim: hedge until implemented
In 04_approach.md (DCL section), change "ensure that every DCL instance is a connected, acyclic information graph" to "ensure that every DCL instance is a connected information graph; an acyclicity constraint is defined but not yet encoded" — OR implement the acyclicity constraint first.

### 5. Sensitivity experiment: remove present-tense finding
In 05_evaluation.md (line 167), change "The constraint sensitivity experiment confirms that only G7..." to "The constraint sensitivity experiment is designed to confirm that only G7..." until data is populated.

### 6. Conclusion TBD: leave as marker
The "TBD" in 07_conclusion.md must be filled with the actual coverage fraction once the mapping table is complete.

## Execution fixes (require tool runs — separate tasks)

### 7. Populate scalability tables [CRITICAL — BLOCKING]
Run Refinery measurements and fill Tab:scalability and Tab:sensitivity. This is the single most important pre-submission task.

### 8. Show Refinery tool output [CRITICAL]
After measurements, include at least one concrete tool output (e.g., the UNSAT result for Headline 1) as a code listing or figure.

### 9. Coverage mapping table [IMPORTANT]
Create fig_coverage_table mapping VCDM 2.0 concepts to metamodel elements. Fill the coverage fraction in Sec 07.

### 10. Implement acyclicity constraint [IMPORTANT]
Add `error cyclic` predicate to vc_metamodel.refinery before submission.

## Constraints
- Do NOT change the headline results or their logical argument.
- Do NOT weaken claims beyond what the evidence warrants — the goal is proportionality, not timidity.
- Prose fixes are independent of each other and can be applied in any order.
- Execution fixes have dependencies: 7 before 8; 9 independent; 10 independent.
```
