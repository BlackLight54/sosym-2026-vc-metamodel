---
description: Run one lights-out research cycle as a multi-agent workflow that produces verified corpus material and folds it into the vault. Use when executing a session prompt emitted by plan_research_pipeline, or when running a proto-SLR cycle that must build citable evidence with zero invented references.
---

# Skill: Multi-Agent Research Cycle

**Purpose:** Execute one full research cycle end to end as a reusable procedure. A cycle takes a session goal (typically an axis or work item handed down by `plan_research_pipeline`), runs a staged multi-agent workflow that finds, deduplicates, adversarially verifies, and synthesizes candidate references, then integrates the verified result into the vault and reports it to the advisor. The cycle runs lights-out: no mid-cycle approvals. The design was recorded from the 2026-07-13 kickoff session, which produced 74/74 verified candidates with 0 unverifiable.

This skill is the **middle layer of a three-level hierarchy**:

1. `plan_research_pipeline` (meta-skill) designs the session prompts for a cycle.
2. Each session runs **this skill**, the seven-step cycle below.
3. Step 3 of this skill launches the innermost staged Workflow (finders, dedup, verify, synthesis, corpus map).

Do not flatten the levels. The five workflow stages live inside step 3; they are not the seven session steps.

## Trigger

- "Run the research cycle"
- "Execute this session prompt" (when the prompt names this skill)
- "Run the proto-SLR"
- "Build the verified corpus for axis X"

## Inputs

- The session prompt emitted by `plan_research_pipeline` (goal, inputs, workflow stage design, integration duties, constraints, completion duties). If no prompt exists, run `plan_research_pipeline` first.
- Current vault state: `zettelkasten/moc/M-011 claim-delivery-matrix.md`, `M-010 objection-ledger.md`, `M-012 journal-extension-delta.md`, `M-013 drafting-guardrails.md`, latest `context/slr/corpus_map.md` if one exists.
- The file-ownership map from the cycle MANIFEST (proves this session's writes are disjoint from concurrent sessions).

## Hard rules (bind every step and every agent prompt)

These are non-negotiable. State them verbatim in every subagent prompt.

- **No invented references.** Adversarial per-candidate verification is mandatory. Every candidate gets one verifier that returns CONFIRMED, CORRECTED, or UNVERIFIABLE. Zero-unverifiable is achievable and is the target, not a lucky outcome. A candidate that cannot be verified is dropped or logged UNVERIFIABLE, never smoothed into the corpus.
- **Concurrent tasks must be file-disjoint.** Only touch files this session owns per the MANIFEST ownership map. Never write a file another session owns.
- **Caps logged, never silent.** Any cap (results per finder, candidates per axis, agents spawned) is written to the ledger. A silently truncated search is a corrupted result.
- **Quote-precision caveat.** Characterizations drawn from abstracts are labeled as such. Verbatim quotes are NOT taken from abstracts or search snippets. Any quoted text is re-pulled from the full text at drafting time, per-use.
- **check_links.sh clean.** After any vault edit, run `zettelkasten/check_links.sh` and resolve to 0 errors before closing.
- **M-013 guardrails bind every agent prompt.** Paste the `M-013 drafting-guardrails` constraints into each subagent prompt.
- **No em dashes** in any artifact this cycle produces. Zero.
- **Model assignment.** Subagents run on Opus at explicit full effort. Fable is permitted ONLY for synthesis stages (per-axis synthesis and cross-axis corpus map). This is both Martin's ruling and the memory cost rule; it is checked. State the model and effort in each agent prompt.

## Steps

### 1. Plan-first: batch the open decisions

Enter plan mode. Read the session prompt and the vault state. Surface every genuinely open decision the cycle needs settled before work runs. Put them to Martin in **one batch**, each with a vault-argued recommendation (cite the D-note, MOC, or source that grounds the recommendation). Do not drip decisions one at a time, and do not ask about things already ruled. If nothing is genuinely open, say so and proceed.

The cycle is lights-out after this step. This is the only approval gate.

### 2. Record rulings BEFORE work runs

Once Martin rules, record each ruling as a D-note in `zettelkasten/decisions/` (next free `D-0NN` id) and mirror it to `.claude/memory/decision_*.md`. Do this **before** launching any workflow, so the rulings bind the agents rather than being reconstructed afterward. Run `zettelkasten/check_links.sh` and confirm 0 errors.

### 3. Launch the staged workflow (lights-out)

Launch the research work as a single multi-agent Workflow. The workflow has five stages with a hard barrier between finding and verifying. Every agent prompt carries the hard rules and the M-013 guardrails.

**Stage A: per-axis finders, two modalities.** For each axis this session owns, spawn finders in two independent modalities (for example a scholarly-database modality and a web/primary-source modality) so a miss in one is caught by the other. Finders write candidate rows to the `context/slr/candidates.json` ledger. Log every cap. Model: Opus, full effort.

**Stage B: dedup barrier.** A single barrier stage deduplicates candidates by DOI and by normalized title. This is a synchronization point: no candidate proceeds to verification until dedup completes. Model: Opus, full effort (Fable not permitted here; dedup is not synthesis).

**Stage C: per-candidate adversarial verification.** One verifier per surviving candidate. Each verifier tries to break the candidate: does the paper exist, are the authors/venue/year right, does it say what the finder claimed. Verdict is CONFIRMED, CORRECTED (with the fix), or UNVERIFIABLE. Verdicts and evidence are written to the ledger. Model: Opus, full effort. This stage is where zero-invented-references is enforced.

**Stage D: per-axis synthesis.** For each axis, synthesize the CONFIRMED and CORRECTED candidates into the axis file. Note coverage and gaps. Model: **Fable permitted** (synthesis stage).

**Stage E: cross-axis corpus map.** Merge the axis files into `context/slr/corpus_map.md`, plus `context/slr/dropped_coverage.md` (what was searched and dropped, with reason) and `context/slr/do_not_cite_additions.md` (UNVERIFIABLE or disqualified items, so later cycles do not re-surface them). Model: **Fable permitted** (synthesis stage).

Ledger and outputs live under `context/slr/`: `candidates.json` (the ledger), one file per axis, `corpus_map.md`, `dropped_coverage.md`, `do_not_cite_additions.md`.

### 4. Run file-disjoint main-loop work in parallel

While the workflow runs lights-out, the main loop does the session's other duties (advisor-feedback processing, spin edits, figure specs, background verification jobs, and similar). Every parallel task must write only files this session owns per the MANIFEST. If two tasks would touch the same file, they are not disjoint: serialize them or re-scope. Name the ownership split explicitly before launching.

### 5. Integrate into the vault

Fold the verified corpus into the zettelkasten. Create S-notes for the priority sources. Update the affected MOCs (for the kickoff cycle these were `M-004 novelty-and-positioning`, `M-010 objection-ledger`, `M-012 journal-extension-delta`, `M-013 drafting-guardrails`). Re-check any spin edits with narrow-never-inflate discipline: a source may narrow or qualify a claim, never inflate it.

Import must-cite references for an axis only in the session that consumes that axis. Zotero entries are made manually by Martin, so flag needed entries rather than fabricating keys. Run `zettelkasten/check_links.sh` and resolve to 0 errors.

### 6. Write the findings-first advisor report

Produce an HTML advisor report, findings first. Lead with what the cycle found and what it changes, not with process narration. Persist it under `context/reports/` as `YYYY-MM-DD_<cycle>_report.html`. Include a ruling batch only for decisions that are genuinely still open after the cycle.

### 7. Close: session-close, feature branch, push

Run `skills/project_session_close` to persist lessons learned. Commit the cycle's work on a feature branch and push. The cycle is complete when: verification shows 0 UNVERIFIABLE smoothed into the corpus, `check_links.sh` reports 0 errors, the report is persisted, and the branch is pushed.

## After

- Report to `plan_research_pipeline` (or to Martin) the merge result: candidates verified, UNVERIFIABLE count, MOCs touched, S-notes added, and any decision still open.
- Verify the file-ownership map held: this session touched only its owned files. A violation means the disjointness proof was wrong and the MANIFEST needs correction before the next cycle.

## Output

- `context/slr/` populated: `candidates.json` ledger, per-axis files, `corpus_map.md`, `dropped_coverage.md`, `do_not_cite_additions.md`.
- D-notes in `zettelkasten/decisions/` mirrored to `.claude/memory/`.
- Vault integration: S-notes, MOC updates, spin re-check.
- `context/reports/YYYY-MM-DD_<cycle>_report.html` (findings first).
- Feature branch pushed, session-close memories written.
