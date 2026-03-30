# Z01: Paper Audit Synthesis Report

**Date:** 2026-03-30
**Deadline:** TODAY ~13:00 CET (AoE grace period)
**Sources:** S00–S07 (section audits), X01–X04 (cross-cutting audits)

---

## 1. Binding Claim Delivery Matrix

| # | Claim | Delivered? | Where? | Evidence quality | Gap / Risk |
|---|-------|------------|--------|------------------|------------|
| C1 | Three-layer metamodel | YES | Sec 04.1–04.3, fig:metamodel, tab:constraint_taxonomy | STRONG | None |
| C2 | W3C VCDM 2.0 grounding | YES | Sec 02.1, Sec 05.1.1 | ADEQUATE | No metaclass-to-VCDM mapping table; T11 coverage figure absent |
| C3 | Cross-layer constraints as graph predicates | YES | Sec 04.4, C1–C9 taxonomy, Refinery listings | STRONG | None |
| C4 | Automated consistency checking | YES | Sec 03.2 (mode definitions), Sec 04.4 (exercise), Sec 05.2 (benchmarks) | STRONG | None |
| C5 | Coverage validation vs W3C | YES | Sec 05.1.1 soundness-completeness framing | ADEQUATE | Soundness asserted not enumerated; T11 figure absent |
| C6 | Expressiveness vs EU regulatory | YES | Sec 05.1.2, eight ARF constraints classified | ADEQUATE | No expressiveness table rendered; T11 figure absent |
| C7 | Anti-pattern detection | YES | Sec 05.1.4, five anti-patterns with predicate mappings | ADEQUATE | "Known" anti-patterns not sourced from literature; no table rendered |
| C8 | Contradictory constraints (headline 1) | YES | Sec 05.1.3 with Refinery listing, G0–G7 sensitivity | STRONG | None |
| C9 | Multi-layer invisibility | YES | Sec 03 (preview), Sec 05.1.3–05.1.4, Sec 05.1.5 (baseline) | STRONG | None |
| C10 | Necessity argument | YES | Sec 05.1.4 (graduated visibility), Sec 07 (closing sentence) | ADEQUATE | Structural argument, not formal proof; calibration is correct |

**Summary:** All 10 claims delivered. Four STRONG, six ADEQUATE. The recurring gap across C2/C5/C6/C7 is the T11 figure set that would elevate prose-based arguments to visual evidence.

---

## 2. Decision Compliance Check

23 of 33 decisions are fully compliant. Non-compliant and partially compliant decisions:

| Decision | Compliant? | Violation / Drift | Location |
|----------|------------|-------------------|----------|
| #17 decision_sec03_overview_restructure | PARTIAL | Sec 3.3 Usage Workflow missing; absorbed into 3.2's final sentences | 03_overview.md |
| #18 decision_evaluation_measurement_schema | PARTIAL | Requires 2 full-width `figure*` diagrams; 0 present (1 commented out). Only tab:scalability exists | 05_evaluation.md:106–115 |
| #20 decision_formal_claims_required | PARTIAL | Three `::: {.formal}` stubs in Sec 02.3 remain unfilled (refinement ordering, propagation semantics, soundness/completeness) | 02_background.md:47–49, :85–87, :109–111 |
| #21 decision_soundness_completeness | PARTIAL | Guarantees stated informally (02_background.md:107) but formal statement is placeholder. Not reiterated in Sec 05 or Sec 07 as decision requires | 02_background.md:109–111 |
| #22 decision_core_disc_properties | PARTIAL | "Diverse" appears only in a footnote; "Realistic" never acknowledged as out of scope | 03_overview.md:38, missing elsewhere |
| #23 decision_range_proofs_future_work | **NO** | Zero mention of range proofs in any section file | 05_evaluation.md:127–131, 07_conclusion.md |
| #26 decision_fsl_elaboration | DEFERRED but defense text missing | Decision claims prose acknowledges FSL gap ("Unlike DCL and CSL...") and Sec 07 lists FSL maturity as limitation. Neither text exists in current draft | 04_approach.md:78, 07_conclusion.md |

---

## 3. Gap Analysis Integration Check

**Differentiation arguments executed in prose?** Yes. The related work (Sec 06) delivers differentiation across three tiers:
- Tier 1 (VC formalizations): "none operates across the boundary between domain-level claim semantics and format-specific representation capabilities" (06_related_work.md:13)
- Tier 2 (MDE-SSI): all four MDE-SSI works cited plus King (2017); "none defines a multi-layer metamodel or formalizes cross-layer constraints" (06_related_work.md:21)
- Tier 3 (multi-level modeling): "independently governed concern spaces" distinguished from standard instantiation-based layering (06_related_work.md:30)

**Novelty claim defended?** Partially. The closing gap statement (06_related_work.md:32) is a novelty-by-conjunction claim ("X + Y + Z has not been done before"). The Adversarial reviewer (Persona D) will identify this as the weakest form of novelty argument. The strongest structural defense — that independently governed layers are not instantiation layers — is present (06_related_work.md:30–31) but could be sharper.

**Two gaps in the defense:**
1. Missing Chechik/Famelis citations for partial model foundations (VENUE.md explicitly flags this as a mathematician reviewer expectation)
2. OCL comparison compressed to one sentence; does not explain why graph predicates are not reducible to OCL constraints

---

## 4. Reviewer Persona Attack Simulation

### Persona A — Champion (MDE-for-New-Domains Advocate)

**Predicted score: Weak Accept (leaning Accept)**

Top 3 concerns:
1. FSL layer lacks structural depth — weakens the "three independently governed layers" argument (Sec 04.3:76–91)
2. Single running example carries entire evaluation; generalizability question unanswered (Sec 05)
3. Necessity claim (C10) is structural argument, not formally established (Sec 07:12)

**Highest-impact fix:** Add one FSL-internal constraint (e.g., SD-JWT-VC disclosure granularity) that forces CSL restructuring, making the third layer load-bearing.

### Persona B — Mathematician (Graph Modeling / Partial Models Expert)

**Predicted score: Borderline (leaning Weak Reject)**

Top 3 concerns:
1. Three `::: {.formal}` stubs unfilled — refinement ordering, propagation semantics, soundness/completeness (02_background.md:47–49, :85–87, :109–111)
2. Four-valued semantics never exercised on headline results; no partial model worked example showing `unknown` → `error` propagation
3. `credential_statement` and `Root_cred_entity` called "shadow predicates" in prose (04_approach.md:54) but are `pred` in the Refinery model

**Highest-impact fix:** Fill the soundness/completeness formal stub (02_background.md:109–111) with a cited formal claim referencing Semerath et al.

### Persona C — Business Manager (MDE Practitioner / Generalist)

**Predicted score: Weak Accept (borderline)**

Top 3 concerns:
1. "Credential schema" never defined in Sec 02; Business Manager will conflate credential with credential schema throughout
2. Scalability evaluation uses synthetic uniform-structure instances (Sec 05.2); gap to real ecosystems not addressed
3. Baseline comparison is definitional ("no existing tool implements..."), not empirical; current design practice not described

**Highest-impact fix:** Add 2–3 sentences to baseline comparison (05_evaluation.md:70–72) describing current credential architect practice and what it misses.

### Persona D — Adversarial (Competing Formalism Advocate)

**Predicted score: Weak Reject**

Top 3 concerns:
1. Novelty-by-conjunction: "X + Y + Z has not been done before" (06_related_work.md:32). Diskin's multi-view consistency not structurally distinguished beyond domain instantiation
2. Tool dependency: metamodel presented entirely in Refinery syntax; no tool-independent presentation
3. FSL is five format classes with boolean capability predicates, no intra-layer constraints; "three-layer claim is aspirational, paper delivers two"

**Highest-impact fix:** Explicitly distinguish from Diskin et al.'s multi-view consistency framework on technical grounds, not just domain grounds.

---

## 5. Argument Flow Audit

### Argument Gaps (claims made but never supported)

| ID | Location | Description |
|----|----------|-------------|
| A1 | 00_abstract.md:24 | "Community-governed decentralized identity systems" promised as governance framework type but never analyzed anywhere in the paper |
| G2 | 05_evaluation.md:21 | Forward reference: "The significance of ARF-C7 for the metamodel's layered architecture is discussed in \autoref{sec:conclusion}" — conclusion never discusses ARF-C7. **Unfulfilled forward reference.** |

### Argument Orphans

| ID | Location | Description |
|----|----------|-------------|
| E3 | 04_approach.md:115 / 05_evaluation.md Sec 5.2 | DSE usage mode is narrated in approach and timed in evaluation, but no qualitative DSE result appears *in the evaluation*. The approach carries the evidence; the evaluation only measures speed. |

### Contradictions

None found. The paper is internally consistent on technical claims.

### Terminology Drift

No drift detected. DCL/CSL/FSL, "cross-layer constraints," "governance conflict," "predicate gap" used uniformly throughout.

---

## 6. Running Example Consistency

| Aspect | Consistent? | Detail |
|--------|-------------|--------|
| CSOK naming | YES | "housing subsidy" in body text, Hungarian name in footnote (03_overview.md:15) only. Minor: 01_introduction.md:10 uses "government housing subsidy" vs. decision's "family housing subsidy" |
| Three credentials | YES | Family status (civil registry), property (land registry), income (employer) — consistent across Sec 01, 03, 04, 05 |
| Domain properties | YES | Number of children, floor area, monthly income — consistent |
| Vertical constraint (headline 1) | YES | Income credential eIDAS/GDPR/VCDM conflict consistent across Sec 03:19, Sec 04:115, Sec 05:27–52, Sec 07:10 |
| Horizontal constraint (headline 2) | YES | Floor area cross-credential predicate gap consistent across Sec 03:19, Sec 04:145–169, Sec 05:54–64 |
| Format assignments | YES | SD-JWT-VC as representative per decision_mdoc_simplified; AnonCreds for predicate proofs. Consistent |
| Governance sources | YES (paper) / OVERPROMISED (abstract) | Paper analyzes eIDAS ARF, GDPR, W3C VCDM. Abstract additionally promises "community guidelines" (00_abstract.md:24) which are never analyzed |
| Notation | YES | Refinery syntax consistent; `[term]{.refi}` spans used throughout |

---

## 7. Prose-Model Consistency

From S04 audit, comparing Sec 04 descriptions against `vc_metamodel.refinery`:

| # | Severity | Discrepancy | Prose location | Model location |
|---|----------|-------------|----------------|----------------|
| 1 | **CRITICAL** | `conforms_vcdm`: prose table says mdoc=NO; model says mdoc=YES | 04_approach.md:84 (tab:format_capabilities) | vc_metamodel.refinery:222–226 |
| 2 | **CRITICAL** | `supports_offline_verification`: prose table says mdoc-only; model says AnonCreds+JSON-LD+mdoc | 04_approach.md:86 | vc_metamodel.refinery:233–236 |
| 3 | **HIGH** | `credential_statement` and `Root_cred_entity` called "shadow predicates" in prose but defined as `pred` (not `shadow pred`) in model | 04_approach.md:54–60 | vc_metamodel.refinery:116, :136 |
| 4 | **MEDIUM** | "Five predicates" claimed at 04_approach.md:70 but only four described in prose | 04_approach.md:70 | — |
| 5 | **LOW** | `common_parent` described as "in supplementary material" but exists in vc_metamodel.refinery | 04_approach.md:148 | vc_metamodel.refinery:183–189 |
| 6 | **LOW** | `Leaf` predicate exists in model but undescribed in prose | — | vc_metamodel.refinery:41 |

Items 1–2 are **submission-blocking** if the model is the source of truth: the governance conflict logic depends on which formats conform to VCDM and support offline verification. Whichever is wrong (table or model) must be corrected.

---

## 8. Unresolved Markers Census

| Marker type | Count | Critical? | Sections |
|-------------|-------|-----------|----------|
| `.formal` | 3 | **YES — renders in PDF unless annotations.lua strips them** | 02_background.md:47–49, :85–87, :109–111 |
| `.todo` | 0 | — | — |
| `.cite` | 0 | — | — |
| `.scaffold` | 0 | — | — |
| `.figure` | 0 | — | — |
| `.meta` | 0 | — | — |
| `\Description{}` placeholder | 1 | **YES — ACM rejects without alt-text** | 03_overview.md:29 (teaser figure) |

**Critical question:** Do the three `.formal` divs render visibly in submission-mode PDF? If `annotations.lua` does NOT strip `.formal` class divs, "Oscar: refinement ordering definition..." will appear in the final document. **Verify before submission.**

---

## 9. Cross-Reference Integrity

**All `\autoref{}` references resolve.** No broken cross-references found (X04 verified all targets).

**Unfulfilled forward reference:**
- 05_evaluation.md:21 references `\autoref{sec:conclusion}` for ARF-C7 significance discussion that does not exist in the conclusion.

**Labels defined but never referenced (notable):**
- `tab:format_capabilities` (04_approach.md:89) — capability matrix table never cross-referenced from outside Sec 04.3
- `tab:constraint_taxonomy` (04_approach.md:111) — constraint taxonomy table never cross-referenced from outside Sec 04.4
- `sec:dcl`, `sec:fsl` — subsection labels never used in autorefs

**Commented-out label:**
- `fig:scalability` (05_evaluation.md:112) — inside HTML comment; figure removed

---

## 10. Critical Path to Submission

### BLOCKERS (must fix before submission)

| # | Task | Target file | Effort | Addresses | Priority |
|---|------|-------------|--------|-----------|----------|
| B1 | **Verify `.formal` divs are stripped by annotations.lua in submission mode.** If not, three "Oscar:..." placeholder texts will appear in the PDF. Fix: either fill them, strip them manually, or confirm filter handles it. | 02_background.md:47–49, :85–87, :109–111 | 5 min (check) / 15 min (manual strip) | Mathematician (B), all reviewers | BLOCKER |
| B2 | **Fill `\Description{Teaser figure description.}` placeholder.** ACM submission rejects without figure alt-text. | 03_overview.md:29 | 5 min | Submission compliance | BLOCKER |
| B3 | **Fix `conforms_vcdm` discrepancy: table says mdoc=NO, model says mdoc=YES.** One is wrong. If the model is wrong, the governance conflict proof may be affected. Determine ground truth and fix. | 04_approach.md:84 vs. vc_metamodel.refinery:222–226 | 10–15 min | C8 (headline 1), Mathematician (B) | BLOCKER |
| B4 | **Fix `supports_offline_verification` discrepancy: table says mdoc-only, model says AC+JLD+mdoc.** Same issue. | 04_approach.md:86 vs. vc_metamodel.refinery:233–236 | 10 min | Model integrity, Mathematician (B) | BLOCKER |
| B5 | **Remove unfulfilled forward reference to conclusion discussing ARF-C7.** Either delete the forward reference at 05_evaluation.md:21 or add one sentence to the conclusion about ARF-C7's significance. Deletion is safer given deadline. | 05_evaluation.md:21 | 3 min | Argument integrity | BLOCKER |

### HIGH-VALUE FIXES (significant reviewer impact, feasible in hours)

| # | Task | Target file | Effort | Addresses | Priority |
|---|------|-------------|--------|-----------|----------|
| H1 | **Fix "shadow predicate" misclassification.** `credential_statement` and `Root_cred_entity` are `pred` in model, not `shadow pred`. Change prose at 04_approach.md:54 to "two derived predicates" or similar. | 04_approach.md:54–60 | 5 min | Mathematician (B) | HIGH |
| H2 | **Fix "five predicates" count.** Only four described. Either describe the fifth or change to "four." | 04_approach.md:70 | 3 min | Mathematician (B) | HIGH |
| H3 | **Add Chechik/Famelis citations to Related Work.** VENUE.md explicitly flags this as a mathematician reviewer expectation. Add to Sec 06.3 near the Refinery/partial-model discussion. | 06_related_work.md:27 | 10 min | Mathematician (B) | HIGH |
| H4 | **Add range proofs future work mention.** Decision #23 is the only outright NO. One sentence in Sec 05.4. | 05_evaluation.md:127–131 | 3 min | Decision compliance | HIGH |
| H5 | **Remove "community guidelines" from abstract or scope it.** The abstract promises governance source diversity the paper does not deliver. Either delete "community guidelines" or add "such as" to make the list illustrative not exhaustive. | 00_abstract.md:24 | 3 min | Argument integrity, Adversarial (D) | HIGH |
| H6 | **Add one sentence for CORE-DISC "Realistic" out-of-scope acknowledgment.** | 05_evaluation.md:123–125 | 3 min | Decision compliance (#22) | HIGH |
| H7 | **Fill soundness/completeness formal stub** (02_background.md:109–111) with a cited formal claim referencing Semerath et al. 2018. Even 2–3 sentences would satisfy the mathematician. This is the single most damaging unfixed issue across all reviewer personas per X03. | 02_background.md:109–111 | 15–20 min | Mathematician (B), Claims C4/C9/C10 | HIGH |

### ACCEPTABLE RISKS (noted but not worth fixing given deadline)

| # | Issue | Why acceptable |
|---|-------|---------------|
| A1 | Abstract champion argument ends on evaluation metrics, not modeling insight (S00) | The submitted abstract (already locked) has a stronger closing. Current version is adequate. |
| A2 | Sec 3.3 Usage Workflow missing (decision #17) | Content absorbed into 3.2's final sentences. Decision itself notes this is "most compressible." |
| A3 | Missing 2 scalability diagrams (decision #18) | Table substitute is adequate for 10-page paper. Page budget is tight (~9.8 pages). |
| A4 | Remaining two `.formal` stubs (refinement ordering, propagation semantics) | If stripped by filter, invisible. If H7 (soundness/completeness) is filled, the mathematician has an anchor. |
| A5 | "Known anti-patterns" not sourced from literature (C7) | The anti-patterns are derivable from the metamodel. Defensible as "structural anti-patterns." |
| A6 | DSE usage mode qualitative evaluation lives in approach, not evaluation (E3) | Architectural choice; scalability measurement in evaluation covers the quantitative angle. |
| A7 | OCL comparison too compressed in Related Work | One sentence is present; expanding risks page budget. |
| A8 | T11 figures (coverage, expressiveness, anti-pattern) absent | These would elevate ADEQUATE claims to STRONG, but producing them under deadline pressure risks errors. |
| A9 | Four-valued vs. three-valued Refinery characterization (S02) | Sec 02 cites Belnap (four-valued); VENUE.md says "3-valued." Both may be correct (Refinery extends). Flag for rebuttal if raised. |
| A10 | FSL defense text weaker than decision_fsl_elaboration prescribes | The decision is deferred; current factual statement at 04_approach.md:78 is honest. Strengthening risks overclaiming. |
| A11 | `common_parent` location mismatch (prose says supplementary, model has it) | Low reviewer impact. |

### CUT CANDIDATES (content that hurts more than it helps)

| # | Content | Rationale |
|---|---------|-----------|
| X1 | "community-governed decentralized identity systems" in abstract (00_abstract.md:24) | Overpromises governance source diversity the paper does not deliver. Remove or soften to "such as." |
| X2 | Forward reference "discussed in \autoref{sec:conclusion}" for ARF-C7 (05_evaluation.md:21) | Conclusion does not deliver. Cut the forward reference rather than expanding the conclusion. |

---

### Execution Order (by impact/effort ratio)

**Phase 1 — Blockers (30 min total):**
1. B1: Check annotations.lua filter behavior on `.formal` divs (5 min)
2. B2: Fill teaser `\Description{}` (5 min)
3. B3 + B4: Resolve capability table vs. model discrepancies (15 min)
4. B5: Remove ARF-C7 forward reference (3 min)

**Phase 2 — High-value quick fixes (20 min total):**
5. H1: Fix shadow predicate misclassification (5 min)
6. H2: Fix "five predicates" count (3 min)
7. H4: Add range proofs future work sentence (3 min)
8. H5: Fix abstract community guidelines overpromise (3 min)
9. H6: Add CORE-DISC Realistic acknowledgment (3 min)

**Phase 3 — High-value medium fixes (30 min total):**
10. H3: Add Chechik/Famelis citations (10 min)
11. H7: Fill soundness/completeness formal stub (20 min)

**Total estimated effort for all non-acceptable-risk items: ~80 minutes.**
