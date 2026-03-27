# Full Paper Audit: Content ↔ Commitments ↔ Accumulated Knowledge

## Goal

Read the entire paper sequentially (Sec 00–07) and audit it against everything the project has accumulated: the binding claims in the abstract, the decisions in DECISIONS.md, the gap analysis findings, the reviewer persona attack vectors, the running example design, and the Refinery formalization. Produce an actionable audit report identifying what the paper delivers, what it fails to deliver, where the argument breaks, and what the four reviewer personas will attack.

This is NOT a general paper review. It is a targeted cross-reference audit: does the paper, as currently written, fulfill the specific commitments it made and defend against the specific attacks the project identified?

## Recommended setup

Use `/model opus[1m]` — the full paper + all supporting artifacts must be in context simultaneously.
Use `/effort high`.

## Files to read in full

**The paper (read sequentially, in order):**
1. `sections/00_abstract.md` — binding claims #1–#10 are the audit checklist
2. `sections/01_introduction.md`
3. `sections/02_background.md`
4. `sections/03_overview.md`
5. `sections/04_approach.md`
6. `sections/05_evaluation.md`
7. `sections/06_related_work.md`
8. `sections/07_conclusion.md`

**Commitments and constraints:**
- `DECISIONS.md` — every active decision is a constraint on the paper
- `TODO.md` — remaining work items indicate gaps between plan and delivery
- `VENUE.md` — reviewer personas and their attack vectors (Section: Reviewer personas + Calibration guidance)
- `CLAUDE.md` — thesis statement (the paper must deliver exactly this)

**Evidence sources (verify claims trace to these):**
- `archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md` — differentiation arguments D1–D5, tier lists, claim correction
- `archive/arf_5_3_4_gap_analysis.md` — expressiveness table source data
- `archive/meeting_notes_2026-03-25.md` — advisor feedback that shaped the paper

**Formalization (verify prose–model consistency):**
- `models/csok.problem` — the main Refinery model
- `models/csok_no_conflict.problem`, `models/csok_no_eidas.problem`, `models/csok_no_gdpr.problem` — SAT variants
- `models/csok_2x.problem`, `models/csok_3x.problem` — scalability instances

**Guides (check explanation floor):**
- `guides/running_example/SKILL.md` — running example design constraints
- `guides/reviewer_archetypes/SKILL.md` — reviewer attack patterns

## Output format

Plan mode. Do NOT edit any files. Produce a structured report with these sections:

---

### 1. Binding Claim Delivery Matrix

For each binding claim #1–#10 from the abstract:

| # | Claim | Delivered? | Where? | Evidence quality | Gap / Risk |
|---|---|---|---|---|---|

Delivered? = YES (prose + evidence present) / PARTIAL (prose exists but evidence is placeholder/TODO) / NO (not yet written) / WEAK (written but unconvincing).

Evidence quality = STRONG (grounded in cited source or formal result) / ADEQUATE / PLACEHOLDER (@TODO marker) / MISSING.

Gap/Risk = what specifically is missing or weak, and how a reviewer would attack it.

### 2. Decision Compliance Check

For each active decision in DECISIONS.md, verify the paper complies:

| Decision | Compliant? | Violation / Drift | Location |
|---|---|---|---|

Focus on:
- **Terminology:** Is "Domain Concept Layer" used everywhere? Any CPL orphans? Any MDA terms (CIM/PIM/PSM)?
- **CSOK naming:** "family housing subsidy" in body, CSOK in footnote only?
- **Framing:** Modeling-first, not detection-first? Does the title match?
- **Running example:** CSOK throughout, no Diploma/Alice remnants?
- **Governance conflict:** Two-tier framing (eIDAS hard, GDPR operationally binding)?
- **mdoc:** Mentioned in Background, simplified away in running example with justification?
- **C5 correction:** Softened novelty claim per gap analysis? No "MDE has not been applied to SSI"?

### 3. Gap Analysis Integration Check

For each entry in GAP_ANALYSIS_SYNTHESIS.md:

**Tier 1 papers (must cite):** Is each cited? Where? With correct differentiation?
**Tier 2 papers (should cite):** Is each cited? If not, is the omission acceptable?
**Differentiation arguments D1–D5:** Does the related work section execute each argument? Quote the specific prose that delivers each differentiation.
**Claim correction (C5):** Is the softened claim actually used in the abstract and introduction? Or does the old strong claim persist?

### 4. Reviewer Persona Attack Simulation

For each of the four reviewer personas in VENUE.md, simulate their review of the paper as currently written:

**Reviewer A (Champion — MDE-for-New-Domains):**
- Can the champion argument be recovered from the abstract's final sentence and Intro P3?
- Is the "so-what" — multi-stakeholder governance conflict invisible to single-layer inspection — clear and compelling?
- What would prevent this reviewer from championing?

**Reviewer B (Mathematician — Graph Modeling Expert):**
- Read every definition in Sec 04. Are they precise? Consistent? Complete?
- Are Refinery mechanisms (error predicate, propagation rule, shadow predicate, scope constraint) correctly characterized in Sec 02.3?
- Is related work on multi-level modeling (Atkinson/Kühne), partial models (Chechik/Famelis), and multi-view consistency (Diskin) adequately addressed?
- What would this reviewer's top 3 technical objections be?

**Reviewer C (Business Manager — MDE Practitioner):**
- Can a reader who knows metamodels but not VCs follow the paper?
- Is the explanation floor met? (VC, credential schema, issuer/holder/verifier, selective disclosure defined in 1–2 sentences each)
- Does the running example make each layer tangible before formal definitions?
- Can this reviewer follow the argument from prose + running example alone, skipping formal definitions?

**Reviewer D (Adversarial — Competing Formalism):**
- Attack D1: "just MLM applied to a new domain" — does the paper preempt this? Where? How convincingly?
- Attack D2: "tool dependency — remove Refinery and what remains?" — does the paper separate metamodel contribution from tool?
- Attack D3: "synthetic evaluation with hand-crafted anti-patterns" — are anti-patterns grounded in cited sources?
- Attack D4: "FSL is thin — three-layer claim is aspirational" — does the paper acknowledge FSL maturity? Is the three-layer claim defended?

For each reviewer: predicted score (strong reject / reject / borderline / weak accept / accept), top 3 concerns, and what single change would most improve their score.

### 5. Argument Flow Audit

Trace the argument through the paper. For each transition, check whether the logical connection is explicit:

- Abstract → Introduction: Does the intro expand on the abstract without contradicting it?
- Intro P1 (problem) → Intro P2 (gap): Is the gap motivated by P1? Does P2 cite the right evidence?
- Intro P3 (contributions) → Sections 04–05: Does each contribution claim map to a specific section and subsection?
- Sec 03 (overview) → Sec 04 (approach): Does the running example in Sec 03 set up Sec 04 definitions? Are the same entities, credentials, and constraints used?
- Sec 04 (approach) → Sec 05 (evaluation): Does the evaluation evaluate what the approach claims? Are there approach claims not evaluated, or evaluation results not grounded in approach definitions?
- Sec 05 (evaluation) → Sec 06 (related work): Does the related work section reference evaluation results to strengthen differentiation?
- Sec 06 (related work) → Sec 07 (conclusion): Does the conclusion reference the positioning established in related work?
- Sec 07 (conclusion) → Abstract: Does the conclusion deliver what the abstract promised? Any over/under-claiming?

Flag: argument gaps (claim made but not supported), argument orphans (evidence presented but not connected to a claim), and argument contradictions (prose in one section contradicts another).

### 6. Running Example Consistency

Trace the CSOK running example across all sections:

- **Entities:** Applicant, num_children, property_area, monthly_income — consistently named? Same structure everywhere?
- **Credentials:** FamilyStatusCred, PropertyCred, IncomeCred — consistently named? Same attribute mappings?
- **Constraints:** C1–C9 (or whatever the final numbering is) — introduced in one place, referenced consistently?
- **Format assignments:** SD-JWT-VC for FamilyStatus/Property, conflict on Income — consistent across Sec 03, 04, 05?
- **Governance sources:** eIDAS, GDPR, VCDM 2.0 — same characterization everywhere? Two-tier framing consistent?
- **Notation:** Are mathematical symbols ($\text{format}(\cdot)$, $\text{trace}(\cdot)$, etc.) used consistently?

### 7. Prose–Model Consistency

Compare the prose descriptions in Sec 04 against the actual Refinery model in `models/csok.problem`:

- Do the metamodel classes described in prose match the classes in the .problem file?
- Do the constraint descriptions match the error predicates and propagation rules?
- Are there model elements not described in prose, or prose claims not reflected in the model?
- Do the three SAT variants (no_conflict, no_eidas, no_gdpr) correspond to the governance conflict analysis in Sec 05?

### 8. Unresolved Markers Census

Count and classify all remaining markers across the paper:

| Marker type | Count | Critical? | Sections |
|---|---|---|---|

Critical = blocks submission (e.g., @TODO for missing content in a delivered section) vs. non-critical (e.g., @CITE that can use a placeholder BibTeX key, @FIGURE that can be submitted as placeholder).

For each critical marker: state what is needed to resolve it and estimate effort (trivial / moderate / significant).

### 9. Cross-Reference Integrity

Check all `\ref{}`, `\autoref{}`, `Section~\ref{}` references:

- Do they point to labels that exist?
- Do they point to the right content? (e.g., "Section 5.3" should be threats, not something else)
- Are forward references used appropriately? (referencing a section before it appears)
- Any broken or stale references from the restructuring?

### 10. Critical Path to Submission

Based on findings from sections 1–9, identify:

1. **Blockers:** What must be resolved before submission? (missing binding claim evidence, broken arguments, critical markers)
2. **High-value fixes:** What single changes would most improve reviewer scores? Rank by impact/effort ratio.
3. **Acceptable risks:** What weaknesses exist but are defensible in rebuttal? (e.g., FSL maturity, single-domain evaluation)
4. **Cut candidates:** If the paper exceeds 10 pages, what can be cut with least argument damage?

Produce a prioritized action list: task, target file, effort estimate, which binding claim or reviewer it addresses.

---

## Constraints

- Read the paper sequentially — the argument must work as a linear read.
- Be specific. "Section 04 needs work" is useless. "Section 04.4 cross-layer constraints subsection has 6 @TODO markers and 0 paragraphs of prose — Binding Claims #3 and #9 are undelivered" is actionable.
- Quote specific prose when claiming a commitment is met or violated.
- Do NOT propose rewrites or draft prose. Identify what is wrong and what is needed; Martin and the writing sessions will fix it.
- Do NOT soften findings. If the paper cannot defend against Reviewer D's attack in its current state, say so directly with the specific missing element.
- The deadline is 2026-03-29 AoE (~2.5 days from now). Frame the critical path accordingly — distinguish between "must fix before submission" and "would improve but can survive without."
- This audit feeds directly into the remaining consolidation tasks (T01, T02, T07, T08, T09, T10). Where a finding maps to a specific task, note the mapping.
