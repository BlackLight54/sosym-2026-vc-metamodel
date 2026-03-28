# X04: Decision Compliance + CFP Audit + Emergency Triage

**Date:** 2026-03-27
**Deadline:** 2026-03-29 AoE (~2 days)
**Mode:** Emergency (<2 days) — only fix what blocks submission.

---

## Decision Compliance

| # | Decision | Status | Violation details |
|---|---|---|---|
| 1 | Modeling-first framing (not detection-first) | **OK** | Title, abstract, intro all lead with metamodeling. No detection-algorithm framing. |
| 2 | Domain is MDE, not formal methods | **OK** | Background covers multi-level modeling, Refinery. No epistemic logic, no theorem-proof structure. |
| 3 | No MDA terminology (CIM/PIM/PSM) | **OK** | Grep finds zero instances of CIM, PIM, PSM in any section file. Layer names are DCL/CSL/FSL throughout. |
| 4 | CSOK running example, simplified | **OK** | Housing subsidy scenario used in Sec 03, 04, 05 with 3 credentials, single subject. |
| 5 | Motivation ends with problem statement | **OK** | Sec 03.1 ends with "no existing tool or methodology checks whether their constraints can be simultaneously satisfied." |
| 6 | Teaser figure shows CSOK across three layers | **INCOMPLETE** | `@FIGURE: fig_teaser` placeholder exists in Sec 01 but no actual figure. **Blocks submission.** |
| 7 | C5 correction — MDE HAS been applied to SSI | **OK** | Sec 06.2 cites all four MDE-for-SSI papers (ChorSSI, Ding & Sato, Pattiyanon, Barclay). Closing paragraph states "MDE has thus been applied to SSI for choreography, security analysis, weakness detection, and governance requirements. None defines a multi-level metamodel..." |
| 8 | Gap analysis completed, core novelty confirmed | **OK** | Novelty framing consistent throughout. |
| 9 | CSOK naming ("family housing subsidy" in body) | **OK** | Sec 03 uses "government housing subsidy" at first mention with CSOK in footnote. Body uses "housing subsidy scenario" / "running example" thereafter. |
| 10 | GDPR constraint strength — two-tier framing | **OK** | Sec 05 Headline 1 explicitly labels GDPR requirement as "authors' operationalization," hedges both inferential steps, cites NAIH 35M HUF precedent. |
| 11 | FSL restructuring as worked example | **OK** | Sec 04 cross-layer section includes the income pre-computed boolean worked example (lines 115-117). |
| 12 | mdoc simplified away | **OK** | Sec 02 mentions both SD-JWT-VC and mdoc, states "since both lack predicate proof support, subsequent sections use SD-JWT-VC as the representative format." |
| 13 | Two orthogonal headline results | **OK** | Sec 05.1.3 presents both: Headline 1 (vertical governance conflict) and Headline 2 (horizontal cross-credential predicate gap), with complementarity remark. |
| 14 | DCL rename (no more CPL) | **MINOR ISSUE** | No CPL instances found in section files. However, Decision 11 text in DECISIONS.md itself still says "Format-driven CPL restructuring" — this is in DECISIONS.md only, not in the paper. Not a paper violation. |
| 15 | No code listings in paper | **OK** | No fenced code blocks in any section file. All formal content is in prose + math. Supplementary material referenced repeatedly ("The complete Refinery encoding is provided in the supplementary material"). |

**Summary:** 13/15 fully compliant. 1 incomplete (Decision 6 — teaser figure missing, blocks submission). 1 minor (Decision 14 — CPL orphan in DECISIONS.md only, not in paper).

---

## CFP Criteria Ratings

| Criterion | Rating (1-5) | Justification | What would raise it |
|---|---|---|---|
| Originality | 4 | Novel intersection: multi-level metamodel + cross-layer constraints + VC credential design. Gap analysis confirms no prior work at this intersection. Adversarial reviewer could reduce to "metamodeling applied to new domain" — the independently-governed-layers argument is the counter but needs sharper delivery. | Sharpen the "not standard top-down refinement" argument in Sec 06.3 paragraph 3 — it is stated but could be more prominent. |
| Soundness | 3 | DCL and CSL layers are well-defined with clear metaclasses, constraints, and propagation rules. FSL is acknowledged as less mature. Cross-layer constraints are precise. **However:** scalability table is entirely TBD, sensitivity table is TBD, coverage fraction in conclusion is TBD. The evaluation claims scalability measurement but delivers no data. Two @FORMAL markers in Sec 04 remain unresolved. | Fill scalability data (even partial). Resolve @FORMAL markers. The paper currently promises quantitative evaluation but delivers only qualitative. |
| Relevance | 5 | Direct fit to MODELS Foundations Track: metamodeling, formal constraint specification, partial graph modeling, design space exploration. Topics list explicitly includes "modeling for specific challenges such as security, interoperability" and "modeling with and for blockchain technology." |  |
| Significance | 4 | Two concrete headline results demonstrating cross-layer conflicts invisible to single-layer inspection. The housing subsidy scenario is grounded in real regulation. The "independently governed layers" framing distinguishes this from standard multi-level modeling. | Quantitative scalability data would strengthen the "practical feasibility" argument. |
| Strength of validation | 2 | **Critical weakness.** The scalability section (Sec 5.2) is entirely unpopulated — 28 TBD cells in the main table, 8 TBD cells in the sensitivity table, no RQ answer paragraphs, missing hardware specification, missing node counts. The qualitative elaboration (coverage, expressiveness, anti-patterns, headline results) is solid. But the CFP explicitly requires "validated by formal proofs, rigorous demonstrations, or empirical evaluations." An empty measurement section invites desk-level skepticism. | Run measurements and populate tables. Even 3-4 scale points with real numbers would transform this rating to 3-4. |
| Quality of presentation | 3 | Prose is precise and well-structured. Running example carries well. Layer definitions are incrementally introduced with examples. **But:** no figures except fig_metamodel (which is a placeholder PNG path). The teaser figure, functional overview figure, coverage table, expressiveness table, anti-pattern table, constraint taxonomy figure, scalability figures — all are @FIGURE placeholders. A MODELS paper without figures is severely disadvantaged. `\citep` used instead of `[@...]` in one place (Sec 05 line 79). | At minimum: produce fig_teaser and fig_metamodel. Resolve the `\citep` to `[@...]`. |
| Quality of related work | 4 | Comprehensive three-subsection structure. All gap-analysis papers cited. Differentiation is precise: each cited work gets a one-sentence positioning statement explaining what it does and what it does not do. The "none combines X + Y + Z" closing is well-earned. | Resolve the double-blind concern about the self-citation (see below). |

**Overall predicted score:** Borderline — weak reject to weak accept. The qualitative contribution is strong (4 on originality, 4 on significance), but the empty scalability section and missing figures pull soundness and validation below the acceptance threshold. A reviewer who reads carefully will see a well-structured argument; a reviewer who flips to the evaluation section will see TBD everywhere.

---

## Marker Inventory

| Section | @TODO | @CITE | @FORMAL | @FIGURE | Submission-blocking? |
|---|---|---|---|---|---|
| 00_abstract | 0 | 0 | 0 | 0 | No |
| 01_introduction | 2 | 0 | 0 | 1 (fig_teaser) | **YES** — fig_teaser |
| 02_background | 1 | 0 | 0 | 0 | No (review item, not blocking) |
| 03_overview | 0 | 0 | 0 | 1 (fig_functional_overview) | No (nice-to-have) |
| 04_approach | 2 | 0 | 2 | 2 (fig_constraint_taxonomy, fig_generated_model) | **Partial** — @FORMAL markers are aspirational, not blocking; fig_constraint_taxonomy is the constraint table already inline |
| 05_evaluation | 6 | 0 | 0 | 4 (fig_coverage_table, fig_expressiveness_table, fig_antipattern_table, fig_scalability) | **YES** — TBD scalability data blocks submission |
| 06_related_work | 0 | 0 | 0 | 0 | No |
| 07_conclusion | 1 | 0 | 0 | 0 | **YES** — TBD coverage fraction |

### Detailed submission-blocking markers

1. **Sec 01, line 9: `@FIGURE: fig_teaser`** — BLOCKS SUBMISSION. An ACM sigconf teaser figure is expected. Submitting without it is possible but severely weakens first impression. Classify: COSTS SCORE (high).

2. **Sec 05, lines 131-144: Scalability table entirely TBD (28 cells)** — BLOCKS SUBMISSION. A table of TBD is unpublishable. Must either populate with real data or cut the section entirely.

3. **Sec 05, lines 158-165: Sensitivity table entirely TBD (8 cells)** — BLOCKS SUBMISSION. Same as above.

4. **Sec 05, line 146: `@TODO: Populate with measurement results`** — BLOCKS SUBMISSION. The measurement infrastructure exists (run_measurements.sh) but has not been run.

5. **Sec 05, line 148: `@TODO: Extend run_measurements.sh`** — COSTS SCORE. Adding plain `check` benchmark is desirable but not blocking.

6. **Sec 05, line 150: `@TODO: RQ answer paragraph`** — BLOCKS SUBMISSION. Cannot have RQs without answers.

7. **Sec 05, line 152: `@TODO: Populate constraint sensitivity table`** — BLOCKS SUBMISSION. Same as #3.

8. **Sec 07, line 11: `TBD` coverage fraction** — BLOCKS SUBMISSION. Conclusion references "TBD VCDM 2.0 concepts" — cannot submit with TBD in body text.

9. **Sec 05, line 121: `TBD` node counts in scalability description** — BLOCKS SUBMISSION. Body text says "TBD to TBD graph nodes."

10. **Sec 05, line 123: `@TODO: Hardware specification`** — COSTS SCORE. Can submit without but weakens reproducibility.

11. **Sec 05, line 125: `@FIGURE: fig_scalability`** — BLOCKS SUBMISSION if scalability data exists. MOOT if section is cut.

12. **Sec 04, line 113: `@TODO: A16 — Apply complete constraint set`** — COSTS SCORE. Would strengthen the worked example but section is coherent without it.

13. **Sec 04, line 25: `@TODO: Acyclicity constraint`** — COSMETIC. Noted limitation in Refinery encoding, not in paper argument.

14. **Sec 01, line 13: `@TODO: Verify gap claim`** — COSMETIC. Gap analysis already completed (Decision 8).

15. **Sec 01, line 17: `@TODO: Finalize contribution list`** — COSMETIC. Contribution list is already written and aligns with binding claims.

16. **Sec 02, line 27: `@TODO: Review B5 with Oscar`** — COSMETIC. Background section is well-written; this is a review request.

17. **Sec 04, line 117: `@TODO: Polish`** — COSMETIC.

18. **Sec 04, lines 17, 23: `@FORMAL` markers** — COSMETIC. The formal content is already in the prose; these markers appear to be remnants requesting explicit Definition environments that the paper does not use (per Foundations Track style).

19. **Sec 05, line 62: `@TODO: Show error predicates firing`** — COSTS SCORE. The headline result prose is strong without Refinery output traces.

20. **Sec 05, line 79: `\citep{rosenberg_zk-creds_2023}`** — BLOCKS SUBMISSION. Wrong citation syntax for pandoc (should be `[@rosenberg_zk-creds_2023]`). Will produce a literal `\citep` in output.

---

## Double-Blind Compliance

### Issues found

1. **Self-citation in Sec 06 (line 32):** "A prior short paper [@farkas_prolog-based_2024] applied Refinery to credential schema validation with a single-layer prototype; the present work extends this to a three-layer metamodel with formalized cross-layer constraints."
   - **Severity: HIGH.** The citation key `farkas_prolog-based_2024` contains the author surname. If the .bib entry lists "Farkas" as author, reviewers can identify the first author. The phrase "the present work extends this" strongly implies shared authorship.
   - **Required action:** Rewrite in third person: "Farkas et al. [@farkas_prolog-based_2024] applied Refinery to credential schema validation with a single-layer prototype; the present work extends this to..." — this is already close to third person but "the present work extends this" implies authorship continuation. Consider: "The present metamodel builds on a single-layer prototype that applied Refinery to credential schema validation [@farkas_prolog-based_2024], extending it to three layers with formalized cross-layer constraints."

2. **Sec 05, line 146:** "@TODO: Martin to run" — contains the author name inside a marker comment. This will not appear in the PDF (pandoc strips `%% ... %%` markers), so **not blocking** for submission, but should be cleaned for safety.

3. **STAF/JOT paper (TODO.md):** The STAF paper by Al-Gburi, Farkas (Martin's surname), Marussy, Semerath, Kocsis is discussed in TODO.md but is NOT cited in any section file. If it were cited, it would reveal shared authorship with Semerath (who is on the PC). Currently **not a violation** — the paper is not cited.

4. **Oszkár Semeráth is on the Program Committee** (CFP.md line 230). The paper uses Refinery extensively and cites Semerath's publications. This is normal — Semerath's Refinery papers are widely cited. The double-blind concern is about the self-citation in item 1 above, not the Refinery citations.

### Verdict
One moderate double-blind risk (self-citation phrasing in Sec 06). Rewrite to clean third-person. The `Martin` in the @TODO marker is invisible in PDF output.

---

## Emergency Triage: Minimum Viable Submission

The paper is roughly 80% complete. The qualitative sections (01-04, 06-07) are well-drafted and coherent. The critical gap is the scalability section (Sec 05.2) which is entirely unpopulated.

### Decision fork: Scalability section

**Option A: Run measurements and populate.** If `run_measurements.sh` works and Martin can execute it in <4 hours, populate the tables with real data, write the RQ answer paragraph, and the paper jumps from "weak reject" to "borderline accept." This is the highest-value action.

**Option B: Cut scalability, reframe evaluation.** If measurements cannot be run in time, cut Sec 5.2 entirely (saving ~0.7 pages). Reframe the evaluation preamble as qualitative elaboration only. Remove scalability claims from abstract ("scalability measurement across ecosystem sizes up to 30 credentials") and intro structure paragraph. The paper becomes purely qualitative — weaker but submittable. Risk: "strength of validation" drops further.

### Priority list (in order)

1. **[BLOCKS] Run measurements and populate Sec 5.2 tables** — OR cut Sec 5.2 and remove all scalability references from abstract/intro/conclusion. Martin decides.
2. **[BLOCKS] Fix TBD in conclusion** (line 11) — replace "TBD VCDM 2.0 concepts" with actual count from coverage analysis.
3. **[BLOCKS] Fix TBD in Sec 5.2** (lines 121, 131-144, 158-165) — covered by item 1.
4. **[BLOCKS] Fix `\citep` → `[@...]`** in Sec 05 line 79.
5. **[BLOCKS] Fix double-blind self-citation** in Sec 06 line 32 — rewrite to clean third person.
6. **[COSTS SCORE] Produce fig_teaser** — even a rough Excalidraw export converted to PNG would substantially improve the paper's first impression.
7. **[COSTS SCORE] Produce fig_metamodel** — the `![...](pandoc/assets/fig_metamodel.png)` reference in Sec 04 needs an actual image file.
8. **[COSTS SCORE] Clean up remaining @TODO markers** — strip cosmetic markers that would render as `\todo{}` annotations in the PDF.
9. **[COSMETIC] Remove @META markers from section files** — these should not appear in the rendered output.
10. **[COSMETIC] Strip all `%% @FIGURE: ...%%` placeholders that will not be filled** — they produce `\todo[inline]{}` annotations.

---

## Fix-It Prompt

```markdown
# Emergency Fix: Submission-Blocking Issues

## Context
MODELS 2026 submission, deadline 2026-03-29 AoE. Double-blind, ACM sigconf, 10+2 pages.
Files: `sections/00_abstract.md` through `sections/07_conclusion.md`.

## Tasks (in priority order)

### 1. Fix `\citep` citation syntax
**File:** `sections/05_evaluation.md`, line 79
**Action:** Replace `\citep{rosenberg_zk-creds_2023}` with `[@rosenberg_zk-creds_2023]`

### 2. Fix double-blind self-citation
**File:** `sections/06_related_work.md`, line 32
**Current:** "A prior short paper [@farkas_prolog-based_2024] applied Refinery to credential schema validation with a single-layer prototype; the present work extends this to a three-layer metamodel with formalized cross-layer constraints."
**Replace with:** "A prior short paper [@farkas_prolog-based_2024] applied Refinery to credential schema validation with a single-layer prototype; the present metamodel extends this to three layers with formalized cross-layer constraints."
(Removes "the present work extends this" which implies authorship continuation.)

### 3. Fix TBD in conclusion
**File:** `sections/07_conclusion.md`, line 11
**Action:** Replace "TBD VCDM 2.0 concepts" with a concrete count. The coverage analysis in Sec 05.1.1 states: DCL metaclasses formalize claim-level info structure, CSL metaclasses the credential packaging model, FSL format classes with 6 capability predicates. Count the in-scope VCDM concepts from the coverage characterization and insert the actual fraction. If the count is not available, replace with a qualitative statement: "the core structural concepts of VCDM 2.0 relevant to credential schema design."

### 4. Fix TBD in scalability description
**File:** `sections/05_evaluation.md`, line 121
**Action:** Replace "TBD to TBD graph nodes" with actual node counts per credential from the Refinery model files, OR replace with "approximately 7N to 8N graph nodes" based on the per-credential structure described (1 Prop + 1 Value at DCL, 1 CredSubj + 1 Claim + 1 CredValue + 1 Credential at CSL, 1 Formatted_Credential at FSL = 7 nodes per credential + 1 shared Subject).

### 5. Strip @TODO markers from body text visible in PDF
**Files:** All section files.
**Action:** Remove or convert to invisible comments any @TODO, @FORMAL, @FIGURE markers that would render as \todo{} in the LaTeX output. Specifically:
- Sec 01 lines 13, 17: Remove (gap claim verified, contribution list finalized).
- Sec 02 line 27: Remove (review request, not paper content).
- Sec 04 lines 17, 23: Remove @FORMAL markers (content is in prose).
- Sec 04 lines 113, 117: Remove @TODO (nice-to-have, not blocking).
- Sec 05 line 62: Remove @TODO (headline result prose is complete).
- Remove @FIGURE placeholders for figures that will not be produced: fig_coverage_table, fig_expressiveness_table, fig_antipattern_table, fig_constraint_taxonomy, fig_generated_model.
- Keep @FIGURE for fig_teaser, fig_functional_overview, fig_scalability ONLY if Martin intends to produce them.

### 6. IF scalability section is cut (Martin decides)
**Files:** `sections/00_abstract.md`, `sections/01_introduction.md`, `sections/05_evaluation.md`, `sections/07_conclusion.md`
**Action:**
- In abstract: Remove "and quantitative scalability measurement across ecosystem sizes up to 30 credentials."
- In intro structure paragraph: Remove "and quantitative scalability measurement across ecosystem sizes up to 30 credentials."
- In Sec 05: Remove Sec 5.2 (lines 115-167) entirely. Adjust section preamble (line 10) to reference qualitative elaboration only.
- In conclusion: Remove scalability references and adjust future work.

## Constraints
- Double-blind: no author names in any rendered text.
- Obsidian Markdown with Mathpix math conventions.
- No code blocks in paper body.
- Do not change the argument structure — fix mechanics only.
```
