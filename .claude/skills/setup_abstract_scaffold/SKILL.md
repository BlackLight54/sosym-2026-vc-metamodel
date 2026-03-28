---
description: Generate a structured abstract draft from the thesis. Use when the user wants to draft, scaffold, or plan the abstract section.
---

# Skill: Abstract Scaffold

**Purpose:** Generate a structured abstract draft from the thesis in CLAUDE.md. The abstract is a contract — it commits to a claim, a method, and a result before the paper is written.

## Trigger

- "Draft the abstract"
- "Scaffold the abstract"
- "Write the abstract contract"

## Inputs

- CLAUDE.md must have thesis filled (core claim, mechanism, so-what).
- context/VENUE.md must have review type (for voice: "We" vs. passive).
- Domain from CLAUDE.md (calibrates register).

## Steps

### 1. Read thesis and venue

Extract:
- Core claim, mechanism, so-what from CLAUDE.md.
- Review type from context/VENUE.md (if double-blind, most CS venues still allow "We").
- Word/character limits for abstracts if specified in context/CFP.md.

### 2. Generate abstract draft

Produce a 4–8 sentence abstract that covers all of the following elements. The order below is one natural arrangement, but not the only one — some abstracts lead with the contribution, others with a surprising result. What matters is that every element is present and the abstract reads as a coherent argument, not a fill-in-the-blanks template.

**Required elements (all must appear):**

| Element | What it must accomplish | Test |
|---------|----------------------|------|
| **Problem** | Name the concrete problem. No generic motivation — the specific gap in the world that this paper addresses. | Would a reader outside the subfield understand *why* this matters? |
| **Gap** | What is missing or broken in current approaches? Why is the status quo insufficient? | Does this distinguish the problem from solved problems? |
| **Contribution** | What does this paper do? State the claim precisely enough to be falsifiable. Use "We propose/present/define..." (if venue allows) or passive. | If someone reads only this sentence, can they determine whether the paper delivers? |
| **Mechanism** | How does the approach work? Name the key technical elements — not a full method description, but enough to be credible. | Could a domain expert distinguish this approach from competing ones? |
| **Evidence** | What are the concrete results? Proofs, measurements, case study outcomes. Not "we evaluate" but what the evaluation *found*. | Does this state results, or just promise activity? |
| **Implication** | What changes because of this work? What can people do now that they couldn't before? | If removed, would the abstract still motivate the reader to continue? |

**Structural freedom:** These elements can be combined, reordered, or split across sentences. Problem + gap often merge into one sentence. Mechanism + evidence sometimes interleave. A strong abstract might lead with the implication ("X is now possible for the first time") and then explain how. The checklist constrains *content*, not *form*.

**What to avoid:**
- An abstract that follows the table row-by-row produces robotic prose. Vary the structure.
- "In this paper, we..." as the opening sentence. The problem should come first.
- Evidence described as activity ("We evaluate...") rather than outcome ("Our analysis shows...").

### 3. Self-critique

After generating the draft, evaluate it:

- **Contribution is falsifiable.** If someone reads only the contribution sentence(s), can they determine whether the paper delivers? If not, rewrite.
- **Problem is specific.** "Security is important" fails. "Cross-organizational BPMN collaborations cannot currently verify participant compliance without a trusted orchestrator" works.
- **Evidence states results, not activity.** "We evaluate on three case studies" is activity. "Our analysis detects two previously unknown compliance violations in a real-world procurement process" is a result.
- **Abstract is unique to this paper.** Could this abstract describe a different paper? If yes, it's too vague.
- **All six elements are present.** Check each off. If one is missing, it's usually the implication or the concrete evidence.

Present the draft with the self-critique. Martin rewrites.

### 4. Champion test

Run `skills/review_champion_test`. At the abstract stage, this evaluates whether the thesis has a champion-worthy insight and whether the abstract makes it visible.

If the champion test fails here, it may be a thesis problem, not an abstract problem — flag for Martin before continuing.

Present the champion test result alongside the abstract draft.

### 5. Write to file

Write the draft to `sections/00_abstract.md`:

```markdown
# Abstract

::: {.scaffold}
This is a contract. Revisit after major changes to the paper's argument.
Structure: problem → gap → contribution → approach/results → implication
:::

[abstract text]
```

### 6. Update TODO.md

Mark abstract task done. Add "Revisit abstract after first draft is complete" to the queue.

## Output

- `sections/00_abstract.md` with structured draft.
- Self-critique presented to Martin.
- TODO.md updated.

## Revisiting the abstract

This skill can be re-run later with the instruction "Revisit the abstract." In revision mode:

- Read the current state of all sections.
- Compare the abstract's claims against what the paper actually delivers.
- Flag any mismatches: overclaims, underclaims, missing results, changed terminology.
- Propose a revised abstract. Martin rewrites.

## Title crafting

Run alongside the abstract (initial) or during final review (revision).

### How to generate title candidates

Produce 3–5 candidate titles. Each must:

- **Set correct expectations.** A reviewer reading only the title should correctly predict the paper's contribution type (formalization, analysis, tool, empirical study).
- **Be specific enough to distinguish.** "A Formal Approach to Business Process Security" could be 50 papers. "Verifiable Compliance in Decentralized BPMN Collaborations" is one paper.
- **Name the key mechanism or insight.** The title should hint at *how*, not just *what*.
- **Avoid filler words.** "Towards," "A Novel," "An Approach to" — cut these unless precision demands them. "Towards" signals incomplete work and invites suspicion.

### Title patterns common at A* venues

| Pattern | Example | When to use |
|---------|---------|-------------|
| [Mechanism] for [Goal] | "Verifiable Process History Credentials for Decentralized Orchestration" | When the mechanism is the contribution |
| [Result]: [Context] | "Compliance Without Trust: Formal Verification of Decentralized Business Processes" | When the result is surprising or compelling |
| [Concept]: [Explanation] | "Self-Orchestration: Eliminating Central Control in Cross-Organizational Workflows" | When introducing a new concept |
| [Question]? | "Can Decentralized Processes Verify Their Own Compliance?" | Bold, but risky — use only if the answer is definitively "yes" |

### Self-check

For each candidate:
- Would a reviewer in the paper's field immediately understand the scope?
- Would a reviewer outside the field get the gist?
- Does it match the abstract's contribution statement?
- Is it under 15 words? (Shorter titles are more memorable.)

Present candidates to Martin. Martin picks or writes their own.

