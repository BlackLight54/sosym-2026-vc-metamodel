# HANDOVER — multi-agent kickoff in sosym-2026-vc-metamodel

> **How to run (Martin):** open a fresh Claude Code session at the root of
> `BlackLight54/sosym-2026-vc-metamodel` and say:
> `HANDOVER — read prompts/2026-07-07_HANDOVER_multiagent_kickoff.md and execute it.`
> Everything below is addressed to that session. Supersedes the 2026-07-06 post-migration
> handover (archived at `context/archive/2026-07-06_HANDOVER_post_migration.md`).

---

Begin your first reply with `HANDOVER` (conversation-title convention). CLAUDE.md gives you
persona, register, and rules; do not re-derive them. This prompt transfers state from the
2026-07-06/07 session (Stage 2 spin, repository migration, advisor consultation) and stages the
advisor-mandated working mode: a lights-out proto-SLR running as parallel multi-agent work while
the main conversation continues pipeline work. **Martin explicitly authorizes multi-agent
workflow orchestration for the proto-SLR in this prompt**; that authorization covers the
Workflow tool.

The advisor's method constraints bind this session: *egy ilyen terv kell* (a plan first),
*mielőtt belevágsz, gondolkozzál* (think before diving in), *fókusz és folyamatos munka*.
Concretely: plan mode before launching anything, and no idle waiting while the workflow runs.

## What you inherit

**Pipeline position (`zettelkasten/PIPELINE.md` is the stage contract):**
- Stage 1 (vault): complete; 150 notes; `check_links.sh` at 0 errors.
- Stage 2 (spin): complete. `context/spin_2026-07-06.md` is the contract, including §10
  (acceptance case) and §11 (decisions requested), which are a Martin-approved amendment to the
  original nine-section contract. The Gate 3→4 advisor brief must later derive from §10.
- Stage 3 (spine): not started. It remains the terminal goal, now additionally gated by the
  advisor items below.

**Decision state — all open, nothing ruled yet:**

| # | Decision | Default in force | Notes |
|---|---|---|---|
| 1 | Venue | SoSyM `[assumed]` | O-VENUE re-populates VENUE.md, regenerates personas |
| 2 | RQ wording | RQ1–RQ3 `[proposed]` (spin §2) | now interacts with RQ0 (below) |
| 3 | Q-007 scalability instances | excluded, risk R9 | recommendation: include |
| 4 | F8 conflict anatomy | excluded from figure set | recommendation: include |
| 5 | **RQ0 adoption** (advisor) | none; needs Martin | reshapes spin §2 and §4 |
| 6 | **Industry 5.0 as spin** (advisor) | none; needs Martin | touches committed framing M-009/D-016; explicit ruling required, never silent adoption |

**Advisor consultation (2026-07-06):** full corrected record in
`context/advisor_notes_2026-07-06.md`. Read it before planning; it is the source for
everything in the mission below. Compressed:
- **RQ0** (relevance / characterizing the threat): VC-based B2B/B2G ecosystems do not exist
  yet; their emergence is a hypothesis; the ecosystem concept itself is worth a definitional
  attempt. IF they emerge, can the design errors be anticipated from the current state of the
  world? The paper must justify that the problem will need addressing.
- **Design-error taxonomy** as the closing element, motivated by the **X.509 precedent**
  (documented PKI error history), not our own examples ("no navel-gazing"); in sync with the
  two headline examples (vertical income conflict, horizontal floor-area gap); systematic.
- **Proto-SLR, lights out**, Fable-run: ground RQ0 and RQ1 in the corpus; full coverage not
  required. Axes: EUDIW ARF + pilot wallets; today's full VC deployment spectrum; who uses VCs
  where/how (QEAA, Data Spaces, mandate tokens[?]); optional angle (advisor marked it
  *kérdéses*): MDE / knowledge-engineering / ontology.
- Leads to chase: a paper on DIDComm verification ("Peint[?]", possibly the Braun line,
  K-013); a Siemens talk at Hyperledger Global Forum, Dublin (year uncertain, 2022 vs 2023).
- Method: parallelize; the SLR runs while bibliographic dialogue, iteration, and figure work
  continue in the main loop.

**Repository state:**
- This repo is the main authoring repo (full ACM-MODELS-26 history; that repo is the frozen
  conference record). Submodules: `models/` (ACM-MODELS-26-code), `prior_work/dse-vc-refinery`,
  `prior_work/ese-vc-fca`, `overleaf/project` (= `BlackLight54/sosym-2026-overleaf`, the
  Overleaf GitHub-Sync repo, currently the Springer Nature template). Run
  `git submodule update --init` before model- or Overleaf-facing work.
- O-OVERLEAF remaining: Martin's sync round-trip check; retarget `skills/project_overleaf_push`
  to `overleaf/project`; retarget pandoc from ACM `acmart` to `sn-jnl.cls` (fold into O-VENUE).
- O-EUTHREAT (ARF-C1..C8 re-verification against v2.9.0) is still the largest content gate
  (spin §9 gate 1); sections still cite v2.7.3.

## Mission

**Step 0 — status.** Run `skills/review_paper_status`.

**Step 1 — plan, in plan mode, before anything runs.** The plan covers: the six open decisions
(table above) with recommendations; the proto-SLR workflow design (below); what the main loop
does while the workflow runs; and the integration path for results. Get Martin's approval.

**Step 2 — put the six decisions to Martin.** Approved items become `D-` notes; update the spin
document's labels and affected M-011/M-012 rows. Decision 6 (Industry 5.0) deserves your
technical assessment in the plan: what it would do to the committed framing, the objection
ranking (O1/O3/O10), and the delta scope, argued from M-009/M-010/M-012, not from taste.

**Step 3 — launch the lights-out proto-SLR as a Workflow.** Design constraints:
- **Multi-modal sweep:** parallel finder agents per axis, each searching a different way. Axis
  set to start from (refine in the plan): (a) VC/SSI ecosystem definitions and B2B/B2G
  deployments; (b) EUDI wallet pilots, LSPs, member-state wallets; (c) QEAA / Data Spaces /
  organizational-credential use; (d) X.509/PKI design-error and misuse taxonomies; (e) DIDComm
  and SSI protocol verification (the "Peint[?]" lead); (f) the *kérdéses* MDE /
  knowledge-engineering / ontology angle, cheap pass only; (g) the Siemens Dublin talk,
  identification and verification.
- **Verification stage:** every candidate source adversarially verified (title, authors, venue,
  year against the actual record) before it is reported as existing. The no-invented-references
  rule binds every agent; unverifiable items land on the M-013 do-not-cite list, never in
  prose. This is the stage that makes the SLR usable; do not skip it to save tokens.
- **Synthesis:** a corpus map under `context/slr/` — per axis: what exists, what is thin, which
  hits are must-cite vs differentiate vs ignore (feeds M-004), and explicitly: what the corpus
  says about RQ0 (is the threat characterized anywhere?) and where RQ1 anchors. Log dropped
  coverage; no silent caps.
- Not full coverage; the advisor said so. Depth per axis over breadth of axes.

**Step 4 — parallel main-loop work while the workflow runs** (the advisor's explicit method):
process the advisor feedback via `skills/plan_advisor_feedback` into D-notes and todos; draft
the spin edits implied by approved decisions (RQ0 into §2, X.509 precedent leg into §6/O3 row,
delta additions into §4); produce the F7 figure spec (`skills/draft_figure_design`, data ready
in A-004). Do not sit idle waiting on the workflow, and do not let the main loop touch the same
files the integration step will rewrite.

**Step 5 — integrate.** Fold SLR results in via `skills/research_prior_work_import` (keepers
become S-notes and citekey-map entries), update M-004/M-010/M-012, re-check the spin against
what the corpus actually supports (the spin may narrow claims, never inflate). Then the path
continues: O-VENUE → `skills/plan_spine`.

## Constraints (violations = failed run)

- Committed `D-` notes are settled; challenge explicitly or execute, never drift silently.
- No promise a blank M-011 evidence cell cannot back.
- **No invented references** — repeated because SLR work is where it breaks: an agent's claim
  that a paper exists is worthless until the verification stage confirms it.
- M-013 binds: vocabulary and framing prohibitions, refuted claims, do-not-cite list, anchor
  quotes verbatim, legal-citation traps.
- No em dashes in new artifacts (the spin §5 verbatim quote keeps its inherited one).
- No page counting for the paper. `check_links.sh` at 0 errors after vault edits.
- Work on a feature branch; push before ending; `skills/project_session_close` at the end.

## Open unknowns to resolve with Martin (first reply, one batch)

1. The "Peint[?]" DIDComm-verification paper: author recall, if any.
2. Siemens Dublin talk year (2022 vs 2023) if he remembers; otherwise axis (g) resolves it.
3. Confirmation of the "LSP-k", "belga wallet", "mandate tokens" readings in the meeting record.
4. Rulings on the six decisions (or explicit "apply your recommendations").
