---
id: O05
short: "teaser-fig"
title: "Design teaser and metamodel figures"
status: pending
depends_on: []
binding_claims: []
target: pandoc/assets/
priority: high
pipeline: "consolidation"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Design the two key figures that do not yet exist: `fig_teaser` (ACM sigconf full-width teaser) and `fig_metamodel` (three-layer class diagram). Both share the three-layer visual structure (DCL/CSL/FSL) and must use a consistent visual vocabulary.

## Read before designing

1. `sections/01_introduction.md` — `::: {#fig:teaser .figure}` spec (very detailed)
2. `sections/04_approach.md` — metamodel definitions and any figure specs
3. `models/vc_metamodel.refinery` — authoritative metaclass names and relationships
4. `context/VENUE.md` — ACM sigconf format, exemplar paper figure style
5. Run `skills/draft_figure_design` for structured design process
6. Oszkár to provide Refinery screenshot for teaser placeholder (per M00 item 10)

## Figure 1: fig_teaser (full-width `figure*`)

**Purpose:** First visual the reviewer sees. Communicates the cross-layer problem at a glance — independently governed constraints interact across layers to create unresolvable conflicts.

**Layout** (from figure spec in sections/01_introduction.md):

- Three horizontal bands: DCL (top), CSL (middle), FSL (bottom)
- **DCL:** Applicant node with three Prop edges to `num_children`, `property_area`, `monthly_income`. Dashed arc for cross-property constraint `area ≥ f(children)`.
- **CSL:** Three credential boxes (FamilyStatus, Property, Income) each with CredentialSchema + Claim + CredentialValue. Dashed alignment arrows. Vertical trace lines to DCL.
- **FSL:** SD-JWT-VC boxes below FamilyStatus/Property (solid, valid). Conflict zone below Income: split box SD-JWT-VC "eIDAS required" vs. AnonCreds "GDPR predicate proof", red dashed border. Second conflict annotation between Property/FamilyStatus for cross-credential predicate gap.

**Caption:** "A housing subsidy scenario across three metamodel layers. Domain facts at the domain concept layer are grouped into credentials with aligned subjects at the credential schema layer. At the format-specific layer, eIDAS format mandates and GDPR data minimization impose contradictory requirements on the income credential; cross-credential predicates lack privacy-preserving enforcement entirely."

**Production:** Excalidraw prototype → TikZ for camera-ready.

## Figure 2: fig_metamodel (column-width or full-width)

**Purpose:** Central metamodel diagram. Shows all metaclasses, relationships, and trace mappings.

**Layout:** Three-layer class diagram (UML-style or Ecore-style, matching MODELS convention). DCL metaclasses, CSL metaclasses, FSL metaclasses, cross-layer relationships (coverage traces, capability constraints). Layer boundaries as labeled horizontal dividers.

**Caption:** Should explain the three layers and their relationships without requiring Sec 4.

**Production:** TikZ (publication quality for class diagrams).

## Visual consistency: STYLE.md

Create `pandoc/assets/STYLE.md` defining:

1. **Color palette:** One color per layer. Must work in grayscale. Suggest: DCL = blue-gray, CSL = teal, FSL = amber/orange.
2. **Shape vocabulary:** Rounded rectangles for instances (teaser), sharp for metaclasses (metamodel). Dashed borders for conflicts.
3. **Line styles:** Solid = containment. Dashed = traces. Dotted = constraints.
4. **Typography:** Sans-serif labels. Monospace for metaclass names. Italic for constraints.

## Constraints

- Figures must be readable in **grayscale** and by **colorblind readers**
- fig_teaser is full-width (`figure*`). fig_metamodel: decide based on complexity.
- CSOK naming: "housing subsidy scenario" in caption (per decision_csok_naming.md)
- **Double-blind:** No author names. Refinery in third person.
- After designing, `pandoc/main.tex` teaser block must be uncommented.

## Acceptance criteria

- [ ] fig_teaser design spec complete with Excalidraw prototype or TikZ draft
- [ ] fig_metamodel design spec complete
- [ ] STYLE.md created with consistent visual vocabulary
- [ ] Both figures readable in grayscale
