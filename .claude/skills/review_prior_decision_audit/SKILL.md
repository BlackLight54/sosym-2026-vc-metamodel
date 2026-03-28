---
description: Surface cross-cutting decisions from .claude/memory/decision_*.md and check whether they still serve the paper as it evolved. Use when reviewing early decisions, checking for decision drift, or when something feels structurally off.
---

# Skill: Prior Decision Audit

**Purpose:** Surface cross-cutting decisions made earlier in the writing process and check whether they still serve the paper. Over weeks of writing, early decisions — threat model scope, which properties to verify, running example choice, contribution framing — may no longer be optimal given how the paper evolved. This skill makes that drift visible before it causes structural problems.

## Trigger

- "Are our early decisions still right?"
- "Audit past decisions"
- "Something feels off"
- Periodically during writing (see "When to run")

## Inputs

- `.claude/memory/decision_*.md` (cross-cutting decisions stored as project memories).
- CLAUDE.md: thesis (has it drifted from the original?).
- All section files (what the paper actually argues, which may differ from what was planned).
- context/VENUE.md: reviewer personas (have the defense points shifted?).
- TODO.md (are there stale tasks that reflect old decisions?).

## What counts as a cross-cutting decision

A cross-cutting decision is any choice that affects multiple sections or constrains downstream work. Examples:

- **Thesis scope:** "We prove security properties X, Y, Z" — but the paper now only handles X and Y.
- **Running example:** "We use a supply chain scenario" — but the example no longer exercises the key distinctions.
- **Threat model:** "We assume honest-but-curious participants" — but the formal model now covers malicious participants too.
- **Contribution framing:** "Our main contribution is the formalism" — but the case study turned out to be more novel than the formalism.
- **Terminology choices:** "We call it a compliance token" — but the term has drifted or a better one emerged.
- **What's in vs. out of scope:** "We defer liveness to future work" — but the paper now implicitly depends on liveness.
- **Evaluation strategy:** "One case study is enough" — but the paper's claims have grown beyond what one case study supports.
- **Venue targeting:** "This is a BPM paper" — but the contribution is now more FM than BPM.

## Steps

### 1. Collect decisions

Read `.claude/memory/decision_*.md` for all recorded cross-cutting decisions. Supplement with decisions implicit in:

- CLAUDE.md thesis (core claim, mechanism, so-what — each is a decision).
- context/VENUE.md (venue choice, supplementary strategy — each is a decision).
- Running example choice.
- Section structure (what's included, what's not).
- Contribution list in Introduction P3.

Produce a decision inventory:

| # | Decision | When made | Where it's reflected | Scope |
|---|---------|-----------|---------------------|-------|
| D1 | Threat model: honest-but-curious | Session 2 | §3 Def 1, §5 case study assumptions | Model, evaluation |
| D2 | Running example: supply chain | Session 1 | §2, §3 examples, §5 | Every section |
| D3 | Main contribution: the formalism | Session 3 | §1 P3, abstract contribution | Framing |

### 2. Check each decision against the current paper

For each decision, ask:

**Is it still correct?**
- Does the paper still do what this decision says? Or has the actual content drifted?
- Example: D1 says "honest-but-curious" but §3 Def 4 actually models malicious participants. The decision is stale.

**Is it still optimal?**
- Even if it's still what the paper does, is it still the *right* choice given what we know now?
- Example: D2 chose a supply chain scenario, but the formalism's most interesting property is about dynamic participant sets, which the supply chain example doesn't exercise. A different example might serve the paper better.

**Is it consistently applied?**
- Does every section that should reflect this decision actually reflect it?
- Example: D3 says the main contribution is the formalism, but the introduction spends more space on the case study than on the formal results.

### 3. Classify findings

For each decision that has a problem:

| Finding type | Description | Action |
|-------------|-------------|--------|
| **Stale** | The paper has moved past this decision but it hasn't been formally updated | Update the decision, propagate via `skills/plan_revision_orchestration` |
| **Suboptimal** | The decision was reasonable then but a better option is now visible | Present the alternative to Martin. If Martin agrees, update and propagate |
| **Inconsistent** | The decision is correct but not applied uniformly | Identify which sections are out of sync, fix locally |
| **Risky** | The decision creates a vulnerability that wasn't apparent earlier | Flag for Martin with the specific risk |

### 4. Check for undocumented decisions

Some cross-cutting decisions are never recorded but exist implicitly. Look for:

- Notation conventions that emerged organically (is $\sigma$ always an execution trace? is it documented?).
- Structural choices that weren't deliberate (related work is in §2 — was that a decision or a default?).
- Assumptions that crept in without being stated.

If found, recommend recording them as `.claude/memory/decision_*.md` files so they can be audited next time.

### 5. Present to Martin

Output in plan mode:

- Decision inventory table.
- For each problematic decision: what it was, what changed, what the options are.
- For stale decisions: a recommendation (update or revert).
- For suboptimal decisions: the alternative, with trade-offs.
- For inconsistencies: which sections need alignment.
- For risks: the specific vulnerability.

Martin decides what to change. Changes are propagated via `skills/plan_revision_orchestration` if they touch multiple sections.

### 6. Update records

After Martin decides:
- Update `.claude/memory/decision_*.md` files with revised decisions (archive superseded decisions to `context/archive/` with a note).
- If a decision changes, add a TODO for `skills/plan_revision_orchestration` to propagate the change.
- If a decision is confirmed as still correct, note that it was audited (prevents re-flagging the same decision next time).

## When to run

- **Every 3–5 sessions** during active writing. Don't run every session — decision drift happens over days, not hours.
- **After a major section is drafted.** Writing the formal model or evaluation often reveals that earlier framing decisions need adjustment.
- **When something feels off.** If Martin or Claude notices the paper isn't quite cohering, decision drift is a likely cause.
- **Before final review.** One last check that all cross-cutting decisions are still reflected accurately.

## Interaction with other skills

- **`skills/plan_revision_orchestration`:** If a decision changes, the revision orchestrator propagates it across sections.
- **`skills/review_claim_evidence_audit`:** Decision drift often manifests as claim-evidence mismatches. If the audit finds problems, a decision audit may explain why.
- **`skills/review_champion_test`:** If the champion insight has shifted, the contribution framing decision (D3-type) may need updating.
- **`skills/review_paper_status`:** Paper status is a snapshot of *where things are*. Decision audit is a check on *whether the plan is still right*.

## Output

- Decision inventory.
- Problem classification for each finding.
- Recommendations for Martin.
- Updated `.claude/memory/decision_*.md` files after Martin's decisions.
- TODO.md updated if revisions are needed.
