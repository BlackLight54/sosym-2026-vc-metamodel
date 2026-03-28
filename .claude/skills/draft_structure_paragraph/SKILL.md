---
description: Generate or update the introduction's structure paragraph (P5) that maps the paper's organization through its sections. Use when sections change, updating the roadmap paragraph, or when the introduction's structure paragraph needs regeneration.
---

# Skill: Structure Paragraph

**Purpose:** Generate or update the structure paragraph in the introduction (typically the last paragraph, P5) that maps the paper's organization: "Section 2 presents... Section 3 defines..."

This paragraph is entirely derivable from the section files and their goals. It should be regenerated whenever sections are added, removed, renamed, or reordered.

## Trigger

- "Update the structure paragraph"
- "Generate the roadmap paragraph"
- "Sections changed — fix the structure paragraph"

## Inputs

- All section files in `sections/` (for titles and header comments with goals).
- `sections/01_introduction.md` (target for the output).

## Steps

### 1. Read section inventory

For each section file (excluding abstract and introduction), extract:
- Section number and title.
- Goal from the header comment (if present).
- One-sentence summary of what the section contains (from reading the first paragraph or the header comment).

### 2. Generate structure paragraph

Produce one paragraph that traces the paper's **argument** through its sections — not just a list of what each section contains.

**Bad (enumerative — reads like a table of contents):**
> The remainder of this paper is organized as follows. Section 2 presents the background. Section 3 defines the formal model. Section 4 presents the analysis. Section 5 presents the evaluation. Section 6 discusses related work. Section 7 concludes.

**Good (argumentative — shows how the paper builds its case):**
> Section 2 introduces the running example and the background concepts it requires. Section 3 formalizes the compliance problem as a property over choreography traces, which Section 4 then uses to prove that the proposed credential scheme preserves compliance under the stated threat model. Section 5 evaluates the approach on three case studies drawn from cross-organizational procurement. Section 6 positions the contribution against related work in process verification and decentralized identity. Section 7 concludes with a discussion of limitations and future directions.

The difference: the good version shows *why* each section follows from the previous one. "which Section 4 then uses to prove" is a causal link, not just a list entry.

**How to make it argumentative:**

- **Link sections that depend on each other.** If Section 4 builds on definitions from Section 3, say so: "Section 3 defines X, which Section 4 uses to prove Y." Relative clauses and transitional phrases ("building on this," "using these definitions," "which enables") create argumentative flow.
- **Name the specific contribution, not the generic activity.** "Section 3 formalizes compliance as a trace property" beats "Section 3 presents the formal model." The reader should know *what* is formalized, not just *that* something is.
- **Vary the sentence structure.** Not every sentence needs to start with "Section N." Combine related sections: "Sections 3 and 4 develop the formal framework: Section 3 defines the model, and Section 4 establishes its key properties."
- **The conclusion sentence can carry weight.** Instead of "Section 7 concludes," try "Section 7 discusses the limitations of the current threat model and identifies extensions to liveness properties as future work."

**Style rules (unchanged):**
- Each section gets exactly one sentence or clause. No more.
- Use active, specific verbs: "defines," "formalizes," "evaluates," "demonstrates," "compares," "proves." Not "discusses" (too vague) or "is about."
- The verb should match what the section actually does, not what it's about.
- Do not summarize beyond one clause — the structure paragraph is a map of the argument, not an abstract.
- Avoid "Section N is organized as follows" — that's for subsection roadmaps, not the paper-level roadmap.

### 3. Check against reality

Verify:
- Every section file (except abstract and introduction) is mentioned.
- No section is mentioned that doesn't have a corresponding file.
- The order matches the actual file numbering.
- The verbs match what the sections actually contain (not what was originally planned — what's there now).

### 4. Write to introduction

Replace or insert the structure paragraph in `sections/01_introduction.md`. It should be the last paragraph of the introduction, marked with:

```markdown
::: {.scaffold}
Structure paragraph — regenerate with skills/draft_structure_paragraph when sections change.
:::
```

### 5. Update TODO.md

If any section's goal in the header comment doesn't match what the section actually contains, flag it: "Section [N] header goal is stale — update or reconcile."

## When to run

- After `skills/setup_section_scaffold` creates the initial section files.
- After any section is added, removed, or reordered.
- During `skills/review_final_review` (forward reference integrity check).
- Before submission.

## Output

- Structure paragraph written to `sections/01_introduction.md`.
- Stale header goal warnings (if any).
