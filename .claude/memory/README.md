# Project-Level Memories

Active project memories auto-loaded via `MEMORY.md` index at conversation start.

- **File types:** `decision_*.md` (active decisions), `claim_*.md` (binding claims with delivery status), `feedback_*.md` (corrections and validated approaches), `reference_*.md` (environment and tooling notes).
- **Each file has YAML frontmatter** with `name`, `description`, and `type` fields. The `MEMORY.md` index references each file.
- **Lifecycle:** When a decision is revised or a memory is no longer active, move it to `context/archive/superseded_decisions/`. Never delete from here without archiving.
- Only currently active state belongs here. This directory is not an archive.