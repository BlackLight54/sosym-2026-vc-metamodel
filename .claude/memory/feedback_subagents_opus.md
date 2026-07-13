---
name: "Subagents run on Opus"
description: "Martin's cost rule after hitting the monthly spend limit: subagents use Opus, not Fable"
type: feedback
date: 2026-07-13
---

**Feedback (Martin, 2026-07-13):** after the monthly spend limit killed two in-flight agents, run subagents on Opus instead of Fable to save token spend.
**Why:** Fable-tier subagents burned the monthly budget mid-session (the proto-SLR alone used ~3.6M subagent tokens); Opus is sufficient for scoped, well-prompted subtasks.
**How to apply:** Pass model "opus" on Agent tool launches and prefer opus/effort overrides for mechanical workflow stages. Reserve the session model for main-loop judgment work. Keep subagent prompts tight (name exact files, forbid exploratory reading) so cheaper models stay reliable.
