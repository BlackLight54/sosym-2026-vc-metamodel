# S05b: Evaluation — Scalability + Threats Review

## Section Assessment
- **Overall verdict:** NEEDS WORK — but the situation is better than expected
- **Strategic recommendation:** COMPLETE (scalability) / ALREADY DRAFTED (threats)
- **Days to deadline:** 2 (submission 2026-03-29 AoE, effective Monday ~13:00 CET)

## Key Discovery: Threats Section Is Already Drafted

The threats section (Sec 5.3, lines 169–187) is **not scaffolded**. It contains four substantive paragraphs covering construct, internal, external, and conclusion validity. The `@TODO` markers in TODO.md ("Draft threats to validity subsection") are stale — the work has been done. The text is specific, honest, and well-calibrated to the paper's actual scope. It needs polish, not drafting.

## Viability Analysis

### Scalability (Sec 5.2) — NEEDS DATA + MINOR DRAFTING

**What exists:**
- Full experimental design: 3 operations (consistency, concretizability, generation), 7 scale points (N=1..30), SAT/UNSAT variants, constraint sensitivity power-set (G0-G7). Well-motivated RQs.
- Complete measurement infrastructure: `run_measurements.sh` (Hyperfine orchestration), `generate_instances.py` (22 instances generated), `analyze_results.py` (figure + table generation). All tested at S3 scale.
- 22 `.problem` instances already generated in `models/evaluation/instances/`.
- 2 of ~30 measurement results collected (e1_check_S3_sat, e1_check_S3_unsat). Mean ~7s, dominated by Docker/JVM startup.
- Prose scaffold: RQ framing paragraph (line 119), measurement setup paragraph (line 123), interpretive closing paragraph (line 167). All are drafted, not just scaffolded.
- Tables structured with TBD cells ready for data.

**What is missing:**
1. Run the full measurement campaign (~28 remaining benchmarks). At ~7s/run x 10 reps x 28 configs = ~33 minutes wall-clock. Plus warmup runs. Estimate: **45-60 minutes of unattended compute time**.
2. Run `analyze_results.py` to produce figures and populated tables.
3. Fill TBD cells in scalability table (line 129-144) and sensitivity table (line 156-165).
4. Fill hardware specification `@TODO` (line 123) from `environment.json`.
5. Fill node counts `@TODO` (line 121) from actual instances.
6. Draft the RQ answer paragraph (line 150 `@TODO`).
7. Add plain `check` (without `-k`) to the measurement script as noted in line 148 `@TODO`. This adds the baseline operation (consistency checking that misses conflicts).

**Effort estimate:** 2-3 hours total. ~1 hour compute (can run in background), ~1 hour to populate tables/figures, ~30 min to draft RQ answer paragraph. The infrastructure investment has already been made.

**Critical dependency:** Martin must run `./run_measurements.sh all` (or the individual experiments). This requires Docker running with the Refinery CLI image pulled.

### Threats to Validity (Sec 5.3) — ESSENTIALLY COMPLETE

**What exists (lines 173-187):**
- **Construct validity** (10 lines): Scope boundaries (proof mechanisms, presentations, status lifecycle excluded). Partial expressibility of 5/8 eIDAS constraints with root causes identified. Silent Subject promotion risk. This is honest and specific.
- **Internal validity** (8 lines): CSOK selection justification (structural completeness, not random sample). ARF version pinning. Format capability currency. Uniform scaling structure acknowledged as limitation.
- **External validity** (7 lines): Single governance context (EU). GovernanceAnnotation designed as extensible but demonstrated only for EU. Single-domain scenario. Usability untested.
- **Conclusion validity** (7 lines): Synthetic homogeneous scaling pattern. Expected scaling behavior stated. Power-set covers 3 frameworks only. Refinery-specific results disclaimed. Reproducibility via supplementary material.

**What is missing:**
- Nothing structurally. The four subsections are substantive and specific.
- Minor: the conclusion validity paragraph references scalability data that does not yet exist ("We expect concretizability checking to scale near-linearly..."). Once measurements are in, this should state the observed pattern rather than predict it. But even as-is, stating expected behavior is acceptable if measurements confirm it.

**Effort estimate:** 15-30 minutes of polish after scalability data arrives. Change "we expect" to "we observe" and cite the actual scaling pattern.

## Is Quantitative Scalability Expected at MODELS Foundations Track?

**Short answer: Yes, for this paper.** Three reasons:

1. **Venue exemplar**: The Semerath et al. MODELS 2020 paper (listed as style target in VENUE.md) includes scalability measurements with runtime figures. This is the advisor's group's own published standard.

2. **Advisor directive**: TODO.md explicitly records "Cite in Sec 05 (measurement setup — emulate their RQ/scalability methodology) [Oszkar]." The advisor wants scalability numbers.

3. **Paper promise**: The evaluation preamble (line 10) explicitly commits to "a quantitative scalability measurement." The abstract and introduction likely echo this. Cutting it after promising it is worse than never having it.

**However:** A pure metamodeling contribution (no tool formalization) would not require runtime measurements. The paper could theoretically survive without scalability if it framed Refinery as illustrative rather than evaluative. But the current framing commits to quantitative evaluation, and the advisor expects it.

## Minimum Viable Version

If measurements cannot be completed (e.g., Docker fails, Refinery errors at larger scale points):

### Option A: Complete with data (RECOMMENDED)
Run `./run_measurements.sh all`. Populate tables. Draft 1 paragraph of RQ answers. ~2-3 hours.

### Option B: Compress to qualitative + partial data
- Keep the S3 data point that already exists (7s).
- Report: "We verified concretizability checking and model generation at N=3 (29 nodes); larger-scale measurements and the full analysis are provided as supplementary material."
- Cut the scalability table to 3-4 rows (N=1, 3, 5, 10).
- Cut the sensitivity table entirely or reduce to a single sentence ("Only G7, the conjunction of all three frameworks, is unsatisfiable").
- Page savings: ~0.5 page.
- Risk: Adversarial reviewer attacks "insufficient evaluation."

### Option C: Cut scalability entirely
- Remove Sec 5.2. Keep the evaluation preamble referencing only elaboration.
- Must also cut scalability mentions from abstract, intro P5, and evaluation preamble.
- Page savings: ~1.0 page.
- Risk: Contradicts advisor expectations. Weakens champion argument. The MODELS 2020 exemplar has scalability — cutting it signals the paper is below the bar the advisor's own group set.

## Reviewer Impact

### Champion (MDE-for-New-Domains Advocate)
- **Complete:** Strengthens the argument — "not just a modeling exercise, computationally feasible at practical scale."
- **Compress:** Acceptable if qualitative argument is strong. Champion focuses on the insight, not the numbers.
- **Cut:** Does not kill the champion argument (the insight stands without runtime data), but weakens the framing and loses an evaluative dimension.

### Mathematician (Graph Modeling Expert)
- **Complete:** Appreciated but not load-bearing. The mathematician evaluates the metamodel definitions, not runtime performance. Scalability is a "nice to have" — confirms the formalization is computationally tractable.
- **Compress/Cut:** Unlikely to affect score. Might even prefer the space be used for more precise definitions.

### Business Manager (MDE Practitioner)
- **Complete:** Directly addresses "does this work in practice?" concern. Even Docker-dominated 7-second times at N=3 are reassuring — real ecosystems have <10 credential types.
- **Compress:** Partial data still helps. "Works for 30 credentials" is the key message.
- **Cut:** Loses the practitioner accessibility angle. "How does it scale?" is a natural question this reviewer will ask.

### Adversarial (Competing Formalism Advocate)
- **Complete:** Partially defuses "synthetic evaluation" attack. The adversarial reviewer will still attack hand-crafted instances, but having runtime data at least shows the formalization is executable.
- **Compress:** Gives ammunition: "evaluation is thin."
- **Cut:** Opens the strongest attack vector: "no evidence the approach works beyond a toy example." Combined with Attack 3 (synthetic evaluation), this could be decisive.

## Risk Assessment

**If scalability data is not ready:** The paper loses one of its two evaluation axes. The elaboration (Sec 5.1) is strong — coverage, expressiveness, headline results, anti-patterns, baseline comparison. This alone is a credible evaluation for a Foundations Track metamodeling paper. But the paper *promises* quantitative measurement. Breaking that promise is worse than never making it.

**If threats section is thin:** It is not thin. The current text is adequate for MODELS Foundations. It is honest about scope boundaries, identifies specific risks, and disclaims generalizability appropriately. No action needed beyond minor polish.

**Recommended course:** Run the measurements. The infrastructure exists. The instances are generated. The script is tested. This is 45-60 minutes of compute time and 1-2 hours of table-filling. The marginal effort is low relative to the payoff.

## Fix-It Prompt

```markdown
# T09: Sec 05 Scalability Data + Threats Polish

## Prerequisites
- Martin has run `./models/evaluation/run_measurements.sh all` and results JSON files exist in `models/evaluation/results/`.
- Martin has run `python models/evaluation/analyze_results.py` and tables/figures exist.
- If plain `check` experiment is needed: Martin has extended `run_measurements.sh` per @TODO at line 148 and re-run.

## Goal
Populate Sec 5.2 (Scalability Measurement) with actual data and polish Sec 5.3 (Threats to Validity).

## Tasks

### 1. Read measurement results
- Read all JSON files in `models/evaluation/results/`.
- Read `models/evaluation/results/environment.json` for hardware spec.
- Extract mean +/- stddev for each configuration.

### 2. Populate scalability table (lines 129-144 of `sections/05_evaluation.md`)
- Fill all TBD cells with mean +/- sigma from Hyperfine results.
- Fill |V| (node count) column — read from instance files or config.yaml.
- Mark Generation column as "—" for UNSAT rows.
- If plain `check` data exists, add a Consistency column.

### 3. Populate sensitivity table (lines 156-165)
- Fill Result column: SAT or UNSAT for each G0-G7 configuration.
- Expected: G0-G6 = SAT, G7 = UNSAT.

### 4. Fill inline @TODOs in Sec 5.2
- Line 121: Replace "TBD to TBD graph nodes" with actual node counts from instances.
- Line 123: Replace hardware @TODO with CPU, RAM, OS from environment.json.
- Line 146: Remove @TODO, data is now populated.
- Line 148: Remove @TODO if plain `check` was added, or note it was omitted.
- Line 150: Draft the RQ answer paragraph (2-3 sentences). Template:
  - "Concretizability checking scales [observed pattern] from N=1 to N=30..."
  - "Model generation scales [observed pattern]..."
  - "Key observation: consistency checking returns SAT on all configurations including UNSAT variants; only concretizability checking correctly distinguishes satisfiable from unsatisfiable configurations."
- Line 152: Remove @TODO after sensitivity table is populated.

### 5. Polish threats section (lines 169-187)
- If scalability data is available: change "we expect" language in conclusion validity to "we observe" and state the actual scaling pattern.
- Check that all cross-references to earlier sections are correct.
- No structural changes needed — the four subsections are substantive.

### 6. Update figure placeholder
- Line 125: If `analyze_results.py` produced a figure, update the @FIGURE marker with the actual filename and confirm it belongs in `figures/`.

## Constraints
- Do not change the experimental design (scale points, operations, governance configs).
- Do not change the threats subsection structure (construct, internal, external, conclusion).
- Maintain Obsidian Markdown with Mathpix math conventions.
- Do not add code listings (DECISIONS.md: no code listings in paper).

## Target file
`sections/05_evaluation.md` — lines 115-187 only.
```
