# T05: Section 06 — Related Work

**Wave:** 1 (parallel with T01-T04, T06)
**Execution:** Single agent. Drafts prose.
**Dependencies:** T00b (clean `@TODO` blocks must be in place).
**Target file:** `sections/06_related_work.md` — all three subsections + synthesis.
**Downstream:** None (off critical path).

---

## Context

Section 06 positions the contribution against three bodies of work. Currently ZERO prose — only detailed scaffolds with citation lists and differentiation strategies. Budget: 0.75 pages (~4 paragraphs across 3 subsections + 1 synthesis sentence).

**Key constraint from DECISIONS.md (2026-03-25):** Do NOT claim "MDE has not been applied to SSI." Four prior MDE works exist. The defensible claim is the intersection: no prior work combines multi-level metamodeling + formalized cross-layer constraints + VC credential design.

## Read Before Writing

1. `sections/06_related_work.md` — current `@TODO` blocks (after T00b merging)
2. `archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md` — positioning from gap analysis
3. `DECISIONS.md` — corrected C5 claim, D5 preemption for Reviewer D
4. `VENUE.md` — Reviewer D attack vectors (novelty reduction, tool dependency)
5. `CLAUDE.md` — writing style

## What to Draft

### 6.1 Credential Ecosystem Design and Formalization (~1.5 paragraphs)

Structure:
1. **Informal baseline** (2 sentences): W3C VCDM 2.0, ARF, AnonCreds spec, ISO mDL — specifications and design patterns without formal cross-layer constraint checking.
2. **Single-layer formalizations** (3-4 sentences): Braun & Kafer 2025 (RDF semantics), EuroS&PW 2022 (LD-VC selective disclosure), Braun et al. 2024 (ProVerif protocol verification). Each formalizes one layer or concern. Differentiate: protocol verification vs. design-time consistency.
3. **Conceptual models** (2-3 sentences): Tith & Colin 2025 (trust policy), Turkanovic et al. 2025 (delegation), ToIP stack (informal layers), Naghmouchi & Laurent 2025 (privacy framework). Single concern each.
4. **Gap** (1 sentence): None formalizes cross-layer constraints spanning domain semantics, credential structure, and format-specific representation.

### 6.2 Model-Driven Engineering for Security and SSI (~1.5 paragraphs)

Structure:
1. **MDE-security foundations** (2 sentences): UMLsec (Jurjens 2002/2004) targets confidentiality/authentication. SecureUML (Basin et al. 2002/2006) targets access control. Neither addresses credential schema design.
2. **MDE-for-SSI** (4-5 sentences — MUST cite ALL FOUR, MUST differentiate):
   - ChorSSI (Cippitelli et al. 2023, EMISA) — BPMN choreography. D1: choreography vs. credential design space.
   - SecureSSI (Ding & Sato 2023, TrustCom) — security analysis. D2: threats vs. design space.
   - Pattiyanon et al. 2022 (MODELSWARD) — weakness detection via DSMLs. D2: detection vs. consistency.
   - Barclay et al. 2020 (arXiv) — iStar governance. Requirements-level.
3. **Corrected claim** (1-2 sentences): MDE has been applied to SSI for security analysis, choreography, weakness detection, governance. None defines a multi-level metamodel or formalizes cross-layer constraints.

### 6.3 Multi-Level Modeling and Graph-Based Design Space Exploration (~1 paragraph)

Structure:
1. **Foundations** (2 sentences): Atkinson & Kuhne (2001/2008) multi-level metamodeling. de Lara & Guerra 2010 (MetaDepth) tool support.
2. **Structurally related** (1 sentence): Diskin et al. multi-view consistency — we add governance dimension.
3. **Tool infrastructure** (1-2 sentences): Refinery / Semerath et al. (SoSyM 2017, ICSE 2024) — third person. Own prior work (CSCS 2024) — third person.
4. **D5 PREEMPTION** (critical for Reviewer D): "Unlike standard multi-level modeling applications where layers represent successive instantiation, the three layers in our metamodel represent independently governed concern spaces connected by coverage and capability constraints — formalized as graph predicates rather than potency annotations."

### Synthesis R4 (1 sentence)

"No prior work combines multi-level metamodeling with formalized cross-layer constraints for verifiable credential ecosystem design under multi-source governance."

## Constraints

- **Corrected C5 claim**: MDE HAS been applied to SSI. Do not overclaim.
- **D5 preemption** in 6.3 is CRITICAL for defending against Reviewer D.
- **Double-blind**: Own prior work (CSCS 2024) in third person.
- All citations as `%% @CITE: ... %%` markers.
- Use `\ref{sec:...}` for cross-references.
- Budget: 0.75 pages. This is tight — every sentence must earn its place.
- No LLM tells. Obsidian Markdown.
