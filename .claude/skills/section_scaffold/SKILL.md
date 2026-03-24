# Skill: Section Scaffold

**Purpose:** Create the initial set of section files in `sections/` based on the venue format and the paper's planned structure.

## Trigger

- "Create section files"
- "Scaffold the paper"
- "Set up sections for [venue/format]"

## Inputs

- VENUE.md must be populated (needs format and page limit).
- CLAUDE.md must have thesis and domain filled.
- Martin provides a section list, or Claude proposes one based on venue conventions.

## Steps

### 1. Determine section structure

**If Martin provides a section list:** Use it directly.

**If not:** Propose a structure based on the venue format:

**LNCS (Springer) typical structure:**
- Abstract, Introduction, Background/Related Work, [1–2 contribution sections], Evaluation/Case Study, Discussion, Conclusion
- Related work sometimes at the end before Conclusion

**IEEEtran typical structure:**
- Abstract, Introduction, Related Work, [contribution sections], Evaluation, Threats to Validity (if empirical), Conclusion
- Related work almost always in Section 2

**ACM sigconf typical structure:**
- Abstract, Introduction, Background, [contribution], Evaluation, Discussion, Related Work, Conclusion
- Related work often near the end

Present the proposed structure to Martin. Martin confirms, modifies, or provides their own.

### 2. Create section files

For each section, create `sections/NN_name.md` in Obsidian/MathPix Markdown:

```markdown
# Section Title

%%
Goal: [one sentence — what this section must accomplish]
Budget: [approximate page allocation from VENUE.md total]
Dependencies: [what must exist before this can be written]
%%

```

Number files with zero-padded two-digit prefixes: `00_abstract.md`, `01_introduction.md`, `02_background.md`, etc.

### 3. Generate initial page budget proposal

Based on the total page limit from VENUE.md and the section structure, propose approximate page allocations. Rules of thumb:

- Abstract: 0.3–0.5 pages (often on first page with intro)
- Introduction: 1–1.5 pages
- Background/Related Work: 1.5–2 pages
- Core contribution: 3–5 pages (largest allocation)
- Evaluation: 2–3 pages
- Discussion: 0.5–1 page
- Conclusion: 0.3–0.5 pages

These are embedded as comments in each section file header, not tracked separately.

### 4. Populate Introduction skeleton

The introduction gets more structure than other sections because its rhetorical moves are predictable:

```markdown
# Introduction

%% P1: Hook — why does the problem matter? Ground in concrete consequences.  %%

%% P2: Gap — what is missing, broken, or unsolved? Be specific.  %%

%% P3: Contribution — the most important paragraph in the paper.
     This is where reviewers form their first impression of the contribution.
     Structure as a numbered list:
     
     "The contributions of this paper are:
     (1) A formal definition of [X] that captures [property] (Section N).
     (2) A proof/analysis that [property holds / is decidable / ...] (Section M).
     (3) A case study / evaluation demonstrating [concrete result] (Section K)."
     
     Each item must be: specific, falsifiable, and forward-reference its evidence section.
     Use skills/claim_evidence_audit to verify this paragraph delivers what it promises.  %%

%% P4: Approach sketch — how? One paragraph, enough to be credible.  %%

%% P5: Structure — trace the argument through the sections, not just list them.
     Show how each section builds on or enables the next. See skills/structure_paragraph.  %%

```

Other sections get only the header comment block — their internal structure is planned in TODO.md when Martin is about to write them.

### 5. Generate structure paragraph

Run `skills/structure_paragraph` to populate the introduction's P5 from the section inventory just created.

### 6. Update TODO.md

Add per-section writing tasks to the queue:
- "Plan and draft Section 1: Introduction"
- "Plan and draft Section 2: Background"
- etc.

## Output

- Section files created in `sections/`.
- Introduction has paragraph-level skeleton including generated structure paragraph.
- Other sections have header comments with goal, budget, dependencies.
- TODO.md updated with writing tasks.
