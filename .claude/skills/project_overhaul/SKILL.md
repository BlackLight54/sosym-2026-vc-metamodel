---
description: Structural reorganization of project infrastructure — skill creation/renaming, memory migration, cross-reference updates, todo decomposition, archive management. Use when the project's documented workflow has drifted from actual usage or needs systematic restructuring.
---

# Skill: Project Overhaul

**Purpose:** Systematically reorganize project infrastructure when the documented workflow has diverged from actual usage patterns. Covers skill management, memory migration, todo decomposition, cross-reference integrity, and archive management.

## Trigger
- "The project structure needs reorganizing"
- "Skills/memory/todos have drifted from the documented workflow"
- "Run a project overhaul"
- After significant changes to project conventions or tooling

## Process

### Phase 1: Audit

1. **Inventory current state:**
   - List all skills in `.claude/skills/` — check each has SKILL.md, correct naming convention (category prefix), accurate description
   - List all memories in `.claude/memory/` — check MEMORY.md index matches actual files, frontmatter is complete
   - List all todos in `context/todos/` — check INDEX.md matches actual files, frontmatter follows spec
   - List all archive directories — check README.md exists, naming conventions followed
   - Check CLAUDE.md documentation matches actual project state

2. **Identify drift:**
   - Skills referenced in documentation but missing or misnamed
   - Memories that are stale or superseded (check `revisit_when` triggers)
   - Todos that are done but not archived
   - Cross-references that point to moved/renamed/deleted targets
   - Conventions documented in CLAUDE.md but not followed in practice

3. **Present findings** as a structured report with:
   - Category | Item | Issue | Proposed fix
   - Prioritized by impact (broken references > stale content > cosmetic)

### Phase 2: Plan

Present a migration plan to the user covering:
1. Renames (with `git mv` commands)
2. New files to create
3. Files to archive (move to `context/archive/`)
4. Cross-reference updates needed (grep patterns → replacement)
5. Documentation updates (CLAUDE.md, WORKFLOW.md, AUTHOR_NOTES.md)

**Wait for user approval before executing.**

### Phase 3: Execute

1. **Create backups** of any monolithic files being decomposed (→ `context/archive/`)
2. **Execute renames** via `git mv` (preserves history)
3. **Create new files** (skills, memories, todos, READMEs)
4. **Update cross-references** across all files that reference renamed/moved targets
5. **Archive superseded content** (→ `context/archive/` subdirectories)
6. **Update indexes** (MEMORY.md, INDEX.md, README.md files)

### Phase 4: Verify

Run `skills/review_consistency_check` or equivalent:
- Grep for all old names/paths — should return zero hits
- Verify all skill directories have SKILL.md
- Verify all non-empty directories have README.md
- Verify MEMORY.md index matches `.claude/memory/` contents
- Verify INDEX.md matches `context/todos/` contents
- Check CLAUDE.md references are current

## Inputs
- Current project directory structure
- CLAUDE.md — documented conventions
- `.claude/memory/MEMORY.md` — memory index
- `context/todos/INDEX.md` — todo index
- `.claude/skills/README.md` — skill catalog

## Output
- Structured audit report (Phase 1)
- Migration plan for approval (Phase 2)
- Execution log with all changes (Phase 3)
- Verification report (Phase 4)

## Constraints
- **Never delete — always archive.** Superseded content goes to `context/archive/`.
- **Use `git mv` for renames** to preserve history.
- **Plan before executing.** Present the migration plan to the user and wait for approval.
- **Atomic batches.** Group related changes so each batch can be committed independently.
- **Verify after each batch.** Don't proceed to the next batch if verification fails.

## When to run
- After significant changes to project conventions (new naming scheme, new directory structure)
- When multiple sessions have accumulated ad-hoc changes without updating documentation
- When starting a new project phase that requires infrastructure changes
- Periodically (every ~10 sessions) as preventive maintenance