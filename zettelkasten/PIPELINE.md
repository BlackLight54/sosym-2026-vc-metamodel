# Pipeline contract — how this vault gets consumed

The paper is produced in four stages. Each stage reads a fixed slice of the vault and owes a fixed
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

## Stage 3 — Paragraph engineering

**Reads:** the spin document, `M-013` (guardrails — load before any prose), `glossary.md`, the
section scaffolds, and the specific notes each paragraph cites.

**Owes:** paragraph-level scaffolds/drafts where every paragraph names its job and the claim or
transition it serves; annotations per CLAUDE.md conventions; citations only through
`sources/_citekey-map.md` (UNRESOLVED keys become `[...]{.cite}` markers, never invented keys).

**Must not:** violate anything in `M-013`; cite the do-not-cite-yet sources; paraphrase the anchor
quotes.

## Stage 4 — Hand-writing (Martin)

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
