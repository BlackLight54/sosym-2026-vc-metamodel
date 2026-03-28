---
description: Verify project consistency across all artifacts — completed todos reflected in sections, decisions reflected in prose, claim delivery status accurate, cross-references valid, skill/workflow references intact. Use after major changes, before submission, or when something feels off.
---

# Skill: Project Consistency Check

**Purpose:** Read all project artifacts and verify they are mutually consistent. Catches: stale references, orphaned files, decisions not reflected in prose, claims marked delivered but missing evidence, todos marked done but work incomplete, broken cross-references between skills/WORKFLOW/CLAUDE.md.

## Trigger

- "Check project consistency"
- "Is everything in sync?"
- "Run a consistency check"
- "Something feels off — verify the state"

## Inputs

All project artifacts:

- `.claude/memory/decision_*.md` — active decisions
- `.claude/memory/claim_*.md` — binding claims with delivery status
- `context/todos/INDEX.md` + individual todo files
- `sections/*.md` — all section files
- `.claude/skills/README.md` — skill inventory
- `context/WORKFLOW.md` — workflow references
- `CLAUDE.md` — key files, thesis, skill references
- `AUTHOR_NOTES.md` — conventions and references
- `context/archive/` — archived artifacts

## Steps

### 1. Decision-prose consistency

For each active decision memory (`decision_*.md`):
- Read the `affects` field to identify target sections.
- Read those sections. Verify the decision is reflected in the prose.
- Flag: decision exists but prose contradicts it, or prose uses terminology/framing the decision prohibits.

### 2. Claim delivery accuracy

For each claim memory (`claim_*.md`):
- Read the `status` field (not_started / partial / delivered / weak).
- Read the `evidence_section` field. Check the actual section content.
- Flag: claim marked "delivered" but section has `.todo` annotations or placeholder prose; claim marked "not_started" but section has substantive content.

### 3. Todo completion verification

For each todo file with status "done" or "completed":
- Read the `target` field. Check the target section.
- Verify the work described in the todo is actually present in the section.
- Flag: todo marked done but target section still has scaffolds or `.todo` annotations in the relevant paragraphs.

### 4. Cross-reference integrity

Scan all infrastructure files for references:
- `CLAUDE.md` references to `context/`, `skills/`, file paths — do targets exist?
- `context/WORKFLOW.md` references to `skills/` — do targets exist?
- `AUTHOR_NOTES.md` references to directories and files — do targets exist?
- `.claude/skills/README.md` skill list — does each listed skill directory exist?
- Inter-skill references (SKILL.md files referencing other skills) — do targets exist?

### 5. Marker census reconciliation

- Count annotation markers (`.todo`, `.cite`, `.formal`, `.figure`, `.scaffold` divs/spans) across all section files.
- Compare against any marker counts recorded in todo files or previous audits.
- Flag: sections with unexpectedly high marker counts that should be further along.

### 6. Archive hygiene

- Check `context/archive/superseded_decisions/` — are there corresponding entries that were removed from MEMORY.md?
- Check `context/archive/completed_todos/` — do completed todos match what's in the done list?
- Flag: orphaned archive files with no clear provenance.

## Output

Consistency report with issues grouped by severity:

| Severity | Category | Issue | Location | Action needed |
|----------|----------|-------|----------|---------------|
| CRITICAL | | | | |
| WARNING  | | | | |
| INFO     | | | | |

- **CRITICAL:** Contradictions between artifacts (decision violated, claim status wrong, broken reference that blocks a skill).
- **WARNING:** Staleness (todo marked done but markers remain, archive without provenance).
- **INFO:** Minor inconsistencies (naming variations, non-blocking stale references).

## When to run

- After completing a consolidation pipeline
- Before submission (alongside or after `skills/review_paper_audit`)
- After major restructuring (section renames, decision changes, skill reorganization)
- When Martin says "something feels off"
