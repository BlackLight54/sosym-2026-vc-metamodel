---
description: Extract lessons learned and update project state before a conversation ends or context compacts. Run when wrapping up, when compaction is imminent, or when explicitly invoked. Saves feedback, claims and decisions as memories, updates todo status.
---

# Skill: Session Close

**Purpose:** Before a conversation ends or context compacts, extract what was learned and persist it. Captures corrections, validated approaches, new decisions, and terminology — saves them as memories so future conversations start with accumulated wisdom. Updates claim delivery status and todo progress.

## Trigger

- "Wrapping up" / "End of session" / "Save lessons"
- Context compaction approaching
- Explicit invocation: `/project_session_close`
- Claude detects conversation is nearing context limits

## Steps

### 1. Scan conversation for lessons

Review the conversation history for:

- **Corrections Martin made:** "No, don't do X" / "That's wrong because Y" -> `feedback` memory
- **Approaches that worked:** Martin approved without pushback, or explicitly confirmed -> `feedback` memory
- **Decisions taken:** New design choices, framing decisions, terminology established -> `project` memory (decision)
- **Terminology established or refined:** New terms defined, existing terms clarified -> `project` memory
- **Patterns to repeat:** Workflow steps that were effective -> `feedback` memory
- **Patterns to avoid:** Approaches that failed or were rejected -> `feedback` memory

### 2. Check for duplicates

Before writing any new memory:

- Read MEMORY.md index.
- For each candidate lesson, check if an existing memory already covers it.
- If yes: update the existing memory file if the lesson refines it. Do not create duplicates.
- If the new lesson supersedes an old one: move the old file to `context/archive/` and remove from MEMORY.md before writing the replacement.

### 3. Write new memories

For each genuinely new lesson:

- Create a memory file in `.claude/memory/` following the standard format:

  ```markdown
  ---
  name: [descriptive name]
  description: [one-line description for retrieval]
  type: feedback | project
  ---

  [Content with Why: and How to apply: lines for feedback/project types]
  ```

- Add a one-line entry to MEMORY.md.

### 4. Update claim delivery status

Check if any binding claims were advanced during this conversation:

- Read `.claude/memory/claim_*.md` files.
- For each claim, assess whether work done in this session changed its status.
- Update the claim file's `status` field if warranted (e.g., partial -> delivered).

### 5. Update todo status

Check if any todos were completed or progressed:

- Read `context/todos/INDEX.md`.
- For completed work: update the todo file's status to "done", move to `context/archive/completed_todos/`.
- For new work items discovered: create new todo files in `context/todos/`.
- Update INDEX.md.

### 6. Summary

Report what was persisted:

- New memories saved (with filenames)
- Existing memories updated (with filenames)
- Claims status changes
- Todos completed or added

## Quality checks

- No duplicate memories created.
- Superseded memories moved to archive, not left in `.claude/memory/`.
- MEMORY.md index is consistent with actual files in `.claude/memory/`.
- Only lessons applicable to future conversations are saved — ephemeral details (specific line numbers, temporary debugging steps) are not persisted.
- Feedback memories include **Why:** and **How to apply:** lines.

## Integration

This skill should be referenced in `CLAUDE.md` under a `## Session close` section so Claude knows to run it proactively when conversations are ending.
