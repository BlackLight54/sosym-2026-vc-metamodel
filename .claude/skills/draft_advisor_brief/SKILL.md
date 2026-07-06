---
description: Produce a one-to-two-page advisor check document from the vault, spin, and spine — thesis, research questions, journal delta, evidence state, adversarial readiness, and the acceptance case, ending in concrete asks. Use before an advisor meeting, after the spine is frozen (degrades gracefully to vault-only earlier).
---

# Skill: Advisor Brief

**Purpose:** Compress the project's state into a document an advisor can read in five minutes and
disagree with productively: what we claim, what we ask, how we are prepared for hostile review, why
this submission should be accepted, and where their input changes what we do. The brief is a *gate
artifact*: it exists to extract decisions, not to report activity.

## Trigger

- "Prepare the advisor brief" / "research proposal one-pager" / "advisor check document"
- Before an advisor meeting; canonically after the spine freeze (Stage 3→4 gate in
  `zettelkasten/PIPELINE.md`).

## Inputs

- `zettelkasten/index.md` thesis line and CLAUDE.md Thesis block (core claim, mechanism, so-what).
- The spin document and, if it exists, the frozen `context/spine/SPINE.md`.
- `zettelkasten/moc/M-011` (evidence state), `M-010` (objections), `M-012` (journal delta +
  Heilmeier pre-answers), `M-009` (threats + committed framing), `M-013` (nothing in the brief may
  violate it).
- `context/VENUE.md` for the journal target (verify it is not stale before citing venue facts).

## Output

`context/advisor_brief_YYYY-MM-DD.md`. **Hard constraint: one to two rendered pages.** The
compression caps below are the mechanism; if a section fights its cap, the content is not yet
distilled — go back to the source map instead of widening the cap.

Render for handoff with pandoc if a PDF is wanted:
`pandoc context/advisor_brief_YYYY-MM-DD.md -o context/advisor_brief_YYYY-MM-DD.pdf`

## Brief structure and compression caps

1. **Thesis** — the core claim verbatim, one sentence, plus one so-what sentence. No variants.
2. **Research questions** — at most three, each mapped to the claims and evaluation axis that answer
   it. If no approved RQ formulation exists (the vault does not carry one by default), derive
   candidates from the thesis and binding claims, mark them **proposed**, and put their approval in
   the Asks section. Once approved, record the formulation as a `D-` note so it stops being
   improvised per document.
3. **Contributions and journal delta** — the contribution list and what makes this more than the
   withdrawn conference paper, from `M-012` tiers 1–2 only. At most five bullets.
4. **Evidence state** — a compact table from `M-011`: claim, status, open item. Collapse delivered
   claims with no open items into a single line ("delivered: K-001, K-003, ..."); itemize only rows
   with open gates.
5. **Adversarial readiness** — the top four or five objections from `M-010` with their one-line
   committed rebuttals. Choose by severity for the target venue's likely reviewers, not by ledger
   order.
6. **The acceptance case** — one paragraph plus at most four evidence bullets: why this gets
   accepted *at this venue, in this state*. Draw on: novelty confirmed by the gap analysis, the
   regulator-documented motivation, the inherited formal guarantees, the delta substance, and the
   evidence completeness from section 4. Then the honest inverse, two or three bullets: what could
   sink it and the mitigation state ([[M-009]] threats with their decision links). An acceptance
   case without the inverse reads as salesmanship; advisors discount it.
7. **Asks** — at most five concrete questions where the advisor's answer changes what we do next.
   Never end with "any feedback welcome"; every ask names its decision and its default if
   unanswered.
8. **Gates** — the open blockers with owners (e.g. ARF re-verification, O-EUTHREAT). No invented
   dates; list order is dependency order.

## Steps

1. Gather inputs; verify `M-011` is current (spot-check two rows against the K-notes).
2. Draft sections 1–8 under the caps. Every factual statement must trace to a vault note or repo
   artifact; anything untraceable is cut or moved to Asks as a question.
3. Self-check against `M-013`: no guardrail violation, no do-not-cite source named as evidence, no
   refuted claim asserted.
4. Length check: render mentally against the two-page bound; cut section 4 itemization first, then
   section 5 to four objections. Sections 1, 6, 7 are never cut.
5. Write the file, date-stamped. Flag in chat which statements are **proposed** (RQs, acceptance
   case wording) versus committed.

## After the meeting

Run `skills/plan_advisor_feedback` on the meeting notes. Its outputs loop back as `D-` notes and
todos; approved RQ formulations become a `D-` note; a rejected acceptance case reopens `M-012`
tiering. The brief itself is archived to `context/archive/` when superseded by the next one.

## Failure modes

- **Status report instead of gate artifact.** If no ask depends on the advisor's judgment, the brief
  was not worth their five minutes; find the real open decisions or postpone the meeting.
- **Cap inflation.** Two pages that spill to four defeat the artifact. The caps are the skill.
- **Improvised research questions presented as settled.** Mark proposals as proposals; route
  approval through the Asks.
