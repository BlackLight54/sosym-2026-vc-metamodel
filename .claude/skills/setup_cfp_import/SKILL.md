---
description: Import a Call for Papers from a URL or pasted text and populate context/CFP.md and context/VENUE.md with venue details, deadlines, and format requirements. Use when setting up a new venue or importing CFP content.
---

# Skill: CFP Import and Venue Derivation

**Purpose:** Given a CFP URL or pasted text, populate context/CFP.md and derive context/VENUE.md.

## Trigger

- "Import CFP from [URL]"
- "Set up the venue from this CFP" (with pasted text)
- "Initialize the venue"

## Inputs

One of:
- A URL to a CFP web page
- Raw CFP text pasted by Martin

## Steps

### 1. Extract CFP content

If URL provided:
- Fetch the URL.
- Extract the relevant CFP content as clean markdown (strip navigation, footers, ads).
- Preserve: dates, page limits, formatting requirements, topics of interest, review criteria, track descriptions.

If text pasted:
- Clean up formatting. Preserve all factual content.

### 2. Populate context/CFP.md

Write the extracted content into context/CFP.md below the instruction comment. Do not modify the instruction comment at the top of the file.

### 3. Derive context/VENUE.md

Read the CFP content and extract:

- **Venue:** Conference/journal name and track (e.g., "BPM 2026 Track I: Foundations").
- **Page limit:** Extract exact limit. Note if references are included/excluded from limit. Note if there are different limits for different paper types (full, short, etc.).
- **Format:** Identify the required template (LNCS, IEEEtran, ACM sigconf, etc.). If not explicitly stated, infer from the venue.
- **Deadlines:** Extract all dates available in the CFP and populate the Deadlines section of context/VENUE.md:
  - Abstract deadline (if separate from submission).
  - Submission deadline (in YYYY-MM-DD format — this is used for time calculations by `skills/review_paper_status` and CLAUDE.md time awareness).
  - Notification date.
  - Camera-ready date.
  - Rebuttal window (if applicable).
  - If a date is not in the CFP, leave the field as placeholder.
- **Review type:** double-blind / single-blind / open. If CFP says "submissions must be anonymized" → double-blind. If CFP says "authors should not be identified" → double-blind. If not stated, flag for Martin to confirm.

For **Exemplar papers**, suggest 2–3 papers published at the same venue in recent years that are well-written in a style appropriate for the paper's topic. Present with a one-line note on why each is a good style model. Martin confirms or replaces.

Reviewer personas are NOT generated here — they need paper content to be useful. The skill adds a TODO to run `skills/setup_reviewer_personas` after more context exists.

### 4. Update TODO.md

- Mark "Initialize project" sub-task as done (if applicable).
- Add remaining setup tasks: "Write thesis in CLAUDE.md", "Set domain in CLAUDE.md".
- Add: "Run `skills/setup_reviewer_personas` after thesis and gap analysis are done."

## Output

- context/CFP.md populated with raw CFP content.
- context/VENUE.md populated with venue, budget, format, deadlines (YYYY-MM-DD), review type, exemplar papers. Reviewer personas section left empty (populated later by `skills/setup_reviewer_personas`).
- TODO.md updated.
