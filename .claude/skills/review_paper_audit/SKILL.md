---
description: Full-paper audit that reads all sections sequentially, cross-references against binding claims, decisions, gap analysis, and reviewer personas. Use after a first complete draft, before submission, or after major revisions. Produces a structured 10-section report.
---

# Skill: Paper Audit

**Purpose:** Read the entire paper sequentially and audit it against everything the project has accumulated: binding claims, decisions, gap analysis findings, reviewer persona attack vectors, running example design, and formalization. Produces an actionable audit report — not a general review, but a targeted cross-reference audit.

## Trigger

- "Run a paper audit"
- "Audit the paper against commitments"
- "Full paper review before submission"
- "Check the paper against decisions and claims"

## Inputs

- All section files in `sections/` (read sequentially)
- Decision memories: `.claude/memory/decision_*.md`
- Claim memories: `.claude/memory/claim_*.md`
- `context/VENUE.md` — reviewer personas and attack vectors
- `CLAUDE.md` — thesis statement
- `context/todos/INDEX.md` — remaining work items
- Evidence sources in `context/archive/` (gap analysis, meeting notes)
- Formalization in `models/*.problem`
- Domain guides: `skills/ref_running_example`, `skills/review_reviewer_archetypes`

## Recommended execution

This audit benefits from multi-agent execution for thoroughness:

### Phase 1 — Per-section reviews (parallel)

One agent per section file. Each agent reads its section plus all decisions, claims, and VENUE.md. Each produces a standalone review covering: binding claim delivery, decision compliance, marker census, argument quality.

Naming: `S00_abstract.md`, `S01_introduction.md`, ..., `S07_conclusion.md`

### Phase 2 — Cross-cutting analyses (parallel)

Four agents running specialized analyses across all sections:

- **X01 — Argument coherence:** Trace the argument through all sections. Check logical connections between transitions (Abstract->Intro, Intro->Overview, Overview->Approach, Approach->Evaluation, Evaluation->Related Work, Related Work->Conclusion, Conclusion->Abstract).
- **X02 — Claim evidence audit:** Run `skills/review_claim_evidence_audit` logic. Map every binding claim to evidence. Diagnose overclaim/underclaim/unsupported.
- **X03 — Reviewer persona simulation:** For each of the four personas in VENUE.md, simulate their review. Predict scores, top concerns, single highest-impact fix.
- **X04 — Decision and CFP compliance:** Check every active decision is reflected in prose. Check CFP requirements (page limit, format, anonymization) are met.

Naming: `X01_argument.md`, `X02_claims.md`, `X03_reviewers.md`, `X04_compliance.md`

### Phase 3 — Synthesis (sequential)

One agent reads all S and X outputs. Produces the final audit report with triage table, strategic decisions, and prioritized action list.

Naming: `Z01_synthesis.md`

## Output format

The synthesis report has 10 sections:

### 1. Binding Claim Delivery Matrix

| # | Claim | Delivered? | Where? | Evidence quality | Gap / Risk |
|---|-------|------------|--------|------------------|------------|

Delivered? = YES / PARTIAL / NO / WEAK. Evidence quality = STRONG / ADEQUATE / PLACEHOLDER / MISSING.

### 2. Decision Compliance Check

| Decision | Compliant? | Violation / Drift | Location |
|----------|------------|-------------------|----------|

### 3. Gap Analysis Integration Check

Tier 1 papers cited? Differentiation arguments D1-D5 executed? Claim correction applied?

### 4. Reviewer Persona Attack Simulation

Per reviewer: predicted score, top 3 concerns, single highest-impact fix.

### 5. Argument Flow Audit

Trace transitions. Flag: argument gaps, argument orphans, argument contradictions.

### 6. Running Example Consistency

Entities, credentials, constraints, format assignments, governance sources, notation — consistent across all sections?

### 7. Prose-Model Consistency

Compare Sec 04 descriptions against `models/csok.problem`. Classes match? Constraints match? Elements described but not modeled, or modeled but not described?

### 8. Unresolved Markers Census

| Marker type | Count | Critical? | Sections |
|-------------|-------|-----------|----------|

### 9. Cross-Reference Integrity

Check all `\autoref{}` references point to existing labels with correct content.

### 10. Critical Path to Submission

Blockers, high-value fixes (ranked by impact/effort), acceptable risks, cut candidates. Prioritized action list with task, target file, effort estimate, which binding claim or reviewer it addresses.

## Output directory

`prompts/[date]_paper_audit/` with S/X/Z naming convention.

## When to run

- After first complete draft of all sections
- Before submission (as alternative or complement to `skills/review_final_review`)
- After major revisions that touch multiple sections
- After a consolidation pipeline completes

## Constraints

- Read the paper sequentially — the argument must work as a linear read.
- Be specific. "Section 04 needs work" is useless. "Section 04.4 cross-layer constraints subsection has 6 `.todo` annotations and 0 paragraphs of prose — Binding Claims #3 and #9 are undelivered" is actionable.
- Quote specific prose when claiming a commitment is met or violated.
- Do NOT propose rewrites or draft prose. Identify what is wrong and what is needed.
- Frame the critical path relative to the deadline from `context/VENUE.md`.
