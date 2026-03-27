---
description: Map contributions to evaluation questions and select appropriate methods to produce a structured evaluation plan. Use when designing the evaluation section, deciding what experiments are needed, or planning how to validate contributions.
---

# Skill: Evaluation Design

**Purpose:** Given the contribution list and the venue expectations, design a structured evaluation that answers the right questions with the right methods. The evaluation section is where most A* rejections originate — either the wrong thing is evaluated, the method doesn't match the claim, or the results don't support the contribution language.

## Trigger

- "Design the evaluation"
- "How should we evaluate this?"
- "What experiments do we need?"
- "Plan the case study"

## Inputs

- CLAUDE.md: thesis (core claim, mechanism, so-what).
- Introduction contribution list (P3) — each numbered contribution needs corresponding evidence.
- VENUE.md: reviewer personas (what evidence each reviewer type expects), exemplar papers (what evaluations look like at this venue).
- Running example (from DECISIONS.md or guides/running_example).
- Domain from CLAUDE.md (calibrates what counts as evidence in this field).

## Steps

### 1. Map contributions to evaluation questions

Each numbered contribution implies one or more evaluation questions. Extract them:

| Contribution | What must be demonstrated | Evaluation question |
|-------------|--------------------------|-------------------|
| C1: "We define X" | X is well-defined and captures the intended concept | Does X distinguish cases it should from cases it shouldn't? |
| C2: "We prove Y" | Y holds under stated assumptions | Is the proof correct? Does the proof cover the interesting cases? |
| C3: "We demonstrate Z on case study" | Z works on a realistic scenario | Does Z produce the expected results? How does it compare to alternatives? |

**Diagnosis at this stage:**
- Contribution with no obvious evaluation question → the contribution may be too vague. Flag for Martin.
- Evaluation question with no contribution → orphan evaluation work. Either add a contribution or cut the evaluation.

### 2. Select evaluation methods

For each evaluation question, determine the appropriate method. The method must match the claim strength in the introduction.

| Claim type | Appropriate methods | Inappropriate methods |
|-----------|-------------------|---------------------|
| "We prove X" | Formal proof, mechanized verification | Case study (can't prove by example) |
| "We guarantee X" | Formal proof with coverage argument | Argument, single example |
| "We show/demonstrate X" | Case study, worked example, experiments | Unsupported argument |
| "We enable X" | Tool implementation + case study | Proof alone (must show it works in practice) |
| "X outperforms Y" | Controlled experiment with metrics, baselines | Case study without comparison |
| "X is feasible/practical" | Implementation + performance measurements | Proof alone |
| "X captures/formalizes Y" | Formal definition + examples that test boundaries | Informal argument |

**For formal methods papers specifically:**
- A formal definition is evaluated by showing it captures the intended cases (positive examples) and excludes what it should (negative examples, ideally from the running example).
- A proof is evaluated by its completeness and by tool verification if applicable (Tamarin, Isabelle, Coq).
- A framework is evaluated by a case study that exercises its key features, ideally with comparison to how the same scenario plays out without the framework.
- Scalability claims need quantitative evidence — even informal measurements help.

**For papers with both formal and empirical components:** The evaluation typically has two parts: (1) formal results (proofs, analysis) and (2) empirical demonstration (case study, implementation, experiments). Structure them as separate subsections with different standards.

### 3. Design each evaluation component

For each evaluation question + method pair, specify:

```
Evaluation question: [the question]
Method: [from step 2]
What we measure / demonstrate: [concrete observables]
Expected result: [what would constitute success]
What would constitute failure: [be honest — if this result would weaken the paper, say so]
Data / scenario: [what input — running example, benchmark, dataset, constructed scenarios]
Baselines / comparisons: [what we compare against, if applicable]
Threats to validity: [what could undermine this result — feed to skills/limitations_threats]
```

Present this in plan mode. Martin approves before any implementation.

### 4. Check venue expectations

Read VENUE.md exemplar papers and reviewer personas:

- **What do accepted papers at this venue typically evaluate?** If the venue expects empirical experiments and you only have a proof, the business manager reviewer will object. If the venue expects formal rigor and you only have experiments, the mathematician reviewer will object.
- **What scale of evaluation is expected?** A single case study may suffice at a formal methods workshop but not at a top SE conference. Calibrate.
- **Is there an artifact evaluation track?** If yes, plan what the artifact contains and how it supports reproducibility.

Flag any mismatch between the planned evaluation and venue expectations.

### 5. Design the running example's role in evaluation

The running example should appear in the evaluation. Determine:

- Is the running example one of the evaluation cases? (Usually yes for formal methods papers.)
- Does it exercise the interesting properties? (If not, the example may be too simple.)
- Are there additional scenarios beyond the running example? (Usually needed — one example is not an evaluation.)

If the running example doesn't work as an evaluation case, flag this — it may indicate the example needs redesign (see `guides/running_example`).

### 6. Propose evaluation section structure

Based on the above, propose the internal structure of the evaluation section:

```markdown
# Evaluation / Case Study

%% Goal: Demonstrate that contributions C1–CN are delivered as claimed. %%

## N.1 [First evaluation component — e.g., "Formal verification results"]

%% Evaluation question: [from step 1]
   Method: [from step 2]
   Expected result: [from step 3] %%

## N.2 [Second component — e.g., "Case study: supply chain collaboration"]

%% ... %%

## N.3 [Discussion of results / Comparison]

%% Synthesis: what do the results collectively demonstrate?
   How do they support the thesis? %%
```

### 7. Identify what must exist before evaluation can be written

Evaluation sections often depend on:
- Formal definitions being stable (can't evaluate what isn't defined yet).
- Tool implementations being complete (can't report results without running the tool).
- Data or scenarios being prepared.

List these dependencies. Add them to TODO.md if not already present.

### 8. Present to Martin

Output in plan mode:
- The contribution → evaluation question mapping.
- The method selection with justification.
- The detailed design for each component.
- The proposed section structure.
- Venue expectation alignment check.
- Dependencies and risks.

Martin approves the plan. Execution follows via WORKFLOW.md "Draft a section" template.

### 9. Update TODO.md

- Add "Draft evaluation section" with the approved structure.
- Add any dependencies (implementation, data preparation, etc.).
- Add "Run `skills/limitations_threats` after evaluation is drafted" — the evaluation design directly informs the limitations.

## When to run

- After the contribution list (Introduction P3) stabilizes.
- Before writing the evaluation section.
- After major changes to contributions (re-run to check alignment).

## Interaction with other skills

- **`skills/claim_evidence_audit`**: The audit checks whether claims match evidence *after* writing. This skill designs the evidence *before* writing. Run this first, then audit after drafting.
- **`skills/limitations_threats`**: The threats to validity identified in step 3 feed directly into the limitations skill. Run limitations after evaluation is drafted.
- **`skills/champion_test`**: Strong evaluation results are often what makes a paper championable. The champion test should reference specific evaluation outcomes.

## Output

- Contribution → evaluation question mapping.
- Evaluation method justification.
- Per-component detailed design.
- Proposed section structure with header comments.
- TODO.md updated.
