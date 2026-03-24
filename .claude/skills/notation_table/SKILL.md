# Skill: Notation Table

**Purpose:** Scan all section files for mathematical notation, check consistency, and generate a notation summary. Useful during writing as a consistency reference, and required by some venues as a paper element.

## Trigger

- "Generate notation table"
- "Check notation consistency"
- "List all symbols"

## Inputs

- All section files in `sections/`.

## Steps

### 1. Scan for notation

Read every section file. Extract all mathematical symbols and notation used in `$...$` and `$$...$$` blocks. For each, record:

- The symbol or notation (e.g., `$\mathcal{P}$`, `$\sigma$`, `$\vdash$`).
- Where it first appears (section, approximate location).
- Where it is defined (if a formal definition exists — may be a different location from first use).
- What it denotes (from the surrounding prose or definition).

### 2. Check consistency

**Overloaded symbols:** Is the same symbol used for different things in different sections? Flag with both uses.

**Undefined symbols:** Is a symbol used before it is defined? Flag with the use location and the definition location (or "no definition found").

**Variant spellings:** Is the same concept written differently in different places? E.g., `$\mathcal{P}$` in Section 3 but `$P$` in Section 5. Flag.

**Unused definitions:** Is a symbol defined but never used afterward? Flag — it may be a remnant from a cut passage.

### 3. Generate notation table

Produce a table sorted by order of first appearance:

```markdown
| Symbol | Meaning | Defined in | First used in |
|--------|---------|-----------|---------------|
| $\mathcal{P}$ | Set of participants | Def. 1, §3.1 | §1, P3 |
| $\sigma$ | Execution trace | Def. 3, §3.2 | §3.2 |
```

### 4. Determine placement

Some venues expect a notation table in the paper (typically at the end of the background section or as an appendix). Check VENUE.md:

- If venue conventions include notation tables → propose adding one to a section file.
- If not standard for the venue → produce as a working reference only (do not add to paper).

If adding to the paper, write it to the appropriate section file with a `\label{tab:notation}` for referencing.

### 5. Report

Present:
- The notation table.
- Any consistency issues found (overloaded, undefined, variant, unused).
- Recommendation on whether to include in the paper.

### 6. Update TODO.md

For each consistency issue: "Fix notation inconsistency: [description] in [locations]."

## When to run

- After first draft is complete (to catch early inconsistencies).
- After modeling phase (definitions may have changed).
- Before submission (final consistency check).

## Output

- Notation table (as working reference or for inclusion in paper).
- Consistency issue report.
- TODO.md updated.
