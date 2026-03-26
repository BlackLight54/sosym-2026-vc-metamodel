# Prompt: Propagate CPL Layer Rename

**Phase:** 4 (sequential — after all restructuring prompts complete)
**Execution:** Must run AFTER P01, P03, P04, P05, P06 are all complete. This prompt touches nearly every file — running it in parallel with anything else risks merge conflicts.
**Dependencies:** P01 must have completed and recorded the decision in DECISIONS.md. P03/P04/P05/P06 must have completed so all files are in their final structure.
**Chain edits:** After completion, edit `prompts/2026-03-26_08_claim_evidence_audit.md` — update `<<TERMINOLOGY>>` placeholder with the new layer name.

---

## Context

P01 (CPL Rename Research) determined that "Claim Property Layer" should be renamed to:

**Old name:** Claim Property Layer
**New name:** Domain Concept Layer

This rename must be propagated to all files that reference the layer name. The rename is mechanical — no argumentative changes, just terminology replacement.

## Task

### Step 1 — Verify the decision

Read `DECISIONS.md` and confirm the CPL rename decision is recorded. If the decision says "candidates for Martin" (i.e., Martin hasn't chosen yet), STOP and ask Martin to choose before proceeding.

### Step 2 — Inventory all occurrences

Search for all occurrences of the old name and its variants across the project. Variants to search for:

- "Claim Property Layer" (full name)
- "claim property layer" (lowercase)
- "CPL" (abbreviation — check context to avoid false positives)
- "claim-property-layer" (hyphenated, in markers or file references)
- "Claim Property" (partial match, e.g., "Claim Property Layer constraints")
- In code/models: `ClaimProperty`, `claim_property`, or any variable/class names derived from it

### Files to update (verify this list against Step 2 results)

- `sections/00_abstract.md`
- `sections/01_introduction.md`
- `sections/02_background.md`
- `sections/03_motivation.md` (now "Overview")
- `sections/04_approach.md`
- `sections/05_evaluation.md`
- `sections/06_related_work.md`
- `sections/07_conclusion.md`
- `CLAUDE.md` (thesis block and terminology decision)
- `DECISIONS.md` (add a superseding note to the 2026-03-24 terminology decision; record the rename)
- `TODO.md`
- `models/*.problem` and `models/*.refinery` files (confirmed: `models/csok_instance.refinery`, `models/vc_metamodel.refinery` reference CPL)
- `.claude/skills/refinery/three_layer_pattern.md` (references CPL in layer documentation)
- `tex/sections/*.tex` files (derived from markdown — regenerate via pandoc rather than manual edit, but verify after)
- Any other files found in Step 2

Note from P05: Intro P2 was revised (new sentences added). Verify that any new
text referencing layer names uses "domain concept layer" / "DCL", not the old
"claim property layer" / "CPL". The P4 approach sketch (line 43) still uses the
old name — rename it.

Note from P06: New text was added to sections/04_approach.md in the preamble,
per-subsection mode annotations (4.1, 4.2, 4.3), and a three-mode demonstration
in Sec 04.4. Verify that new text uses "domain concept layer" / "DCL", not
"claim property layer" / "CPL". The existing subsection header "## Claim Property
Layer" (line 14) and all existing CPL references still need renaming.

Note from P06: New text was added to sections/01_introduction.md in the approach
sketch paragraph (P4). Verify that "claim property layer" in P4 is renamed to
"domain concept layer" — P06 did not rename existing text.

### Step 3 — Execute the rename

For each file:
1. Replace all variants of the old name with the corresponding variant of the new name.
2. Preserve the abbreviation convention: the paper uses "CPL" as shorthand — this changes to "DCL" (Domain Concept Layer). The abbreviation is already recorded in DECISIONS.md.
3. In `CLAUDE.md`, update the thesis block (layer names) and the terminology decision reference.
4. In `DECISIONS.md`:
   - Add a new decision entry for the rename
   - Add a "Superseded by" note to the 2026-03-24 terminology decision, pointing to the new entry

### Step 4 — Verify consistency

After all replacements:
1. Search again for any remaining occurrences of the old name — there should be zero (except in archive/ files, which are historical records and should NOT be modified).
2. Verify that the new name reads naturally in all contexts: "at the [new name] layer," "[new name]-layer constraints," "the [new name] captures..."
3. Check that the abbreviation is introduced exactly once (first use in the abstract or introduction) and used consistently thereafter.

### Step 5 — Chain edit (CRITICAL)

Edit `prompts/2026-03-26_08_claim_evidence_audit.md`:
1. Find placeholder `<<TERMINOLOGY>>` and replace with the new layer name and abbreviation.
2. Add a note that the audit should verify the rename was applied consistently.

## Constraints

- This is a MECHANICAL rename. Do NOT change the meaning, structure, or argumentation of any text.
- Do NOT modify files in `archive/` — those are historical records.
- Do NOT change "Credential Schema Layer" or "Format-Specific Layer" — only the CPL is being renamed.
- If you encounter a sentence where the new name reads awkwardly, flag it for Martin rather than rewriting the sentence.
- If models/*.problem files use the old name in Refinery class names or predicates, rename those too — but note that this may require retesting in Refinery.
