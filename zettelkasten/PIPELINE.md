# Pipeline contract — how this vault gets consumed

The paper is produced in five stages. Each stage reads a fixed slice of the vault and owes a fixed
output. A fresh agent (or a fresh conversation) entering a stage should need nothing beyond this file,
the named maps, and the stage's own instructions.

## Stage 1 — Knowledge base (this vault)

Maintained under the rules in `README.md`. Two plane distinction:
- **Argument maps** (M-001 … M-009): what the paper knows and claims.
- **Production maps** (M-010 … M-014): objections, delivery state, journal delta, guardrails, figures.

Every new decision made downstream comes back here as a `D-` note; every new objection joins
`M-010`; every claim-status change lands in `M-011` *and* the K-note.

## Stage 2 — Paper spin & research proposal

**Reads:** `index.md` → `M-001` (outline) → `M-012` (delta + Heilmeier seed) → `M-011` (delivery
matrix) → `M-010` (objection ledger) → `M-009` (committed framing paragraph) → `M-014` (figure
selection).

**Owes:** the spin document with (1) thesis and contribution list with the conference→journal delta,
(2) evidence inventory resolved through `M-011`, (3) objection pre-emptions from `M-010`, (4) selected
figure set from `M-014`, (5) risk register from `M-009` threats, (6) venue commitment (re-populate
`context/VENUE.md`; the MODELS'26 content there is stale).

**Must not:** re-litigate committed `D-` notes (challenge them explicitly if wrong — CLAUDE.md rule 4,
never silently); promise a claim whose `M-011` row has a blank evidence cell; count pages.

## Stage 3 — Spine (structure as a checkable contract)

The mind-map-to-outline step, decomposed into six passes so each catches one error class. Method and
templates: `.claude/skills/plan_spine/SKILL.md`. Output: `context/spine/SPINE.md` (frozen) +
`context/spine/mindmap.md`.

**Reads:** the spin document → `M-001` (outline proposal) → `M-011` (what each claim owes) → `M-010`
(where each rebuttal must land) → `M-014` (figures to place) → `glossary.md`.

**Owes:** (1) *Harvest* — mind map of every element that will appear, each leaf resolved to a vault
ID, unresolvable leaves converted to work or cut; (2) *Home* — section tree, one introduction site
per element; (3) *Order* — define-before-use dependency graph, linearization, the cross-reference
table (encodes the notation-in-background lesson); (4) *Contract* — per-section entry/exit reader
states, claims advanced, objections pre-empted; (5) *Place* — figures, example beats, anchor quotes
at first point of need; (6) *Audit and freeze* — checklist against `M-011`/`M-010`/`M-014`, then the
`FROZEN` marker.

**Must not:** introduce new claims or contributions (that was Stage 2); merge passes; leave a used
element without an earlier introduction or a signposted forward reference; write prose.

## Gate 3→4 — Advisor check

Before prose begins, the frozen spine is compressed into a one-to-two-page **advisor brief**
(`.claude/skills/draft_advisor_brief/SKILL.md`): thesis, research questions (proposed → approved as a
`D-` note), contributions and journal delta, evidence state, adversarial readiness (top objections
with committed rebuttals), the acceptance case with its honest inverse, and concrete asks with
defaults. Output: `context/advisor_brief_[date].md`. The meeting's feedback is processed with
`skills/plan_advisor_feedback`; its decisions come back as `D-` notes and todos before Stage 4
starts. A brief with no ask that changes what we do next means the gate is not ready to run.

## Stage 4 — Paragraph engineering

**Reads:** the **frozen spine** (`context/spine/SPINE.md`) one section block at a time, `M-013`
(guardrails — load before any prose), `glossary.md`, the section scaffolds, and the specific notes
each paragraph cites.

**Owes:** paragraph-level scaffolds/drafts where every paragraph names its job and the claim or
transition it serves — each section's spine job decomposes into paragraph jobs; annotations per
CLAUDE.md conventions; citations only through `sources/_citekey-map.md` (UNRESOLVED keys become
`[...]{.cite}` markers, never invented keys).

**Must not:** violate anything in `M-013`; cite the do-not-cite-yet sources; paraphrase the anchor
quotes; restructure silently — a structural change reopens the spine and requires a `D-` note.

## Stage 5 — Hand-writing (Martin)

The vault serves lookup: `glossary.md` for terms, `M-013` for quotes and traps, `M-011` for what each
section still owes. Cut prose goes to `context/archive/` with recovery context; new decisions made
while writing come back as `D-` notes.

## LLM-assisted gates (implemented)

Checkpoints with dedicated skills, in pipeline order:

- **Spine mock review** — after the Stage 3 freeze, before the advisor gate: personas attack
  `SPINE.md` structurally; findings map to `M-010` or reopen named spine passes.
  → `.claude/skills/review_spine_mock_review`
- **Claim stress-test** — before Stage 4 and again pre-submission: one skeptic per binding claim
  attempts refutation (REFUTED / WEAKENED / SURVIVES); verdicts flow into `M-011` and the K-notes.
  → `.claude/skills/review_claim_stress_test`
- **Paragraph contract check** — during Stage 4, after each section draft: the per-paragraph alarm
  against scaffold job, spine contract, and `M-013`; flags with sentence anchors, never rewrites.
  → `.claude/skills/review_paragraph_contract_check`
- **Model–prose sync check** — during/after Stage 4 and on any `models/` change: identifier, arity,
  role, and counted-set consistency both ways (init the `models` submodule first).
  → `.claude/skills/review_model_prose_sync`
- **Regulatory currency sweep** — before submission and before camera-ready: every dated EU fact
  re-verified against primary sources; S-notes, `M-009`, and the as-of snapshot move together.
  → `.claude/skills/research_currency_sweep`

Also covered by pre-existing skills: figures (`draft_figure_design`), citations
(`draft_bibliography`), naturalness (`review_prose_naturalness`), mechanical pre-submission
(`review_pre_submission_check`), champion test (`review_champion_test`), rebuttal (`plan_rebuttal`),
advisor feedback intake (`plan_advisor_feedback`).

## Candidate gates (next generation, create on first need)

- **Reproducibility dry-run** (`review_repro_dry_run`): a clean-container agent follows the
  supplementary README from scratch — build the models, rerun E0–E3, diff verdicts and numbers
  against the paper. The artifact-evaluation rehearsal.
- **Number consistency check** (`review_number_consistency`): every number in prose (timings, node
  counts, "eight constraints", abstract figures) traced to the artifact that generates it; flags
  hand-typed numbers with no generating source.
- **Cold-reader simulation** (`review_cold_reader_sim`): an agent pinned to the practitioner
  persona's floor reads linearly and reports, per section, believed-state / confusions /
  expectations — the empirical test of the spine's entry/exit contracts (complement to the mock
  review: comprehension, not attack).
- **Related-work freshness sweep** (`research_related_work_refresh`): near submission, re-run the
  gap-analysis queries for papers published since; each hit classified must-cite / differentiate
  (updates `M-004`, `K-011..K-015`) / ignore.
- **Figure self-containment check** (`review_figure_selfcontainment`): a judge sees only
  figure + caption and must reconstruct the message; failures are caption fixes (the
  figures-carry-the-argument doctrine, enforced).
- **Rebuttal delivery check** (`review_rebuttal_delivery`): after revisions, every change promised
  in the response letter verified as landed in the text, with diff anchors (closes the
  `plan_rebuttal` loop).
- **Submission package assembly** (`project_submission_package`): build and verify the final
  package — anonymity scan on PDF and supplementary, metadata, completeness against the venue
  checklist (complements `review_pre_submission_check`, which scans sections, not the package).

## Freshness rules

- `./check_links.sh` after every editing session; it also lints citekey-map coverage and claim status
  fields.
- The open items that gate submission live in `context/todos/` (O-EUTHREAT is the current gate);
  `M-011` mirrors them per claim.
- When a stage finds this contract wrong, fix the contract in the same commit as the work that
  exposed it.
