---
id: "O-VENUE"
short: "venue-cfp"
title: "Re-populate VENUE.md for SoSyM and regenerate reviewer personas"
status: done
priority: high
depends_on: []
binding_claims: []
target: "context/VENUE.md, context/CFP.md"
pipeline: ""
assigned: "claude"
created: "2026-07-06"
---

## Goal

`context/VENUE.md` still describes MODELS'26 (submitted 2026-03-29, withdrawn). The Stage 2 spin
document (`context/spin_2026-07-06.md`) committed to SoSyM as the target venue, labeled `[assumed]`
because the venue-fit analysis is still open (Todoist thread "Write the SoSyM paper", task
6g86Rjv3VxvFvMmv). This todo replaces the stale venue record and re-instantiates the reviewer
personas for a journal audience. **It gates the Stage 3 spine freeze** (spin document §9, gate 4):
the spine's audience calibration and format assumptions must not run against MODELS'26 personas.

## Context a fresh agent needs

- The spin document (§6) ranked the M-010 objections for SoSyM on three assumptions: core-MDE
  audience raises O1/O2, journal-depth evaluation scrutiny raises O3/O8, long review cycle raises
  O7. If the venue-fit analysis lands elsewhere, re-rank §6 and re-check §7 figure choices.
- Current personas in VENUE.md were instantiated 2026-03-24 from `skills/ref_reviewer_archetypes`
  for MODELS 2026; the archetype guide and calibration structure remain valid, only the
  instantiation is stale.
- SoSyM is a journal: no page limit pressure comparable to a 10-page conference format, no
  double-blind by default (verify: SoSyM uses single-blind review; confirm from the author
  guidelines, do not assume). Rule 7 in CLAUDE.md (review type) depends on this answer.

## Steps

1. Confirm SoSyM with Martin, or record his alternative. If SoSyM is confirmed, record the venue
   commitment as a new `D-` note in `zettelkasten/decisions/` and remove the `[assumed]` label from
   the spin document §6/§7.
2. Fetch the SoSyM author guidelines (Springer, Software and Systems Modeling) and run
   `skills/setup_cfp_import` to populate `context/CFP.md` and `context/VENUE.md`: format, length
   guidance, review type, special-section options, submission system.
3. Run `skills/setup_reviewer_personas` to re-instantiate the four archetypes for the journal
   audience; keep the calibration-guidance structure of the current file.
4. Update the spin document's §6 ranking note and §8 row R7 to reflect the populated venue record.
5. Run `./zettelkasten/check_links.sh` if any vault note was touched.

## Acceptance criteria

- VENUE.md names SoSyM (or Martin's choice) with populated format, deadlines (if any), and review
  type; no MODELS'26 content remains outside an archive note.
- Reviewer personas re-instantiated for the journal venue.
- Venue decision recorded as a `D-` note; spin document labels updated.
- `check_links.sh` reports 0 errors.

## Completion note (2026-07-13)

All acceptance criteria met; file left in `context/todos/` pending archive by the main session.

- Step 1 was already resolved before this run: D-018 (`zettelkasten/decisions/D-018 venue-sosym.md`) records the SoSyM ruling; the spin document already carried "venue ruled, D-018".
- VENUE.md re-populated for SoSyM from pages fetched 2026-07-13 (link.springer.com/journal/10270 home + submission guidelines; sosym.org home, /submission, /review_process, /theme_sections). Key verified facts: single-blind ("This journal follows a single-blind reviewing procedure"), continuous submission with no deadlines, no page restrictions, Springer Nature LaTeX template with `[iicol]` option (recommended, not required), Manuscript Central submission, at least three reviewers, one major revision maximum. UNVERIFIED items are marked in VENUE.md: the `sn-jnl.cls` file name (template named, file not, on the fetched page), typical regular-paper length (undocumented), journal-first mechanics, ESM policy.
- CFP.md re-populated with the author-guidelines import (journal has no CFP); old MODELS'26 content archived to `context/archive/venue_models26.md` and `context/archive/cfp_models26.md` with recovery notes.
- Four personas re-instantiated for the SoSyM journal audience in VENUE.md, attacks keyed to the M-010 objection ranking in spin section 6 (O1/O3/O2/O5/O8/O7/O4); O7 currency attack elevated per the journal review cycle.
- Exemplar papers verified against fetched Springer article pages: Semeráth et al. SoSyM 16 (2017), Torre et al. SoSyM 20 (2021), Kühne SoSyM 5 (2006).
- Spin document updated: section 6 persona note, section 8 row R7 closed, section 9 gate 4 marked done.
- `check_links.sh`: 0 errors.
- Follow-up (not in this todo's scope): run `skills/review_champion_test` after the spine freeze; Martin to set the internal submission target date in VENUE.md.
