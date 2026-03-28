# Z01: Review Synthesis

**Generated:** 2026-03-27 | **Deadline:** 2026-03-29 AoE (~1.5 days) | **Mode:** Emergency

---

## 1. Paper Status Summary

The paper's qualitative argument is strong: a well-structured three-layer metamodel, two compelling headline results (governance conflict, cross-credential predicate gap), and honest scoping. However, the entire quantitative evaluation axis is empty (28 TBD cells in scalability, 8 TBD in sensitivity, no RQ answers), the coverage fraction in the conclusion is literal "TBD," several key figures are placeholders, and the FSL layer invites an "incomplete third layer" attack. Predicted outcome as-is: **weak reject** (split decision, 2-1 against). With scalability data populated, figures produced, and prose fixes applied: **borderline accept** (2-2 split, champion-dependent).

---

## 2. Strategic Decisions

### Decision A: Scalability Section — Complete or Cut?

- **Option A (Complete):** Run `./run_measurements.sh all` (~45-60 min compute), populate tables, draft RQ answer paragraph. Total effort: 2-3 hours including table-filling. Infrastructure exists and is tested. This is the single highest-impact action.
- **Option B (Cut):** Remove Sec 5.2 entirely. Also remove scalability claims from abstract, intro structure paragraph, evaluation preamble, and conclusion. Saves ~0.7 pages. Paper becomes qualitative-only evaluation.
- **Recommendation: Option A.** The measurement infrastructure is built, instances are generated, scripts are tested. Cutting after promising quantitative evaluation is worse than never promising it. The advisor expects scalability numbers (MODELS 2020 exemplar has them). Even partial data (5-6 scale points) transforms the validation rating from 2/5 to 3-4/5.

### Decision B: FSL Maturity — Reframe or Expand?

- **Option A (Reframe only):** Replace "less mature" with a precise scope statement: FSL carries capability predicates and governance annotations sufficient for cross-layer constraint detection; format-internal structural constraints are orthogonal to this contribution. ~15 min.
- **Option B (Reframe + add one FSL constraint):** In addition to reframing, add one format-internal structural constraint (e.g., SD-JWT-VC hash-based disclosure structure) to demonstrate the FSL is a real layer, not a lookup table. ~1-2 hours including verification.
- **Recommendation: Option A.** At 1.5 days to deadline, expanding the FSL formalization risks introducing errors. The reframing is sufficient: the FSL's role is to carry capability predicates into cross-layer constraints, and the headline results depend on exactly this. The limitation is already honestly acknowledged.

### Decision C: Multi-Level vs. Multi-Layer Terminology

- **Option A (Keep "multi-level"):** Acknowledge the departure from standard instantiation-based multi-level modeling in Sec 2.2 and 6.3. Add 2-3 sentences distinguishing. Risk: Reviewer D still attacks the framing mismatch.
- **Option B (Switch to "multi-layer"):** Replace "multi-level" with "multi-layer" throughout (title, abstract, intro, approach, related work). Acknowledge Atkinson/Kuhne but frame the layering as trace-connected concern spaces, not instantiation levels. Significant search-replace operation.
- **Recommendation: Option A.** Changing the title and framing at 1.5 days is risky. The term "multi-level metamodeling" is in the title, abstract registration, and throughout the paper. Adding a precise distinction paragraph is safer than a global rename. The distinction *is* the defense: our layers are independently governed concern spaces, not instantiation levels, and that is what makes cross-layer constraints interesting.

---

## 3. Triage Table

| ID | Issue | Severity | Source Agents | Sections | Category |
|---|---|---|---|---|---|
| T01 | Scalability tables entirely TBD (28+8 cells) | CRITICAL | S05a, S05b, X01, X02, X03, X04 | 05 | DATA_FIX |
| T02 | Conclusion coverage fraction is literal "TBD" | CRITICAL | S07, X01, X02, X04 | 07, 05 | DATA_FIX |
| T03 | `\citep` instead of `[@...]` in Sec 05 | CRITICAL | X04 | 05 | PROSE_FIX |
| T04 | Double-blind self-citation phrasing in Sec 06 | CRITICAL | X04 | 06 | PROSE_FIX |
| T05 | Abstract "no existing tool" — universal negative overclaim | CRITICAL | S00, S01, S03, X02 | 00, 01, 03 | PROSE_FIX |
| T06 | Abstract "prerequisite" — necessity overclaim | CRITICAL | S00, X02, X03 | 00 | PROSE_FIX |
| T07 | Acyclicity claimed but not implemented in Refinery | CRITICAL | S04a, S04c, X02 | 04 | DATA_FIX |
| T08 | @TODO markers visible in PDF output | CRITICAL | X04 | 01, 02, 04, 05 | PROSE_FIX |
| T09 | FSL "less mature" admission without defense | IMPORTANT | S04c, X01, X03, X04 | 04 | PROSE_FIX |
| T10 | Gap claim in intro not scoped to C5 correction | IMPORTANT | S01, S03, X02 | 01, 03 | PROSE_FIX |
| T11 | Missing partial model community citations (Chechik, Famelis) | IMPORTANT | S06, X03 | 06 | PROSE_FIX |
| T12 | No Alloy/OCL differentiation in related work | IMPORTANT | S06, X03 | 06 | PROSE_FIX |
| T13 | `statement` predicate definition imprecise | IMPORTANT | S04a, X03 | 04 | PROSE_FIX |
| T14 | Subject inference rule informal | IMPORTANT | S04a | 04 | PROSE_FIX |
| T15 | Trace mapping definition imprecise (CSL) | IMPORTANT | S04b | 04 | PROSE_FIX |
| T16 | Six FSL derived predicates undefined in body | IMPORTANT | S04c, X03 | 04 | PROSE_FIX |
| T17 | Governance annotation classes structurally opaque | IMPORTANT | S04c | 04 | PROSE_FIX |
| T18 | No explicit novelty defense paragraph | IMPORTANT | S04c, X03 | 04 | PROSE_FIX |
| T19 | Introduction P2 overloaded — needs splitting | IMPORTANT | S01 | 01 | STRUCTURAL |
| T20 | Contribution C3 does not preview headline results | IMPORTANT | S01, X01 | 01 | PROSE_FIX |
| T21 | C2 conflates formalization with usage modes | IMPORTANT | S01 | 01 | PROSE_FIX |
| T22 | Introduction P4 redundant with contribution list | IMPORTANT | S01 | 01 | PROSE_FIX |
| T23 | "Open-world assumption" imprecise for Refinery | IMPORTANT | S02 | 02 | PROSE_FIX |
| T24 | No tool justification in Sec 2.3 (why not Alloy?) | IMPORTANT | S02, S06 | 02 | PROSE_FIX |
| T25 | Background 2.2 conflates background with design choices | IMPORTANT | S02 | 02 | STRUCTURAL |
| T26 | Usage modes in 3.2 insufficiently precise | IMPORTANT | S03 | 03 | PROSE_FIX |
| T27 | "information graphs" undefined in abstract | IMPORTANT | S00 | 00 | PROSE_FIX |
| T28 | Coverage table missing (figure placeholder only) | IMPORTANT | S05a, X01, X02, X03 | 05 | DATA_FIX |
| T29 | Partially-expressible constraints under-analyzed | IMPORTANT | S05a, X02 | 05 | PROSE_FIX |
| T30 | Novelty defense in Sec 6.3 is assertion not argument | IMPORTANT | S06, X03 | 06 | PROSE_FIX |
| T31 | Teaser figure placeholder (no actual figure) | IMPORTANT | X04 | 01 | DATA_FIX |
| T32 | Sensitivity experiment claims results with TBD data | IMPORTANT | X02 | 05 | PROSE_FIX |
| T33 | Cutcandidate governance paragraph should be kept | IMPORTANT | S02 | 02 | STRUCTURAL |
| T34 | CSOK naming: "government" not "family" in Sec 3.1 | POLISH | S03, X04 | 03 | PROSE_FIX |
| T35 | 3.3 workflow previews Sec 04.4 worked example | POLISH | S03 | 03 | PROSE_FIX |
| T36 | `non_connected` and `no_self_loop` need semi-formal defs | POLISH | S04a | 04 | PROSE_FIX |
| T37 | Entity alignment introduced before defined | POLISH | S04b | 04 | PROSE_FIX |
| T38 | Anti-patterns: sharpen graduated-visibility argument | POLISH | S05a | 05 | PROSE_FIX |
| T39 | NAIH paragraph could be trimmed ~30% | POLISH | S05a | 05 | PROSE_FIX |
| T40 | SNARK row in format table is distraction | POLISH | S05a | 05 | PROSE_FIX |
| T41 | Baseline comparison does not close the loop | POLISH | S05a | 05 | PROSE_FIX |
| T42 | Structure paragraph too long | POLISH | S01 | 01 | PROSE_FIX |
| T43 | Running example not named in intro prose | POLISH | S01, X01 | 01 | PROSE_FIX |
| T44 | Preamble "derived from" → "traced to" | POLISH | S04a | 04 | PROSE_FIX |
| T45 | "Supplementary material" refrain (7 occurrences) | POLISH | S04c | 04 | PROSE_FIX |
| T46 | Compound future work direction in conclusion | POLISH | S07 | 07 | PROSE_FIX |
| T47 | Conclusion missing anti-pattern mention | POLISH | S07 | 07 | PROSE_FIX |
| T48 | Soundness-completeness terminology non-standard | POLISH | X03 | 05 | PROSE_FIX |
| T49 | Potency introduced but never used | POLISH | S02 | 02 | PROSE_FIX |
| T50 | BBS+ predicate proof claim lacks citation | POLISH | S02 | 02 | PROSE_FIX |
| T51 | Multi-level vs. multi-viewpoint framing unaddressed | POLISH | X03 | 02, 06 | STRATEGIC |

---

## 4. Prioritized Action List

Ordered by impact-per-hour given ~1.5 day deadline.

| Rank | ID | Action | Effort | Dependency | Who |
|---|---|---|---|---|---|
| 1 | T01 | Run measurements, populate scalability + sensitivity tables | 3h (1h compute + 2h fill) | Docker + Refinery CLI | Martin (run), Claude (fill tables) |
| 2 | T03 | Fix `\citep` → `[@...]` | 2 min | None | Claude |
| 3 | T04 | Fix double-blind self-citation | 5 min | None | Claude |
| 4 | T08 | Strip all submission-blocking @TODO/@FORMAL/@FIGURE markers | 30 min | None | Claude |
| 5 | T02 | Fill TBD coverage fraction in conclusion | 15 min | T28 (coverage table) | Claude |
| 6 | T05+T06 | Fix abstract overclaims ("no existing tool", "prerequisite") | 15 min | None | Claude |
| 7 | T07 | Resolve acyclicity: soften claim or implement constraint | 15 min (soften) / 1h (implement) | None | Martin (implement) or Claude (soften) |
| 8 | T09 | Reframe FSL maturity as scope boundary | 15 min | None | Claude |
| 9 | T10 | Scope gap claim in intro + overview to C5 correction | 15 min | None | Claude |
| 10 | T18 | Add novelty defense paragraph in Sec 4.4 | 15 min | None | Claude |
| 11 | T11+T12 | Add Chechik/Famelis citations + Alloy/OCL differentiation | 20 min | None | Claude |
| 12 | T13+T14+T15 | Tighten DCL/CSL formal definitions | 30 min | None | Claude |
| 13 | T16+T17 | Define 2 key FSL predicates + governance annotations | 20 min | None | Claude |
| 14 | T28 | Create coverage mapping table | 45 min | None | Claude |
| 15 | T31 | Produce teaser figure (even rough Excalidraw) | 1-2h | None | Martin |
| 16 | T19-T22 | Introduction restructuring (split P2, strengthen C3, compress P4) | 45 min | None | Claude |
| 17 | T23+T24 | Fix Refinery semantics description + tool justification | 15 min | None | Claude |
| 18 | T26 | Add operational definitions to usage modes in 3.2 | 10 min | None | Claude |
| 19 | T27 | Fix "information graphs" in abstract | 5 min | None | Claude |
| 20 | T30 | Strengthen novelty defense in Sec 6.3 | 10 min | None | Claude |
| 21 | T29+T32 | Name partially-expressible constraints + fix sensitivity claim | 10 min | None | Claude |
| 22 | T34-T50 | All POLISH items (batch) | 45 min | None | Claude |

---

## 5. Kill List

| Section/Element | Cut? | Cost of Keeping | Cost of Cutting | Recommendation |
|---|---|---|---|---|
| Sec 5.2 (Scalability) | CUT only if measurements fail | 3h to complete | Breaks promise in abstract/intro; validation drops to 2/5; adversarial reviewer gains ammunition | **KEEP if measurements can run. Cut only as last resort.** |
| fig_teaser placeholder | CUT marker if figure not produced | Score cost: first-impression weakened | Removing the @FIGURE marker is trivial; paper works without teaser | **Produce if possible; strip marker if not** |
| fig_functional_overview | CUT marker | Nice-to-have but prose covers it | No argument loss | **Strip marker** |
| fig_coverage_table | CONVERT to inline Markdown table | 45 min to build the table | Coverage claim weakened | **Build as Markdown table, not designed figure** |
| fig_expressiveness_table | Already served by Table 1 | None | None | **Strip marker (redundant)** |
| fig_antipattern_table | Already served by inline table | None | None | **Strip marker (redundant)** |
| fig_constraint_taxonomy | Constraint table is already inline | None | None | **Strip marker** |
| fig_generated_model | Optional visualization | None | None | **Strip marker** |
| .cutcandidate in Sec 2.1 (governance para) | KEEP | Worth the space — anchors eIDAS/GDPR interaction | Sec 03 must re-introduce GDPR | **Keep; remove cutcandidate wrapper** |
| .cutcandidate in Sec 6.1 (Mazzocca, Garcia-Rodriguez) | CUT | Breadth without differentiation | Frees 2-3 lines for missing citations | **Cut to make room for T11+T12** |

---

## 6. Top Fix Prompts

### Prompt 1: Emergency Submission Blockers (Mechanical)

**Target files:** `sections/05_evaluation.md`, `sections/06_related_work.md`, `sections/07_conclusion.md`, all section files
**Goal:** Fix all mechanical submission-blocking issues in one pass.
**Read first:** `prompts/2026-03-27_section_reviews/X04_decision_cfp_compliance.md` (marker inventory)
**Constraints:** No argument changes. Purely mechanical fixes.

**Instructions:**
1. In `sections/05_evaluation.md` line 79: Replace `\citep{rosenberg_zk-creds_2023}` with `[@rosenberg_zk-creds_2023]`.
2. In `sections/06_related_work.md`: Rewrite self-citation to clean third person: "A prior short paper [@farkas_prolog-based_2024] applied Refinery to credential schema validation with a single-layer prototype. The present metamodel extends that approach to three layers with formalized cross-layer constraints."
3. Strip all @TODO markers that would render as `\todo{}` in PDF. Specifically remove: Sec 01 lines 13, 17; Sec 02 line 27; Sec 04 lines 17, 23, 113, 117; Sec 05 line 62. For Sec 04 line 25 (acyclicity): soften the prose claim to "connected information graph with tree-structured containment" and remove the @TODO.
4. Strip @FIGURE placeholders that will not be filled: fig_coverage_table (unless Martin builds it), fig_expressiveness_table, fig_antipattern_table, fig_constraint_taxonomy, fig_generated_model. Keep fig_teaser and fig_functional_overview only if Martin confirms production.
5. Strip @FORMAL markers at Sec 04 lines 17, 23.
6. In `sections/07_conclusion.md`: Replace "TBD VCDM 2.0 concepts" with "the core structural concepts of VCDM 2.0 relevant to credential schema design" (qualitative fallback; replace with actual fraction if coverage table is built).

**Acceptance criteria:** `grep -r "@TODO\|@FORMAL\|@FIGURE\|\\citep\|TBD" sections/` returns zero matches in submission-visible text (markers inside `%% ... %%` that pandoc strips are acceptable only if confirmed to be stripped).

---

### Prompt 2: Abstract + Introduction Overclaim Fixes

**Target files:** `sections/00_abstract.md`, `sections/01_introduction.md`
**Goal:** Fix overclaims, scope gap claim, strengthen contribution list, compress redundancy.
**Read first:** `sections/00_abstract.md`, `sections/01_introduction.md`, `context/DECISIONS.md` (C5 correction), `prompts/2026-03-27_section_reviews/S00_abstract_title.md`, `prompts/2026-03-27_section_reviews/S01_introduction.md`
**Constraints:** Preserve all 10 binding claims. Stay within 1.25-page intro budget. No LLM tells. Match existing register.

**Instructions:**
1. **Abstract "no existing tool" (T05):** Replace with "yet no formal framework captures their cross-layer interactions or checks their joint consistency."
2. **Abstract "prerequisite" (T06):** Replace final sentence with: "These results demonstrate that multi-layer formal modeling reveals credential ecosystem design errors invisible to single-layer approaches."
3. **Abstract "information graphs" (T27):** Replace "as information graphs" with "as typed graph structures" or drop the prepositional phrase.
4. **Abstract "surfaces" (X02 H-3):** Replace "surfaces two cross-layer design errors" with "demonstrates detection of two cross-layer design errors."
5. **Intro gap claim (T10):** Replace "yet no integrated formal model captures these cross-layer constraints" with scoped version matching C5 correction: "yet no multi-level formalization captures the cross-layer constraints spanning domain semantics, credential structure, and format-specific representation."
6. **Intro P2 split (T19):** Split into P2a (cross-source interaction + income example with 2-3 sentences) and P2b (tool gap).
7. **C3 headline preview (T20):** Add result preview: evaluation surfaces two cross-layer errors (governance conflict, format expressiveness gap) undetectable by single-layer analysis.
8. **C2 cleanup (T21):** Remove "supporting consistency checking, error identification, and design space exploration" — usage modes belong in Sec 3.2.
9. **P4 compression (T22):** Cut redundant restatement of layers. Keep only new info (layer names, Refinery generation mechanism). Add running example anchor + teaser figure reference.
10. **Structure paragraph (T42):** Compress to 4-5 sentences.

**Acceptance criteria:** No universal negative claims. Final abstract sentence claims sufficiency not necessity. "Information graphs" absent. All 10 binding claims still present. Intro fits ~7 paragraphs + contribution list.

---

### Prompt 3: Approach Section Formalization Pass

**Target files:** `sections/04_approach.md`
**Goal:** Tighten formal definitions in DCL, CSL, and FSL to satisfy Reviewer B. Reframe FSL. Add novelty defense.
**Read first:** `sections/04_approach.md`, `sections/02_background.md` (Refinery mechanisms), `context/DECISIONS.md`, reviews S04a, S04b, S04c.
**Constraints:** No code listings. Obsidian Markdown + Mathpix math. Do not exceed ~3.0 page budget for full approach section. Net growth <= 10 lines.

**Instructions:**
1. **DCL `statement` predicate (T13):** Define compositionally: $\text{statement}(s, p, v) \iff \text{property}(s, p) \wedge \text{value}(p, v)$. State $s \neq v$ as separate constraint cross-referencing `no_self_loop`.
2. **Subject inference (T14):** Add semi-formal: $\forall e : \text{Entity}.\ (\nexists p : \text{Prop}.\ \text{value}(p, e)) \implies e : \text{Subject}$.
3. **CSL trace mapping (T15):** Distinguish containment (Prop owns Claim) from trace reference (CredEntity::trace -> Entity). State multiplicities.
4. **CSL propagation rules (S04b Issue 2):** Add "sets CredentialSubject(ce) to *must* in the three-valued interpretation" for at least one rule.
5. **Entity alignment forward reference (T37):** Add forward-ref sentence before first use of `aligned` in CSL table.
6. **FSL maturity reframe (T09):** Replace "less mature" with scope statement per Decision A above.
7. **Define 2 key FSL predicates (T16):** `supports_predicate_proof` and `supports_multi_credential_proof` in math notation. 2-3 sentences.
8. **Governance annotations (T17):** One paragraph defining GovernanceAnnotation abstract metaclass, three subclasses, attachment via containment, consumption by error predicates.
9. **Novelty defense (T18):** Add 2-3 sentences at end of cross-layer subsection distinguishing from standard multi-level metamodeling: independent governance sources, shadow predicates for ecosystem-level properties, bidirectional layer interaction.
10. **Acyclicity (T07):** Soften "connected, acyclic" to "connected information graph with tree-structured containment" and remove @TODO.
11. **Move fig_metamodel** to after preamble, before DCL heading.
12. **Consolidate "supplementary material" (T45):** One statement at section opening; shorten or remove subsequent occurrences.

**Acceptance criteria:** `statement` predicate has compositional definition. Subject inference has semi-formal definition. CSL trace mechanisms distinguished. FSL no longer says "less mature." At least 2 FSL predicates defined in body. Novelty defense paragraph present. Zero @TODO/@FORMAL markers remain.

---

### Prompt 4: Evaluation Elaboration Polish

**Target files:** `sections/05_evaluation.md` (lines 1-113 only, elaboration subsection)
**Goal:** Polish headline results, fix minor issues, remove stale markers.
**Read first:** `sections/05_evaluation.md`, review S05a.
**Constraints:** Do not touch Sec 5.2 (scalability) — that requires measurement data. No code listings.

**Instructions:**
1. **Headline 1 @TODO (line 62):** Replace with forward reference to sensitivity experiment: "The constraint sensitivity experiment (\autoref{tab:sensitivity}) formally confirms this: configuration G7 is the only unsatisfiable configuration among all $2^3$ subsets."
2. **NAIH trimming (T39):** Compress ~30%. Keep: bank fined, pregnancy booklet example, NAIH finding. Cut medical detail.
3. **SNARK row (T40):** Move from main table to footnote.
4. **Partially-expressible constraints (T29):** Name them: "ARF-C2, C3, C5 require attestation-type subtyping; ARF-C6, C8 require per-claim privacy annotation."
5. **Anti-patterns graduated visibility (T38):** Add: "The three intra-layer predicates establish that the metamodel subsumes standard structural well-formedness checking."
6. **Baseline loop closure (T41):** Add: "The headline results provide concrete evidence: both conflicts are grounded in cited regulatory sources yet undetectable by any of these baselines."
7. **Strip redundant @FIGURE markers:** fig_expressiveness_table, fig_antipattern_table.
8. **Fix sensitivity experiment present-tense (T32):** Change "confirms" to "is designed to confirm" until data is populated.

**Acceptance criteria:** Zero @TODO in lines 1-113. At most 1 @FIGURE remaining (coverage table). SNARK row in footnote. Partially-expressible constraints named inline.

---

### Prompt 5: Related Work + Background Patch

**Target files:** `sections/06_related_work.md`, `sections/02_background.md`
**Goal:** Address critical citation gaps, tool justification, and precision issues.
**Read first:** Reviews S02, S06. `context/DECISIONS.md`.
**Constraints:** Related work budget: 0.75 pages. Background budget: 1.25 pages. Double-blind compliance.

**Instructions for Sec 06:**
1. **Cut both .cutcandidate spans** (Mazzocca survey, Garcia-Rodriguez + Schardong) to free space.
2. **Add partial model citations (T11):** Cite Chechik and Devereux (2003), Famelis et al. (2012). Differentiate: partiality here = incomplete credential designs, not behavioral specs or requirements.
3. **Add Alloy/OCL differentiation (T12):** Alloy = bounded model finding without partial model semantics. OCL on multi-level metamodels = fully instantiated models, no three-valued evaluation.
4. **Strengthen novelty defense (T30):** After "independently governed concern spaces," add clause: "where constraints originate from normative sources (W3C, EU regulations, national privacy law) that impose requirements independently and may formally conflict."
5. **Fix self-citation third person (T04):** Already covered in Prompt 1 but verify.

**Instructions for Sec 02:**
6. **Fix "open-world assumption" (T23):** Replace with: constraints evaluated over partial interpretations; violation confirmed only when error predicate evaluates to *must* (holds under every possible refinement).
7. **Add tool justification (T24):** 1-2 sentences before Refinery intro: alternative model finders (Alloy, USE/OCL) operate on fully specified models; partial graph modeling needed because credential designs are inherently incomplete.
8. **Keep governance paragraph (T33):** Remove cutcandidate wrapper.
9. **Split Sec 2.2 paragraph 2 (T25):** Move Ecore-style notation, partial model characterization, trace details to Sec 04. Keep only general claim in 2.2.

**Acceptance criteria:** Chechik and Famelis cited. Alloy/OCL differentiated. "Open-world assumption" absent. Governance paragraph kept. No .cutcandidate spans remain.

---

### Prompt 6: Scalability Data Population (post-measurements)

**Target files:** `sections/05_evaluation.md` (lines 115-187), `sections/07_conclusion.md`
**Goal:** Populate scalability and sensitivity tables with measurement data. Draft RQ answers. Polish threats.
**Read first:** All JSON files in `models/evaluation/results/`, `models/evaluation/results/environment.json`, review S05b.
**Constraints:** Do not change experimental design. Maintain Obsidian Markdown.
**Prerequisite:** Martin has run `./models/evaluation/run_measurements.sh all` and results exist.

**Instructions:**
1. Read all measurement JSON files. Extract mean +/- stddev per configuration.
2. Fill scalability table (lines 129-144): all TBD cells with actual data. Mark Generation as "---" for UNSAT rows.
3. Fill sensitivity table (lines 156-165): SAT/UNSAT per G0-G7 configuration.
4. Fill hardware spec @TODO (line 123) from environment.json.
5. Fill node counts (line 121) from instance files.
6. Draft RQ answer paragraph (line 150): state observed scaling pattern, key insight about consistency vs. concretizability.
7. Polish threats (lines 169-187): change "we expect" to "we observe" with actual patterns.
8. Update conclusion coverage fraction if coverage table is available.

**Acceptance criteria:** Zero TBD cells in scalability or sensitivity tables. RQ answer paragraph drafted. Hardware spec filled. Node counts filled.

---

### Prompt 7: Overview + Conclusion Minor Fixes

**Target files:** `sections/03_overview.md`, `sections/07_conclusion.md`
**Goal:** Fix naming, precision, and minor gaps.
**Read first:** Reviews S03, S07.
**Constraints:** Minimal edits. Do not restructure.

**Instructions for Sec 03:**
1. **CSOK naming (T34):** Change "a government housing subsidy" to "a family housing subsidy" in first sentence.
2. **Usage modes precision (T26):** Add operational parentheticals per mode: consistency checking = all error predicates false; error identification = at least one satisfied with binding; exploration = generates completions or proves none exists.
3. **Gap claim tightening (T10):** Replace "no existing tool or methodology" with survey-backed scoped claim matching C5 correction. Merge with survey citations. Drop "to the best of our knowledge."
4. **Workflow trimming (T35):** Remove restructuring detail from 3.3 (belongs in Sec 04.4).

**Instructions for Sec 07:**
5. **Split compound future work (T46):** Separate empirical case study from portability investigation.
6. **Add anti-pattern mention (T47):** Brief clause referencing anti-pattern detection alongside headline results in P2.
7. **Add scalability limitation (S07 Issue 3):** Brief note acknowledging scalability ceiling after evaluation data is available.

**Acceptance criteria:** "family housing subsidy" in first sentence. Each usage mode has operational parenthetical. No "to the best of our knowledge." Future work has 4 distinct directions. Anti-patterns mentioned in conclusion P2.
