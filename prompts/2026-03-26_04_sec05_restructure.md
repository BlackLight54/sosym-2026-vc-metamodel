# Prompt: Sec 05 Restructure — Evaluation → Elaboration + Structured Measurement

**Phase:** 2 (parallel with P03)
**Execution:** Can run simultaneously with `2026-03-26_03_sec03_restructure.md`. Touches only `sections/05_evaluation.md` — no file conflicts.
**Dependencies:** Ideally runs after P02 (ARF gap analysis) so ARF constraints are available. If P02 hasn't completed, use the placeholder content and note where ARF findings should be inserted.
**Chain edits:** After completion, edit `prompts/2026-03-26_08_claim_evidence_audit.md` — update the list of evaluation claims to audit.

---

## Context

Advisor feedback (Oszkár, 2026-03-25): The evaluation section needs major restructuring. Current structure is a three-axis validation (coverage, expressiveness, error visibility). New structure splits into:
1. **Elaboration** (unstructured) — absorbs current content, reframes coverage as "how far we formalized"
2. **Scalability Measurement** (structured, fixed schema) — new content with research questions, model instances, measurement setup, results diagrams, analysis
3. **Threats to Validity** — four categories

The budget increases from 2.0 to ≥2.0 pages (Oszkár said "at least two pages evaluation").

Key advisor quotes:
- "VCDM coverage tells us how far we got in the work, but it's not a measurement. It's elaboration — soundness/completeness."
- "Compare with at least one baseline development tool — why Refinery instead of that?"
- Measurement setup inspired by Nour's ECMFA paper (Martin to provide reference).
- Need 2–5 model instances of increasing size for scalability measurement.

## Task

### Step 1 — Read current state

Read:
- `sections/05_evaluation.md` (current scaffold and partial prose)
- `DECISIONS.md` (evaluation-related decisions)
- If `archive/arf_5_3_4_gap_analysis.md` exists (from P02), read it for ARF constraint findings.

### Step 2 — Plan the restructure (present to Martin)

Present a plan showing the new structure:

```
# Evaluation
@META: Budget: ≥2.0 pages (target 2.5)

Preamble: State evaluation strategy — two parts (elaboration + measurement) + threats.

## Elaboration (5.1)

### Metamodel Coverage (soundness/completeness framing)
- VCDM 2.0 concept mapping table — reframed as "how far we formalized"
- Not a measurement, but a characterization of scope
- Coverage count: N of M concepts mapped, explicit exclusions

### Constraint Expressiveness
- Table: constraint × source (W3C/EU/community) × expressible × predicate
- **ARF constraints (from P02 — `archive/arf_5_3_4_gap_analysis.md`):** 8 constraints recommended for the expressiveness table, extracted from ARF v2.7.3 (Section 5.3, Topic 3, Topic 12):
  - C1 (PID_02): Dual format mandate — PID in both ISO 18013-5 and SD-JWT VC. **Yes** — `EidasMandate` + format class.
  - C2 (ARB_01): QEAA/PuB-EAA restricted to ISO 18013-5 or SD-JWT VC. **Partial** — lacks attestation qualification level.
  - C3 (ARB_01a): Non-qualified EAA may also use W3C VCDM. **Partial** — same gap as C2.
  - C4 (ARB_02): Proximity requires mdoc (SD-JWT VC lacks offline protocol). **Yes** — `supports_offline_verification`.
  - C5 (PID_21): Per-claim selective disclosure for SD-JWT VC PIDs. **Partial** — format-level only.
  - C6 (5.3.4): W3C VCDM requires separate security specs. **Partial** — conformance captured, incompleteness not.
  - C7 (ARB_06): Encoding-independent attribute definition, then per-format. **Yes** — validates three-layer architecture.
  - C8 (5.3.3): Salted-hash SD enables RP linkability; only ZKP provides unlinkability. **Partial** — separate predicates exist but distinction not graduated.
  - Coverage: 3 Yes / 5 Partial / 2 No (10 total; 2 out-of-scope not in table)
- Target: 10-15 constraints from at least two governance sources
- Include expressiveness limitations paragraph

### Headline Results (E6)
- Headline 1: Income governance conflict (vertical) — keep existing prose
- Headline 2: Cross-credential predicate gap (horizontal) — keep existing prose
- Complementarity paragraph — keep existing prose

### Anti-Pattern Detection
- Anti-pattern catalog table
- Detection results per anti-pattern
- Multi-layer visibility argument

### Baseline Comparison
- Compare with one baseline: OCL on Ecore, Alloy, or manual inspection
- At least one axis of comparison (e.g., expressiveness, automation, error visibility)
- Be honest about limitations

## Scalability Measurement (5.2) — FIXED SCHEMA

### Research Questions
- RQ1: "How does validation runtime scale with model size?"
- RQ2: [propose 1-2 additional RQs, e.g., "How does the number of constraint violations affect error identification time?"]

### Selected Domains
- 2-5 model instances of increasing size
- Based on CSOK variants (e.g., 1-cred minimal, 3-cred CSOK, 5-cred extended, 10-cred synthetic)
- Justify why scaling is representative: "each additional credential adds N entities, M claims, K constraints"

### Measurement Setup
- Tools: Refinery version, JVM version, hardware spec
- Environment: reproducibility info
- Metrics: validation time, model generation time, memory usage
- Cite Nour's ECMFA paper for methodology inspiration (<<NOUR_CITE>> — Martin to provide)

### Measurement Results
- 2 full-width `figure*` diagrams
- %% @FIGURE: fig_scalability_validation | Validation runtime vs. model size (number of entities/constraints). X-axis: model size. Y-axis: time (ms). Lines for consistency check, error identification. figure* (full-width). %%
- %% @FIGURE: fig_scalability_generation | Generation runtime vs. model size. X-axis: model size. Y-axis: time (ms). Line for design space exploration. figure* (full-width). %%

### Analysis of Results
- Answer each RQ
- Draw conclusions about practical applicability
- State limitations of the measurement

## Threats to Validity (5.3)
- Internal validity: [scaffolded items]
- External validity: [scaffolded items]
- Construct validity: [scaffolded items]
- Conclusion validity: [scaffolded items]
```

**Metamodel gaps from ARF analysis (P02):**
1. **Attestation qualification level** (C2, C3): No PID/QEAA/PuB-EAA/EAA hierarchy — format eligibility per qualification not expressible. Future work: credential-type hierarchy in CSL.
2. **Per-claim selective disclosure** (C5): `supports_selective_disclosure(f)` is format-level only. CSL `Claim` lacks SD annotation. Minor — format-level suffices for governance conflict analysis.
3. **SD mechanism distinction** (C8): Salted-hash vs ZKP unlinkability not encoded as graduated predicate. Existing separate predicates drive correct UNSAT result; gap is documentation, not correctness.

These are future work items — not blocking for current submission. Mention in Threats to Validity (construct validity: metamodel scope choices).

### Step 3 — Execute the restructure

After Martin approves (or if you judge this follows Oszkár's explicit instructions closely enough):

1. **Restructure `sections/05_evaluation.md`** to match the plan above.
2. **Preserve all existing drafted prose** — the Headline 1, Headline 2, and Complementarity paragraphs are already written. Move them under the new Elaboration → Headline Results subsection.
3. **Reframe coverage** — change the framing from "validation axis" to "elaboration: how far we formalized." Replace "Metamodel Coverage" validation language with soundness/completeness language.
4. **Add scaffolds for new subsections** — Baseline Comparison, Scalability Measurement (all sub-parts), Threats to Validity. Use `@SCAFFOLD` and `@TODO` markers.
5. **Add figure placeholders** for the two `figure*` scalability diagrams.
6. **Update `@META` budget** from 2.0 to ≥2.0 pages.
7. **Add `@TODO` for model instances** — note that 2-5 model instances of increasing size need to be created in `models/`.

### Step 4 — Update TODO.md

Mark "Sec 05 restructure" items as done. Add new TODO items:
- [ ] Create 2-5 model instances of increasing size in `models/` for scalability measurement
- [ ] Run scalability measurements in Refinery
- [ ] Design 2 `figure*` scalability diagrams
- [ ] Draft baseline comparison paragraph
- [ ] Draft threats to validity subsection

### Step 5 — Chain edit (CRITICAL)

After completing the restructure, edit `prompts/2026-03-26_08_claim_evidence_audit.md`:

1. Find placeholder `<<EVALUATION_CLAIMS>>` and replace with the actual list of claims the restructured evaluation makes. Include:
   - Coverage claim (soundness/completeness of VCDM formalization)
   - Expressiveness claim (N constraints from K governance sources)
   - Headline result claims (governance conflict, cross-credential gap)
   - Anti-pattern detection claim
   - Scalability claim (whatever the measurement shows)
   - Baseline comparison claim
2. Find placeholder `<<EVALUATION_STRUCTURE>>` and replace with the actual subsection structure (5.1, 5.2, 5.3 with sub-parts).

## Constraints

- Preserve all existing drafted prose (Headline 1, Headline 2, Complementarity). These are substantial and reviewed.
- The expressiveness table is a scaffold — it will be filled during drafting, not now. Place the scaffold with column headers.
- Scalability measurement is a scaffold — actual measurements happen later. Create the structure and placeholders.
- Threats to validity: scaffold each category with 2-3 bullet points of likely threats based on the paper's design.
- If P02 (ARF gap analysis) has not yet run, use `<<ARF_CONSTRAINTS>>` as placeholder text noting "Insert ARF 5.3.4 constraint findings from P02 here."
- Output in Obsidian Markdown with Mathpix math conventions.
