---
description: Evaluate whether the paper has a champion-worthy insight that a sympathetic reviewer would fight for in a PC meeting. Use when assessing paper strength, checking if the core contribution is visible, or asking 'would anyone champion this?'
---

# Skill: Champion Test

**Purpose:** Evaluate whether the paper, in its current state, would be championed by the Champion reviewer archetype (see `skills/review_reviewer_archetypes`). A paper that passes the champion test has a clear, communicable insight that a sympathetic reviewer would fight for in the PC meeting. A paper that fails may be technically correct but will not be accepted.

This is the single most important quality signal for A* venues.

## Trigger

- "Run the champion test"
- "Would anyone champion this paper?"
- "What's the strongest thing about this paper?"

## Inputs

- CLAUDE.md: thesis.
- Abstract (if it exists).
- Introduction contribution list (P3, if it exists).
- Evaluation section (if it exists).
- Champion persona from context/VENUE.md (if generated).

## Steps

### 1. Identify the champion insight

Answer this question: **If a reviewer reads only the abstract and skims the contributions, what single insight would make them say "this must be accepted"?**

The champion insight is not the same as the thesis. The thesis is the paper's claim. The champion insight is why that claim *matters* — the thing that makes a reviewer lean forward.

Examples of champion insights:
- "This eliminates the need for a trusted third party in cross-organizational process verification — that's a fundamental architectural improvement."
- "The formal model catches a class of attacks that existing approaches miss entirely."
- "This makes something that previously required manual expert analysis fully automated."

Examples of what is NOT a champion insight:
- "The paper is technically sound." (Necessary but not exciting.)
- "The formalism is novel." (Novel how? Why should anyone care?)
- "This extends prior work." (Extensions are incremental by default.)

If you can state the champion insight in one sentence, proceed. If you cannot, flag this — the paper may have a contribution problem, not a presentation problem.

### 2. Visibility check

The champion insight must be visible without deep reading. Check:

- **Abstract contribution element:** Does the abstract's contribution statement convey the insight? A reviewer who reads only this sentence should be able to paraphrase why the paper matters.
- **Abstract implication element:** Does it state what changes because of this work?
- **Introduction P3 (contribution paragraph):** Does it foreground the insight, or bury it in a list of technical deliverables?
- **Title:** Does it hint at the insight?

If the insight exists but is buried, the fix is presentation — foreground it. If the insight is visible but weak, the fix is deeper — the contribution may need strengthening.

### 3. PC meeting simulation

Simulate the 2-minute champion argument. The champion reviewer stands up in the PC meeting and says:

"This paper should be accepted because [one sentence]. The authors [what they did — one sentence]. This matters because [consequence — one sentence]. Yes, [acknowledge the main weakness], but [why it doesn't outweigh the contribution]."

Write this argument out. If it sounds compelling, the paper passes. If it sounds like a stretch, the paper has a problem.

### 4. Diagnose failure

If the champion test fails, diagnose why:

| Failure mode | Symptom | Likely fix |
|-------------|---------|-----------|
| **No insight** | Cannot state in one sentence why this matters | Thesis problem — revisit CLAUDE.md so-what |
| **Buried insight** | Insight exists but is not visible in abstract/intro | Presentation problem — rewrite abstract contribution/implication, intro P3 |
| **Incremental contribution** | Insight reduces to "we did X but slightly differently" | Contribution problem — find the qualitative difference, or accept the paper is incremental |
| **Wrong audience** | Insight is exciting for field A but paper is submitted to field B | Venue mismatch — reframe for the venue or consider a different venue |
| **Undelivered promise** | Insight would be champion-worthy *if* the paper delivered, but the evaluation doesn't | Evidence problem — strengthen evaluation or weaken claim |

### 5. Report

Present:
- The champion insight (one sentence), or "could not identify one" with diagnosis.
- The visibility assessment (where it appears, where it's missing).
- The PC meeting argument (the 2-minute pitch).
- Diagnosis and recommended fix if the test fails.

## When to run

- **After writing the abstract** (`skills/setup_abstract_scaffold` calls this).
- **After the first draft** (does the full paper deliver the champion insight?).
- **During final review** (`skills/review_final_review` calls this).
- **After major revisions** (did the insight survive the rewrite?).
- **Whenever something feels off** about the paper's direction.

## Interaction with other skills

- **`skills/setup_abstract_scaffold`:** Runs the champion test as part of abstract generation. If the test fails at this stage, it may be a thesis problem.
- **`skills/review_final_review`:** Runs the champion test as part of the full-paper review. If the test fails at this stage, it's a delivery or presentation problem.
- **`skills/setup_reviewer_personas`:** The champion persona in context/VENUE.md is an instantiation of the Champion archetype for this specific paper and venue.

## Output

- Champion insight statement (or failure diagnosis).
- Visibility assessment.
- PC meeting argument.
- Recommended fix if needed.
