---
description: Decompose multi-section revisions into ordered, self-contained prompt files ensuring correct change propagation. Use when a change affects multiple sections, propagating revisions across the paper, or planning a cross-cutting revision.
---

# Skill: Revision Orchestration

**Purpose:** Decompose a revision that touches multiple sections into ordered, self-contained Claude Code prompts. Ensures changes propagate correctly and nothing is missed.

## Trigger

- "This change affects multiple sections"
- "Propagate [change] across the paper"
- "Plan the revision for [issue from final_review or claim_audit]"
- "Fix all the issues from the review"

## Why this exists

Single-section edits are straightforward — use the "Revise a section" template in context/WORKFLOW.md. But some changes cascade:

- Renaming a concept changes every section that uses it.
- Removing a claim from Section 3 invalidates parts of Section 1 (contribution list), Section 4 (evaluation), and the abstract.
- A reviewer asks you to restructure the argument, which touches introduction framing, background ordering, and conclusion.

Doing these as ad-hoc edits creates inconsistencies. This skill produces an ordered sequence of prompts that maintain coherence.

## Inputs

- The change to be made (from Martin, from `skills/final_review`, from `skills/claim_evidence_audit`, or from reviewer feedback).
- All section files (to trace dependencies).

## Steps

### 1. Analyze the change

Classify the revision:

| Type | Example | Propagation pattern |
|------|---------|-------------------|
| **Terminology** | Rename "trust credential" → "compliance token" | Every section, every occurrence |
| **Claim removal** | Drop C3 from contribution list | Intro P3, abstract, sections that reference C3, conclusion |
| **Claim addition** | Add new contribution | Intro P3, abstract, new evidence section, conclusion |
| **Definition change** | Modify Definition 4 | All sections that use Def 4, any proofs that depend on it |
| **Restructure** | Move related work from §2 to §6 | Section numbering, all forward/backward refs, intro structure paragraph |
| **Scope change** | Narrow the threat model | Abstract, intro gap, contribution claims, evaluation scope, discussion limitations |
| **Reviewer response** | Address specific reviewer concern | Depends on concern — trace from the point of critique |

### 2. Trace dependencies

For each section file, determine:
- Does this section reference the thing being changed?
- If changed, would this section become inconsistent?
- What is the minimal edit needed here?

Build a dependency graph. Order edits so that upstream changes happen before downstream ones.

**Ordering principle:** Change the authoritative definition first, then propagate outward. For terminology: change the definition site → update all uses. For claims: change the contribution list → update evidence sections → update intro/conclusion/abstract.

### 3. Generate prompt files

Create one prompt file per edit in `prompts/`:

Filename: `YYYY-MM-DD_revision_NN_[section]_[description].md`

The `NN` prefix encodes execution order (01, 02, 03...).

Each file:

```markdown
# Revision: [short description]

**Part of:** [the overall change being made]
**Execute after:** [list of prompt files that must complete first, or "none"]
**Target:** sections/[filename].md

## Goal

[Specific, concrete goal for this edit. What changes and why.]

## What changed upstream

[What was changed in previous prompts that this edit must be consistent with.
Include the new terminology, the revised definition, the dropped claim — whatever
this edit needs to know.]

## Constraints

- [What must NOT change in this section]
- [Terminology to use/avoid]
- [Page budget awareness]

## After

- [What to check: does this section still make sense after the edit?]
- [Any downstream prompts that depend on this one]
- [If significant text removed, move to archive/]
```

### 4. Generate a summary prompt

Create one additional file: `YYYY-MM-DD_revision_00_plan.md`

This is NOT an edit prompt — it's a summary of the full revision plan:

```markdown
# Revision Plan: [overall change]

**Date:** [today]
**Triggered by:** [what caused this revision — reviewer feedback, final_review finding, etc.]

## Change summary

[One paragraph: what is changing and why.]

## Prompt sequence

1. `revision_01_[section]_[desc].md` — [one-line summary]
2. `revision_02_[section]_[desc].md` — [one-line summary]
3. ...

## Verification

After all prompts are executed:
- [ ] Re-read the modified sections in order for coherence.
- [ ] Run `skills/pre_submission_check` to catch broken refs.
- [ ] Check that the abstract still matches the paper.
```

### 5. Update TODO.md

Add one task per prompt file, in order:
- "Execute `prompts/revision_01_...` (do first)"
- "Execute `prompts/revision_02_...` (after 01)"
- etc.
- "After all revision prompts: coherence check"

## Handling reviewer feedback

When processing multiple reviewer points (from `skills/rebuttal`), each point may generate its own revision plan. If two revision plans touch the same section, merge them into a single plan with the combined edits — don't create conflicting prompts for the same file.

## Output

- Ordered prompt files in `prompts/`.
- Summary plan file.
- TODO.md updated with sequenced tasks.
