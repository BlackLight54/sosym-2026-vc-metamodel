# Prompt: Create the Teaser Figure as SVG

## Task

Create a publication-quality SVG figure for an academic paper about multi-layer metamodeling for verifiable credential ecosystems. This is the **teaser figure** — the first thing reviewers see. It must be visually polished, information-dense, and self-contained.

The figure appears as a full-width `\begin{figure*}` in ACM sigconf format. Target dimensions: **~1200 units wide × ~380 units tall** (approximately 3:1 aspect ratio — wider than tall).

## Figure Design: "The Exploded Sandwich"

The figure has **three separated horizontal layer bands** (DCL, CSL, FSL) with **explicit inter-layer constraint zones** in the gaps between them. The gaps are not empty whitespace — they carry labeled cross-layer constraints. This is the key design idea: the cross-layer constraints (the paper's core contribution) get their own visual territory between the layers.

Flanking the model: an **input column** on the left and an **output column** on the right.

### Overall Layout (left to right)

```
┌─INPUT COL─┐  ┌─DCL BAND──────────────────────────────────┐  ┌─OUTPUT COL──┐
│            │  │                                            │  │             │
│ Metamodel  │  │  Domain Concept Layer content              │  │ ① CHECK     │
│ definitions│  │                                            │  │ UNSAT       │
│            │  └────────────────────────────────────────────┘  │             │
│            │     ↕ CONSTRAINT ZONE: C1, C2 (trace, align)    │             │
│            │  ┌─CSL BAND──────────────────────────────────┐  │             │
│ Scenario   │  │                                            │  │ ② IDENTIFY  │
│ instance   │  │  Credential Schema Layer content           │  │ gov_conflict│
│ (CSOK)     │  │                                            │  │ cross_cred  │
│            │  └────────────────────────────────────────────┘  │ _gap        │
│            │     ↕ CONSTRAINT ZONE: C5, C6, C7 (governance)  │             │
│ Governance │  ┌─FSL BAND──────────────────────────────────┐  │ ③ GENERATE  │
│ constraints│  │                                            │  │ SAT w/o     │
│ (eIDAS,    │  │  Format-Specific Layer content             │  │ eIDAS →     │
│  GDPR,     │  │  including CONFLICT ZONE on Income        │  │ AnonCreds   │
│  W3C VCDM) │  │                                            │  │             │
└────────────┘  └────────────────────────────────────────────┘  └─────────────┘
```

### Spatial Budget

| Zone | Width (of 1200) | Height (of 380) | Notes |
|------|----------------|-----------------|-------|
| Left input column | ~160 | full height | Three stacked input items |
| Layer label strip | ~40 | full height | "DCL" / "CSL" / "FSL" rotated or horizontal |
| DCL band | ~830 | ~75 | Blue-gray background |
| DCL↔CSL constraint zone | ~830 | ~30 | No background — white with constraint labels/arcs |
| CSL band | ~830 | ~90 | Teal background |
| CSL↔FSL constraint zone | ~830 | ~30 | No background — white with constraint labels/arcs |
| FSL band | ~830 | ~90 | Amber background |
| Right output column | ~170 | full height | Three modality results |

(Heights are approximate — adjust for readability. The constraint zones should be visually distinct from the layer bands.)

### Color Palette

| Element | Fill | Stroke | Opacity |
|---------|------|--------|---------|
| DCL band background | `#dbe4ff` | `#8da0cb` | 0.3 |
| CSL band background | `#c3fae8` | `#66d9a8` | 0.3 |
| FSL band background | `#fff3bf` | `#fcc419` | 0.3 |
| Conflict zone (Income at FSL) | `#ffc9c9` | `#e03131` dashed | 0.4 |
| Cross-credential gap indicator | none | `#e03131` dotted | — |
| Input boxes | `#f8f9fa` | `#adb5bd` | 1.0 |
| Output boxes | `#f8f9fa` | `#adb5bd` | 1.0 |
| Instance nodes (in DCL) | `#dbe4ff` | `#4c6ef5` | 0.8 |
| Instance nodes (in CSL) | `#c3fae8` | `#20c997` | 0.8 |
| Instance nodes (in FSL) | `#fff3bf` | `#fab005` | 0.8 |
| Governance tags | varies by source | — | — |
| Leader lines (margin→model) | `#e03131` | — | 0.6 |

### Grayscale Fallback

The figure must work in grayscale. Use:
- Different stroke patterns (solid, dashed, dotted) in addition to colors
- Hatching inside the conflict zone
- Three distinct gray levels for the layer backgrounds

### Font Choices

- **Layer labels** (DCL, CSL, FSL): Bold sans-serif, 13–14px
- **Node labels** (Applicant, num_children, etc.): Regular sans-serif, 10–11px
- **Constraint labels** (C1, C2, ...): Italic sans-serif, 9–10px
- **Input/output headings** (Metamodel, ① CHECK): Bold sans-serif, 10–11px
- **Input/output details**: Regular sans-serif, 8–9px
- **Governance tags** (eIDAS, GDPR, W3C): Small caps or bold, 8px

---

## Content Specification

### Left Input Column (3 items, stacked vertically)

**Item 1: Metamodel definitions**
- Label: "Metamodel"
- Subtitle: "DCL + CSL + FSL definitions"
- Small light-gray rounded rectangle

**Item 2: Scenario instance**
- Label: "Scenario instance"
- Subtitle: "Housing subsidy (CSOK)"
- Small light-gray rounded rectangle

**Item 3: Governance constraints**
- Label: "Governance"
- Subtitle: "eIDAS ARF · GDPR · W3C VCDM"
- Small light-gray rounded rectangle

A subtle arrow (or flow line) from each input item points right toward the model area.

### DCL Band Content

One Subject node, three Property→Value chains:

```
[Applicant] ──has_children──▶ [num_children]
     │
     ├──────owns_property──▶ [property_area]
     │                              │
     └──────earns──────────▶ [monthly_income]

    ····area ≥ f(children)····  (dotted arc between num_children and property_area, labeled "C4")
```

- **Applicant**: rounded rectangle, slightly larger, labeled "Applicant" with italic subtitle "Subject"
- **num_children**, **property_area**, **monthly_income**: rounded rectangles, labeled with italic subtitle "Value"
- **has_children**, **owns_property**, **earns**: edge labels on the arrows (these are Prop names)
- **C4 constraint arc**: dotted line between num_children and property_area, labeled "C4: area ≥ f(children)" in italic

Arrange the three Value nodes spread left-to-right so they align roughly with the three credential columns below.

### DCL↔CSL Constraint Zone

Between the DCL and CSL bands, show cross-layer constraints as labeled arcs or annotations:

- **C1: entity alignment** — a horizontal arc or dashed line connecting the three credential subjects below to the Applicant above, labeled "C1: aligned"
- **C2: trace consistency** — three vertical dashed arrows from each DCL Value down to its CSL counterpart, labeled "C2: trace"

These arcs span the gap between the two bands. They should be visually prominent — this gap IS the contribution.

### CSL Band Content

Three credential grouping boxes, arranged left-to-right:

**FamilyStatusCred** (left third):
- Outer box labeled "FamilyStatusCred"
- Inside: [CS_Applicant₁] → claim → [num_children₁]
- Italic subtitle: "Civil registry"

**PropertyCred** (center third):
- Outer box labeled "PropertyCred"
- Inside: [CS_Applicant₂] → claim → [property_area₁]
- Italic subtitle: "Land registry"

**IncomeCred** (right third):
- Outer box labeled "IncomeCred"
- Inside: [CS_Applicant₃] → claim → [monthly_income₁]
- Italic subtitle: "Employer"

A small "C3: non-empty ✓" annotation near each credential confirms structural well-formedness.

### CSL↔FSL Constraint Zone

Between the CSL and FSL bands, show governance-sourced cross-layer constraints:

- **C5: eIDAS format mandate** → arrow from IncomeCred downward, labeled "C5: eIDAS → SD-JWT-VC"
- **C6: GDPR predicate proof** → arrow from IncomeCred downward, labeled "C6: GDPR → predicate proof"
- **C7: W3C VCDM conformance** → arrow from IncomeCred downward, labeled "C7: W3C → VCDM conformance"

For FamilyStatusCred and PropertyCred: simple "C5 ✓" annotations (eIDAS satisfied by SD-JWT-VC).

The three C5/C6/C7 arrows converging on the Income column create the visual drama — three governance requirements pointing to the same credential, each demanding something different.

### FSL Band Content

**FamilyStatusCred format** (left):
- Rounded rectangle: "SD-JWT-VC"
- Small green check: "eIDAS ✓"
- Solid border (no issues)

**PropertyCred format** (center):
- Rounded rectangle: "SD-JWT-VC"
- Small green check: "eIDAS ✓"
- Solid border

**Between FamilyStatus and Property at FSL level:**
- Red dotted span across both, labeled "C9: cross-credential predicate gap"
- Small annotation: "C4 requires cross-credential ZKP — no format supports it"

**IncomeCred format — THE CONFLICT ZONE** (right):
- Dashed red border rectangle with light red fill
- Inside, two sub-boxes side by side:
  - Left sub-box: "SD-JWT-VC" with tags "eIDAS ✓" and "W3C ✓" but "pred ✗" (red)
  - Right sub-box: "AnonCreds" with tags "pred ✓" but "eIDAS ✗" (red) and "W3C ✗" (red)
- Below both: bold label "C8: UNSATISFIABLE" or "C8: governance conflict"
- The message: no single format satisfies all three requirements

### Right Output Column (3 items, stacked vertically)

**① CHECK**
- Circle with "1" or bold "①"
- "UNSAT"
- Subtitle: "under eIDAS ∧ GDPR ∧ W3C"
- A thin red leader line connects to the conflict zone in the FSL band

**② IDENTIFY**
- Circle with "2" or bold "②"
- "governance_conflict(IncomeCred)"
- "cross_cred_predicate_gap(area, children)"
- A thin red leader line connects to the conflict zone and to the cross-cred gap span

**③ GENERATE**
- Circle with "3" or bold "③"
- "SAT when eIDAS removed"
- "→ AnonCreds for IncomeCred"
- Subtitle: "2 valid configurations generated"

### Visual Integration Details

- The **left input column** items should vertically align with the layers they primarily feed: Metamodel ↔ DCL, Instance ↔ CSL, Governance ↔ FSL. Subtle arrows or flow lines connect them to the model.
- The **right output column** items should vertically align with the layer where their result manifests: CHECK ↔ overall model, IDENTIFY ↔ FSL conflict zone, GENERATE ↔ FSL resolution.
- **Leader lines** from the output column connect to specific elements in the model. These are thin, colored red, slightly transparent. They ground the diagnostic results in the model.
- The **constraint zones** (gaps between layers) should have slightly different visual treatment from the layer bands — no background fill, just the constraint arcs/labels on white space. This makes them read as "the space between layers where cross-layer analysis happens."

---

## SVG Technical Requirements

- Output as a single SVG file
- Use `viewBox="0 0 1200 380"` (or adjust height slightly for readability)
- All text as `<text>` elements with `font-family="system-ui, -apple-system, 'Segoe UI', sans-serif"`
- Use `<defs>` for reusable elements (arrowheads, hatching patterns, node shapes)
- Group elements logically with `<g>` and `id` attributes (e.g., `id="dcl-band"`, `id="csl-band"`, `id="conflict-zone"`)
- Use CSS classes for consistent styling where possible
- Ensure clean SVG — no unnecessary transforms, no pixel-coordinate text

## Quality Bar

This is for a top-tier conference (MODELS, ACM). The figure should look:
- **Polished** — consistent spacing, aligned elements, harmonious colors
- **Dense but readable** — every element earns its space, but nothing is cluttered
- **Self-contained** — a reviewer should understand the paper's argument from this figure + its caption alone
- **Professional** — comparable to figures in Nature or Science in terms of visual quality

## Caption (for reference — don't include in SVG)

> A housing subsidy credential scenario analyzed end-to-end. **(Left)** The designer provides metamodel definitions, a scenario instance, and governance constraints as inputs. **(Center)** The scenario modeled across three metamodel layers, separated by cross-layer constraint zones: domain facts at the Domain Concept Layer are grouped into credentials at the Credential Schema Layer, with format assignments at the Format-Specific Layer. Each layer is internally well-formed; the governance conflict on the income credential (C8) and the cross-credential predicate gap (C9) emerge only through cross-layer analysis. **(Right)** Refinery's three analysis modes: consistency checking reports the design unsatisfiable under joint governance; error identification locates the specific conflicts; model generation produces valid alternatives when one governance constraint is relaxed.
