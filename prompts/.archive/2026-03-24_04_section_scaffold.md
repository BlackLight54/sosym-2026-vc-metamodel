# Prompt: Scaffold the paper sections

**Task type:** Skill execution
**Skill:** `skills/section_scaffold`
**Target:** `sections/` directory — create section files

## Instruction for Claude Code

Read `skills/section_scaffold/SKILL.md` and execute it.

## Context

**Venue:** MODELS 2026 Foundations Track, ACM sigconf, 10 pages + 2 refs.
**Review:** Double-blind.
**Thesis:** Multi-layer metamodel for VC ecosystem design with formalized cross-layer constraints (see CLAUDE.md).
**Prior work:** CSCS 2024 short paper (4 pages, workshop) + TDK report (40 pages, thesis). Both in `prior_work/`.
**Abstract:** `Abstract - submitted.md`.

## Expected structure (propose adjustments)

Based on the abstract and prior work, the likely section structure is:

1. **Introduction** — Problem (VC ecosystem design), gap (no formal cross-layer constraint checking), contribution (layered metamodel + formalized constraints), results preview.
2. **Background** — W3C VCDM 2.0 essentials, partial graph modeling / Refinery, MDA layers. Minimal — only what the reader needs.
3. **Problem / Motivation** — The credential ecosystem design problem. Cross-layer constraints from different governance frameworks. Running example (e.g., the Hungarian CSOK mortgage scenario or a simpler one). Why single-layer inspection fails.
4. **Approach** — Layered metamodel (CIM: knowledge graph, PIM: abstract VC schemas, PSM: format-specific). Constraint formalization as graph predicates. Transformations.
5. **Validation / Evaluation** — Three-axis validation: (a) metamodel coverage vs W3C spec, (b) constraint expressiveness vs W3C + EU requirements, (c) error detection vs known anti-patterns.
6. **Related Work** — VC design approaches, MDE for security/identity, DSE with graph modeling.
7. **Conclusion** — Summary, limitations, future work.

## Constraints

- 10-page budget. Background must be tight (~1.5 pages). Approach is the core (~3 pages). Evaluation (~2 pages).
- Each section file should include per-paragraph guidance: what each paragraph must accomplish, key claims, evidence needed, and markers for citations/formal content.
- Use the conventions from CLAUDE.md: Obsidian Markdown, `%% @CITE: %%` markers, `%% @FORMAL: %%` markers.

## After

- Section files created in `sections/`.
- Update TODO.md: mark done, add per-section drafting tasks.
