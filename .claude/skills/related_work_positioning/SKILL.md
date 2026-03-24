# Skill: Related Work Positioning

**Purpose:** Build a structured comparison matrix that positions the paper against related work on specific technical dimensions. Transforms "X does something different" into "X handles P but not Q; we handle both at the cost of assuming R."

## Trigger

- "Position against related work"
- "Build comparison matrix"
- "How do we differentiate from [specific paper]?"

## Inputs

- CLAUDE.md (thesis, domain).
- Reference notes in `archive/references/` (from `skills/prior_work_import`).
- Gap analysis results.
- Related work section draft (if it exists).

## Steps

### 1. Identify comparison dimensions

Extract the technical dimensions on which the paper's contribution should be compared. These are NOT generic categories ("approach," "scope") — they are specific, falsifiable properties.

**How to find dimensions:**
- What does the paper do that competing approaches cannot? Each such thing is a dimension.
- What assumptions does the paper make? Each assumption's absence is a dimension where competitors might be stronger.
- What properties does the formalism guarantee? Each property is a dimension.

**Example dimensions for a formal verification paper:**
- Handles multi-party collaboration (yes/no/partial)
- Decentralized execution (yes/no)
- Formally verified security properties (which ones specifically)
- Supports dynamic participants (yes/no)
- Requires trusted third party (yes/no)
- Scalability beyond N participants (demonstrated/claimed/not addressed)

**Bad dimensions:** "Novel" (not falsifiable), "Practical" (vague), "Comprehensive" (meaningless).

### 2. Select works to compare

From the reference notes and gap analysis, select:
- **Direct competitors:** 3–5 works that address the same problem or a close variant. These are the works a reviewer will immediately think of.
- **Foundational works:** 1–2 works the paper builds on. Not competitors but need positioning ("we extend X by adding Y").
- **Adjacent works:** 1–2 works from adjacent fields that a cross-disciplinary reviewer might cite ("what about approach Z from [other field]?").

### 3. Build the matrix

| | Dim 1 | Dim 2 | Dim 3 | Dim 4 | Dim 5 |
|---|---|---|---|---|---|
| This paper | ✓ | ✓ | partial | ✗ (assumes R) | ✓ |
| Competitor A [ref] | ✓ | ✗ | ✓ | ✓ | ✗ |
| Competitor B [ref] | ✗ | ✓ | ✗ | ✓ | partial |
| ... | | | | | |

For each cell, use: ✓ (fully addressed), partial (addressed with limitations), ✗ (not addressed), N/A (not applicable to this approach).

**Critical:** Be honest. If a competitor beats the paper on a dimension, say so. The paper should win on the dimensions that matter most for the thesis, and explicitly acknowledge where it doesn't win.

### 4. Derive positioning statements

From the matrix, generate positioning statements for each competitor:

**Pattern:** "[Competitor] addresses [dimensions where they're strong] but [does not address / only partially addresses] [dimensions where we're strong]. In contrast, our approach [what we do differently], which enables [consequence], at the cost of [honest limitation]."

Each statement must:
- Name specific technical differences, not vague impressions.
- Acknowledge the competitor's strengths.
- Explain *why* the difference matters (not just that it exists).
- Be honest about trade-offs.

### 5. Identify the paper's unique cell

There should be at least one column (dimension) or combination of columns where this paper is the only ✓. That's the novelty claim in concrete form. If no such cell exists, the paper has a positioning problem — flag it.

### 6. Check for missing competitors

Does the matrix suggest any empty rows? Work that should be compared but isn't? Flag these as research tasks for gap analysis.

### 7. Propose related work structure

Based on the matrix, suggest how to organize the related work section:

- **By dimension:** Group works by which dimension they share with the paper. Works well when dimensions map to distinct research communities.
- **By approach type:** Group works by their technical approach. Works well when the same problem has been attacked multiple ways.
- **By chronological development:** Only if the field has a clear evolutionary arc that the paper is the next step of.

Each group gets a paragraph. The paragraph compares 2–3 works within the group on the relevant dimensions, then states how the paper differs.

### 8. Present to Martin

Output:
- The comparison matrix.
- The unique cell analysis.
- Positioning statements for each competitor.
- Suggested related work structure.
- Any gaps (missing competitors, unclear dimensions).

Martin rewrites all positioning statements.

### 9. Update TODO.md

- Add "Write related work section using positioning from comparison matrix" if not drafted.
- Add "Check [specific competitor] — potential missing from matrix" for any gaps.

## The matrix as a figure

Consider whether the comparison matrix itself should be a table in the paper (common in SE and FM papers). If so, add it to the figure plan — the skill can propose this.

## Output

- Comparison matrix.
- Positioning statements per competitor.
- Related work structure proposal.
- TODO.md updated.
