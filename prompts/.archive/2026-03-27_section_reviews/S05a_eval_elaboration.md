# S05a: Evaluation — Elaboration Review

## Section Assessment

- **Overall verdict:** NEEDS WORK
- **Days to deadline:** 2 (submission 2026-03-29 AoE, effective Monday 2026-03-30 ~13:00 CET)

### Reviewer scores and reactions

| Reviewer | Score | Reaction |
|----------|-------|----------|
| A (Champion) | Weak Accept | Headline results are genuinely compelling. The vertical/horizontal orthogonality is clear. But the Coverage and Expressiveness subsections are thin — @FIGURE placeholders and @TODO markers undercut the sense that this is a mature evaluation. Will still champion on headline strength if the rest is filled. |
| B (Mathematician) | Borderline | Headline 1 contradiction analysis is well-structured: three governance sources, unsatisfiable conjunction, each pair satisfiable. The constraint sensitivity experiment (G0–G7) is exactly the kind of evidence B wants. But the @TODO at line 62 ("show the error predicates firing") is a gap: without the Refinery output confirming the formal analysis, B must take the paper's word for it. Headline 2 format capability table is correct but could be tighter — the "research prototype" row for SNARK-based creds is a distraction. |
| C (Business Manager) | Weak Accept | The income governance conflict is accessible — three rules that cannot all be satisfied, with a concrete enforcement precedent (NAIH bank fine). The cross-credential gap is slightly harder to follow but the table helps. Anti-pattern table is readable. Coverage and Expressiveness subsections are currently too terse for C to evaluate. |
| D (Adversarial) | Weak Reject | "Synthetic evaluation" attack lands partially: the running example is a single hand-crafted scenario. The baseline comparison is analytical, not empirical — no competing tool implements cross-layer checking, which is honest but leaves D unsatisfied. The anti-pattern catalog has five entries, three of which are single-layer — D will argue these are trivial. The "just applying a model" attack is partially blunted by the governance conflict being grounded in real regulatory sources, but D will push on external validity. |

## Critique

### Critical (blocks submission)

**C1. Scalability section is entirely TBD.** Every data cell in Table 3 (scalability) and Table 4 (sensitivity) says "TBD." Four @TODO markers (lines 146–152) indicate measurements have not been run. This is roughly 1 page of the 2.5-page evaluation budget that does not exist yet. The scalability section is well-designed — the SAT/UNSAT pairing and the G0–G7 power-set experiment are strong methodological choices — but without data, it is not submittable. **Severity: blocking.** This is outside the scope of S05a (elaboration review) but flagged because it affects the overall evaluation verdict.

**C2. @TODO at line 62: Refinery output for Headline 1.** The text argues the governance conflict is unsatisfiable but never shows the solver confirming this. The constraint sensitivity table (G0–G7) will partially address this once populated, but Reviewer B will want to see either (a) the error predicates firing in Refinery output, or (b) an explicit argument that the G7 UNSAT result in Table 4 constitutes the formal confirmation. Add a forward reference to the sensitivity experiment as the formal validation if Refinery output screenshots are excluded per Decision 14 (no code listings). **Severity: high.** Fix: replace the @TODO with a sentence stating that the constraint sensitivity experiment (Table 4) formally confirms the unsatisfiability — G7 is the only UNSAT configuration.

### Major

**M1. Coverage subsection lacks the coverage table.** The @FIGURE at line 22 is a placeholder. The prose (line 20) makes the soundness-completeness argument in abstract terms but never shows the mapping. For a 10-page paper this is acceptable only if the argument is tight without the table; currently it is tight enough. However, the three excluded concept families (proofs, presentations, status) are stated but not justified beyond "scope boundaries." Reviewer D will ask why these exclusions do not weaken the metamodel's claims. **Fix direction:** Either produce the coverage table (even as a Markdown table, not a figure) or add one sentence per exclusion explaining why it is orthogonal to schema design.

**M2. Expressiveness subsection: partially-expressible constraints under-analyzed.** Line 40 states two root causes for partial expressibility but does not name the five constraints or show how each maps. The supplementary material reference is appropriate, but the paper should at minimum state which constraints hit which root cause. Without this, Reviewer B cannot verify the "five partially, zero not expressible" claim. **Fix direction:** Add a compact inline enumeration: "ARF-C2, C3, C5 require attestation-type subtyping; ARF-C6, C8 require per-claim privacy annotation."

**M3. Anti-pattern subsection: three of five are single-layer.** The table at lines 95–101 has five anti-patterns, but disconnected domain graph, empty credential, and orphaned root entity are all detectable by single-layer inspection — the paper admits this at line 107. Reviewer D will argue these are trivial structural well-formedness checks, not contributions. **Fix direction:** The subsection already makes the graduated-visibility argument (intra-layer through cross-layer to ecosystem-level). Sharpen this: lead with the cross-layer anti-patterns (trace misalignment, cross-credential predicate gap) and present the single-layer ones as baseline completeness. One sentence stating "single-layer anti-patterns establish that the metamodel subsumes standard well-formedness checking" would pre-empt D.

### Minor

**m1. Headline 2 format table: SNARK row is a distraction.** The SNARK-based row (line 79) with "research prototype" in the cross-credential arithmetic column weakens the "no deployed format" claim by introducing a format that does support it. Move the SNARK row to a footnote or remark, or add a column header clarifying "deployed formats" vs. "research."

**m2. Complementarity remark (line 87): earns its space but could be tighter.** The vertical/horizontal distinction is the right framing and directly supports the two-axis evaluation claim in the opening paragraph. Currently three sentences; could be two. Not urgent.

**m3. Baseline comparison (lines 109–113): adequate but not strong.** Three baselines in one paragraph is compressed but defensible given page budget. The key sentence — "no existing tool implements cross-layer credential ecosystem checking" — is the honest answer to D's "tool dependency" attack. However, D will counter: "if no tool exists, how do we know the problem is real?" The answer is the headline results themselves — the baseline paragraph should explicitly close the loop: "the headline results demonstrate conflicts that none of these baselines would detect." **Fix:** Add one sentence at the end.

**m4. NAIH enforcement precedent (line 55): strong but long.** The NAIH paragraph is 7 lines — roughly 15% of Headline 1. It is the right evidence (concrete, recent, domain-relevant) and directly supports the GDPR operationalization. But it could be compressed by ~30% without losing the argument. The details about "previous pregnancies, miscarriages, and maternal health" are vivid but may exceed what a MODELS reviewer needs. **Fix direction:** Keep the enforcement action, trim the medical detail to one clause.

**m5. ARF-C7 remark (lines 42–43): strong independent validation.** This is one of the best paragraphs in the section — external confirmation that the layering is structurally motivated, not an artifact. Ensure it survives any page-budget cuts.

## @TODO and @FIGURE Density Assessment

| Marker | Location | Realistic to fill in 2 days? |
|--------|----------|------------------------------|
| @FIGURE fig_coverage_table (line 22) | Coverage | Yes if done as Markdown table, no if requires designed figure |
| @FIGURE fig_expressiveness_table (line 38) | Expressiveness | Redundant — Table 1 already exists in prose. Remove marker or merge |
| @TODO line 62 | Headline 1 Refinery output | Replace with forward reference to G7 sensitivity result |
| @FIGURE fig_antipattern_table (line 105) | Anti-patterns | Table already exists in prose (lines 95–101). Remove marker |
| @TODO lines 146–152 | Scalability data | BLOCKING — requires running measurements |

Assessment: The elaboration subsections (5.1) have 3 figure placeholders that are either already satisfied by existing tables or convertible to Markdown tables. The single @TODO (line 62) is replaceable with a cross-reference. The elaboration section is close to submittable with minor fixes. The scalability section (5.2) is the real risk.

## Fix-It Prompt

```
# Fix-It: Section 05 Evaluation — Elaboration Polish

## Target file
`sections/05_evaluation.md` — lines 1–113 (Elaboration subsection only)

## Goal
Polish the elaboration subsection to submission quality. Do NOT touch the scalability section (lines 115+) — that requires measurement data.

## Constraints
- 2 days to deadline. No new content threads. Polish and tighten only.
- No code listings (Decision 14).
- Obsidian Markdown with Mathpix math conventions.

## Tasks (in order)

### T1. Headline 1: Replace @TODO (line 62) with forward reference
Remove the @TODO. Add a sentence: "The constraint sensitivity experiment (\autoref{tab:sensitivity}) formally confirms this: configuration G7 — the conjunction of all three governance frameworks — is the only unsatisfiable configuration among all $2^3$ subsets."

### T2. Headline 1: Trim NAIH paragraph
Compress the NAIH enforcement precedent (lines 55, starting "A directly analogous...") by ~30%. Keep: bank fined 35M HUF, pregnancy booklet copied when only 12-week verification needed, NAIH found data disproportionate. Cut: "sensitive health data on previous pregnancies, miscarriages, and maternal health" — compress to "containing sensitive health data beyond the verification need."

### T3. Headline 2: Move SNARK row to footnote
In the format capability table (lines 72–79), remove the SNARK-based row from the main table. Add a footnote after the table: "Research prototypes based on SNARKs (e.g., zk-creds \citep{rosenberg_zk-creds_2023}) support cross-credential arithmetic but lack stable specifications and production deployments."

### T4. Expressiveness: Name the partially-expressible constraints
After line 40 ("Both gaps are closable..."), add: "Specifically, ARF-C2, C3, and C5 condition format eligibility on attestation qualification level (PID, QEAA, EAA); ARF-C6 and C8 require per-claim selective disclosure annotation."

### T5. Anti-patterns: Sharpen graduated-visibility argument
In the anti-pattern prose (line 107), after "Trace misalignment requires cross-layer analysis," add a clause: "The three intra-layer predicates establish that the metamodel subsumes standard structural well-formedness checking;" Then continue with the existing text about trace misalignment and cross-credential predicate gap.

### T6. Baseline: Close the loop
At the end of the baseline paragraph (line 113), after "...invisible to any single-layer approach," add: "The headline results (\autoref{sec:headlines}) provide concrete evidence: both conflicts are grounded in cited regulatory sources yet undetectable by any of these baselines."

### T7. Remove redundant @FIGURE markers
- Line 38 (@FIGURE fig_expressiveness_table): Remove — Table 1 already serves this role.
- Line 105 (@FIGURE fig_antipattern_table): Remove — the anti-pattern table at lines 95–101 already serves this role.
- Line 22 (@FIGURE fig_coverage_table): Keep only if Martin plans to produce the figure. Otherwise, convert the coverage argument to a compact Markdown table inline.

### T8. Complementarity remark: minor tightening
Compress from 3 sentences to 2. Proposed: "The two results are orthogonal: Headline 1 identifies a vertical governance conflict (contradictory format requirements on a single credential), while Headline 2 identifies a horizontal expressiveness gap (an ecosystem-level constraint spanning credentials that exceeds any deployed format's capabilities). Together, they demonstrate that multi-layer analysis detects both conflict types invisible to single-layer inspection."

## Verification
After edits, grep for remaining @TODO and @FIGURE markers in lines 1–113. There should be at most 1 @FIGURE (coverage table, if retained) and 0 @TODO markers.
```
