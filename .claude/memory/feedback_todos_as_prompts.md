---
name: "Todos must be self-contained agent prompts"
description: "Todo files must embed all context so a fresh agent can execute them without additional briefing"
type: feedback
---

Todo files must be written as self-contained, executable prompts. A future agent in a fresh conversation should be able to pick up the todo and execute it with only "do this todo" from Martin.

**Why:** Martin hands off todos to new Claude Code sessions. If the todo says "check git history" or "continue from last time," the agent wastes time searching or asks Martin for context he already provided once.

**How to apply:** When writing or updating todos, embed all relevant context inline (raw notes, source quotes, prior decisions), state the goal, list concrete output artifacts, and define acceptance criteria. Never reference conversation history.
