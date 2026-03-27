---
description: Two-level audit that maps contributions to evidence sections and scans every claim for proportional evidence. Use when auditing claims, mapping contributions, or checking for overclaiming/underclaiming.
---

# Skill: Claim Audit

**Purpose:** Two-level audit. First: verify the numbered contribution list maps to evidence sections (contribution mapping). Second: scan every claim in the paper for proportional evidence. The most common soft rejection at A* venues is a mismatch between claim language and evidence type.

## Trigger

- "Audit claims and evidence"
- "Map the contributions"
- "Are we overclaiming anywhere?"
- "Check claim strength"

## Inputs

- All section files.
- CLAUDE.md (thesis).

## Steps

### 1. Contribution mapping

Extract or verify the numbered contribution list from the introduction (typically P3).

Each contribution must be specific, falsifiable, and distinct. Map each to its evidence section:

| Contribution | Evidence section | Evidence type | Delivered? |
|-------------|-----------------|---------------|-----------|
| C1: [claim] | Section [N] | [formal def / proof / case study / experiment] | strong / weak / missing |

Diagnose:
- **Overclaim:** Introduction promises more than the evidence delivers.
- **Underclaim:** Paper delivers more than claimed. Strengthen the claim.
- **Orphan evidence:** Significant work in a section that isn't claimed as a contribution.
- **Missing evidence:** A contribution has no corresponding section.

Check that the contribution paragraph (Introduction P3) forward-references each evidence section and uses language matching the evidence type ("We define..." / "We prove..." / "We demonstrate...").

### 2. Extract all claims

Read every section file. For each sentence, classify it:

- **Strong claim:** "We prove / guarantee / ensure / establish that..."
- **Medium claim:** "We show / demonstrate / our analysis reveals that..."
- **Weak claim:** "We argue / suggest / our results indicate that..."
- **Not a claim:** Definitions, descriptions of method, transitions, background.

Record each claim with: the sentence (paraphrased), its location, and its strength level.

### 3. Classify evidence types

For each claim, identify what evidence supports it:

| Evidence type | Strength ceiling | Examples |
|--------------|-----------------|----------|
| Formal proof | Strong | Theorem with proof, verified by tool |
| Proof sketch | Medium | Outline of proof, full version in appendix |
| Formal analysis | Medium–Strong | Model checking results, static analysis |
| Case study | Medium | Worked example on real-world scenario |
| Experiment | Medium–Strong | Controlled experiment with metrics |
| Example | Weak–Medium | Illustrative instance, not comprehensive |
| Argument | Weak | Logical reasoning without formal backing |
| None | — | Claim is asserted without support |

### 4. Diagnose mismatches

For each claim, check:

**Overclaim (claim is stronger than evidence):**
- "We prove X" but only a proof sketch exists → either downgrade to "We argue" or provide the full proof.
- "We guarantee Y" but the case study only shows Y in one scenario → downgrade to "We demonstrate Y in [context]."
- "Our approach handles Z" but Z is only discussed, never formalized → either formalize or weaken.

**Underclaim (evidence is stronger than claim):**
- Full formal proof exists but the paper says "We argue" → upgrade to "We prove."
- Comprehensive experiments but the paper says "preliminary results indicate" → upgrade.

**Unsupported claim:**
- A claim has no evidence at all. Either provide evidence, add a `%% @FORMAL: description %%` or `%% @CITE: description %%` marker, or cut the claim.

**Evidence without a claim:**
- Significant analysis or results exist that aren't claimed as a contribution. Either claim them or question why the analysis is in the paper.

### 5. Check hedging language

Scan for hedging patterns and evaluate whether each is appropriate:

- **Appropriate hedging:** "Under the assumption that channels are authentic, we prove..." (honest scope limitation).
- **Inappropriate hedging:** "It might be the case that our approach could potentially..." (lack of confidence that undermines the paper).
- **Missing hedging:** "Our approach is secure" without stating assumptions (overclaim — what threat model?).

### 6. Report

Present findings as a table:

| # | Claim (paraphrased) | Location | Claim strength | Evidence type | Evidence location | Diagnosis |
|---|---------------------|----------|---------------|---------------|-------------------|-----------|
| 1 | We prove X | §1, P3 | Strong | Proof sketch | §4.2 | OVERCLAIM: upgrade proof or downgrade claim |
| 2 | We show Y | §3, P1 | Medium | Case study | §5 | OK |
| 3 | Z holds | §3.2, P4 | Medium | None | — | UNSUPPORTED: needs evidence or cut |

Group by severity: overclaims first (most dangerous for review), then unsupported, then underclaims (opportunities), then clean entries (no action needed).

### 7. Update TODO.md

For each overclaim: "Fix overclaim in [location] — either strengthen evidence or weaken claim."
For each unsupported claim: "Support or cut claim in [location]."
For underclaims: "Consider strengthening claim in [location] — evidence supports it."

## When to run

- After first draft is complete.
- After modeling phase (when formal results may have changed what the paper can claim).
- As part of `skills/final_review`.
- Before submission — a last check that the rewriting process didn't introduce new overclaims.

## Output

- Claim–evidence table.
- Severity-grouped diagnosis.
- TODO.md updated.
