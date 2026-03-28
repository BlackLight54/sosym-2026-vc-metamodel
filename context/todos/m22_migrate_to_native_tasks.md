---
id: "M22"
short: "native-tasks"
title: "Migrate todo pipeline from context/todos/ to Claude Code native Tasks"
status: pending
priority: low
depends_on: []
binding_claims: []
target: ""
pipeline: ""
assigned: "claude"
created: "2026-03-28"
---
## Inspiration  

<https://claudearchitect.com/docs/claude-code/claude-code-tasks-vs-todos/>

## Goal

Replace the custom todo pipeline (`context/todos/` with YAML frontmatter files, INDEX.md, root TODO.md) with Claude Code's native Tasks system (`~/.claude/tasks/`). Native Tasks persist across sessions, support dependencies and blockers, and coordinate across sub-agents — eliminating the need for a hand-rolled tracking layer.

## Background

Claude Code upgraded its session-scoped TodoWrite tool to a persistent Tasks system. Tasks are stored as files in `~/.claude/tasks/`, survive session restarts, and can coordinate across multiple sessions or sub-agents. This makes the custom `context/todos/` infrastructure redundant.

**Known limitation:** There is no persistent task panel in the VS Code extension yet (open feature request). Tasks appear as standard messages in the chat transcript and scroll out of view. This is a UX annoyance but does not block the migration — the underlying persistence and cross-session coordination still work.

## Migration steps

### 1. Inventory active todos

Scan `context/todos/` for all files with `status: pending`, `in_progress`, or `blocked`. These need migration. Files with `status: done` should already be in `context/archive/completed_todos/`.

### 2. Create native Tasks

For each active todo, create a corresponding native Task preserving: title, description, priority, dependencies, binding claims (as metadata in the task description), and assignment.

### 3. Update CLAUDE.md

Remove or rewrite these sections that reference the custom pipeline:

- "Todo file format" section (frontmatter spec, lifecycle, ID convention)
- "Persistence model → Todos" section
- "Claude Code edit protocol" references to `context/todos/`
- Any skill or workflow references to updating `context/todos/`

Replace with a brief note that tasks use Claude Code's native Tasks system.

### 4. Update WORKFLOW.md

The "Session start" and post-task "After" instructions reference updating TODO.md and `context/todos/`. Rewrite to reference native Tasks.

### 5. Update skills

Grep all `skills/*/SKILL.md` files for references to `context/todos/`, `TODO.md`, `INDEX.md`, or the custom frontmatter format. Update each to use native Tasks instead.

### 6. Archive custom infrastructure

- Move `context/todos/` contents to `context/archive/todos_legacy/`
- Move root `TODO.md` to `context/archive/`
- Remove `context/todos/INDEX.md`

## Acceptance criteria

- [ ] All active todos from `context/todos/` exist as native Tasks
- [ ] No skill, workflow, or CLAUDE.md reference points to the old `context/todos/` pipeline
- [ ] Old todo files archived to `context/archive/todos_legacy/`
- [ ] Root `TODO.md` archived or replaced with a pointer to native Tasks
- [ ] A test round-trip: create a task, close the session, reopen, verify the task persists
