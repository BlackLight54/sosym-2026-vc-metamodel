# X01: Argument Coherence and Promise Tracking

## Overall Coherence Assessment

- **Verdict:** MOSTLY COHERENT
- **Weakest link in the argument chain:** Evaluation (Sec 5) scalability measurement is entirely TBD data. The argument goes from a well-developed approach section directly into empty table cells, undermining the quantitative evidence axis that the introduction promises.
- **Strongest section transition:** Sec 3 (Overview) to Sec 4 (Approach). The running example motivates the metamodel layers precisely, and the approach section picks up each layer in the order the overview introduced them. The functional overview (3.2) defines the three usage modes that the approach section then references consistently.
- **Weakest section transition:** Sec 4 (Approach) to Sec 5 (Evaluation). The approach section ends with a TODO marker and an incomplete paragraph about applying the constraint set (line 113). The evaluation opens by restating its structure but does not connect back to the specific open questions the approach section raises. The reader encounters a shift from detailed formalization to a summary mode without a bridge.

## Promise Tracking Table

| Promise (from Intro) | Where delivered | Status | Gap |
|---|---|---|---|
| C1: Three-layer metamodel grounded in VCDM 2.0 (Sec 4) | Sec 4.1 (DCL), 4.2 (CSL), 4.3 (FSL), fig_metamodel | **Delivered, with caveat** | FSL is explicitly acknowledged as "less mature" (Sec 4.3 line 65). The adversarial reviewer will attack this as a two-and-a-half-layer metamodel. The paper partially pre-empts this in the conclusion limitations paragraph but does not address it directly in the approach. |
| C2: Cross-layer constraint formalization as graph predicates (Sec 4, "sec:cross-layer") | Sec 4.4 (cross-layer constraints) | **Mostly delivered** | The constraint table (C1-C9) is clear and well-structured. However, the actual Refinery encodings are deferred to supplementary material. The paper presents mathematical predicate definitions but the reader must trust they map correctly to Refinery. This is acceptable at 10 pages but the Mathematician reviewer will want to see at least one complete predicate encoding inline. |
| C3: Three-axis validation (coverage, expressiveness, error detection) | Sec 5.1.1 (coverage), 5.1.2 (expressiveness), 5.1.3 (headlines) + 5.1.4 (anti-patterns) | **Partially delivered** | Coverage (5.1.1): described qualitatively but the coverage mapping table is a figure placeholder, not an actual table. Expressiveness (5.1.2): three of eight constraints shown; full analysis deferred to supplement. Headlines (5.1.3): well-developed and convincing. Anti-patterns (5.1.4): delivered. Baseline comparison (5.1.5): analytical, no empirical baseline. |
| Quantitative scalability measurement | Sec 5.2 | **Not delivered** | Every cell in the scalability table is TBD. The constraint sensitivity table is TBD. The RQ answer paragraph is a TODO. This is the single largest gap in the paper. |
| "Reveals formally contradictory cross-framework constraints" (abstract binding claim #8) | Sec 5.1.3 Headline 1 | **Delivered** | The income governance conflict is well-argued with the three-source unsatisfiability clearly demonstrated. The NAIH enforcement action grounds the GDPR operationalization. |
| "Multi-layer errors invisible to single-layer inspection" (abstract binding claim #9) | Sec 5.1.3 Headlines 1 and 2, Sec 5.1.4 anti-patterns | **Delivered** | Both headline results explicitly argue single-layer invisibility. The anti-pattern table grades visibility by layer scope. |
| "Eight eIDAS regulatory constraints classified" (abstract) | Sec 5.1.2 | **Partially delivered** | Three fully expressible constraints are tabled. Five partially expressible are discussed in prose. The full classification is deferred to supplement. The abstract says "classifies eight" which is accurate but the paper body shows only three in detail. |
| "Five structural anti-patterns formalized" (abstract) | Sec 5.1.4, tab:antipatterns | **Delivered** | Five anti-patterns are tabled with predicate names, layers, and kinds. |
| "Two cross-layer design errors surfaced" (abstract) | Sec 5.1.3 | **Delivered** | Headlines 1 (vertical governance conflict) and 2 (horizontal predicate gap) are clearly presented. |
| "Automated consistency checking through design space exploration" (abstract) | Sec 3.2, 4.4 (usage mode demonstrations) | **Partially delivered** | The three usage modes are defined and the running example walks through them. However, no actual Refinery output is shown. The reader must trust the tool produces what is described. A screenshot or output listing would strengthen this. |
| Unpromised result: baseline comparison (Sec 5.1.5) | Sec 5.1.5 | **Delivered but not promised** | The introduction does not mention a baseline comparison. It appears in the evaluation. This is fine structurally but could be mentioned in the structure paragraph. |

## Terminology Drift

| Term | First defined (section) | Inconsistent usage (section, line) | Issue |
|---|---|---|---|
| Domain Concept Layer / DCL | Sec 1 line 25: "domain concept layer" (lowercase, italic) | Sec 4 line 11: "domain concept layer (DCL)" (formal intro with acronym) | Minor: the term is used in Sec 1 and Sec 3 before its formal definition in Sec 4. The acronym DCL first appears in Sec 4 but the abstract already uses the full phrase. Acceptable but the acronym should be introduced at first use (Sec 1 or abstract). |
| Credential Schema Layer / CSL | Sec 1 line 25: "credential schema layer" | Same pattern as DCL. Acronym CSL first in Sec 4. | Same issue. |
| Format-Specific Layer / FSL | Sec 1 line 25: "format-specific layer" | Same pattern. | Same issue. |
| "error predicate" | Sec 2.3 line 34: defined as "structural pattern that must not hold" | Sec 4.2 line 49: used as "graph predicates whose satisfaction marks a partial model as inconsistent" | Slight reformulation but consistent in meaning. No real drift. |
| "propagation rule" | Sec 2.3 line 34: "derives new facts from the current partial interpretation" | Consistent throughout. | No issue. |
| "shadow predicate" | Sec 2.3 line 34: "records derived information without constraining the model" | Sec 4.4 line 107: consistent usage for `aligned` and `common_parent` | No issue. |
| "statement" predicate | Sec 4.1 line 21: $\text{statement}(s, p, v)$ defined at DCL | Sec 4.2 line 49: `credential_statement` at CSL mirrors it | Clear naming: `statement` (DCL) vs `credential_statement` (CSL). The parallel is explicit. |
| "trace" | Sec 2.2 line 25: "cross-layer trace relationships" | Sec 4.2 line 45: `trace` reference on CredEntity; also `Prop::trace` | Two distinct `trace` references exist: `CredEntity::trace` (entity-to-entity) and `Prop::trace` (property-to-claim). Both are called "trace" which could confuse. Sec 4.4 line 105 disambiguates with notation $\text{trace}(p, c)$ vs $\text{trace}(t, e)$ but acknowledges the overloading parenthetically. This is a minor readability risk. |
| "governance conflict" | Sec 3.1 line 17: used informally | Sec 4.4 C8: formalized as a constraint | Sec 5.1.3: used as a result label | Consistent progression from informal to formal. |
| "multi-credential proof" | Sec 4.3 line 67: capability predicate | Sec 4.4 line 109: `supports_multi_credential_proof` | Sec 5.1.3 Headline 2: "cross-credential arithmetic predicates" | Slight terminology shift: "multi-credential proof" (capability) vs "cross-credential arithmetic" (domain requirement) vs "cross-credential predicate" (anti-pattern name). These are different concepts but the distinctions could be sharper. |
| "design space exploration" | Sec 1 line 25, Sec 3.2 line 30 | Consistent throughout | No issue. |

## Argument Breaks

### Break 1: Approach to Evaluation transition (Severity: MEDIUM)
**Location:** End of Sec 4.4 (line 113-117) to start of Sec 5.
**What's missing:** Sec 4 ends with two TODO markers and an incomplete application paragraph. The evaluation opens with a structural overview but does not say "the preceding section defined the metamodel and constraints; we now evaluate whether they achieve the three goals stated in the introduction." The logical bridge is implicit.
**Fix direction:** Remove or complete the TODO at line 113. Add a single transition sentence at the start of Sec 5 connecting back to the contribution claims.

### Break 2: Scalability measurement is a void (Severity: HIGH)
**Location:** Sec 5.2 (lines 119-167).
**What's missing:** Every data cell is TBD. The RQ answer paragraph is a TODO. The evaluation promises "quantitative scalability measurement" but delivers only the experimental design. This is the paper's largest credibility gap. Without data, the three-axis validation claim in the introduction reduces to two axes (coverage and expressiveness via elaboration only).
**Fix direction:** Run the measurements and populate the tables. If measurements cannot be completed before deadline, consider whether the experimental design alone (with a clear "measurements pending" note) is better than TBD cells, or whether to cut the quantitative axis and reframe as qualitative-only evaluation.

### Break 3: Coverage table is a placeholder (Severity: MEDIUM)
**Location:** Sec 5.1.1 (line 22).
**What's missing:** The coverage mapping is described as a figure placeholder (`@FIGURE: fig_coverage_table`). The prose claims soundness and completeness but the reader has no table to verify. The conclusion references this with a TBD fraction (line 11).
**Fix direction:** Produce the coverage mapping table (VCDM concept to metamodel element to layer, with in-scope/out-of-scope marks). This is a straightforward table derivable from the metamodel definition.

### Break 4: FSL maturity gap acknowledged but not resolved (Severity: MEDIUM)
**Location:** Sec 4.3 line 65: "This layer is less mature than DCL and CSL: format-internal structural constraints are not yet formalized."
**What's missing:** The introduction promises a three-layer metamodel. The approach section delivers two well-developed layers and one that is explicitly incomplete. The evaluation does not separately assess FSL maturity or address how its incompleteness affects the headline results. The conclusion acknowledges it as a limitation.
**Fix direction:** This is partially pre-empted but needs sharper framing. In Sec 4.3, argue that FSL maturity is sufficient for the governance conflict analysis (which it is -- the capability predicates and governance annotations are the FSL elements that matter for Headlines 1 and 2). The "less mature" remark should specify what is missing (format-internal structural constraints) without implying the layer is undercooked for the paper's claims.

### Break 5: Abstract binding claims vs. delivered content (Severity: LOW)
**Location:** Abstract lines 7-17.
**What's missing:** Binding claim #4 ("automated consistency checking demonstration") is not delivered as a standalone demonstration. The running example walks through the three usage modes verbally but no tool output, screenshot, or generated model is shown. The supplementary material is referenced but the paper itself lacks a concrete demonstration artifact.
**Fix direction:** Include one small Refinery output excerpt (even 3-4 lines of solver output) showing a constraint violation or generated model. This converts the verbal walkthrough into a demonstrated capability.

### Break 6: Section reference accuracy (Severity: LOW)
**Location:** Introduction line 22: `\autoref{sec:cross-layer}` for contribution 2.
**Issue:** The cross-layer constraints subsection label is `sec:cross-layer` (Sec 4.4). This is correct. However, the structure paragraph (line 29) says the approach section "formalizes cross-layer constraints as Refinery graph predicates, including trace consistency, entity alignment, and structural anti-pattern detection." Anti-pattern detection is actually in Sec 5.1.4, not Sec 4. The approach section defines the predicates; the evaluation section catalogs the anti-patterns.
**Fix direction:** Either move the anti-pattern table to Sec 4.4 (where the predicates are defined) or adjust the structure paragraph to say anti-patterns are "cataloged in the evaluation."

## Running Example Continuity

### Where it appears:
- **Sec 1 (Introduction):** Referenced indirectly via the "housing subsidy" mention in the teaser figure description (line 9). Not introduced in the prose -- the introduction uses a generic "income credential" example inline (line 15) but does not name CSOK.
- **Sec 3.1 (Motivation):** Formally introduced with footnote citing CSOK. Full scenario described with three credentials, three authorities, two cross-layer problems. This is the strongest running example section.
- **Sec 4.1 (DCL):** Running example table (lines 29-38) instantiates all DCL elements. Two domain constraints stated.
- **Sec 4.2 (CSL):** Running example table (lines 53-59) instantiates all CSL elements. Entity alignment shown.
- **Sec 4.3 (FSL):** Running example table (lines 71-77) instantiates format assignments with the conflict site marked.
- **Sec 4.4 (Cross-layer):** Constraint table (lines 85-96) maps all nine constraints to CSOK instances. Usage mode walkthrough on the running example (lines 101). Trace consistency and entity alignment illustrated with CSOK elements.
- **Sec 5.1.2 (Expressiveness):** Three ARF constraints tabled; running example is not the primary vehicle here (regulatory constraints, not CSOK-specific).
- **Sec 5.1.3 (Headlines):** Both headline results are developed entirely through the CSOK running example. This is the culmination of the running example thread.
- **Sec 5.1.4 (Anti-patterns):** The running example is referenced implicitly through the predicates defined in Sec 4, but the anti-pattern table is generic (not CSOK-specific).
- **Sec 5.2 (Scalability):** Synthetic instances, not the running example. The CSOK scenario is not used for scalability; N=3 corresponds to the CSOK scale but this is not stated explicitly.
- **Sec 6 (Related Work):** No running example.
- **Sec 7 (Conclusion):** References "income credential governance conflict" and "cross-credential predicate gap" by name but not through the CSOK framing.

### Where it drops:
- **Sec 2 (Background):** The running example is not used. This is acceptable -- the background introduces general concepts. However, the background's VC format discussion (Sec 2.1 line 14) uses "income >= threshold" as an inline example, which is a forward reference to the running example before it is introduced. This creates a mild continuity issue: the reader encounters the income example in Sec 2 without context, then sees it formalized in Sec 3.
- **Sec 5.1.5 (Baseline comparison):** Generic comparison, no CSOK instantiation. Could be strengthened by showing what each baseline misses on the CSOK example.
- **Sec 5.2 (Scalability):** Entirely synthetic. A note saying "the N=3 SAT instance corresponds to the CSOK scenario structure" would anchor the synthetic instances to the running example.

### Inconsistencies:
- **Sec 3.1** footnote says "additional credentials required in practice (tax clearance, criminal record check) are omitted." But Sec 5.2 scales to N=30 using "one property per credential" synthetic instances. The relationship between the simplified CSOK (3 credentials) and the scalability instances is never stated.
- **Sec 2.1** uses "$\mathit{income} \geq \mathit{threshold}$" before the running example exists. The same notation appears in Sec 4.3 as "$\text{monthly\_income} \geq \text{threshold}$" and in Sec 5.1.3. The variable name shifts from `income` to `monthly_income` between Sec 2 and Sec 4. Minor but noticeable.

## Scaffolding Gaps

The paper transitions from polished prose to scaffolding in several places:

1. **Sec 4.1 line 25:** `@TODO: Acyclicity constraint...` -- inline TODO within otherwise polished prose. Jarring because the surrounding paragraph asserts acyclicity but the constraint is not yet implemented.
2. **Sec 4.4 line 113:** `@TODO: A16 -- Apply complete constraint set...` -- a substantial missing paragraph. The approach section's final subsection ends with an incomplete demonstration.
3. **Sec 5.2 lines 146-152:** Four consecutive TODO markers. The entire scalability results section is scaffolding.
4. **Sec 7 line 11:** `@TODO: Replace TBD with actual N/M coverage fraction` -- conclusion references data that does not yet exist.
5. **Figure placeholders:** `@FIGURE` markers throughout (fig_teaser, fig_functional_overview, fig_coverage_table, fig_expressiveness_table, fig_antipattern_table, fig_constraint_taxonomy, fig_scalability, fig_generated_model). The only actual figure is fig_metamodel (Sec 4.1 line 19).

The reading experience: Sections 1-4 read as a coherent, well-argued paper with occasional TODO markers that do not break flow. Section 5.1 (elaboration) is mostly drafted with the headline results being publication-quality. Section 5.2 (scalability) is a skeleton. The drop from polished Sec 5.1.3 to empty Sec 5.2 is the most jarring transition.

## Fix-It Prompt

```
# Coherence Repair: Priority Actions for Submission

## Context
Read X01_argument_coherence.md for the full analysis. The paper is MOSTLY COHERENT
with one HIGH-severity gap (scalability data) and several MEDIUM gaps. Deadline is
2026-03-29 AoE (2 days remaining). Focus on what blocks submission.

## Priority 1: Scalability data (HIGH -- blocks submission)
- Target: sections/05_evaluation.md, Sec 5.2
- Action: Run measurements and populate tab:scalability and tab:sensitivity.
  If measurements cannot complete in time, write an honest "measurements pending"
  note and reframe the evaluation as primarily qualitative with scalability as
  a preliminary design. Do NOT submit with TBD cells.
- Also: Draft the RQ answer paragraph once data is available.

## Priority 2: Coverage table (MEDIUM -- weakens contribution claim)
- Target: sections/05_evaluation.md, Sec 5.1.1
- Action: Create the VCDM 2.0 coverage mapping table (concept -> metamodel element
  -> layer -> in-scope/out-of-scope). This is derivable from the metamodel definition
  in Sec 4 and the VCDM spec. Replace the @FIGURE placeholder with an actual table.
- Also: Update the conclusion's TBD coverage fraction (sections/07_conclusion.md line 11).

## Priority 3: FSL maturity framing (MEDIUM -- pre-empts adversarial reviewer)
- Target: sections/04_approach.md, Sec 4.3 line 65
- Action: Replace "This layer is less mature than DCL and CSL: format-internal
  structural constraints are not yet formalized" with a framing that specifies
  what IS formalized (capability predicates, governance annotations -- sufficient
  for the headline results) and what is NOT (format-internal encoding constraints --
  outside the scope of cross-layer governance analysis). The current phrasing
  invites the adversarial reviewer's "two-and-a-half layer" attack.

## Priority 4: Layer acronym introduction (LOW -- consistency)
- Target: sections/01_introduction.md line 25
- Action: Introduce DCL, CSL, FSL acronyms at first use in the introduction's
  approach sketch paragraph, where the three layers are first named.

## Priority 5: Approach-to-Evaluation transition (LOW -- flow)
- Target: End of sections/04_approach.md, start of sections/05_evaluation.md
- Action: Complete or remove @TODO at line 113 of 04_approach.md. Add a single
  transition sentence at the start of Sec 5 connecting the evaluation structure
  to the contribution claims from the introduction.

## Priority 6: Structure paragraph accuracy (LOW)
- Target: sections/01_introduction.md line 29
- Action: Change "structural anti-pattern detection" to note that anti-patterns
  are cataloged in the evaluation (Sec 5.1.4), not in the approach section.

## Priority 7: Running example anchoring in Sec 5.2 (LOW)
- Target: sections/05_evaluation.md, Sec 5.2
- Action: Add one sentence noting that the N=3 instance corresponds to the
  CSOK housing subsidy scenario structure.

## Do NOT attempt:
- Major restructuring of any section
- New figures (unless the coverage table counts)
- Expanding the FSL formalization
- Adding Refinery code listings to the main text
```
