---
id: "M01"
short: "todo-dedup"
title: "Deduplicate and consolidate overlapping todos"
status: done
priority: medium
depends_on: ["M04"]
binding_claims: []
target: "context/todos/"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

After M04 (Z01 extraction) creates ~51 new Z-series todos, review all todos in `context/todos/` for overlaps and duplicates:

1. Scan all todo files. Group by target section and topic.
2. Identify duplicates (same work described in different todos, e.g., an O-series and Z-series todo both targeting the same paragraph fix).
3. Merge duplicates — keep the more specific one, archive the other to `context/archive/completed_todos/` with a note pointing to the surviving todo.
4. Verify dependency chains are consistent (no circular deps, no deps on archived todos).
5. Update `context/todos/INDEX.md` to reflect the consolidated state.

Acceptance criteria: no two todos describe the same work item. Every todo has a unique, non-overlapping scope.
