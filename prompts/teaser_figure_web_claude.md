# Task: Produce a TikZ teaser figure for an academic paper

## What this is

I need you to produce a **publication-quality TikZ figure** for an ACM SIGCONF paper about multi-layer metamodeling for verifiable credential ecosystems. This is a full-width teaser figure (`\begin{figure*}`) that appears at the top of page 1. It must be wider than tall (~18cm × ~6cm).

## The figure's job

Communicate the paper's complete contribution in one visual: **what goes in** (left), **what the model looks like** (center), and **what the tool finds** (right). The reader should understand the paper's argument from this figure + caption alone.

## Starting point

Here is a working TikZ draft that compiles. This is just a suggestion; you may deviate from it or completely leave it behind.

```latex
\documentclass[border=5pt]{standalone}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{tikz}
\usetikzlibrary{positioning, arrows.meta, fit, backgrounds, calc, decorations.pathreplacing, patterns}

% Colors per layer
\definecolor{dclbg}{HTML}{dbe4ff}
\definecolor{dclstroke}{HTML}{4a9eed}
\definecolor{cslbg}{HTML}{d3f9d8}
\definecolor{cslstroke}{HTML}{22c55e}
\definecolor{fslbg}{HTML}{fff3bf}
\definecolor{fslstroke}{HTML}{d4a843}
\definecolor{conflictbg}{HTML}{ffc9c9}
\definecolor{conflictstroke}{HTML}{ef4444}
\definecolor{okgreen}{HTML}{b2f2bb}
\definecolor{inputblue}{HTML}{a5d8ff}
\definecolor{inputgreen}{HTML}{c3fae8}
\definecolor{inputamber}{HTML}{ffd8a8}
\definecolor{govpurple}{HTML}{8b5cf6}
\definecolor{darkgray}{HTML}{555555}

\tikzset{
  % Node styles
  dclnode/.style={draw=dclstroke, fill=dclbg, rounded corners=4pt, font=\small\sffamily, minimum height=6mm, inner sep=3pt},
  cslnode/.style={draw=cslstroke, fill=cslbg, rounded corners=4pt, font=\small\sffamily, minimum height=12mm, inner sep=4pt, text width=25mm, align=center},
  fslok/.style={draw=cslstroke, fill=okgreen, rounded corners=4pt, font=\small\sffamily, minimum height=10mm, inner sep=3pt, align=center},
  fslsub/.style={draw, rounded corners=3pt, fill=white, font=\scriptsize\ttfamily, inner sep=3pt, align=left, minimum width=18mm},
  % Input/output boxes
  inputbox/.style={rounded corners=6pt, font=\small\sffamily, minimum width=28mm, inner sep=4pt, align=center, text width=26mm},
  outputbox/.style={rounded corners=6pt, font=\small\sffamily, minimum width=38mm, inner sep=4pt, align=center, text width=36mm},
  % Arrows
  trace/.style={-{Stealth[length=3pt]}, dashed, gray, thin},
  constraint/.style={dashed, conflictstroke, thick},
  govarrow/.style={-{Stealth[length=4pt]}, thick},
  bridge/.style={-{Stealth[length=3pt]}, thick},
}

\begin{document}
\begin{tikzpicture}[x=1mm, y=1mm]

% ============================================================
% BACKGROUND ZONES (three layer bands)
% ============================================================
\fill[dclbg, opacity=0.35, rounded corners=3pt] (32,52) rectangle (140,82);
\fill[cslbg, opacity=0.35, rounded corners=3pt] (32,18) rectangle (140,50);
\fill[fslbg, opacity=0.35, rounded corners=3pt] (32,-22) rectangle (140,16);

% Layer labels
\node[font=\small\sffamily\bfseries, color=dclstroke] at (35,67) {DCL};
\node[font=\small\sffamily\bfseries, color=cslstroke] at (35,34) {CSL};
\node[font=\small\sffamily\bfseries, color=fslstroke!80!black] at (35,0) {FSL};

% Column headers
\node[font=\scriptsize\sffamily, color=darkgray] at (58,80) {FamilyStatus};
\node[font=\scriptsize\sffamily, color=darkgray] at (86,80) {Property};
\node[font=\scriptsize\sffamily, color=darkgray] at (118,80) {Income};

% ============================================================
% INPUT COLUMN (left)
% ============================================================
\node[inputbox, draw=dclstroke, fill=inputblue] (inmeta) at (14,67) {Metamodel\\definitions};
\node[inputbox, draw=cslstroke, fill=inputgreen] (ininst) at (14,34) {Scenario\\instance\\{\scriptsize(housing subsidy)}};
\node[inputbox, draw=fslstroke, fill=inputamber, text width=26mm] (ingov) at (14,-2) {Governance\\constraints\\[1mm]{\scriptsize C5: eIDAS}\\{\scriptsize C6: GDPR}\\{\scriptsize C7: W3C}};

% Arrows from inputs to model zones
\draw[bridge, dclstroke] (inmeta.east) -- ++(3,0);
\draw[bridge, cslstroke] (ininst.east) -- ++(3,0);
\draw[bridge, fslstroke] (ingov.east) -- ++(3,0);

% ============================================================
% DCL CONTENT
% ============================================================
\node[dclnode, minimum width=22mm] (app) at (78,74) {Applicant};

\node[dclnode] (numch) at (55,60) {\scriptsize num\_children};
\node[dclnode] (proparea) at (86,60) {\scriptsize property\_area};
\node[dclnode] (moninc) at (120,60) {\scriptsize monthly\_income};

\draw[-{Stealth[length=3pt]}] (app.south west) -- node[left, font=\tiny, color=darkgray, pos=0.4] {has\_ch} (numch.north);
\draw[-{Stealth[length=3pt]}] (app.south) -- node[right, font=\tiny, color=darkgray, pos=0.4] {owns\_p} (proparea.north);
\draw[-{Stealth[length=3pt]}] (app.south east) -- node[right, font=\tiny, color=darkgray, pos=0.3] {earns} (moninc.north);

% C4 constraint arc
\draw[constraint, decoration={brace, mirror, amplitude=3pt}, decorate]
  (numch.south) -- (proparea.south)
  node[midway, below=3pt, font=\tiny, color=conflictstroke] {C4: area $\geq$ f(ch)};

% ============================================================
% CSL CONTENT
% ============================================================
\node[cslnode] (cfam) at (55,36) {\scriptsize FamilyStatusCred\\[-0.5mm]\tiny CS\_App$_1$\\claim$\to$numch$_1$};
\node[cslnode] (cprop) at (86,36) {\scriptsize PropertyCred\\[-0.5mm]\tiny CS\_App$_2$\\claim$\to$area$_1$};
\node[cslnode] (cinc) at (120,36) {\scriptsize IncomeCred\\[-0.5mm]\tiny CS\_App$_3$\\claim$\to$inc$_1$};

% C2: trace arrows
\draw[trace] (numch.south) -- (cfam.north) node[midway, left, font=\tiny, color=gray] {C2};
\draw[trace] (proparea.south) -- (cprop.north) node[midway, left, font=\tiny, color=gray] {C2};
\draw[trace] (moninc.south) -- (cinc.north) node[midway, left, font=\tiny, color=gray] {C2};

% C1: entity alignment arc
\draw[dashed, cslstroke, thick]
  (cfam.south) -- ++(0,-2) -| (cprop.south)
  node[midway, below=0pt, font=\tiny, color=cslstroke] {};
\draw[dashed, cslstroke, thick]
  (cprop.south) -- ++(0,-2) -| (cinc.south);
\node[font=\tiny, color=cslstroke] at (86,22) {C1: entity alignment};

% C3: non-empty markers
\node[font=\tiny, color=cslstroke] at (55,20) {C3 $\checkmark$};
\node[font=\tiny, color=cslstroke] at (86,20) {C3 $\checkmark$};
\node[font=\tiny, color=cslstroke] at (120,20) {C3 $\checkmark$};

% ============================================================
% FSL CONTENT
% ============================================================

% OK format boxes
\node[fslok] (sdjwt1) at (55,8) {SD-JWT-VC\\[-0.5mm]{\tiny eIDAS $\checkmark$}};
\node[fslok] (sdjwt2) at (86,8) {SD-JWT-VC\\[-0.5mm]{\tiny eIDAS $\checkmark$}};

% ============================================================
% CONFLICT ZONE
% ============================================================
\draw[conflictstroke, very thick, dashed, fill=conflictbg, rounded corners=5pt]
  (104,-20) rectangle (137,14);

\node[font=\scriptsize\sffamily\bfseries, color=conflictstroke] at (120.5,12) {GOVERNANCE CONFLICT};

% Two sub-boxes showing the dilemma
\node[fslsub, draw=dclstroke] (sub1) at (112,3) {SD-JWT-VC\\eIDAS: \textbf{ok}\\pred:\;\; \textbf{NO}\\W3C:\;\; \textbf{ok}};
\node[fslsub, draw=govpurple] (sub2) at (130,3) {AnonCreds\\eIDAS: \textbf{NO}\\pred:\;\; \textbf{ok}\\W3C:\;\; \textbf{NO}};

\node[font=\scriptsize\sffamily, color=conflictstroke] at (121,-3) {vs.};

% UNSAT label
\node[font=\small\sffamily\bfseries, color=conflictstroke] at (120.5,-14) {C5$\wedge$C6$\wedge$C7 $\Rightarrow$ UNSAT};

% Governance convergence arrows (C5, C6, C7 entering conflict zone)
\draw[govarrow, dclstroke] (101,8) -- (104,8) node[midway, above, font=\tiny] {C5};
\draw[govarrow, orange] (101,2) -- (104,2) node[midway, above, font=\tiny] {C6};
\draw[govarrow, govpurple] (101,-4) -- (104,-4) node[midway, above, font=\tiny] {C7};

% C9: cross-credential predicate gap
\draw[constraint, decoration={brace, mirror, amplitude=4pt}, decorate]
  (sdjwt1.south) ++(0,-1) -- (sdjwt2.south |- 0,-1)
  node[midway, below=4pt, font=\tiny, color=conflictstroke, text width=35mm, align=center]
  {C9: cross-cred gap\\no format supports\\cross-credential ZKP};

% ============================================================
% OUTPUT COLUMN (right)
% ============================================================
\node[outputbox, draw=conflictstroke, fill=conflictbg] (ochk) at (156,67)
  {\textbf{(1) CHECK}\\[1mm]UNSAT under\\eIDAS $\wedge$ GDPR $\wedge$ W3C};

\node[outputbox, draw=conflictstroke, fill=conflictbg] (oid) at (156,36)
  {\textbf{(2) IDENTIFY}\\[1mm]{\small\texttt{governance\_conflict}}\\{\small\texttt{cross\_cred\_gap}}};

\node[outputbox, draw=cslstroke, fill=okgreen] (ogen) at (156,8)
  {\textbf{(3) GENERATE}\\[1mm]SAT when eIDAS\\removed $\to$ AnonCreds};

% Refinery SVG placeholder
\node[outputbox, draw=gray, dashed, fill=black!5, text width=36mm, minimum height=14mm] (svgph) at (156,-12)
  {{\tiny [Refinery SVG: concrete.svg]}\\[-0.5mm]{\tiny generated valid instance}};

% Leader arrows from model to output
\draw[bridge, conflictstroke] (140,67) -- (ochk.west);
\draw[bridge, conflictstroke] (140,36) -- (oid.west);
\draw[bridge, cslstroke] (140,4) -- (ogen.west);

% ============================================================
% BOTTOM LABELS
% ============================================================
\node[font=\small\sffamily, color=darkgray] at (14,-26) {INPUT};
\node[font=\small\sffamily, color=darkgray] at (86,-26) {MODEL};
\node[font=\small\sffamily, color=darkgray] at (156,-26) {OUTPUT};

\end{tikzpicture}
\end{document}
```

## What the figure shows (the domain story)

This figure depicts a **housing subsidy credential scenario** across three metamodel layers. Three independent government authorities issue credentials for a subsidy application:

- **Civil registry** → FamilyStatusCred (number of children)
- **Land registry** → PropertyCred (floor area of property)
- **Employer** → IncomeCred (monthly income)

The figure reads **left → right**: INPUT → MODEL → OUTPUT.

### Left column: INPUT (what the designer provides to the Refinery tool)

Three input boxes, each color-matched and vertically aligned with the model layer it feeds:

1. **Metamodel definitions** (blue, aligned with DCL) — the metaclass definitions for all three layers
2. **Scenario instance** (teal, aligned with CSL) — the specific housing subsidy scenario
3. **Governance constraints** (amber, aligned with FSL) — three independent governance sources:
   - C5: eIDAS ARF (EU format mandate — requires SD-JWT-VC)
   - C6: GDPR Art. 5(1)(c) (data minimization — requires predicate proof capability)
   - C7: W3C VCDM 2.0 (data model conformance)

### Center: MODEL (the three-layer instance — the paper's core contribution)

Three horizontal layer bands with a colored background each:

**DCL (Domain Concept Layer)** — blue-gray band at top:

- One Subject node: `Applicant`
- Three Value nodes: `num_children`, `property_area`, `monthly_income`
- Three property edges fan from Applicant down to the values (labeled `has_children`, `owns_property`, `earns`)
- A red dashed constraint brace between `num_children` and `property_area` labeled **C4: area ≥ f(ch)** — this is the cross-property domain constraint

**CSL (Credential Schema Layer)** — teal band in middle:

- Three credential boxes side by side: `FamilyStatusCred`, `PropertyCred`, `IncomeCred`
- Each shows: credential name, credential subject (CS_App₁, CS_App₂, CS_App₃), and a claim mapping
- **C2** trace arrows (dashed gray) connect DCL values down to their CSL credentials
- **C1: entity alignment** — a dashed teal arc along the bottom connecting all three credential subjects (they all trace to the same Applicant)
- **C3** non-empty check marks (✓) under each credential

**FSL (Format-Specific Layer)** — amber band at bottom:

- Two green "OK" boxes under FamilyStatus and Property: `SD-JWT-VC / eIDAS ✓`
- A large **CONFLICT ZONE** (red dashed border, light red fill) under Income containing:
  - Title: "GOVERNANCE CONFLICT"
  - Two white sub-boxes side by side showing the format dilemma:
    - **SD-JWT-VC** (blue border): eIDAS ok, predicate proof NO, W3C ok
    - **AnonCreds** (purple border): eIDAS NO, predicate proof ok, W3C NO
  - "vs." between them
  - **C5 ∧ C6 ∧ C7 ⇒ UNSAT** at the bottom — no format satisfies all three
  - Three color-coded convergence arrows (C5 blue, C6 orange, C7 purple) entering the conflict zone from the left
- A red dashed brace **C9: cross-cred gap** spanning below the two green SD-JWT-VC boxes, labeled "no format supports cross-credential ZKP"

### Right column: OUTPUT (Refinery's three analysis modes)

Three result boxes, vertically aligned with the model layers:

1. **(1) CHECK** (red) — UNSAT under eIDAS ∧ GDPR ∧ W3C — aligned with DCL level
2. **(2) IDENTIFY** (red) — `governance_conflict`, `cross_cred_gap` — aligned with CSL level
3. **(3) GENERATE** (green) — SAT when eIDAS removed → AnonCreds — aligned with FSL level
4. A dashed placeholder for **Refinery SVG output** (concrete.svg showing the generated valid instance)

Leader arrows connect the model zone to each output box.

### Bottom labels

**INPUT** / **MODEL** / **OUTPUT** centered under each column.

## Design requirements

1. **Wider than tall** — landscape orientation, ~3:1 aspect ratio
2. **Clean lines** — no hand-drawn style, sharp edges, consistent stroke widths
3. **Color palette** — must work in grayscale too (conflict zone uses dashed borders, not just red fill)
4. **The conflict zone is the visual climax** — it should be the most visually prominent element. The rest of the figure is "clean" (blues, greens, teals); the conflict zone is the only red area. This encodes the paper's thesis: each layer looks fine alone, problems only emerge through cross-layer analysis.
5. **Three governance arrows converging** on the conflict zone — this is the "aha" visual. Three independent forces, each reasonable on its own, collide at one point.
6. **Publication quality** — this goes in an ACM proceedings paper. Typography should use `\sffamily` for labels, `\ttfamily` for predicate/code names, math mode for formulas.
7. **Self-contained** — the figure + caption should tell the entire paper's story.

## Specific refinements needed from the draft

The draft compiles and has the right content, but needs polish:

- **Spacing**: Elements are a bit cramped. Give the DCL nodes more vertical breathing room. The CSL credential boxes could be slightly wider. The conflict zone could be slightly larger.
- **Alignment**: Make sure the three credential columns (FamilyStatus / Property / Income) align vertically through all three layers — DCL values, CSL credentials, and FSL format boxes should be in the same vertical columns.
- **Governance convergence arrows**: The C5/C6/C7 arrows entering the conflict zone are currently very short (3mm). Make them more dramatic — longer, perhaps starting from the left edge of the FSL band or from between the green boxes and the conflict zone. They should visually convey "three forces converging."
- **Conflict zone interior**: The two sub-boxes (SD-JWT-VC vs AnonCreds) need clear visual contrast. Consider using ✓/✗ symbols instead of ok/NO for the property matrices. Make the "UNSAT" label more prominent.
- **Font sizes**: Some labels are too small. Cross-layer constraint labels (C1, C2, C3, C4, C9) should be readable at print size. The figure will be ~18cm wide in print.
- **The C9 gap brace**: Should be more visually prominent — it's the second headline result. Consider making it span wider or adding a small icon.
- **Leader arrows**: The arrows from model to output could be more visible. Consider using different line styles for red (error) vs green (valid) leader arrows.

## Output format

Produce a **complete, compilable** `\documentclass[border=5pt]{standalone}` TikZ document. Use `\usepackage{lmodern}` to avoid METAFONT issues. The figure should compile with `pdflatex`.

## Caption (for reference — don't include in the TikZ)

> A housing subsidy credential scenario analyzed end-to-end. **(Left)** The designer provides metamodel definitions, a scenario instance, and governance constraints as inputs. **(Center)** The scenario modeled across three metamodel layers: domain facts at the Domain Concept Layer are grouped into credentials at the Credential Schema Layer, with format assignments at the Format-Specific Layer. Each layer is internally well-formed; the governance conflict on the income credential and the cross-credential predicate gap emerge only through cross-layer analysis. **(Right)** Refinery's three analysis modes: consistency checking reports the design unsatisfiable under joint governance; error identification locates the specific conflict; model generation produces a valid alternative when one governance constraint is relaxed.
