---
id: "M02"
short: "wf-scaffold-improvements"
title: "Extract remaining improvements from workflow scaffold notes"
status: done
priority: medium
depends_on: []
binding_claims: []
target: "CLAUDE.md, .claude/skills/"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Read `context/NOTES_REGARDING_WORKFLOW_SCAFFOLD.md` and extract the remaining (non-struck-through) improvement ideas into actionable changes or todos.

**Remaining items from the notes file:**

1. "Maybe more todo/filter types, maybe obsidian filters" — assess whether additional annotation classes beyond `.todo`, `.cite`, `.formal`, `.figure`, `.scaffold`, `.meta` are needed. If so, add to `annotations.lua` and document in CLAUDE.md.
2. Plan-mode strikethrough convention (line 12) — formalize in CLAUDE.md that when Claude proposes edits in plan mode, changed text should be shown with ~~strikethrough~~ for deletions and **bold** for additions.
3. Plan-mode strikethrough for drafted text (line 16) — same as above, apply to drafted text revisions.
4. Pandoc definition lists (line 27) — assess whether definition lists (`Term\n:   Definition`) would improve any section (e.g., Sec 4 formal definitions). If so, create a todo.
5. "Remove node for plan mode as default" (line 51) — Martin wants to control which operating mode is active. Update CLAUDE.md to not default to plan mode but instead ask or infer from context.

Also study the archived prompts for pipeline skill improvements:
- `prompts/.archive/2026-03-27 other tasks/PIPELINE.md`
- `prompts/.archive/2026-03-27_consolidation/PIPELINE.md`
- `prompts/.archive/2026-03-27_section_reviews/`

Extract any patterns that should be codified into `plan_consolidation_pipeline` or other pipeline skills.

Acceptance criteria: all non-struck-through items in the notes file are either implemented, created as separate todos, or explicitly decided against (with rationale).
