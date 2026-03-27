---
description: Scan all section files for mechanical issues before submission: unresolved markers, broken references, anonymity violations, terminology inconsistencies. Use when checking readiness to submit or running a pre-submission scan.
---

# Skill: Pre-Submission Check

**Purpose:** Scan all section files for mechanical issues before submission: unresolved markers, broken references, anonymity violations, and other fixable problems.

## Trigger

- "Run pre-submission check"
- "Check the paper"
- "Are we ready to submit?"

## Inputs

- All files in `sections/`.
- context/VENUE.md (for review type).
- `pandoc/assets/` directory (for reference resolution).

## Steps

### 1. Run automated scan

Execute the check script (`skills/pre_submission_check/check.sh`) or perform these checks manually by reading all section files:

**Unresolved markers:**
- Search all section files for `%% @CITE:` — each is an unresolved citation.
- Search for `%% @FORMAL:` — each is an unresolved formal element.
- Search for `%% @TODO:` — each is an incomplete task.
- Count and list each with file and line location.

**Broken figure references:**
- Find all `\ref{fig:NAME}` in section files.
- Check that a corresponding source file exists in `pandoc/assets/` (matching `fig_NAME.*`).
- Check that a caption exists near each reference.

**Anonymity (if context/VENUE.md review type is double-blind):**
- Search for author names (Martin's name and any co-authors — Martin should list these).
- Search for first-person references to own prior work ("our previous work", "we previously showed" without appropriate third-person framing).
- Search for institutional affiliations.
- Search for acknowledgments that reveal identity.
- Search for GitHub/repo URLs that could identify authors.

**Terminology consistency:**
- Extract key terms from the first occurrence in each section.
- Flag any term that appears with variant spellings or capitalization across sections.
- Flag any abbreviation used before it is defined.

**Structural checks:**
- Every section file has a top-level heading.
- No orphaned sections (referenced in structure paragraph of intro but file missing, or vice versa).
- Abstract exists and is populated.

### 2. Report

Present findings as a numbered list grouped by severity:

**Must fix (blocks submission):**
- Unresolved `%% @CITE: description %%` markers
- Anonymity violations (if double-blind)
- Broken figure references

**Should fix (likely reviewer complaint):**
- Unresolved `%% @FORMAL: description %%` markers
- Terminology inconsistencies
- Undefined abbreviations

**Worth checking (minor):**
- Remaining `%% @TODO: description %%` markers
- Very long paragraphs (> ~15 sentences — may indicate structure problems)

### 3. Update TODO.md

Add a "must fix" task for each blocking issue. Add "should fix" items to the queue.

## Check script

Create `skills/pre_submission_check/check.sh` on first use:

```bash
#!/usr/bin/env bash
# Pre-submission check for paper scaffold
# Run from project root: bash skills/pre_submission_check/check.sh

set -euo pipefail

SECTIONS_DIR="sections"
FIGURES_DIR="figures"

echo "=== Unresolved Markers ==="
echo "--- @CITE markers ---"
grep -rn '%% @CITE:' "$SECTIONS_DIR" || echo "None found."
echo "--- @FORMAL markers ---"
grep -rn '%% @FORMAL:' "$SECTIONS_DIR" || echo "None found."
echo "--- @TODO markers ---"
grep -rn '%% @TODO:' "$SECTIONS_DIR" || echo "None found."

echo ""
echo "=== Figure References ==="
# Extract all \ref{fig:NAME} and check for source files
grep -roh '\\ref{fig:[^}]*}' "$SECTIONS_DIR" | sort -u | while read -r ref; do
    name=$(echo "$ref" | sed 's/\\ref{fig:\(.*\)}/\1/')
    if ! compgen -G "$FIGURES_DIR/fig_${name}."'*' > /dev/null 2>&1; then
        echo "MISSING: $ref — no fig_${name}.* in $FIGURES_DIR"
    fi
done

echo ""
echo "=== Double-Blind Check ==="
echo "Searching for potential identity leaks (add author names to this list):"
# Add author names here:
# grep -rni 'FirstName\|LastName' "$SECTIONS_DIR" || echo "None found."
grep -rni 'github\.com\|gitlab\.com\|bitbucket\.org' "$SECTIONS_DIR" || echo "No repo URLs found."
grep -rni 'acknowledge\|acknowledgement\|acknowledgment' "$SECTIONS_DIR" || echo "No acknowledgments found."
```

Martin should customize this script with author names and co-author names.

## Output

- Numbered issue list by severity.
- Check script created (if not yet present).
- TODO.md updated with must-fix tasks.
