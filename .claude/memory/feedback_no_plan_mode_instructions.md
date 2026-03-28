---
name: "No plan-mode instructions in CLAUDE.md"
description: "Martin uses Claude Code's built-in plan mode feature — do not add plan-first rules to CLAUDE.md"
type: feedback
---

Do not add "plan first" or "default to plan mode" instructions in CLAUDE.md or project configuration. Martin controls planning via Claude Code's built-in plan mode toggle.

**Why:** Claude Code has a native plan mode feature. Duplicating this as a CLAUDE.md instruction creates redundant guardrails and slows down execution when Martin has already chosen the mode.

**How to apply:** Never re-add plan-mode-default rules to CLAUDE.md. If Martin wants planning, he activates plan mode in Claude Code. Respect the mode the session is in.
