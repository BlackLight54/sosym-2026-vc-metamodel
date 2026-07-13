# Figure spec: F8 conflict anatomy (fig:conflict-anatomy)

Spec produced via `skills/draft_figure_design` (step 3 template, extended with element
inventory, data provenance, and open questions). Status: committed per D-022 (2026-07-13),
which also fixes the placement (section 3 motivation, near the ARF anchor quote) and
requires this spec before Stage 4 prose starts.

## Figure: fig:conflict-anatomy

**Claim it supports:** C-034 (statutory unlinkability gap) under the D-014 framing: the
vertical governance conflict is regulator-documented, not author-constructed. The figure
pre-empts objection O5 ("conflict manufactured by over-reading GDPR") at first sight
(D-022 rationale).

**Message (one sentence):** The EU's own texts state both horns of the conflict: statutory
unlinkability and minimization duties on one side, an in-force mandate chain ending at a
linkable salted-hash baseline on the other, while the ZKP specifications that would
discharge the duties sit published but bound by no implementing act.

**Section:** Section 3 motivation (`sections/03_overview.md`, `{#sec:motivation}`),
adjacent to the ARF v2.9.0 section 7.4.3.5.1 anchor quote that D-014 commits the paper to
quoting. The quote is not yet in the section file; figure and Stage 4 prose land together.

**Type:** Two-column opposition diagram with a central wedge (anatomy of a documented
conflict).

**What the reader should see in 5 seconds:** Two solid columns pressing against each other
at a hatched conflict zone, with a grey dashed block sitting in the wedge between them,
attached only by dashed lines.

**What the reader should see in 30 seconds:** The left column is statutory duties with
article numbers. The right column is a three-step mandate chain from a format mandate down
to the regulator's own linkability admission. The wedge block names TS13/TS14 with
publication dates and the status "published, non-mandated". The conflict marker states
joint unsatisfiability under the formats governance currently binds.

## Visual concept

Left block, titled "Statutory duties (in force)": two stacked duty boxes citing Reg.
910/2014 Art. 5a(16)(b) (unlinkability) and Art. 5b(3) (minimization). Right block, titled
"Mandate chain (in force)": a vertical chain of three boxes connected by solid arrows:
dual-issuance mandate, then salted-hash disclosure ceiling, then the ARF's own admission.
The two blocks angle toward a central hatched conflict marker (same visual encoding as
F7's UNSAT node) labeled with the joint-unsatisfiability statement. In the wedge below or
between the two sides sits the TS13/TS14 block in grey with a dashed border; a dashed,
crossed-out edge from the mandate chain to this block reads "referenced by no implementing
act". The dashed edge is the point: the capable technology exists, governance does not
bind it.

Reading direction: duties left, mandates right, collision center, remedy unbound below.
No panel decomposition needed; the figure makes one point.

## Element inventory (exact labels)

Legal precision per M-013 (legal-citation traps): the minimization duty attaches to Art.
5b(3) of Reg. 910/2014, never to ETSI TS6 text; the ARF must be cited as v2.9.0; anchor
quotes are verbatim, no paraphrase drift.

Left column (statutory duties):

| Element | Exact label |
|---|---|
| Column title | Statutory duties (Reg. 910/2014, as amended by Reg. (EU) 2024/1183) |
| Duty box 1 | Art. 5a(16)(b): unlinkability where user identification is not required |
| Duty box 2 | Art. 5b(3): data minimization |

Optional verbatim anchor for duty box 2 (M-013 anchor list; use only verbatim):
"Relying parties shall not request users to provide any data other than that indicated
pursuant to paragraph 2, point (c)."

Right column (mandate chain):

| Element | Exact label |
|---|---|
| Column title | Mandate chain (in force) |
| Chain box 1 | CIR (EU) 2024/2977: dual issuance; every PID in both ISO/IEC 18013-5 (mdoc) and SD-JWT VC |
| Chain box 2 | Salted-hash disclosure ceiling: mdoc MSO and SD-JWT VC `_sd` commitments; disclosures linkable across relying parties |
| Chain box 3 | ARF v2.9.0 release, Topic A discussion paper section 2.2 (RP linkability): the framework's own admission; main doc section 7.4.3.5.1 names the risk |

Verbatim anchor for chain box 3 (M-013 anchor list, CORRECTED 2026-07-13 by the
O-EUTHREAT verbatim check; quote exactly, no ellipsis splice): "By comparing the received
salt values, the Relying Party may find matching salt values. It can then conclude that
the corresponding attestations must have been the same, and hence that it must have been
interacting with the same person." Loci precision (binding): the sentence is in the ARF
v2.9.0 release's Topic A discussion paper section 2.2, NOT in main-doc section 7.4.3.5.1;
the main doc names the RP-linkability risk at 7.4.3.5.1 and concedes salted-hash
linkability at 7.4.3.5.3 for Attestation Provider linkability specifically. Labels and
prose must cite the two loci precisely (M-013).

Wedge:

| Element | Exact label |
|---|---|
| Wedge box | TS13 v1.0.1 (26 Jan 2026): arithmetic-circuit ZKP. TS14 v1.0 (27 Feb 2026): multi-message-signature ZKP |
| Status tag | published, non-mandated |
| Dashed edge label | referenced by no implementing act |

Sourcing nuance for the status tag: S-038 states both specs are published but
non-mandated; the verbatim phrase "is not referenced in any CIR (EU)" is said of TS14 in
EC standards-repo issue #468. If the figure uses the verbatim phrase, attach it to TS14
only; the generic "published, non-mandated" tag is safe for both.

Center:

| Element | Exact label |
|---|---|
| Conflict marker | jointly unsatisfiable under the currently bound formats |

(C-034 wording: "jointly unsatisfiable under the currently approved capability set";
either phrasing is defensible, keep consistent with the section prose.)

Visual vocabulary (grayscale- and colorblind-safe):

| Concept | Fill | Border | Line style |
|---|---|---|---|
| In-force instrument (statute, CIR, ARF) | white / light | solid | solid arrows |
| Published, non-mandated spec (TS13/TS14) | grey | dashed | dashed edge |
| Conflict marker | dark | thick solid | diagonal hatch |

The conflict marker must reuse F7's UNSAT encoding (dark fill, hatch, thick border) so the
motivation figure and the evaluation lattice visibly show the same conflict. Propose
recording this in `pandoc/assets/STYLE.md` (does not exist yet).

## Data source (vault IDs)

- C-034 statutory-unlinkability-gap: the conflict statement; Art. 5a(16)(b) unlinkability
  duty; salted-hash commitments (mdoc MSO, SD-JWT VC `_sd`) cross-verifier linkable; ARF
  v2.9.0 section 7.4.3.5.1 confirmation; "governance does not yet bind the available
  technology".
- D-014 regulator-documented-conflict: the framing the figure carries (regulator's text
  leads; CSOK instantiates a live conflict, does not originate it).
- D-022 f8-conflict-anatomy: the commitment, placement, and O5 pre-emption rationale.
- C-033 dual-issuance-mandate: CIR 2024/2977, PID in both mdoc and SD-JWT VC; conjunctive,
  not disjunctive. Carries a currency flag (see open question 2).
- S-034 eudiw-arf-2.9.0: version pin (v2.9.0, 21 May 2026) and the 7.4.3.5.x subsection
  map (7.4.3.5.1 Linkability, 7.4.3.5.2 Mitigating Relying Party linkability, 7.4.3.5.3
  Zero-Knowledge Proofs).
- S-038 eudiw-zkp-ts13-ts14: TS13 v1.0.1 (26 Jan 2026), TS14 v1.0 (27 Feb 2026),
  published but non-mandated; issue #468 status quote.
- M-013 drafting-guardrails: anchor quotes (verbatim) and legal-citation traps binding the
  labels above.

No invented data: every date, article number, and quote above traces to these notes.

## Draft caption

The unlinkability conflict is documented in the regulator's own texts, not constructed for
this paper. Left: two statutory duties of Reg. 910/2014, as amended by Reg. (EU)
2024/1183: the unlinkability requirement of Art. 5a(16)(b) and the minimization duty of
Art. 5b(3). Right: the in-force mandate chain: CIR (EU) 2024/2977 requires each PID to be
issued in both ISO/IEC 18013-5 (mdoc) and SD-JWT VC; both formats disclose through
salted-hash commitments that are linkable across relying parties, a ceiling the framework's
own release documents concede (ARF v2.9.0, Topic A discussion paper section 2.2; risk
named in main doc section 7.4.3.5.1). Center wedge: the zero-knowledge
specifications TS13 and TS14 that would discharge the duties are published but referenced
by no implementing act. The duties and the mandate chain are jointly unsatisfiable under
the formats governance currently binds; the gap is not missing technology but governance
that does not yet bind the available technology. Section 5 shows the same conflict shape
is minimal and machine-detectable in the running example.

## Ready-to-paste section metadata block

```markdown
::: {#fig:conflict-anatomy .figure}
Anatomy of the regulator-documented unlinkability conflict: statutory duties vs the in-force mandate chain, TS13/TS14 unbound in the wedge.
:::

**Figure F8: The unlinkability conflict is documented in the regulator's own texts, not
constructed for this paper.** Left: two statutory duties of Reg. 910/2014, as amended by
Reg. (EU) 2024/1183: the unlinkability requirement of Art. 5a(16)(b) and the minimization
duty of Art. 5b(3). Right: the in-force mandate chain: CIR (EU) 2024/2977 requires each
PID to be issued in both ISO/IEC 18013-5 (mdoc) and SD-JWT VC; both formats disclose
through salted-hash commitments that are linkable across relying parties, a ceiling the
framework's own release documents concede (ARF v2.9.0, Topic A discussion paper section
2.2; risk named in main doc section 7.4.3.5.1). Center wedge: the
zero-knowledge specifications TS13 and TS14 that would discharge the duties are published
but referenced by no implementing act. The duties and the mandate chain are jointly
unsatisfiable under the formats governance currently binds; the gap is not missing
technology but governance that does not yet bind the available technology. Section 5 shows
the same conflict shape is minimal and machine-detectable in the running example.
```

## Format recommendation

**Source format:** Excalidraw prototype first, TikZ final (the M-014 production route).
Unlike F7, the layout here is not geometrically determined: box sizes depend on label
lengths, and the wedge composition needs visual iteration. Prototype in Excalidraw to fix
proportions, then transcribe to TikZ for font and style consistency with F7.

**Filename:** `pandoc/assets/fig_conflict_anatomy.tex` (label `fig:conflict-anatomy`);
prototype `pandoc/assets/fig_conflict_anatomy.excalidraw`.

**Sizing:** D-018 commits to SoSyM (single-column journal layout); `context/VENUE.md` is
stale (ACM sigconf) pending todo O-VENUE. The figure is text-heavy; at single-column
journal width it likely wants full text width. Re-check after VENUE.md regeneration.

**Dependencies:**
1. Stage 4 motivation prose: the ARF anchor quote placement decides how much quote text
   the figure itself carries (open question 1).
2. C-033 currency re-verification: dual issuance was read from ARF v2.7.3 / CIR 2024/2977;
   confirm it holds verbatim in ARF v2.9.0 section 5.4 / Annex 3.01 before finalizing
   chain box 1 (M-009 moving-target threat; `skills/research_currency_sweep`).
3. Shared conflict encoding with F7 and the F2 teaser (propose `pandoc/assets/STYLE.md`).

## Open questions for Martin

1. **Quote inside the figure or in the prose only?** D-022 places F8 near the ARF anchor
   quote (now precisely located: Topic A discussion paper section 2.2, per the 2026-07-13
   O-EUTHREAT correction). Carrying the full verbatim quote in chain box 3 duplicates the
   adjacent prose. Options: (a) full quote in the figure, prose paraphrase; (b) quote in
   prose, figure box reads only "ARF v2.9.0 Topic A section 2.2: salted-hash disclosures
   admitted linkable"; (c) truncated quote in the figure. The spec drafts (a) in the
   element inventory but the caption works under any option.
2. **Citation form for the statute.** C-034 cites Art. 5a(16)(b) under "Reg. (EU)
   2024/1183"; M-013 pins Art. 5b(3) to "Reg. 910/2014". Both articles live in Reg.
   910/2014 as amended by Reg. (EU) 2024/1183. Which canonical string does section 3
   prose use? Figure labels must match it exactly.
3. **Does Art. 5b(3) stay?** M-014's F8 row lists both duties, but C-034's joint
   unsatisfiability argument runs through unlinkability alone. Keeping minimization
   strengthens the "statutory duties" side but adds a box whose conflict role the caption
   does not argue. Keep both (current draft) or unlinkability only?
4. **Format-token granularity.** Chain box 2 names "mdoc MSO" and "SD-JWT VC `_sd`". The
   practitioner reviewer persona has no VC background; is "salted-hash disclosure
   mechanism of both mandated formats" enough for the motivation, with tokens deferred to
   section 5?
5. **ETSI handoff detail.** S-038 records TS14's planned handoff to ETSI as TS 119 476-2
   (expected 28 Feb 2027). Include as a small wedge footnote (strengthens
   "non-mandated for the foreseeable horizon") or cut for density?
6. **Verdict tie-in.** Should the conflict marker carry a forward pointer to F7 (e.g.
   "see Fig. F7: only the full conjunction is UNSAT") to make the
   motivation-to-evaluation arc explicit, or does the caption's final sentence suffice?
