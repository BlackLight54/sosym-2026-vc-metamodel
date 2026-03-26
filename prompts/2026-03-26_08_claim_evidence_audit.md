# Prompt: Re-run Claim Evidence Audit

**Phase:** 5 (last — after all restructuring and rename)
**Execution:** Must run AFTER all other prompts (P01–P07) are complete. This is the final consistency check.
**Dependencies:** All section files must be in their final restructured state. The CPL rename must be propagated.
**Chain edits:** None — this is the terminal prompt in the pipeline.

---

## Context

Advisor feedback (Oszkár, 2026-03-25): "Binding claims need to be re-run against the original abstract after Sec 03 and Sec 05 restructuring."

The abstract (`sections/00_abstract.md`) contains binding claims that the paper must deliver. After the restructuring done in P03–P07, verify that:
1. Every binding claim in the abstract is still supported by content in the paper.
2. No new claims were introduced in the restructuring that aren't reflected in the abstract.
3. The restructured sections (03 Overview, 05 Evaluation) still deliver what the abstract promises.

## New layer terminology

The "Claim Property Layer (CPL)" has been renamed to **Domain Concept Layer (DCL)** throughout the paper (P07). The abbreviation "DCL" replaces "CPL" everywhere. The audit should verify that no orphaned references to the old name remain outside of `archive/` and `prompts/` (which are historical records).

## Evaluation structure after restructuring

```
5. Evaluation
   5.1 Elaboration
       5.1.1 Metamodel Coverage (soundness/completeness of VCDM 2.0 formalization)
       5.1.2 Constraint Expressiveness (table: constraints × sources × expressible × predicate)
       5.1.3 Headline Results
             — Headline 1: Income governance conflict (vertical, UNSAT)
             — Headline 2: Cross-credential predicate gap (horizontal)
             — Complementarity paragraph
       5.1.4 Anti-Pattern Detection (catalog, detection results, multi-layer visibility)
       5.1.5 Baseline Comparison (vs. one baseline tool)
   5.2 Scalability Measurement (fixed schema)
       5.2.1 Research Questions (RQ1: validation runtime, RQ2: generation runtime)
       5.2.2 Selected Domains (2–5 model instances of increasing size)
       5.2.3 Measurement Setup (tools, environment, metrics)
       5.2.4 Measurement Results (2 figure* diagrams)
       5.2.5 Analysis of Results
   5.3 Threats to Validity
       5.3.1 Internal Validity
       5.3.2 External Validity
       5.3.3 Construct Validity
       5.3.4 Conclusion Validity
```

## Evaluation claims after restructuring

1. **Coverage claim (5.1.1):** The metamodel captures N of M VCDM 2.0 concepts relevant to credential ecosystem design (soundness/completeness characterization, not a measurement). Explicit exclusions: proof mechanisms, verifiable presentations, status/revocation.
2. **Expressiveness claim (5.1.2):** Constraints from multiple governance sources (W3C VCDM 2.0, eIDAS/ARF, community) are expressible as graph predicates. Focused on constraints that exercise the three-layer architecture (ARF C1 dual format mandate, C4 proximity→mdoc, C7 encoding-independent attributes). Partially expressible ARF constraints noted as scope boundaries.
3. **Headline 1 — vertical governance conflict (5.1.3):** eIDAS format mandate + GDPR data minimization + VCDM conformance → UNSAT on IncomeCred. No format satisfies all three. Invisible to single-layer inspection.
4. **Headline 2 — horizontal expressiveness gap (5.1.3):** Cross-credential arithmetic predicate (property_area ≥ min_area(num_children)) cannot be enforced privacy-preservingly by any deployed format. Invisible to single-layer inspection.
5. **Anti-pattern detection claim (5.1.4):** Error predicates catch N anti-patterns spanning multiple layers. Multi-layer visibility: layer-by-layer checks pass, cross-layer check fails.
6. **Baseline comparison claim (5.1.5):** [Per comparison axis chosen — expressiveness and/or automation vs. one baseline tool. To be drafted.]
7. **Scalability claim (5.2):** Validation and generation runtime scales [per measurement results — to be populated after Refinery runs].

## Task

### Step 1 — Run the skill

Execute `skills/claim_evidence_audit` against the current state of the paper. This skill:
1. Extracts binding claims from the abstract
2. Maps each claim to evidence in the paper (section, paragraph, figure, table)
3. Classifies each mapping as: delivered, partially delivered, missing, or overclaimed

### Step 2 — Augmented checks

In addition to the standard skill output, manually verify:

**Terminology consistency:**
- The new layer name (from P07) is used consistently across all sections
- No orphaned references to the old "Claim Property Layer" name remain
- Abbreviations are introduced once and used consistently

**Structural alignment:**
- Intro P3 contribution list matches what Sec 04 and Sec 05 actually contain
- Intro P5 structure paragraph matches the actual section names and content
- Abstract claims map to specific subsections in the restructured Sec 05

**New content introduced by restructuring:**
- Does the Functional Overview (Sec 3.2) introduce any capability claim not in the abstract? If so, flag.
- Does the Usage Workflow (Sec 3.3) imply any user study or usability claim? If so, flag.
- Does the Scalability Measurement (Sec 5.2) introduce research questions that aren't covered by abstract claims? If so, flag.
- Does the Baseline Comparison (Sec 5.1) claim superiority over a specific tool? If so, verify the claim is hedged appropriately.

**Reviewer persona cross-check:**
- For each reviewer persona in VENUE.md, identify the 1-2 most likely attack points given the restructured paper.
- Verify that the paper addresses these attack points (or flag if it doesn't).

### Step 3 — Produce audit report

Output a structured report:

```
## Claim Evidence Audit — 2026-03-26

### Binding claims status
| # | Claim | Status | Evidence location | Notes |
|---|-------|--------|-------------------|-------|

### Terminology consistency
- [OK/ISSUE]: ...

### Structural alignment
- [OK/ISSUE]: ...

### New claims from restructuring
- [OK/ISSUE]: ...

### Reviewer persona vulnerabilities
| Persona | Attack point | Addressed? | Location/Fix |
|---------|-------------|-----------|-------------|
```

### Step 4 — Update TODO.md

Based on the audit:
1. Mark the "Re-run claim_evidence_audit" TODO as done.
2. Add any new TODO items for issues found (flag as critical if they block submission, high-priority if they weaken the paper, medium if nice-to-have).
3. Given the deadline is 2026-03-27, be realistic about what can be fixed. Flag critical issues only — cosmetic issues can wait.

## Constraints

- This is an AUDIT, not a rewrite. Identify issues; do not fix them (unless the fix is trivial, e.g., a missing section reference).
- Present findings in plan mode. Martin decides which issues to address.
- If `skills/claim_evidence_audit` is not available or produces an error, perform the audit manually using the binding claims listed in `sections/00_abstract.md` `@META` block.
- Be precise about locations: file, line number, paragraph ID where applicable.
- The audit should take ~15 minutes of reading, not hours of research. Focus on structural alignment, not deep content review.
