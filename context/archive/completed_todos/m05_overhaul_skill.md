---
id: "M05"
short: "overhaul-skill"
title: "Create project overhaul skill"
status: done
priority: medium
depends_on: []
binding_claims: []
target: ".claude/skills/project_overhaul/SKILL.md"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Created `.claude/skills/project_overhaul/SKILL.md` — four-phase skill (Audit, Plan, Execute, Verify) for structural project reorganization.

**File:** `.claude/skills/project_overhaul/SKILL.md`

Reusable skill for structural reorganization:

1. Audit current project structure (skills, memory, todos, archive)
2. Identify gaps between usage patterns and documented workflow
3. Propose categorization/reorganization
4. Execute migration with `git mv`, cross-reference updates, verification
5. Run `review_consistency_check` post-migration
