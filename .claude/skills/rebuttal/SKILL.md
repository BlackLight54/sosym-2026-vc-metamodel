# Skill: Rebuttal Preparation

**Purpose:** Given reviewer feedback, prepare a structured rebuttal that addresses every point, maximizes chances of acceptance, and identifies which revision promises are feasible within the timeline.

## Trigger

- "Prepare rebuttal"
- "Help me respond to reviews"
- "We got reviews back"

## Inputs

- Reviewer comments (pasted by Martin).
- The submitted paper (all section files as they were at submission — may need to be retrieved from archive or git).
- VENUE.md (for rebuttal format constraints — word limits, scope of allowed changes).

## Steps

### 1. Parse and classify reviewer comments

For each reviewer, extract every distinct point and classify it:

| Type | Description | Response strategy |
|------|-------------|-------------------|
| **Misunderstanding** | Reviewer misread or missed something that IS in the paper | Point to the specific location. If multiple reviewers miss it, the paper's exposition is the problem. |
| **Valid criticism** | Reviewer identified a genuine weakness | Acknowledge, propose a fix, state whether it's feasible in revision. |
| **Missing related work** | Reviewer cites work we didn't discuss | Assess relevance. If relevant, acknowledge and propose how to integrate. If tangential, explain why briefly. |
| **Scope objection** | Reviewer wants more than the paper promises | Clarify the paper's scope. Don't promise to expand beyond what's feasible. |
| **Request for evidence** | Reviewer wants additional experiments, proofs, or examples | Assess feasibility. Promise only what can be delivered. |
| **Positive point** | Reviewer praises something | Note it — useful for understanding what works. Don't waste rebuttal space responding to praise. |
| **Editorial** | Writing quality, formatting | Acknowledge briefly. |

### 2. Identify the decision-critical points

Not all reviewer points are equal. Identify which points, if left unaddressed, would lead to rejection. These are:

- Points that question the paper's core contribution or novelty.
- Points raised by multiple reviewers (consensus weaknesses).
- Points from the reviewer whose score is closest to the accept threshold.
- Points that the meta-reviewer explicitly highlights.

These get the most rebuttal space.

### 3. Assess feasibility of revisions

For each valid criticism or evidence request:

- **Can it be addressed in the rebuttal text alone?** (clarification, pointing to existing content)
- **Can it be addressed with a minor revision?** (adding a paragraph, a citation, an example)
- **Does it require major revision?** (new experiments, new proofs, structural changes)
- **Is it out of scope?** (future work)

Be honest. Promising a major revision you can't deliver is worse than saying "we acknowledge this limitation and will address it in the camera-ready."

### 4. Draft rebuttal

Structure the rebuttal as:

```
We thank the reviewers for their constructive feedback. We address
the main concerns below.

## Concern 1: [short label] (Reviewer A, Reviewer C)
[Response — 2-4 sentences. Direct, specific, no filler.]

## Concern 2: [short label] (Reviewer B)
[Response]

...
```

**Rebuttal writing rules:**
- Lead with the strongest responses (misunderstandings where you can point to the text, valid criticisms with concrete fixes).
- Never be defensive or dismissive. "We appreciate this observation" → then the substance.
- Be specific: "We will add a comparison with [Author, Year] in Section 2, paragraph 3, showing that their approach requires [assumption] which our setting does not satisfy" — not "We will discuss more related work."
- If a reviewer is wrong, say so politely but clearly, with evidence from the paper.
- Word budget: spend 60% on decision-critical points, 30% on valid-but-non-critical, 10% on clarifications.

### 5. Create revision plan

Separate from the rebuttal text, produce a revision plan for the camera-ready (or R2, if journal):

| Priority | What to change | Where | Addresses reviewer | Feasibility |
|----------|---------------|-------|-------------------|-------------|
| Must | Add comparison with [X] | §2, P4 | R1, R3 | 1 paragraph |
| Must | Clarify threat model assumptions | §3, P1 | R2 | 2 sentences |
| Should | Add running example to §4 | §4 | R1 | 0.5 pages |
| Won't | Full scalability evaluation | — | R2 | Out of scope, acknowledge |

### 6. Self-check

Before presenting the rebuttal:
- Does every reviewer point get a response? (Even minor ones deserve a brief acknowledgment.)
- Are the promises in the rebuttal consistent with the revision plan? (Don't promise what you can't deliver.)
- Does the rebuttal stay within the word/page limit?
- Is the tone professional throughout? No sarcasm, no defensiveness, no excessive gratitude.

### 7. Present to Martin

Output:
- Classified reviewer points (the table from step 1).
- Decision-critical points highlighted.
- Draft rebuttal text.
- Revision plan table.

Martin rewrites the rebuttal and confirms the revision plan.

## Output

- Reviewer point classification.
- Draft rebuttal.
- Revision plan.
