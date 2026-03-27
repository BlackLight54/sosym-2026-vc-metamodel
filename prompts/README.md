# Prompts

Generated prompt files — ready-to-execute instructions for research agents or Claude Code.

Skills that delegate work produce prompt files here. Each file is a self-contained instruction that can be:
- Pasted into a research agent (Claude research mode, SciSpace, Semantic Scholar)
- Given to Claude Code as an edit instruction
- Sent to any LLM agent with a clear question

## Naming

`YYYY-MM-DD_[skill]_[description].md`

Examples:
- `2026-03-23_gap_analysis_rq1_novelty_threat.md`
- `2026-03-23_revision_fix_overclaim_section3.md`
- `2026-03-23_revision_propagate_terminology_change.md`

## Lifecycle

1. A skill generates prompt files here.
2. TODO.md gets a task per prompt: "Execute `prompts/[filename]`."
3. Martin (or Claude Code) executes each prompt.
4. Results are processed (imported via `skills/prior_work_import`, applied to sections, etc.).
5. Executed prompts can be deleted or moved to `context/archive/` if the results are worth preserving.

## What goes here

- Research agent prompts from `skills/gap_analysis`
- Multi-section revision prompts from `skills/revision_orchestration`
- Any other delegated work that needs a self-contained instruction

## What does NOT go here

- The paper itself (section files are authoritative).
- Permanent reference material (that goes in `context/archive/references/` or `.claude/skills/`).
