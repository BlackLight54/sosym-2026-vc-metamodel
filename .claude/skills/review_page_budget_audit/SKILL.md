---
description: Multi-agent page budget audit. Estimates per-section page counts, compares against budgets, identifies inflation sources and deficit areas, and recommends where to add or cut. Run when approaching page limits or after major content changes.
---

# Skill: Page Budget Audit

**Purpose:** Analyze the paper's page budget allocation across all sections. Estimate actual page consumption vs. budgeted pages, identify where space is wasted or insufficient, and produce actionable recommendations for balancing the paper within venue page limits.

## Trigger

- "Run a page budget audit"
- "How are we doing on page budget?"
- "Where should we cut / add?"

## Inputs

- All section files in `sections/`
- `context/VENUE.md` — total page limit, format details
- Section budgets from `@META: Budget:` markers in section files (or YAML frontmatter once migrated)

## Recommended execution

### Phase 1 — Per-section audits (parallel)

One agent per section file. Each agent reads its section and reports:

- **Word count** (prose only — exclude markers, meta, scaffold, comments)
- **Budget** from `@META: Budget:` marker (or YAML frontmatter)
- **Figure/table count** with estimated page impact (~0.3 pages per figure, ~0.2 per table — adjust based on actual size)
- **Display math block count** with estimated page impact (~0.1 pages per block)
- **Estimated page count** using ~800 words/page heuristic for ACM sigconf two-column format
- **Delta vs. budget** (over/under/on-track, in pages)
- **Content density assessment:** what fraction is real prose, what is scaffold/placeholder/markers
- **Specific inflation sources:** verbose passages, redundant explanations, unnecessary background
- **Specific deficit sources:** placeholder markers, missing subsections, underdeveloped arguments

Naming: `B01_abstract.md`, `B02_introduction.md`, etc.

### Phase 2 — Cross-section analyses (parallel)

Three agents running specialized analyses across all sections:

- **X1: Balance analysis** — Compare section page estimates against venue total page limit (from VENUE.md). Flag sections consuming disproportionate budget relative to their argumentative weight. Check whether contributions sections (approach, evaluation) get enough space vs. context-setting sections (background, related work). Compute allocation percentages.

- **X2: Dependency and gap analysis** — Which sections reference content not yet written in other sections? Where are structural holes (e.g., background promised but not delivered, evaluation referencing non-existent results, introduction promising contributions not yet present)? Estimate pages needed to fill gaps.

- **X3: Redundancy detection** — Find repeated explanations across sections, duplicated definitions, concepts introduced in multiple places. Quantify approximate space wasted by redundancy. Identify which instance to keep and which to cut.

Naming: `X1_balance.md`, `X2_gaps.md`, `X3_redundancy.md`

### Phase 3 — Synthesis (sequential)

One agent reads all Phase 1 (B*) and Phase 2 (X*) outputs and produces:

1. **Budget tree table:**

   | Section | Budget (pages) | Estimated (pages) | Delta | Status |
   |---------|---------------|-------------------|-------|--------|

   With totals row.

2. **Top 5 inflation sources** — ranked by pages wasted. Each: section, passage/subsection, estimated waste, recommendation.

3. **Top 5 deficit areas** — ranked by pages needed. Each: section, what's missing, estimated pages needed, which binding claim it affects.

4. **Recommended actions** — prioritized list: what to cut, what to add, what to move. Each action: target section, specific change, estimated page impact, priority (must/should/could).

5. **Risk flags** — sections that cannot fit in budget even with cuts, scope trade-offs that require Martin's decision, binding claims at risk from page pressure.

Naming: `Z01_budget_synthesis.md`

## Output directory

`prompts/[date]_page_budget_audit/` with B/X/Z naming convention.

## Heuristics

- ACM sigconf two-column: ~800 words/page for prose, ~600 if math-heavy
- One column-width figure: ~0.3 pages; full-width figure: ~0.5 pages
- One table: ~0.2-0.4 pages depending on rows
- Display math block: ~0.1 pages
- These are estimates — the goal is directional accuracy, not precision

## Constraints

- Be specific about inflation sources. "Section 04 is too long" is useless. "Section 04.2 repeats the three-layer distinction already made in Section 03.1, wasting ~0.3 pages" is actionable.
- Do NOT propose rewrites. Identify what to cut/add and by how much.
- Frame recommendations relative to binding claims — cuts should never sacrifice claim delivery.
- Reference venue page limit from VENUE.md throughout.

## When to run

- When approaching venue page limits
- After major content additions
- Before submission as complement to `review_paper_audit`
- When deciding where to invest remaining writing time