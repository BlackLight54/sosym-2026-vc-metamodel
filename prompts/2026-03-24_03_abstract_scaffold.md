# Prompt: Scaffold the abstract

**Task type:** Skill execution
**Skill:** `skills/abstract_scaffold`
**Target:** New or revised abstract structure

## Instruction for Claude Code

Read `skills/abstract_scaffold/SKILL.md` and execute it.

## Context

The submitted abstract is in `Abstract - submitted.md`. The thesis is in CLAUDE.md. The prior work is in `prior_work/` (CSCS 2024 short paper + TDK report).

Key constraint: the abstract was already submitted on 2026-03-20. The skill should produce a structured abstract that is consistent with the submitted version but may sharpen it. The paper submission (2026-03-27) allows a revised abstract in the PDF.

The submitted abstract is 150 words. ACM sigconf abstracts are typically 150-250 words. There is room to sharpen the contribution list and make the results statement more precise.

## What the skill should produce

1. Structured abstract (problem → approach → contributions → validation → results).
2. Champion test: does the abstract give a reviewer enough to champion acceptance?
3. Title candidates (2-3 options) — the current working title is not yet set.
4. Identify any claims in the submitted abstract that the paper must deliver on.

## After

- Abstract scaffold in a new file or as output.
- Title candidates proposed.
- Update TODO.md: mark done.
