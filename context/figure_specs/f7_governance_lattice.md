# Figure spec: F7 governance lattice (fig:governance-lattice)

Spec produced via `skills/draft_figure_design` (step 3 template, extended with element
inventory, data provenance, and open questions). Status: F7 is in the committed figure set
per D-022 (2026-07-13); M-014's status column still says "proposed" and needs updating.

## Figure: fig:governance-lattice

**Claim it supports:** K-008 (Headline 1 minimality): cross-framework constraints can be
formally contradictory, and the contradiction requires all three frameworks. "Every proper
subset is satisfiable" becomes one image.

**Message (one sentence):** Of the eight governance configurations over {eIDAS, Privacy,
VCDM}, only the full conjunction G7 is unsatisfiable; removing any one framework restores
satisfiability, so the conflict is minimal and cannot be attributed to any single source or
pair of sources.

**Section:** Section 5 (evaluation). Candidate anchors: the confirmation sentence in
`sections/05_evaluation.md` at `{#sec:headline-income-conflict}` ("The constraint
sensitivity analysis ... confirms this") or the sensitivity paragraph in
`{#sec:scalability}`. Recommendation: place at the Headline 1 discussion, where the
argumentative weight sits; the sensitivity paragraph then references the figure. Martin
decides (open question 5).

**Type:** Formal structure diagram: the Boolean lattice B3 (power-set of three elements)
drawn as a cube in 2D projection.

**What the reader should see in 5 seconds:** A cube of eight nodes, seven light, one dark
and hatched at the top. Only the top configuration is broken.

**What the reader should see in 30 seconds:** Each node is a governance configuration
labeled with the frameworks it activates; each edge adds exactly one framework; the three
cube axes correspond to the three frameworks. All seven proper subsets carry SAT verdicts,
including all three pairs. The top node, the full conjunction, is the only UNSAT node.
Every edge into the top crosses from satisfiable to unsatisfiable.

## Visual concept

A cube (2D isometric or oblique projection) with the empty configuration at the bottom
front corner and the full conjunction at the top back corner. The three edge directions of
the cube encode "add eIDAS", "add Privacy", "add VCDM" respectively, annotated once at the
three edges leaving the bottom node. Nodes are rounded rectangles carrying the subset label
and a small verdict badge (SAT / UNSAT). The G7 node is visually singular: dark fill,
diagonal hatching, thick border. Optionally the three edges into G7 are emphasized (thicker
or marked) to carry "removing any one framework dissolves the conflict" without text.

Alternative layout (fallback if the cube reads poorly at column width): a flat Hasse
diagram in four ranks by cardinality (1-3-3-1). Same node inventory and encodings. The cube
is preferred because M-014 specifies "the power-set as a cube" and the axis annotation
makes the three frameworks legible as dimensions.

## Element inventory (exact labels)

Node labels use the paper's established set notation from `sections/05_evaluation.md`
(power-set over {eIDAS, Privacy, VCDM}). "Privacy" is the paper's name for the
GDPR-derived operationalized requirement (D-011 framing); do not label the axis "GDPR"
even though the ablation model file is named `csok_no_gdpr.problem`.

| Element | Exact label | Verdict badge |
|---|---|---|
| Bottom node | (empty set symbol) | SAT |
| Singleton node | {eIDAS} | SAT |
| Singleton node | {Privacy} | SAT |
| Singleton node | {VCDM} | SAT |
| Pair node | {eIDAS, Privacy} | SAT |
| Pair node | {eIDAS, VCDM} | SAT |
| Pair node | {Privacy, VCDM} | SAT |
| Top node | G7 = {eIDAS, Privacy, VCDM} | UNSAT |
| Axis annotation 1 | + eIDAS | |
| Axis annotation 2 | + Privacy | |
| Axis annotation 3 | + VCDM | |
| Corner annotation | N = 3 (fixed instance size) | |

G-index placement: only G7 = eIDAS AND Privacy AND VCDM is pinned by the paper text
(`05_evaluation.md`, scalability discussion). The G0-G6 index-to-subset assignment must be
read off `models/evaluation/instances/sensitivity_G{0-7}.problem` before the indices go
into the figure; those files are not present in this worktree (`models/` is empty here).
Until verified, the figure carries subset labels as primary and the G7 index only.

Verdict encoding (grayscale- and colorblind-safe, never color alone):

| Concept | Fill | Pattern | Border |
|---|---|---|---|
| SAT configuration | white / light | none | thin solid |
| UNSAT configuration (G7) | dark | diagonal hatch | thick solid |

The UNSAT encoding should be the shared conflict encoding across the paper's figures: F8's
conflict marker and the F2 teaser's conflict elements should use the same fill + hatch +
border treatment. No `pandoc/assets/STYLE.md` exists yet; creating it with this vocabulary
is recommended when F7/F8 drafts land.

## Data source (vault IDs and files)

- A-004 constraint-sensitivity-variants: the artifact note; verdicts: "of the eight
  configurations, only G7 (the triple conjunction) is UNSAT; every proper subset is
  satisfiable."
- K-008 contradictory-cross-framework-constraints: the binding claim (status: delivered);
  "constraint sensitivity (G0-G7) confirms only the full conjunction G7 is unsatisfiable,
  all seven proper subsets satisfiable."
- C-025 governance-conflict-vertical: the Headline 1 result the experiment confirms.
- `sections/05_evaluation.md`: notation (power-set over {eIDAS, Privacy, VCDM}, N=3,
  configurations G0-G7); the verdict sentence: only G7 = eIDAS AND Privacy AND VCDM yields
  unsatisfiability, all seven proper subsets satisfiable, all complete in under 0.1 s.
- Underlying models (not in this worktree): `models/csok_no_eidas.problem`,
  `models/csok_no_gdpr.problem`, `models/csok_no_conflict.problem`,
  `models/evaluation/instances/sensitivity_G{0-7}.problem`, `evaluation/README.md` (E3).

No other data may appear in the figure. Per-node solve times are not recorded in the vault
notes; if Martin wants them annotated, they must come from the E3 evaluation README.

## Draft caption

Constraint sensitivity over the governance power-set: only the full conjunction of the
three frameworks is unsatisfiable. Each node is one configuration of the sensitivity
experiment (N = 3 credentials), labeled with the governance frameworks it activates; each
edge adds one framework. All seven proper subsets, including every pair, admit at least one
valid format assignment (SAT, light nodes) and complete in under 0.1 s. The top
configuration G7, activating eIDAS, Privacy, and VCDM together, admits none (UNSAT, dark
hatched node). Removing any single framework from G7 restores satisfiability: the conflict
is minimal, produced by the interaction of all three sources rather than by any framework
alone or any pair.

## Ready-to-paste section metadata block

```markdown
::: {#fig:governance-lattice .figure}
G0-G7 governance power-set as a cube: seven SAT configurations, only the full conjunction G7 UNSAT.
:::

**Figure F7: Constraint sensitivity over the governance power-set: only the full
conjunction of the three frameworks is unsatisfiable.** Each node is one configuration of
the sensitivity experiment (N = 3 credentials), labeled with the governance frameworks it
activates; each edge adds one framework. All seven proper subsets, including every pair,
admit at least one valid format assignment (SAT, light nodes) and complete in under 0.1 s.
The top configuration G7, activating eIDAS, Privacy, and VCDM together, admits none
(UNSAT, dark hatched node). Removing any single framework from G7 restores satisfiability:
the conflict is minimal, produced by the interaction of all three sources rather than by
any framework alone or any pair.
```

## Format recommendation

**Source format:** TikZ. The layout is a regular geometric structure (cube projection,
eight nodes, twelve edges) where precise positioning matters and text is short; this is the
skill's stated TikZ sweet spot ("formal structures"). Skipping the Excalidraw prototype
stage of the M-014 production route is justified here because the geometry is fully
determined; go straight to TikZ.

**Filename:** `pandoc/assets/fig_governance_lattice.tex` (label `fig:governance-lattice`).

**Sizing:** D-018 commits the paper to SoSyM (single-column Springer journal layout), but
`context/VENUE.md` still carries the stale ACM sigconf conference format (todo O-VENUE).
Design for a single-column journal width; re-check after VENUE.md is regenerated.

**Dependencies:**
1. G0-G6 index-to-subset mapping verified against
   `models/evaluation/instances/sensitivity_G*.problem` (files absent from this worktree).
2. Shared conflict encoding agreed with F8 and F2 (propose `pandoc/assets/STYLE.md`).
3. VENUE.md regeneration (O-VENUE) for final sizing.

## Open questions for Martin

1. **G-index mapping.** The instance files defining which subset each of G0-G6 denotes are
   not in this worktree. Should the figure carry all eight G-indices (after verification
   against the `sensitivity_G*.problem` files), or subset labels only, with "G7" as the
   sole index since it is the only one the prose names?
2. **Cube vs Hasse.** The cube (M-014's wording) encodes frameworks as axes; a flat
   1-3-3-1 Hasse diagram is easier to read at column width. Which layout?
3. **Timing annotation.** Keep "under 0.1 s" in the caption only (current draft), or
   annotate the figure? Per-node times would need the E3 README data.
4. **Emphasis on the covering edges into G7.** Should the three edges into G7 be visually
   marked to carry "remove any one framework and the conflict dissolves", or is the single
   dark node enough?
5. **Placement.** At the Headline 1 discussion ({#sec:headline-income-conflict}) or at the
   sensitivity experiment ({#sec:scalability})? The spec recommends Headline 1.
6. **Ablation file discrepancy (flag, not a figure decision).** A-004 says the three
   `csok_no_*.problem` files remove one framework each, but the third is named
   `csok_no_conflict.problem`, not `csok_no_vcdm.problem`; and the file set uses "gdpr"
   where the paper says "Privacy". Worth confirming the ablations align with the
   cardinality-2 lattice nodes before the caption implies they do.
