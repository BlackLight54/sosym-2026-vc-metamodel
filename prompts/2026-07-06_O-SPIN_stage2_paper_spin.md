# O-SPIN — Stage 2: paper spin & research proposal

> **How to run (Martin):** open a fresh Claude Code session at the repo root and say:
> `O-SPIN — read prompts/2026-07-06_O-SPIN_stage2_paper_spin.md and execute it.`
> Everything below is addressed to that session.

---

Begin your first reply with `O-SPIN` (conversation-title convention). CLAUDE.md already gives you
your persona, register, and rules; do not re-derive them. This prompt adds only what Stage 2 needs.

## Mission

Produce the **spin document**: the single artifact that fixes what the journal paper claims, on what
evidence, against which objections, with which figures, for which venue. It is the contract every
later stage (spine, paragraph engineering, hand-writing) executes against. Stage 1 (the Zettelkasten)
is complete and current as of 2026-07-06; you are not building knowledge, you are committing to an
argument.

## Ground yourself first (read in this order, for these reasons)

Read before generating anything. Each read has a purpose; skim beyond it.

1. `zettelkasten/PIPELINE.md` — your stage contract: what Stage 2 owes and must not do.
2. Run `skills/review_paper_status` — session-start snapshot, including gates due (step 5b).
3. `zettelkasten/index.md` → `moc/M-001` — the proposed journal structure you will confirm or amend.
4. `moc/M-012 journal-extension-delta` — the delta tiers and Heilmeier pre-answers; your raw material.
5. `moc/M-011 claim-delivery-matrix` — what each claim can honestly promise today.
6. `moc/M-010 objection-ledger` — the attacks your framing must pre-empt.
7. `moc/M-009 threats-to-applicability` — the committed one-paragraph framing (Decisions D-013..D-016
   are settled; execute them, do not reopen them).
8. `moc/M-014 figure-plan` — the figure candidates you will select from.
9. `moc/M-013 drafting-guardrails` — §Framing prohibitions only (the rest binds later stages).
10. `context/VENUE.md` — **stale (MODELS'26)**; see Decision point A.

Do not re-read the 140 atomic notes; the maps exist so you do not have to. Follow links out of a map
only when a specific cell is load-bearing for a choice you are making.

## Decision points — ASK vs DEFAULT

Surface these in your plan (plan mode, see Method). For each ASK, use one question with concrete
options; if Martin is unavailable or declines to choose, apply the stated DEFAULT and label it
`[assumed]` in the spin document.

- **A. Venue.** ASK: confirm SoSyM as the target (working target per the Todoist thread; venue-fit
  analysis is an open task). DEFAULT: SoSyM, labeled assumed; note that `context/VENUE.md` must be
  re-populated via `skills/setup_cfp_import` before the spine freezes.
- **B. Research questions.** Derive at most three RQ candidates from the thesis and binding claims
  (no approved formulation exists in the vault — this is a known gap). ASK for approval; on
  approval, record the wording as a new `D-` note. DEFAULT: present them as `[proposed]`.
- **C. Delta scope.** Recommend which M-012 Tier 2–3 items are in scope for this submission cycle
  (Tier 1 is mandatory, Tier 4 is future-work paragraphs only). ASK with your recommendation first.
  DEFAULT: Tier 1 + the two catalogue extensions (C-035, C-036) + dual-issuance modeling; nothing
  else.
- **D. Figure set.** Recommend from M-014; F1–F3 exist, F7 (G0–G7 lattice) is the cheapest
  high-payoff addition. DEFAULT: F1–F3, F5, F7, F9.

## Deliverable contract

**File:** `context/spin_2026-MM-DD.md` (today's date). Obsidian Markdown, standard infra style.
**Structure (exactly these sections, in order):**

1. **Thesis** — verbatim from CLAUDE.md; one so-what sentence. No variants.
2. **Research questions** — ≤3, each mapped to the claims and evaluation axis that answer it;
   marked `[proposed]` or `[approved → D-0XX]`.
3. **Contributions** — numbered; each names its binding claims (K-ids) and its M-011 evidence
   state in one line. A contribution whose M-011 row has a blank evidence cell may not appear.
4. **Journal delta** — what this adds over the withdrawn conference paper, from M-012, with your
   Decision-C scope commitment and one line on what is deliberately excluded and why.
5. **Committed framing** — the M-009 one-paragraph framing, verbatim, plus how each of
   D-013..D-016 shows up in the paper (one line each).
6. **Objection pre-emptions** — the M-010 objections this submission will face ranked for the
   chosen venue; for each, the rebuttal's landing section. New objections you discover go to
   M-010 first, then here.
7. **Figure set** — the Decision-D selection; per figure: the claim it carries and its status.
8. **Risk register** — from M-009 threats plus anything review_paper_status flagged; each risk
   with its mitigation decision and residual exposure.
9. **Open gates** — what must close before submission (O-EUTHREAT items, figure production,
   VENUE.md), in dependency order. No dates unless they exist in the repo.

**Caps:** sections 1–2 fit on half a page together; nothing exceeds one page; the whole document
reads in ten minutes. Compression rule: if a section fights its cap, distill at the source map, do
not widen the cap.

## Method

1. Ground (reads above). 2. Enter plan mode: present the four decision points with recommendations,
the proposed RQ wordings, and the document skeleton with one-line section intents. 3. On approval,
write the document in one pass. 4. Run the self-check. 5. Close the loop (below). Draft nothing
before the plan is approved; ask nothing that has a stated DEFAULT unless the answer changes the
document.

## Constraints (violations = failed run)

- Do not re-litigate any committed `D-` note. If you believe one is wrong, say so explicitly with
  the technical argument and stop for Martin's ruling; never silently deviate (CLAUDE.md rule 4).
- Do not promise a claim M-011 cannot back today. The spin document may narrow claims; it may not
  inflate them.
- Do not count pages, characters, or words for the *paper* (CLAUDE.md rule 3). The caps above bind
  this document only.
- Do not cite or invent references; the spin document names sources by S-id only. The
  do-not-cite-yet list in M-013 applies even here.
- Do not start Stage 3. The spine (`skills/plan_spine`) is the next session's job.
- No em dashes in the deliverable. No filler, no throat-clearing, no hedge stacking.

## Self-check before returning (report results, do not just assert)

- [ ] Every contribution resolves through an M-011 row with a non-blank evidence cell.
- [ ] Every M-010 objection relevant to the venue has a landing section or an explicit
      accepted-risk entry in section 8.
- [ ] The committed framing paragraph appears verbatim; D-013..D-016 each traceable in the text.
- [ ] Every `[assumed]` and `[proposed]` label is listed in your closing summary for Martin.
- [ ] The document contains no wikilink or ID that does not resolve in the vault
      (`./zettelkasten/check_links.sh` must stay at 0 errors if you edited any vault note).
- [ ] Anything you are uncertain about is stated as uncertain in the document, not smoothed over.

## Close the loop

- New decisions made (approved RQs, venue, delta scope) → `D-` notes; update `M-011`/`M-012` rows
  your choices changed; add a todo for VENUE.md re-population if Decision A stayed assumed.
- Update `context/todos/` (this task done; follow-ups created). Commit with a descriptive message.
- End your final message with: the decisions taken, the labels awaiting Martin, and the single next
  action (run `skills/plan_spine` on the approved spin document).
