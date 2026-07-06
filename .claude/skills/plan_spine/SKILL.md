---
description: Build the paper's spine in six passes — mind-map harvest, section homes, define-before-use ordering, reader contracts, figure/example placement, audit-and-freeze. Use between the paper-spin document and paragraph engineering, when the outline must become a checkable structure with cross-references and expectations.
---

# Skill: Spine Creation

**Purpose:** Turn the spin document's *what* into a frozen structural contract: which section owns
which element, in what order, with which cross-references, carrying which claims, meeting which reader
expectations. The spine is the bridge between "what the paper contains" (spin) and "what each
paragraph does" (paragraph engineering). Each pass catches one class of structural error; do not merge
passes, because merged passes hide exactly the errors they exist to catch.

## Trigger

- "Create the spine"
- "Turn the spin document into an outline"
- "Mind-map the paper" / "What goes where?"
- After the spin document is approved, before any section scaffolding or prose.

## Inputs

- The approved spin document (thesis, contributions, delta, selected figures).
- `zettelkasten/moc/M-001` (outline proposal), `M-011` (claim delivery matrix),
  `M-010` (objection ledger), `M-014` (figure plan), `zettelkasten/glossary.md`.
- Prior structure decisions in `.claude/memory/decision_*` (notation-in-background,
  type-graph placement, overview restructure).

## Outputs

All under `context/spine/`:

- `mindmap.md` — the Pass-1 harvest (Obsidian `mindmap-plugin: basic` format, like the precursor's
  MindMap page).
- `SPINE.md` — the section blocks (template: `spine_section_template.md` in this skill folder), the
  cross-reference table, and the audit checklist with results.
- Freeze marker: a `## FROZEN [date]` header at the top of `SPINE.md` after Pass 6.

## Steps

### Pass 1 — Harvest (diverge: what will be in the paper)

Build a mind map of **every element that must appear**: claims, concepts, definitions, notation,
constraints (C1..Cn), figures, tables, running-example beats, rebuttals, anchor quotes. One node per
element, hierarchy loose (this is inventory, not structure).

**Discipline:** every leaf carries the vault ID it resolves to (`[[C-016 ...]]`, `K-006`, `F7`, `O5`).
A leaf that resolves to nothing is one of two things, and the pass must say which:
- **new work** → becomes a todo / `M-007` entry before the spine proceeds, or
- **a cut** → deleted here, cheaply, instead of during drafting.

*Catches:* content that exists only in someone's head; content in the vault nobody planned to use
(diff the harvest against `M-011` — undelivered evidence and unused figures surface here).

### Pass 2 — Home (converge: one introduction site per element)

Partition the harvest into a section tree. Every element gets exactly **one home**: the section that
*introduces* (defines, first explains) it. Uses elsewhere are cross-references, never
re-introductions.

*Catches:* duplicate introductions (the same concept explained twice, differently); homeless elements
(harvested but no section wants them → cut or new subsection); sections with no elements (structure
without content → delete the section).

### Pass 3 — Order (dependencies and cross-references)

For each element ask: *what must the reader already hold to understand this?* Draw define-before-use
edges between elements, lift them to sections, and linearize. A backward edge means either reorder, or
a deliberate, signposted forward reference (rare; each one is listed explicitly).

Produce the **cross-reference table**: for every element, its introduction site and every use site
(`§4.4 uses four-valued semantics → introduced §2.3`).

*Catches:* the conference draft's diagnosed failure — concepts "floating" without anchoring to their
background definitions (`decision_bg_notation_consistency`: every Refinery term used in §4/§5 must
resolve to its §2.3 introduction through this table, and nothing defined in the background may be
re-defined later).

### Pass 4 — Contract (reader expectations per section)

For each section fill the contract fields of the template: **entry state** (what the reader knows and
believes arriving), **exit state** (what they must know and believe leaving), **claims advanced**
(K-ids), **objections pre-empted here** (O-ids from `M-010`).

Global checks:
- The champion argument is recoverable by the end of the introduction (persona calibration).
- No claim is asserted as delivered before the section that carries its evidence.
- Every claim promised in `M-011` appears in exactly one section's exit state.
- Chained entry/exit states are consistent: section N+1's entry state is implied by states 1..N.

*Catches:* promise/payoff mismatches — the reader who was promised X in §1 and never receives it, or
receives it unannounced.

### Pass 5 — Place (load-bearing elements at point of need)

Assign exact positions for figures and tables (`M-014` F-ids; a figure sits at its first
cross-reference — type graph near the constraint table, per advisor), running-example beats (each beat
advances exactly one new difficulty; the example never idles), and anchor quotes (`M-013`).

*Catches:* figures nobody references; example beats that repeat instead of advance; quotes
paraphrased because no placement existed.

### Pass 6 — Audit and freeze

Run the checklist and record results in `SPINE.md`:

- [ ] Every `M-011` row has a home section and its Open items are scheduled or blocking.
- [ ] Every used element has an earlier introduction or a listed, signposted forward reference.
- [ ] Every figure is referenced at least once; every referenced figure exists or is scheduled.
- [ ] Every `M-010` objection's landing spot exists in the tree.
- [ ] Every section has a job, an entry state, and an exit state.
- [ ] Budget risks flagged per section (flag only — no page arithmetic, CLAUDE.md rule 3).

Then **freeze**: add the `## FROZEN [date]` header. The spine is now the contract for paragraph
engineering. Post-freeze structural changes require a `D-` note in the Zettelkasten stating what
changed and why; silent restructuring during drafting is the failure mode the freeze exists to
prevent.

## Handoff

Paragraph engineering consumes one section block at a time: the section's job decomposes into
paragraph jobs (`::: {.scaffold}` divs via `skills/setup_section_scaffold`), the cross-reference table
becomes `\autoref{}` targets, and `M-013` is loaded before any prose.

## Failure modes

- **Merging passes.** Homing while harvesting truncates the inventory; ordering while homing bakes in
  the first order that comes to mind. Keep passes separate.
- **Spine as prose.** The spine states structure, not sentences. If a cell wants to become a
  paragraph, it belongs to the next stage.
- **Unresolvable leaves silently kept.** Every Pass-1 leaf without a vault ID must be explicitly
  converted to work or cut; anything else re-imports the "content that exists only in heads" problem.
