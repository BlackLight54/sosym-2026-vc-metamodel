---
description: Design the next research cycle by emitting one self-contained session prompt per parallel session plus a manifest that proves file-disjointness. Use when starting a new lights-out research cycle, when planning parallel research sessions, or when Martin triggers a cycle manually.
---

# Skill: Research Pipeline Planning

**Purpose:** This is the **meta-skill at the top of the research pipeline hierarchy**. Given the current vault state and a cycle goal, it designs the next cycle: it selects a set of mutually file-disjoint work items, emits one self-contained session prompt per session, and emits a manifest that proves disjointness and fixes the merge order. Each emitted session prompt instructs its session to run `skills/research_multiagent_cycle`.

The hierarchy:

1. **This skill** designs the session prompts for a cycle.
2. Each session runs `skills/research_multiagent_cycle` (the seven-step cycle).
3. Step 3 of that cycle launches the innermost staged Workflow (finders, dedup, verify, synthesis, corpus map).

Martin triggers cycles manually. Each session, once launched, runs fully lights-out with no mid-cycle approvals, so the prompts this skill emits must be complete enough to run unattended.

## Trigger

- "Plan the next research cycle"
- "Design the pipeline sessions"
- "Set up the parallel research sessions"
- "Kick off a new cycle"

## Inputs

- The cycle goal (from Martin).
- Vault state, read at the start of every planning run (step 1 below).

## Steps

### 1. Read state

Read, in this order:

- `context/todos/INDEX.md` (open work items and their status).
- `zettelkasten/moc/M-011 claim-delivery-matrix.md` (what claims still need evidence).
- `zettelkasten/moc/M-010 objection-ledger.md` (open objections a cycle could close).
- `zettelkasten/moc/M-012 journal-extension-delta.md` (what the journal version must add).
- The latest `context/slr/corpus_map.md` (what the last cycle already covered, so this cycle does not re-search it).
- The latest coverage audit and the latest advisor notes (for example `context/advisor_notes_*.md`).

Coverage audits run at baseline and again before spine freeze only. Do not schedule a coverage audit mid-cycle unless one of those two triggers applies.

### 2. Select mutually file-disjoint work items

Choose a set of work items that can run as parallel sessions without touching each other's files. Disjointness is the selection constraint, not an afterthought: if two candidate items would both write the same MOC, the same axis file, or the same section, either assign that file to exactly one of them or serialize them into one session.

For each item, name the files it will own (S-notes, MOCs, axis files under `context/slr/`, section files, todo files). Two items are disjoint only if their owned-file sets do not intersect.

Example selection (2026-07-13 rulings, illustrative): two parallel file-disjoint sessions.

- Session A: AF01 design-error taxonomy, WITH a targeted non-web-PKI finder extension (eIDAS 1 qualified certificates, S/MIME, enterprise PKI). Owns the taxonomy artifact and its axis files.
- Session B: eval line T12 (`context/todos/t12_eval_consistency.md`), then AF02 (`af02_q007_instance_generator.md`). Owns the eval todos and the instance-generator artifact.

The two sessions share no owned files, so they run in parallel.

### 3. Emit one self-contained session prompt per session

Write one prompt file per session into `prompts/`, named `YYYY-MM-DD_PIPELINE_<slug>.md`.

Each prompt must be self-contained per CLAUDE.md's todo-writing rule: embed all context needed to execute, do not say "continue from where we left off," and do not point at conversation history. A fresh session must be able to run it unattended. Each prompt contains:

- **Goal.** What this session delivers.
- **Inputs.** The exact files to read, with vault paths.
- **Workflow stage design.** The axes this session owns and how the five workflow stages (finders in two modalities, dedup by DOI and normalized title, per-candidate adversarial verification, per-axis synthesis, cross-axis corpus map) apply to them. State the model rule at the stage level: Opus at full effort for finders, dedup, and verifiers; Fable permitted only for the synthesis and corpus-map stages.
- **Integration duties.** Which S-notes to create, which MOCs to update, the spin re-check with narrow-never-inflate discipline, must-cite imports for the axes this session consumes.
- **Constraints.** The hard rules from `research_multiagent_cycle` (no invented references, file-disjoint writes, caps logged, quote-precision caveat, check_links.sh 0 errors, no em dashes, M-013 guardrails in every agent prompt). Zotero entries are made manually by Martin, so flag needed entries. Full-text reads happen per-use at drafting.
- **Completion duties.** Findings-first HTML report under `context/reports/`, run `skills/project_session_close`, commit on a feature branch, push, and report the merge result.
- **Directive.** The prompt must instruct the session to follow `skills/research_multiagent_cycle`.

### 4. Emit the manifest

Write `prompts/YYYY-MM-DD_PIPELINE_MANIFEST.md`. This is the control document for the cycle. It contains:

- **Session list.** Each session, its slug, and its one-line goal.
- **File-ownership map.** For each session, the exact set of files it owns. This map IS the proof of disjointness: the reader must be able to confirm no two sessions share a file. It is also what enforces the file-disjoint and caps-logged hard rules at merge time, so it must be exhaustive, not indicative.
- **Merge order.** The order in which session outputs fold into the vault, so that if any dependency exists between outputs it is respected.
- **Report obligation.** The cycle's reporting duty: findings-first, with a ruling batch only for decisions that are genuinely open.

### 5. Verify and hand off

Confirm every emitted prompt names `skills/research_multiagent_cycle` as its procedure and that the ownership map has no intersections. Present the manifest and the prompt list to Martin. Martin triggers the sessions manually.

## After

- When the sessions return, check each session touched only its owned files. A file touched by two sessions means the disjointness proof failed and the manifest was wrong.
- Fold outputs in the manifest's merge order.
- The corpus_map and coverage state produced this cycle become the step-1 inputs for the next planning run.

## Output

- `prompts/YYYY-MM-DD_PIPELINE_<slug>.md`, one per session, each self-contained and each directing its session to `skills/research_multiagent_cycle`.
- `prompts/YYYY-MM-DD_PIPELINE_MANIFEST.md`: session list, file-ownership map (proof of disjointness), merge order, report obligation.

## Relation to other skills

- `plan_consolidation_pipeline` also emits self-contained, ordered prompt files, but it maps **binding claims to drafting waves** for the paper. This skill maps **research work items to parallel verified-corpus-building sessions**. If the goal is drafting sections from scaffolds, use `plan_consolidation_pipeline`. If the goal is building citable evidence through a verified multi-agent cycle, use this skill.
- `research_gap_analysis` emits per-RQ single-agent research prompts. `research_multiagent_cycle`, which this skill schedules, extends that pattern into a staged, adversarially verified corpus-building workflow.
