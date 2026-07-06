# HANDOVER — first session in sosym-2026-vc-metamodel

> **How to run (Martin):** open a fresh Claude Code session at the root of
> `BlackLight54/sosym-2026-vc-metamodel` and say:
> `HANDOVER — read prompts/2026-07-06_HANDOVER_post_migration.md and execute it.`
> Everything below is addressed to that session.

---

Begin your first reply with `HANDOVER` (conversation-title convention). CLAUDE.md gives you persona,
register, and rules; do not re-derive them. This prompt transfers the state of the 2026-07-06
session (Stage 2 spin + repository migration) and fixes your first actions. Trust this document
over memory of "how the project usually works": the repository home changed today.

## What you inherit

**Pipeline position (`zettelkasten/PIPELINE.md` is the contract):**
- Stage 1 (knowledge base): complete, 150 notes, `check_links.sh` at 0 errors.
- Stage 2 (spin): **complete.** The spin document is `context/spin_2026-07-06.md`. It was written
  with all four decision-point DEFAULTs applied because the interactive channel failed mid-run;
  every default is labeled `[assumed]` or `[proposed]` in place.
- Stage 3 (spine, `skills/plan_spine`): **not started, deliberately.** It is your terminal goal,
  gated by the items below.

**The spin document's decision state (its §11 is the ruling table):**

| Decision | Default in force | Flagged recommendation |
|---|---|---|
| A venue | SoSyM `[assumed]` | none |
| B research questions | RQ1–RQ3 `[proposed]` (spin §2) | approve wording → D-note |
| C delta scope | Tier 1 + C-035/C-036 + dual issuance `[assumed]` | add Q-007 (closes K-004's journal open item, strengthens O3 rebuttal) |
| D figure set | F1–F3, F5, F7, F9 `[assumed]` | add F8 (pre-empts O5, carries D-014 in the motivation) |

Spin §10–§11 (acceptance case, decisions requested) are a Martin-approved amendment to the
original nine-section O-SPIN contract, added for the 2026-07-06 advisor meeting. The Gate 3→4
advisor brief must be derived from §10 when its time comes, never written independently.

**Repository migration (completed 2026-07-06):**
- This repo, `sosym-2026-vc-metamodel`, is the **main authoring repo**. It carries the full
  ACM-MODELS-26 history; `BlackLight54/ACM-MODELS-26` is the frozen conference record (withdrawn
  MODELS'26 submission) and must not receive further paper work.
- Submodules (all https URLs): `models/` → ACM-MODELS-26-code (Refinery models, evaluation
  harness); `prior_work/dse-vc-refinery`; `prior_work/ese-vc-fca`. Fresh clones need
  `git submodule update --init` before any model-facing work (`review_model_prose_sync` depends
  on it).
- `overleaf/project` is a submodule → `BlackLight54/sosym-2026-overleaf`, which the Overleaf
  project syncs with via GitHub Sync; it holds the Springer Nature template (`sn-jnl.cls`).
  Remaining wiring in todo O-OVERLEAF: Martin verifies the sync round trip;
  `skills/project_overleaf_push` gets retargeted at the submodule; the pandoc pipeline moves
  from ACM `acmart` to `sn-jnl.cls` (fold that into O-VENUE execution).

**Advisor meeting (2026-07-06):** Martin showed the spin document to his advisor. The outcomes
are NOT in the repo. Nothing from that meeting has been processed.

## Your mission, in order

1. **Intake advisor feedback.** Ask Martin for the meeting outcomes (rulings on the §11 table,
   plus anything else raised). Process with `skills/plan_advisor_feedback`: decisions become
   `D-` notes in `zettelkasten/decisions/`, work becomes todos. Then update the spin document's
   labels (`[assumed]`/`[proposed]` → `[approved → D-0XX]` or revised content), and propagate:
   M-012 scope line, M-011 rows, K-notes if claim wording changed. If a ruling contradicts a
   committed D-note, stop and surface it; never silently deviate (CLAUDE.md rule 4).
2. **Execute O-VENUE** (`context/todos/o-venue_sosym_cfp_import.md`). Re-populate VENUE.md for
   the confirmed venue via `skills/setup_cfp_import`, regenerate reviewer personas via
   `skills/setup_reviewer_personas`, record the venue D-note. This gates the spine freeze; do it
   before Stage 3 even if feedback intake is quick.
3. **Finish O-OVERLEAF** (`context/todos/o-overleaf_attach_project.md`). The submodule wiring is
   done; what remains is Martin's one-time sync round-trip check, retargeting
   `skills/project_overleaf_push` at `overleaf/project`, and the acmart-to-sn-jnl pandoc
   retarget (do that alongside O-VENUE). None of it gates the spine.
4. **Start Stage 3.** Run `skills/plan_spine` against the updated spin document. Read the Stage 3
   contract in `PIPELINE.md` first: six passes, no new claims, no prose, output
   `context/spine/SPINE.md` + `mindmap.md`, then the mock review gate.

Do not reorder 1 before 2 matters only if the advisor changed the venue; check that first.

## Ground yourself (read in this order, skim beyond the purpose)

1. `zettelkasten/PIPELINE.md` — stage contracts and gates.
2. `context/spin_2026-07-06.md` — the argument you are executing; §9 open gates, §11 rulings.
3. `context/todos/INDEX.md` — live work items (O-VENUE, O-OVERLEAF, O-EUTHREAT are the ones that
   gate progress).
4. Run `skills/review_paper_status` — derived gate due-ness (step 5b) and section state.
5. `zettelkasten/moc/M-013 drafting-guardrails` — before touching any prose, including spin edits.

Do not re-read the atomic notes; the maps exist so you do not have to.

## Constraints carried forward (violations = failed run)

- Committed `D-` notes are settled; challenge explicitly or execute, never drift.
- No promise a blank M-011 evidence cell cannot back; the spin may narrow claims, not inflate.
- No page counting for the paper; no invented references (M-013 do-not-cite list stands:
  S-020, S-021, S-031, S-039, S-040, S-042 all await verification).
- No em dashes in new artifacts. Known exception: the verbatim M-009 framing quote in spin §5
  carries one inherited em dash, flagged there; leave it verbatim.
- `./zettelkasten/check_links.sh` must return 0 errors after any vault edit.
- Work on a feature branch; commit with descriptive messages; push before ending.

## Honest state (do not smooth these over)

- **O-EUTHREAT is the largest open gate** (spin §9 gate 1): ARF-C1..C8 re-verification against
  v2.9.0. Sections still cite v2.7.3. K-006's strength and F5's content move with the result.
- VENUE.md is stale MODELS'26 content until O-VENUE runs; the reviewer personas in it are
  conference-instantiated and must not calibrate journal decisions.
- Figure debt: of the committed set, F5/F7/F9 do not exist yet (F7's data is ready in A-004).
- The `models/` submodule state was not touched or verified this session.
- The Todoist venue-fit task (6g86Rjv3VxvFvMmv) was never closed; SoSyM remains working target,
  not analyzed fit.

## Close the loop (every session)

New decisions → `D-` notes; claim changes → M-011 + K-note; new objections → M-010 first.
Update todos, archive completed ones to `context/archive/completed_todos/`. Run
`skills/project_session_close` before ending. Commit and push.
