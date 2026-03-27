# O05: Figure Design — Teaser + Metamodel

**Wave:** 1.5 (after consolidation T01-T03 complete — metaclass names and layer structure stable)
**Execution:** Single agent. Runs `skills/figure_design` for two figures. Produces design specs + draft source files.
**Dependencies:** T01 (DCL metaclasses), T02 (CSL metaclasses), T03 (FSL metaclasses). Benefits from T07 (cross-layer constraints), but can start from existing specs.
**Target files:** `figures/fig_teaser.*`, `figures/fig_metamodel.*`, `figures/STYLE.md`.
**Downstream:** T10 (polish — teaser figure must exist for final submission). `tex/main.tex` teaser block must be uncommented.

---

## Context

The paper needs two key figures, neither of which exists yet:

1. **fig_teaser** — ACM sigconf teaser figure (full-width, before first column). Unified CSOK housing subsidy scenario across three metamodel layers. Detailed spec exists in `sections/01_introduction.md` line 8 (`@FIGURE: fig_teaser`).

2. **fig_metamodel** — Three-layer class diagram showing all metaclasses, relationships, and trace mappings. Referenced in Section 4. No detailed spec yet — must be designed from the approach section definitions.

Both figures share the three-layer visual structure (DCL/CSL/FSL) and must use a consistent visual vocabulary. Designing them together enforces consistency.

## Read Before Designing

1. `sections/01_introduction.md` — `@FIGURE: fig_teaser` spec (line 8, very detailed)
2. `sections/04_approach.md` — metamodel definitions and any `@FIGURE: fig_metamodel` spec
3. `models/vc_metamodel.refinery` — authoritative metaclass names and relationships
4. `models/csok.problem` or `models/csok_instance_*.refinery` — CSOK scenario entities for teaser
5. `DECISIONS.md` — CSOK naming convention ("family housing subsidy"), teaser figure decision, mdoc simplified away, two headline results
6. `VENUE.md` — ACM sigconf format constraints, exemplar papers (check their figure style)
7. `figures/README.md` — allowed figure formats and conventions
8. `skills/figure_design/SKILL.md` — figure design skill steps
9. T01/T02/T03 output — final metaclass names (if available; otherwise use names from `models/vc_metamodel.refinery`)

## What to Design

### Figure 1: fig_teaser (full-width `figure*`)

**Purpose:** First visual the reviewer sees. Must communicate the cross-layer problem at a glance — that independently governed constraints interact across layers to create unresolvable conflicts.

**Layout** (from `@FIGURE` spec):
- Three horizontal bands: DCL (top), CSL (middle), FSL (bottom)
- **DCL:** Applicant node with three Prop edges to `num_children`, `property_area`, `monthly_income`. Dashed arc for cross-property constraint `area ≥ f(children)`.
- **CSL:** Three credential boxes (FamilyStatus, Property, Income), each with CredentialSchema + Claim + CredentialValue elements. Dashed alignment arrows between credential subject nodes. Vertical trace lines to DCL.
- **FSL:** SD-JWT-VC boxes below FamilyStatus and Property (solid border, valid assignment). Conflict zone below Income: split box showing SD-JWT-VC ("eIDAS required") vs. AnonCreds ("GDPR predicate proof"), red dashed border indicating no single format satisfies both. Second conflict annotation between Property and FamilyStatus for cross-credential predicate gap.

**Caption** (draft — conclusion first per Nature style):
"A housing subsidy scenario across three metamodel layers. Domain facts at the domain concept layer are grouped into credentials with aligned subjects at the credential schema layer. At the format-specific layer, eIDAS format mandates and GDPR data minimization impose contradictory requirements on the income credential; cross-credential predicates lack privacy-preserving enforcement entirely."

**Production:** Excalidraw prototype → TikZ for camera-ready.

### Figure 2: fig_metamodel (column-width `figure` or full-width `figure*`)

**Purpose:** Central metamodel diagram. Shows the formal structure: metaclasses, attributes, relationships, and trace mappings across all three layers.

**Layout:**
- Three-layer class diagram (UML-style or Ecore-style, matching MODELS convention).
- **DCL metaclasses:** Entity (abstract), Subject, Value, Prop (or as defined in T01). Show key attributes and relationships.
- **CSL metaclasses:** CredentialSchema, Claim, CredentialValue, trace mappings to DCL entities.
- **FSL metaclasses:** FormatBinding, format subclasses (SDJWTVC, AnonCreds, JSONLD, etc.), capability annotations.
- **Cross-layer relationships:** Coverage traces (CSL → DCL), capability constraints (FSL → CSL), format containment.
- Layer boundaries as labeled horizontal dividers or shaded regions.

**Caption:** Should explain the three layers and their relationships without requiring the reader to read Section 4 first.

**Production:** TikZ (publication quality for class diagrams).

### Visual Consistency: STYLE.md

Create `figures/STYLE.md` defining:
1. **Color palette:** One color per layer (DCL, CSL, FSL). Must work in grayscale. Suggest: DCL = blue-gray, CSL = teal, FSL = amber/orange. Confirm with Martin.
2. **Shape vocabulary:** Rounded rectangles for instances/scenarios (teaser), sharp rectangles for metaclasses (metamodel). Dashed borders for constraints/conflicts.
3. **Line styles:** Solid for containment/composition. Dashed for traces/mappings. Dotted for constraints.
4. **Typography:** Sans-serif labels. Monospace for metaclass names. Italic for constraint annotations.
5. **Layer dividers:** Consistent across both figures — labeled horizontal rules or shaded bands.

## Constraints

- Figures must be readable in **grayscale** and by **colorblind readers**. Use shape and position in addition to color.
- fig_teaser is full-width (`figure*`). fig_metamodel: decide column-width vs. full-width based on complexity.
- Metaclass names must match the final names from T01-T03. If T01-T03 have not yet run, use names from `models/vc_metamodel.refinery` and flag for update.
- CSOK naming: "housing subsidy scenario" in caption, not "CSOK." Per DECISIONS.md.
- **Double-blind:** No author names. Refinery in third person in captions.
- After designing, note that `tex/main.tex` has the teaser block commented out (lines 56-61) — it must be uncommented when the figure file is ready.
- Follow `skills/figure_design/SKILL.md` process.
