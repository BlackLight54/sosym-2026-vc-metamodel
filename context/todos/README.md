# Todo Tracking

Each todo is a separate `.md` file with YAML frontmatter. This is the active todo store; completed todos move to `context/archive/completed_todos/`.

## Frontmatter spec

```yaml
---
id: "M01"              # Unique ID — alphanumeric, any prefix (T07, O-ARF, M01, Z-T03)
short: "page-audit"    # Short slug for quick reference
title: "Create page budget audit skill"
status: pending        # pending | in_progress | blocked | done
priority: high         # high | medium | low
depends_on: []         # List of todo IDs this blocks on
binding_claims: []     # List of claim numbers (1-10)
target: ""             # Target file(s) or section(s)
pipeline: ""           # Pipeline ID (e.g., "consolidation", "overhaul-p2", "z01-triage")
assigned: "claude"     # claude | martin | imre | oszkár
created: "2026-03-28"
---
```

## Conventions

- **ID prefix encodes pipeline:** T = consolidation, O = other, M = overhaul/migration, Z = synthesis triage.
- **File naming:** `{id}_{short}.md`, lowercase (e.g., `m01_page_audit.md`).
- **Lifecycle:** `pending` -> `in_progress` -> `done` (move to `context/archive/completed_todos/`). Use `blocked` with a note explaining what unblocks it.
- See `INDEX.md` in this directory for a categorized listing. See `TODO.md` in the project root for quick status.
- Do not put completed todos here; move them to the archive.
