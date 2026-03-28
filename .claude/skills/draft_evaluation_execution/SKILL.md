---
description: Produce a concrete checklist of evaluation items (proofs, tools, case studies) with status, dependencies, and acceptance criteria. Use when tracking what still needs to be run, checking evaluation progress, or asking 'what is blocking the evaluation section?'
---

# Skill: Evaluation Execution Checklist

**Purpose:** Given an evaluation plan (from `skills/draft_evaluation_design` or an existing evaluation section), produce a concrete checklist of what must be done — proofs to complete, tools to run, case studies to execute, data to collect — with dependencies and acceptance criteria. This is a lightweight tracking tool, not a deep design skill; `skills/draft_evaluation_design` handles the *what* and *why*, this skill handles the *do it and confirm it's done*.

## Trigger

- "What do I still need to run?"
- "Evaluation checklist"
- "What's blocking the evaluation section?"
- "Track evaluation progress"

## Inputs

- Evaluation section file (if it exists).
- `skills/draft_evaluation_design` output (if it was run).
- Contribution list from Introduction P3.
- CLAUDE.md: thesis and domain.
- context/DECISIONS.md: any evaluation-related decisions.

## Steps

### 1. Extract evaluation items

Read the evaluation section (or evaluation design output) and extract every discrete unit of work. An evaluation item is something that produces a result the paper reports. Typical item types:

| Type | What it produces | Example |
|------|-----------------|---------|
| **Formal proof** | Theorem statement + proof (or proof sketch + full proof in appendix) | "Prove Theorem 1: protocol preserves confidentiality under Dolev-Yao" |
| **Mechanized verification** | Tool output confirming a property | "Tamarin: verify lemma `secrecy_credential` terminates and holds" |
| **Case study instance** | Worked example showing the approach applied to a scenario | "Apply the framework to the supply chain running example, produce trace" |
| **Prototype implementation** | Working code demonstrating feasibility | "Implement credential issuance flow in TypeScript, measure round-trips" |
| **Benchmark / measurement** | Quantitative data (timing, size, scalability) | "Measure proof generation time for N=10,50,100 participants" |
| **Comparison** | Side-by-side result against a baseline or competing approach | "Compare our approach vs. centralized orchestrator on the 3 scenarios" |
| **Expert review / validation** | Qualitative assessment from domain experts | "Review model with 2 industry practitioners" |

Not every evaluation has all types. Extract only what the paper actually needs.

### 2. Determine status

For each item, classify:

| Status | Meaning |
|--------|---------|
| **Not started** | No work done yet |
| **In progress** | Partially complete — tool running, proof sketched, code started |
| **Blocked** | Cannot proceed — depends on something else (a definition, data, access) |
| **Done (unwritten)** | Results exist but not yet written into the evaluation section |
| **Done (written)** | Results exist and are reported in the paper |

Status is determined by reading the evaluation section for reported results and checking for `%% @TODO: %%` or `%% @FORMAL: %%` markers that indicate incomplete work.

### 3. Identify dependencies

Some items depend on others or on work outside the evaluation:

- A mechanized verification depends on the formal definitions being stable.
- A comparison depends on the baseline being implemented or characterized.
- A case study depends on the running example being finalized.
- Measurements depend on the prototype being functional.

Record blocking dependencies for each item.

### 4. Define acceptance criteria

For each item, state what "done" looks like concretely. This prevents scope creep and gives Martin a clear target:

- **Proof:** "Proof is complete, covers all cases in Definition 3, and is consistent with the proof sketch in §4.2."
- **Tool run:** "Tamarin terminates on all lemmas within 10 minutes. Output log saved."
- **Case study:** "Running example fully traced through all 5 protocol steps. Result matches expected outcome described in §3."
- **Measurement:** "Timing data for N=10,50,100 collected. Table or chart drafted for §5."

### 5. Produce checklist

Present as a table:

```
## Evaluation Execution Checklist — [date]

| # | Item | Type | Status | Depends on | Acceptance criteria | Section |
|---|------|------|--------|-----------|-------------------|---------|
| E1 | Prove Theorem 1 (confidentiality) | Proof | In progress | Def 3 stable | Full proof, all cases | §4.2 |
| E2 | Tamarin: secrecy lemma | Mechanized | Blocked | E1 | Terminates, holds | §5.1 |
| E3 | Supply chain case study | Case study | Not started | Running example (context/DECISIONS.md) | All steps traced | §5.2 |
| E4 | Round-trip measurements | Benchmark | Not started | Prototype (E5) | N=10,50,100 timed | §5.3 |
| E5 | Credential issuance prototype | Implementation | In progress | — | Issues + verifies 1 VC | §5.3 |

### Blocked items
- E2 blocked by E1: Tamarin encoding depends on the final form of Theorem 1.

### Recommended execution order
1. Stabilize Def 3 → E1 (proof) → E2 (Tamarin)
2. E5 (prototype) → E4 (measurements)
3. E3 (case study) — can run in parallel with track 1
```

### 6. Update TODO.md

Add one task per non-done item, respecting dependencies:

- "E1: Complete proof of Theorem 1 (depends on Def 3)"
- "E2: Run Tamarin secrecy lemma (after E1)"
- "E3: Execute supply chain case study"
- etc.

Group under a "## Evaluation execution" heading in TODO.md if one doesn't exist.

## Re-running

This skill is idempotent — re-run it to update statuses as work progresses. On re-run:

- Check which items advanced since last run.
- Update statuses.
- Flag any items that were "in progress" last time and are still "in progress" (potential stall).
- Flag new blockers.

## Interaction with other skills

- **`skills/draft_evaluation_design`:** Designs the evaluation (what to evaluate, which methods). This skill tracks execution of that plan. Run evaluation_design first if no evaluation plan exists.
- **`skills/review_claim_evidence_audit`:** Audits whether claims have proportional evidence. If the audit finds gaps, they may map to incomplete items on this checklist.
- **`skills/draft_limitations_threats`:** Limitations often arise from evaluation scope decisions. Items marked as out-of-scope on this checklist may become limitations.
- **`skills/review_paper_status`:** Paper status reports section maturity. This skill reports evaluation completeness — a more granular view of the evaluation section's readiness.

## Output

- Evaluation execution checklist (table with status, dependencies, acceptance criteria).
- Blocked items with explanations.
- Recommended execution order.
- TODO.md updated.
