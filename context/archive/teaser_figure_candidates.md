# Teaser Figure Design Candidates

**Date:** 2026-03-28/29
**Context:** Designing fig_teaser (submission blocker B2) for MODELS 2026 Foundations Track

---

## Candidate A: "Compatibility Landscape" (Heatmap)

Rows = credential formats (SD-JWT-VC, AnonCreds, JSON-LD, JWT-VC, mdoc). Columns = governance requirements (eIDAS, GDPR, W3C). Cells = green ✓ or red ✗. The "ALL THREE" column is entirely red — no format satisfies all governance sources simultaneously.

Three-layer metamodel as a compact sidebar explaining why each governance source imposes what it does. Below: Refinery modality strip (check/identify/generate).

**Strength:** Empty intersection is devastating — mathematical proof of impossibility, no domain knowledge needed.
**Weakness:** Three-layer metamodel subordinate to governance result. Only shows Headline 1. No running example.
**Best for:** Paper whose main contribution is the impossibility result itself.

---

## Candidate B: "Alluvial Rupture" (Sankey Flow)

Left-to-right flow through three layer stages. Wide colored bands = credentials flowing DCL → CSL → FSL → Governance Validation. First two credentials flow smoothly → "VALID." Third credential's band RUPTURES at FSL-to-Governance transition: splits into thin streams, each trying a different format, each hitting a dead end.

Cross-credential gap shown as dashed cross-connection between first two credential bands.

**Strength:** "Smooth, smooth, BREAK" rhythm creates narrative tension. Rare in MDE, common in Nature/Science — signals ambition.
**Weakness:** Complex to produce well. Three-layer structure shown as stages, not layers. MDE audience expects layers.
**Best for:** High visual impact, but risky if curves aren't beautiful.

---

## Candidate C: "Three Lenses"

Three translucent colored overlays of the same credential ecosystem, one per governance source (eIDAS blue, GDPR green, W3C purple). Each lens shows a clean, satisfiable design individually. Fourth view shows all three lenses overlaid — interference pattern at IncomeCred, bold ∅ UNSAT.

**Strength:** "Lens" metaphor IS the paper's thesis. Reader SEES each perspective being fine and combination failing.
**Weakness:** Four panels, individual lens panels mostly redundant. Three-layer structure invisible — lenses correspond to governance sources, not modeling layers.
**Best for:** Intuitive proof of the "invisible to single-layer" thesis.

---

## Candidate D: "Design Space Void"

Scatter-plot where axes = capability dimensions (format capability vs. governance compliance). Formats as points. Governance requirements define regions. The feasible region (all three overlapping) is EMPTY for Income's needs.

**Strength:** Reframes problem as structural gap in credential format ecosystem. Design space visualizations powerful in engineering.
**Weakness:** Very abstract. Three-layer metamodel invisible. Running example invisible. More "discussion" than "teaser."
**Best for:** Bold reframing, but too abstract for a teaser.

---

## Candidate E: "Exploded Sandwich" ← SELECTED

Three separated horizontal layer bands (DCL, CSL, FSL) with explicit inter-layer constraint zones in the gaps. Gaps carry labeled cross-layer constraints — the contribution gets its own visual territory. Left input column, right output column with three Refinery modalities.

C4 arc crosses the DCL boundary into the gap. Conflict zone at FSL on IncomeCred with SD-JWT-VC vs AnonCreds split. Cross-credential predicate gap span between FamilyStatus and Property at FSL.

**Strength:** Cross-layer constraints get dedicated visual space. Shows everything: layers, running example, constraints, conflict, three modalities. Left-to-right flow (Input → Model → Output).
**Weakness:** Dense. Needs careful spacing.
**Best for:** Foundations Track paper where the contribution is the metamodel and cross-layer constraints.

---

## Candidate F: "Coordinated Dashboard" (2×2 Grid)

Four coordinated views: (a) three-layer instance model, (b) governance compatibility matrix (heatmap), (c) Refinery pipeline, (d) results & resolution. Cross-referenced by numbered annotations.

**Strength:** Each view uses optimal encoding for its content. Compatibility matrix provides mathematical punchline.
**Weakness:** Four panels can feel stitched together. No clear left-to-right narrative. Reader must mentally integrate.
**Best for:** Multi-faceted contribution needing different visualization types.

---

## Candidate G: "Progressive Reveal"

Left-to-right flow where the model BUILDS progressively. Stage 1 (DCL alone): ✓ OK. Stage 2 (+CSL): ✓ OK. Stage 3 (+FSL+governance): ✗ CONFLICT. The conflict appears only when all layers combined.

**Strength:** "Invisible to single-layer" thesis becomes experiential — reader watches OK→OK→FAIL.
**Weakness:** Repeats elements three times (Applicant appears in every stage). Redundant space usage. Middle stages are padding.
**Best for:** Emphasizing the emergence of conflict through layer accumulation.

---

## Candidate H: "Wiring Diagram"

Three horizontal "buses" (layers). Elements hang off each bus. Cross-layer constraints as "wires" connecting across buses. Governance conflict = "short circuit" — incompatible wires connected to same node.

**Strength:** Constraints as wires immediately intuitive. "Short circuit" is powerful metaphor. Naturally wider than tall.
**Weakness:** Electrical engineering metaphor may feel foreign to MDE audience. Many crossing wires risk clutter.
**Best for:** Engineering-oriented audience comfortable with circuit schematics.

---

## Candidate I: "Integrated Schematic"

Single unified diagram: three layers as background zones, model fills center, ALL cross-layer constraints shown as labeled arcs, governance arrows from left margin, Refinery outputs in right margin. Everything in one coordinate system.

**Strength:** Maximum density, zero redundancy. Everything shown once in precise position. Self-contained — entire argument reconstructible from figure.
**Weakness:** Dense. Needs careful font sizing. Left margin text is long.
**Best for:** Maximum information density in a single unified visual.

---

## Candidate 3+6 Fusion (precursor to Exploded Sandwich)

Three-panel left-to-right: Inputs (left) → Three-layer instance (center) → Outputs (right). Evolved into the Exploded Sandwich by adding inter-layer constraint zones in the gaps between bands.

---

## ASCII Sketches from Design Session

### Candidate 1 / A — Venn Impossibility

```
           eIDAS ARF
          (format mandate)
             ╱    ╲
            ╱      ╲
  SD-JWT-VC╱   ∅    ╲ ???
           ╱          ╲
          ╱            ╲
GDPR ────────────────── W3C VCDM
(predicate proof) JSON-LD (data model)
               AnonCreds
```

### Candidate 2 / B — Layer Isolation Test

```
┌──── DCL alone ──── [Applicant]─has_ch─>[num_ch]
│                    [Applicant]─owns_p─>[prop_area]  area≥f(ch) ✓
│                    [Applicant]─earns──>[monthly_inc]           ✓ PASS
├────────────────────────────────────────────────────────────────────
│ CSL alone ──── [FamilyStatusCred] [PropertyCred] [IncomeCred]
│                subjects aligned ✓  traces valid ✓             ✓ PASS
├────────────────────────────────────────────────────────────────────
│ FSL alone ──── SD-JWT-VC: eIDAS ✓  SD-JWT-VC: eIDAS ✓  ???
│                (format assigned)   (format assigned)    ✓ PASS
╞════════════════════════════════════════════════════════════════════
│ MULTI-LAYER ── [FamilyStatus ✓]   [Property ✓]   [Income ✗✗]
│ (Refinery)     ──── cross-cred predicate gap ──── gov. conflict
│                eIDAS∧GDPR∧W3C → UNSAT                  ✗✗ FAIL
└────────────────────────────────────────────────────────────────────
```

### Candidate 3 — Pipeline (Input → Tool → Output)

```
┌──────────────┐     ┌───────────────┐     ┌──────────────────┐
│(a) Author     │     │(b) Refinery    │     │(c) Results        │
│               │     │               │     │                   │
│ ┌DCL────────┐│     │ Metamodel ──┐ │     │ ✓/✗ Consistency   │
│ │Applicant  ││     │ Instance ──→│R│     │   → UNSAT         │
│ │ props→vals││     │ Governance──┘ │     │                   │
│ ├CSL────────┤│ ──> │               │ ──> │ ⚠ Error ID        │
│ │3 creds    ││     │   ┌─────┐    │     │   → gov_conflict  │
│ │trace+align││     │   │check│    │     │                   │
│ ├FSL────────┤│     │   │iden.│    │     │ ⊞ Generate         │
│ │formats    ││     │   │gen. │    │     │   → valid instance │
│ │governance ││     │   └─────┘    │     │     (eIDAS removed)│
│ └───────────┘│     │               │     │                   │
└──────────────┘     └───────────────┘     └──────────────────┘
```

### Candidate 5 — Two Worlds

```
┌──────────── Current practice ──────────┬──── Multi-layer analysis (ours) ─────┐
│                                         │                                       │
│  FamilyStatus  Property  Income         │  DCL  [Applicant → props → values]   │
│  ┌──────┐     ┌──────┐  ┌──────┐       │       area≥f(ch) constraint           │
│  │claims│     │claims│  │claims│        │  CSL  [3 creds, aligned subjects]     │
│  │SD-JWT│     │SD-JWT│  │SD-JWT│        │       trace links to DCL              │
│  │  ✓   │     │  ✓   │  │  ✓   │       │  FSL  [SD-JWT ✓] [SD-JWT ✓] [??? ✗]  │
│  └──────┘     └──────┘  └──────┘       │       governance_conflict(Income)     │
│                                         │       cross_cred_gap(area,children)  │
│  JSON Schema ✓  Format valid ✓          │                                       │
│  "All checks pass"                      │  Refinery: check→UNSAT, identify→    │
│                                         │  gov_conflict, generate→valid w/o     │
│                                         │  eIDAS                                │
└─────────────────────────────────────────┴───────────────────────────────────────┘
```

### Candidate 6 — Annotated Instance with Diagnostic Margin

```
┌───────────────────────────────────────────────┬─────────────────┐
│                                               │  ① CHECK        │
│   DCL zone (blue-gray)                        │  UNSAT under    │
│   [Applicant]──has_ch──>[num_ch]              │  eIDAS∧GDPR∧W3C│
│          │──owns_p──>[prop_area]              │                 │
│          │──earns───>[monthly_inc]            │  ② IDENTIFY     │
│          ····area≥f(ch)····                   │  governance_    │
│   CSL zone (teal)                             │  conflict(      │
│   ┌FamilyStatus┐ ┌Property──┐ ┌Income────┐   │  IncomeCred)    │
│   │CS_App₁     │ │CS_App₂   │ │CS_App₃   │  │  cross_cred_gap│
│   │claim→numch₁│ │claim→area│ │claim→inc₁ │  │  (area,ch)     │
│   └──┬─────────┘ └──┬──────┘ └──┬────────┘  │                 │
│      │aligned────────│aligned────│            │  ③ GENERATE     │
│   FSL zone (amber)                            │  SAT when eIDAS │
│   [SD-JWT-VC ✓]  [SD-JWT-VC ✓]  [??? ✗✗]    │  removed →      │
│    eIDAS ✓        eIDAS ✓    ╔══conflict══╗  │  AnonCreds for  │
│                              ║eIDAS∧GDPR  ║←─│  IncomeCred     │
│                              ║∧W3C: UNSAT ║  │                 │
│    ·········cross-cred gap···║════════════╝  │                 │
└───────────────────────────────────────────────┴─────────────────┘
```

### Candidate 4 / D — Governance Triangle

```
                    eIDAS ARF
                   (format mandate)
                      ╱    ╲
                     ╱      ╲
           SD-JWT-VC╱   ∅    ╲ ???
            (eIDAS+W3C)       ╲
                   ╱            ╲
                  ╱              ╲
    GDPR ─────────────────────── W3C VCDM
   (predicate proof)             (data model)
         nothing        nothing
     Three vertices = three governance sources
     Edges = format(s) satisfying each pair
     Center = triple conjunction → EMPTY
```

### Candidate B — Alluvial Rupture (Sankey Flow)

```
Domain Facts          Credentials           Formats            Governance
                                                               ┌─eIDAS─✓
num_children ═══╗  ╔═FamilyStatusCred═══╗  ╔═SD-JWT-VC══════╗ ├─GDPR──✓
                ╠══╣                    ╠══╣    (smooth)     ╠═╡─W3C───✓
                ╝  ╚════════════════════╝  ╚═════════════════╝ └───────✓ VALID

                                                               ┌─eIDAS─✓
property_area═══╗  ╔═PropertyCred═══════╗  ╔═SD-JWT-VC══════╗ ├─GDPR──✓
                ╠══╣                    ╠══╣    (smooth)     ╠═╡─W3C───✓
                ╝  ╚════════════════════╝  ╚═════════════════╝ └───────✓ VALID

                                                               ┌─eIDAS─→SD-JWT─→✗pred
monthly_income══╗  ╔═IncomeCred═════════╗  ╔═ ??? ═══════X  ╠═├─GDPR──→Anon───→✗eIDAS
                ╠══╣                    ╠══╣   RUPTURE    ║  ║ └─W3C───→JSON-LD→✗pred
                ╝  ╚════════════════════╝  ╚══════════════╝  ╝     ✗ IMPOSSIBLE
```

### Candidate D — Design Space Void

```
  Governance       ┌──────────────────────────────────────┐
  compliance  3 ───│·  ·  ·  ·  ·  ·  ·  ·  ·  ·  ·  · │
  (# sources      │                                      │
  satisfied)  2 ───│·  ·  SD-JWT ·  ·  ·  ·  ·  ·  ·  · │
                   │      (eIDAS+W3C)     VOID           │
              1 ───│·  ·  ·  ·  AnonCreds ·  ·  ·  ·  · │
                   │           (GDPR only)                │
              0 ───│·  JWT-VC  ·  mdoc  ·  JSON-LD  ·  · │
                   └──────────────────────────────────────┘
                   sel.disc  pred.proof  cross-cred ZKP
                          Format capability →

  Income needs: governance=3, capability=pred.proof
  That region is EMPTY — no deployed format occupies it.
```

### Candidate E — Exploded Sandwich (standalone)

```
┌─INPUT COL─┐  ┌─DCL BAND──────────────────────────────────┐  ┌─OUTPUT COL──┐
│            │  │                                            │  │             │
│ Metamodel  │  │  [Applicant]─has_ch→[num_ch]              │  │ ① CHECK     │
│ definitions│  │      ├─owns_p→[prop_area]···area≥f(ch)··  │  │ UNSAT       │
│            │  │      └─earns→[monthly_inc]                │  │             │
│            │  └────────────────────────────────────────────┘  │             │
│            │     ↕ CONSTRAINT ZONE: C1, C2 (trace, align)    │             │
│            │  ┌─CSL BAND──────────────────────────────────┐  │             │
│ Scenario   │  │ ┌FamilyStat──┐ ┌Property──┐ ┌Income────┐ │  │ ② IDENTIFY  │
│ instance   │  │ │CS_App₁     │ │CS_App₂   │ │CS_App₃   │ │  │ gov_conflict│
│ (CSOK)     │  │ │claim→numch │ │claim→area│ │claim→inc │ │  │ cross_cred  │
│            │  │ └────────────┘ └──────────┘ └──────────┘ │  │ _gap        │
│            │  └────────────────────────────────────────────┘  │             │
│ Governance │     ↕ CONSTRAINT ZONE: C5, C6, C7 (governance)  │             │
│ constraints│  ┌─FSL BAND──────────────────────────────────┐  │ ③ GENERATE  │
│ (eIDAS,    │  │ [SD-JWT ✓]  [SD-JWT ✓]  ╔══CONFLICT═══╗  │  │ SAT w/o     │
│  GDPR,     │  │  eIDAS✓      eIDAS✓     ║SD-JWT│Anon  ║  │  │ eIDAS →     │
│  W3C VCDM) │  │  ··cross-cred gap (✗)·· ║eIDAS✓│pred✓ ║  │  │ AnonCreds   │
│            │  │                          ║pred✗ │W3C✗  ║  │  │             │
│            │  │                          ╚═════════════╝  │  │             │
└────────────┘  └────────────────────────────────────────────┘  └─────────────┘
```

### Candidate F — Coordinated Dashboard (2×2)

```
┌───────────────────────────────────────┬────────────────────────────────────┐
│  (a) Three-Layer Instance Model       │  (b) Governance Compatibility      │
│                                       │                                    │
│  DCL: [Applicant]→props→values        │      eIDAS  GDPR  W3C   ALL      │
│       area≥f(ch) constraint           │ SDJWT  ✓     ✗     ✓    ✗       │
│  CSL: [FamStat] [Property] [Income]   │ Anon   ✗     ✓     ✗    ✗       │
│       trace ↕ aligned ↔               │ JSONLD ✗     ✗     ✓    ✗       │
│  FSL: [SDJWT✓] [SDJWT✓] [???]       │ JWTVC  ✓     ✗     ✓    ✗       │
│       C1–C9 constraint labels         │ mdoc   ✗     ✗     ✗    ✗       │
│                                       │                                    │
│  Cross-layer constraints labeled      │  "ALL" column entirely red:        │
│  at layer boundaries                  │  no format satisfies all three     │
├───────────────────────────────────────┼────────────────────────────────────┤
│  (c) Refinery Analysis Pipeline       │  (d) Results & Resolution          │
│                                       │                                    │
│  INPUTS:            REFINERY:         │  ① CHECK: UNSAT                   │
│  ┌Metamodel──┐     ┌────────┐        │  ② IDENTIFY:                      │
│  │DCL+CSL+FSL│────→│ check  │        │     governance_conflict(Income)   │
│  ├Instance───┤     │ ident. │        │     cross_cred_predicate_gap     │
│  │CSOK scenario────→│ gen.   │        │  ③ GENERATE:                      │
│  ├Governance─┤     └────────┘        │     SAT when eIDAS removed       │
│  │eIDAS+GDPR │                       │     → AnonCreds for IncomeCred   │
│  │+W3C VCDM  │                       │     [Refinery SVG thumbnail]     │
│  └───────────┘                       │                                    │
└───────────────────────────────────────┴────────────────────────────────────┘
```

### Candidate G — Progressive Reveal

```
┌──────────┬──────────────┬──────────────────┬───────────────────┬────────────┐
│ INPUTS   │ Stage 1: DCL │ Stage 2: +CSL    │ Stage 3: +FSL     │ DIAGNOSIS  │
│          │              │                  │ +Governance        │            │
│ Metamodel│ [Applicant]  │ [Applicant]      │ [Applicant]       │ ① CHECK    │
│ defns    │  ├→[num_ch]  │  ├→[num_ch]      │  ├→[num_ch]       │ UNSAT      │
│          │  ├→[prop_ar] │  ├→[prop_ar]     │  ├→[prop_ar]      │            │
│ Instance │  └→[mon_inc] │  └→[mon_inc]     │  └→[mon_inc]      │ ② IDENTIFY │
│ (CSOK)   │              │  ↕C1,C2          │  ↕C1,C2           │ gov_       │
│          │  area≥f(ch)  │ [FamStat]        │ [FamStat]         │ conflict   │
│ Govern-  │              │ [Property]       │ [Property]        │ cross_cred │
│ ance     │              │ [Income]         │ [Income]          │ _gap       │
│ (eIDAS,  │              │  aligned ↔       │  aligned ↔        │            │
│  GDPR,   │              │                  │  ↕C5,C6,C7        │ ③ GENERATE │
│  W3C)    │    ✓ OK      │     ✓ OK         │ [SDJWT✓][SDJWT✓] │ SAT w/o    │
│          │              │                  │ [CONFLICT ✗✗✗]    │ eIDAS      │
│          │              │                  │  cross-cred gap ✗ │            │
└──────────┴──────────────┴──────────────────┴───────────────────┴────────────┘
                   ✓                 ✓              ✗ ← conflict appears HERE
```

### Candidate H — Wiring Diagram

```
┌─INPUTS────┐                                                      ┌─OUTPUTS────┐
│            │                                                      │            │
│ Metamodel  │  DCL BUS ═══[Applicant]═══[num_ch]═══[prop_ar]═══[mon_inc]═══   │ ① CHECK  │
│            │              │              │  ···area≥f(ch)···  │               │ UNSAT    │
│            │              │C2            │C2                  │C2             │          │
│ Instance   │  CSL BUS ═══[FamStat]══════[Property]═══════════[Income]═══     │ ② IDENT  │
│ (CSOK)     │         C1:aligned──────C1:aligned──────        │               │ gov_conf │
│            │              │              │                     │               │ cred_gap │
│            │              │C5            │C5                  │C5,C6,C7       │          │
│ Governance │  FSL BUS ═══[SD-JWT ✓]═════[SD-JWT ✓]═══════╔══[CONFLICT]══╗   │ ③ GENER  │
│ (eIDAS,    │                    ···cross-cred gap (✗)···  ║ ⚡SHORT ⚡  ║   │ SAT w/o  │
│  GDPR,     │              eIDAS→──────────────────────────║→SD-JWT      ║   │ eIDAS    │
│  W3C)      │              GDPR→───────────────────────────║→AnonCreds   ║   │          │
│            │              W3C→────────────────────────────║→JSON-LD     ║   │          │
│            │                                              ╚═════════════╝   │          │
└────────────┘                                                      └────────────┘
```

### Candidate I — Integrated Schematic

```
┌────┬─────────────────────────────────────────────────────────────┬──────────┐
│    │        FamilyStatus         Property           Income       │          │
│    │                                                             │          │
│    │   ┌──[Applicant]──────────────────────────────────┐        │          │
│ M  │   │     │              │              │           │        │ ① CHECK  │
│ e  │ D │     │has_ch        │owns_p        │earns      │        │ UNSAT    │
│ t  │ C │     ↓              ↓              ↓           │        │          │
│ a  │ L │  [num_ch]    [prop_area]    [monthly_inc]     │        │          │
│ m  │   │     │  ·····area≥f(ch)·····C4  │             │        │          │
│ o  │   └─────│──────────────│──────────────│───────────┘        │          │
│ d  │     C2:trace↓      C2:trace↓      C2:trace↓               │          │
│ e  │   ┌─────│──────────────│──────────────│───────────┐        │ ② IDENT  │
│ l  │   │  [CS_App₁]    [CS_App₂]     [CS_App₃]       │        │ gov_     │
│    │ C │     │              │              │           │        │ conflict │
│ +  │ S │  claim→         claim→         claim→         │        │ (Income) │
│    │ L │  [numch₁]      [area₁]       [inc₁]         │        │          │
│ I  │   │  C1:aligned────C1:aligned─────┘               │        │ cross_   │
│ n  │   │  C3:non-empty✓  C3✓            C3✓           │        │ cred_gap │
│ s  │   └─────│──────────────│──────────────│───────────┘        │          │
│ t  │     C5,C7↓          C5,C7↓        C5,C6,C7↓               │          │
│ a  │   ┌─────│──────────────│──────────────│───────────┐        │ ③ GENER  │
│ n  │   │  [SD-JWT-VC]   [SD-JWT-VC]   ╔═CONFLICT════╗ │        │ SAT w/o  │
│ c  │ F │   eIDAS✓         eIDAS✓      ║SD-JWT│Anon  ║ │        │ eIDAS →  │
│ e  │ S │                               ║eIDAS✓│pred✓ ║ │        │ Anon for │
│    │ L │  ·····cross-cred gap (✗)····  ║pred✗ │W3C✗  ║ │        │ Income   │
│ +  │   │  C4→C9: no format supports   ║W3C✓  │eIDAS✗║ │        │          │
│    │   │       cross-cred ZKP          ╚══════════════╝ │        │ [Refinery│
│ G  │   └───────────────────────────────────────────────┘        │  SVG]    │
│ o  │                                                             │          │
│ v  │   eIDAS─C5→─────────────────────────────→conflict zone     │          │
│    │   GDPR──C6→─────────────────────────────→conflict zone     │          │
│    │   W3C───C7→─────────────────────────────→conflict zone     │          │
└────┴─────────────────────────────────────────────────────────────┴──────────┘
```

### Selected: Fused 3+6 / Exploded Sandwich (final layout)

```
┌───────────┬────┬──────────────────────────────────────────────┬──────────────┐
│           │    │ FamilyStatus       Property        Income     │              │
│ Metamodel │    │                                               │              │
│ (DCL+CSL  │ D  │ [Applicant]─has_ch─>[num_ch]                │ ① CHECK      │
│  +FSL     │ C  │      ├──owns_p──>[prop_area]                │ UNSAT under  │
│  defns)   │ L  │      └──earns──>[monthly_inc]               │ eIDAS∧GDPR   │
│           │    │      ·····area≥f(ch)·····                    │ ∧W3C         │
│           │    │          C4: cross-property                   │              │
│───────────│────┤──────────────────────────────────────────────│──────────────│
│           │    │                    ┆C2:trace   ┆C2:trace     │              │
│ Scenario  │    │ ┌FamilyStat──┐ ┌Property──┐  ┌Income─────┐  │ ② IDENTIFY   │
│ instance  │ C  │ │CS_App₁    │ │CS_App₂   │  │CS_App₃    │  │ governance_  │
│ (housing  │ S  │ │claim→num  │ │claim→area │  │claim→inc  │  │ conflict     │
│  subsidy) │ L  │ └───────────┘ └──────────┘  └───────────┘  │ (IncomeCred) │
│           │    │  C1:aligned─────C1:aligned──────            │ cross_cred_  │
│           │    │  C3:non-empty ✓  C3:non-empty ✓  C3 ✓  ←───│ predicate_gap│
│───────────│────┤──────────────────────────────────────────────│──────────────│
│           │    │                                              │              │
│ Governance│    │ [SD-JWT-VC ✓]   [SD-JWT-VC ✓]  ╔═CONFLICT══╗│ ③ GENERATE   │
│ constraints│F  │  eIDAS ✓         eIDAS ✓       ║           ║│ SAT when     │
│           │ S  │                                 ║ C5:eIDAS──║│ eIDAS removed│
│ ┌eIDAS───┐│ L  │  ·····cross-cred gap (✗)····  ║──→SD-JWT  ║│ → AnonCreds  │
│ │C5:fmt  ││    │       C4+C9: no format         ║ C6:GDPR──║│   for Income │
│ ├GDPR────┤│    │       supports cross-cred      ║──→Anon   ║│              │
│ │C6:pred ││    │       ZKP evaluation            ║ C7:W3C──║│ [Refinery    │
│ ├W3C─────┤│    │                                 ║──→???    ║│  SVG here]   │
│ │C7:vcdm ││    │                                 ║ ✗ UNSAT  ║│              │
│ └────────┘│    │                                 ╚══════════╝│              │
└───────────┴────┴──────────────────────────────────────────────┴──────────────┘
     INPUT      │           MODEL (the contribution)            │   OUTPUT
                │  cross-layer constraints labeled C1–C9        │
                └───────────────────────────────────────────────┘
```

**The "aha" element — governance flow convergence:**

In the FSL band, three governance constraint arrows (C5, C6, C7) enter the conflict zone from the left column, each color-coded by source (eIDAS, GDPR, W3C VCDM). Each arrow points to a different format requirement. The arrows CONVERGE on the Income credential where they meet at a single point — and no format sits at that intersection.

**Cross-layer constraints explicitly labeled at layer boundaries:**
- Between DCL and CSL: C1 (entity alignment arcs), C2 (trace arrows), C3 (non-empty checks)
- Between CSL and FSL: implicit through format assignment
- Within FSL: C5, C6, C7 (governance), C8 (conflict = their conjunction), C9 (predicate gap)
- Spanning DCL→FSL: C4 (domain constraint that surfaces as cross-cred gap)

---

## Selection Rationale

Selected **Candidate E (Exploded Sandwich)** because:
1. Shows the complete contribution (metamodel + tool + results)
2. Cross-layer constraints — the core novelty — get dedicated visual space in the inter-layer gaps
3. All three Refinery modalities visible (check/identify/generate)
4. Both headline results (governance conflict + cross-credential gap) highlighted
5. Left-to-right narrative flow (Input → Model → Output)
6. Appropriate for Foundations Track where the contribution is the formalization
