# T08: Section 05 — Evaluation Elaboration

**Wave:** 2 (after T01+T02+T03 + T07 complete)
**Execution:** Single agent. Drafts prose + populates tables.
**Dependencies:** T01+T02+T03 (layer definitions for coverage mapping), T07 (cross-layer constraint definitions for anti-pattern analysis).
**Target file:** `sections/05_evaluation.md` — subsections 5.1.1 through 5.1.5.
**Downstream:** T09 (threats + scalability), T10 (polish — abstract numbers).

---

## Context

Section 05 evaluates the metamodel along five axes. The two headline results (governance conflict and cross-credential predicate gap) are already fully drafted. This task fills in the remaining evaluation subsections: coverage characterization, expressiveness table, anti-pattern detection table, multi-layer visibility argument, and baseline comparison.

**Binding claims delivered:** #5 (coverage), #6 (expressiveness — HIGH RISK), #7 (anti-patterns), #9 (multi-layer visibility).

## Read Before Writing

1. `sections/05_evaluation.md` — current state (headline results are drafted; rest is scaffold)
2. `sections/04_approach.md` — layer definitions from T01-T03 and T07 (needed for coverage mapping)
3. `models/vc_metamodel.refinery` — authoritative predicate names
4. `context/archive/arf_5_3_4_gap_analysis.md` — ARF constraint analysis (8 constraints, 3 fully expressible)
5. `context/DECISIONS.md` — two orthogonal headline results, ARF constraint ID prefixing
6. `context/VENUE.md` — Reviewer B (Mathematician) and Reviewer D (Adversarial) attack vectors
7. `CLAUDE.md` — writing style

## What to Draft

### 5.1.1 Metamodel Coverage (~1 paragraph + possible table)
- Characterize: how many VCDM 2.0 concepts are covered by the metamodel
- Method: map DCL+CSL+FSL metaclasses to VCDM 2.0 spec concepts
- Result: $N$/$M$ VCDM 2.0 concepts relevant to credential ecosystem design are formalized
- If exact numbers are not derivable from model file, use `$N$/$M$` placeholder
- Acknowledge: coverage is of concepts relevant to design-time, not all VCDM concepts

### 5.1.2 Constraint Expressiveness (~1 paragraph + TABLE)
- **Populate the expressiveness table** — this is currently EMPTY and HIGH RISK
- Source: `context/archive/arf_5_3_4_gap_analysis.md` — use ARF constraint IDs with ARF- prefix (ARF-C1, ARF-C4, ARF-C7, etc.)
- Table columns: Constraint ID | Source | Description | Expressible? | Metamodel Element
- Include at least the 3 fully expressible constraints (ARF-C1, ARF-C4, ARF-C7) and 2-3 partially expressible
- ARF-C7 provides direct architectural validation of DCL→CSL→FSL layering — highlight this
- **IMPORTANT**: Prefix ARF constraint IDs with "ARF-" to avoid collision with paper-internal C1-C9 binding claims

### 5.1.3 Headline Results (ALREADY DRAFTED — DO NOT TOUCH)
- Headline 1: Income credential governance conflict — FULLY DRAFTED
- Headline 2: Cross-credential predicate gap — FULLY DRAFTED

### 5.1.4 Anti-Pattern Detection (~1 paragraph + TABLE)
- Define anti-pattern table: anti-pattern name | description | detecting predicate | layer(s) | severity
- Include anti-patterns from A14: missing_credential_coverage, cross_credential_predicate_gap
- Include format-governance conflicts from FSL
- **Multi-layer visibility argument** (2-3 sentences): The cross-credential predicate gap is invisible at any single layer — only the cross-layer trace mapping reveals it. This is the key argument for the multi-level approach over single-layer alternatives.

### 5.1.5 Baseline Comparison (~1 paragraph)
- Compare against: manual review (no formalization), single-layer modeling (UML class diagram per layer without cross-layer constraints), informal multi-layer (layers without formal cross-layer predicates)
- For each baseline: what it catches, what it misses
- Conclusion: only the integrated formalization with cross-layer graph predicates catches all identified anti-patterns

### DO NOT TOUCH
- 5.1.3 Headline Results (both headlines fully drafted)
- Section 5.2 (Scalability) — T09
- Section 5.3 (Threats to Validity) — T09
- Evaluation preamble — T10

## Constraints

- ARF constraint IDs MUST be prefixed ARF-C1, ARF-C4, ARF-C7 to avoid collision with paper's C1-C9
- Tables must use standard Markdown table format
- Predicate names must match `models/vc_metamodel.refinery` exactly
- Use `\ref{sec:...}` for cross-references to approach section
- Budget: ~1.5 pages for all five subsections combined (headlines already occupy ~0.75 pages)
- No new claims beyond what is established in the approach. No LLM tells. Obsidian Markdown.
