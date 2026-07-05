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

## Freshness rules

- `./check_links.sh` after every editing session; it also lints citekey-map coverage and claim status
  fields.
- The open items that gate submission live in `context/todos/` (O-EUTHREAT is the current gate);
  `M-011` mirrors them per claim.
- When a stage finds this contract wrong, fix the contract in the same commit as the work that
  exposed it.
