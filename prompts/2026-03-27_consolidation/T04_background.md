# T04: Section 02 — Background

**Wave:** 1 (parallel with T01-T03, T05-T06)
**Execution:** Single agent. Drafts prose.
**Dependencies:** T00b (clean `@TODO` blocks must be in place).
**Target file:** `sections/02_background.md` — all three subsections.
**Downstream:** None directly (T01-T03 do not depend on this, but the paper's coherence does).

---

## Context

Section 02 establishes three conceptual pillars: (1) W3C VCDM 2.0, (2) multi-level modeling, (3) Refinery. Currently ZERO prose — only scaffolds. Budget: 1.25 pages (~7 paragraphs across 3 subsections).

The explanation floor is set by Reviewer C (MDE Practitioner — knows metamodels/EMF, does NOT know VCs/SSI). A reader who knows EMF but not VCs should understand each subsection.

**Binding claims delivered:** #2 (VCDM grounding) indirectly.

## Read Before Writing

1. `sections/02_background.md` — current `@TODO` blocks (after T00b merging)
2. `sections/04_approach.md` — what concepts are used (especially Refinery mechanisms)
3. `sections/03_overview.md` — what VC terms the reader encounters first
4. `DECISIONS.md` — no MDA, mdoc simplified, double-blind
5. `models/vc_metamodel.refinery` — for accuracy on Refinery concepts
6. `CLAUDE.md` — writing style

## What to Draft

### 2.1 W3C Verifiable Credentials Data Model 2.0 (~2-3 paragraphs)

**B1** (5-7 sentences): Define VC, credential subject, issuer, claims, proof. Emphasize: VCDM defines structural vocabulary but not domain semantics or format-specific encoding — this gap motivates the three-layer separation.

**B2** (3-4 sentences): Format diversity — SD-JWT-VC (hash-based selective disclosure), AnonCreds (CL signatures, **predicate proofs** via ZKP), JSON-LD with Data Integrity Proofs. Each format has different privacy capabilities. Mention mdoc (ISO 18013-5) briefly as eIDAS-mandated alongside SD-JWT-VC.

**B3** (2-3 sentences, optional — cut if space tight): Governance context — EU Digital Identity Wallet, eIDAS 2.0, ARF impose constraints on format choice and attribute disclosure.

**CRITICAL**: The term "predicate proofs" (or "predicate proof") MUST be introduced in B2. It is used without re-definition in Section~\ref{sec:motivation} (M3) and Section~\ref{sec:approach}.

### 2.2 Multi-Level Modeling (~1-2 paragraphs)

**B4** (3-4 sentences): Atkinson & Kuhne multi-level metamodeling. Linguistic vs. ontological typing. Potency. Position our three layers as ontological levels connected by cross-level constraints — not standard top-down refinement but independently governed concern spaces.

**B5** (2-3 sentences): Metamodeling notation — Ecore-style class diagrams, instances as partial models, cross-layer trace relationships as refinement mappings.

### 2.3 Partial Graph Modeling with Refinery (~2 paragraphs)

**B6** (4-5 sentences): Refinery overview (**third person** — double-blind). Partial graph modeling framework. Graph predicates as first-class constraint language. Design space exploration via model generation from partial specifications. Cite Marussy et al. ICSE 2024 and Semerath & Varro SoSyM 2017.

**B7** (4-5 sentences): Refinery concepts needed for Section~\ref{sec:cross-layer}: error predicates (constraints that must not hold — if satisfied, design is invalid), propagation rules (derived knowledge guiding generation — negative elimination), shadow predicates (record derived information without constraining), scope constraints, partial interpretation (may/must/unknown).

## Constraints

- **No MDA terminology** (no CIM/PIM/PSM). Hard constraint from advisor.
- **Double-blind**: Refinery in third person. Not "our tool."
- **Predicate proofs** MUST be introduced in B2.
- Use `\ref{sec:...}` for all cross-references.
- Budget: 1.25 pages. Cut B3 if over budget.
- `@CITE` markers for all references (will be resolved later).
- Obsidian Markdown with Mathpix math conventions.
- No LLM tells. No throat-clearing. Every sentence defines, claims, evidences, transitions, or orients.
