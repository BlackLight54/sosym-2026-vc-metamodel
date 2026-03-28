---
description: Audit the paper for ethical violations, factual misrepresentation, citation accuracy, anonymity leaks, overclaiming, logical gaps, and LLM tells. Use before submission, grace period upload, or when an advisor asks for an integrity check.
---

# Skill: Integrity Audit

**Purpose:** Substantive integrity check that goes beyond mechanical issues (those are covered by `review_pre_submission_check`). This skill asks: are claims honest, are citations accurate, is the double-blind actually blind, and does the prose read as human-written. Modeled on the audit that caught the NAIH citation interpretation gap, the WLOG overclaim, and the Refinery deanonymization signal before the March 2026 grace period upload.

## Trigger

- "Run integrity audit"
- "Check for ethical violations"
- "Is anything misleading?"
- "LLM tell check"
- "Advisor wants an ethics check"
- "Pre-upload integrity check"

## Inputs

- All files in `sections/`.
- `context/VENUE.md` (review type, reviewer expectations).
- `pandoc/references.bib` or equivalent bibliography file.
- `pandoc/assets/` (supplementary material references).
- `.claude/memory/decision_*.md` (for cross-checking claims against recorded decisions).

## Audit categories

Findings are reported in **severity order**. Each category has a specific detection pattern.

### Category 1: Broken references and incomplete content

**What to look for:** Unresolved `??` placeholders from LaTeX `\ref{}`/`\label{}` failures. Missing bibliography entries (raw `[@key]` syntax in output). Empty tables or figures where prose describes content that isn't there. Placeholder values (`N/M`, `TBD`, `XX`).

**Why it matters:** Signals an unfinished paper. Reviewers question readiness.

### Category 2: Double-blind and anonymity violations

**What to look for:**
- **Tool + example combinations** that narrow the author set. A niche tool from a specific research group combined with a domain-specific example from the group's country is a strong signal even if neither alone is identifying.
- **Supplementary material metadata:** commit history, author names in code comments, repository URLs, institutional paths in file metadata.
- **First-person references to own prior work:** "our previous work showed" or "we extend [N]" where [N] is the authors' own paper.
- **Acknowledgments** that reveal funding sources or institutional affiliations.
- **Non-English regulatory examples** that localize the authors (e.g., a Hungarian enforcement decision combined with a Hungarian university's tool).

**Why it matters:** Violates the review process. Can result in desk rejection.

**Skip this category if** `context/VENUE.md` specifies single-blind or open review.

### Category 3: Factual claims requiring verification

**What to look for:** Claims attributed to a specific source where the source may not say what the paper claims. The pattern is:
1. The paper states "Source X says/shows/requires Y."
2. Source X likely says something related but different — a general principle, not the specific technical mechanism the paper attributes to it.
3. The gap between what the source says and what the paper claims creates a misleading impression.

**Detection heuristic:** Any sentence that attributes a specific technical requirement to a regulatory, legal, or standards body source. Any footnote that interprets an enforcement action as requiring a particular technology.

**Report format per finding:** Quote the paper's claim. State what the source likely says. Assess the interpretive gap. Rate risk: low (defensible interpretation), medium (requires argument not provided), high (likely misleading if a reviewer checks).

### Category 4: Overclaimed or imprecise statements

**What to look for:**
- **Universal negatives** ("no existing approach," "no deployed format") supported by limited survey evidence. A single counterexample breaks these.
- **Conflated concepts:** regulation vs. technical specification (e.g., "eIDAS mandates X" when the ARF specifies X), legal requirement vs. analytical interpretation (e.g., "operationally binding" for something that is the authors' own inference).
- **Non-standard terminology** presented as established (e.g., a coined classification like "operationally binding" that sounds like a legal term).
- **Capability claims for unreleased specifications** (e.g., "AnonCreds v2 supports X") without explicit "(planned)" or "(draft)" qualification.
- **"Without loss of generality" claims** where the substituted item and the original differ on at least one axis the paper analyzes.

### Category 5: Citation and attribution issues

**What to look for:**
- **Non-English primary sources** (government decrees, enforcement decisions) where a reviewer cannot verify the attributed content. Flag and suggest adding an English-language secondary source or inline translation of the relevant passage.
- **Wiki or community-edited sources** (e.g., GDPRhub) used as sole authority for factual claims. Suggest citing the primary source alongside.
- **Expired or superseded drafts** (IETF internet-drafts, W3C working drafts). Check whether the cited draft number is still current and whether capability claims still hold for the latest version.
- **Self-citation through tool provenance:** if the paper uses an open-source tool from a specific research group and the tool's documentation or repository identifies the authors.

### Category 6: Logical and structural gaps

**What to look for:**
- **Properties claimed but not enforced.** The paper says "the metamodel ensures X" but no constraint actually enforces X. Example: claiming acyclicity when only self-loops are prevented.
- **Circular reasoning.** A classification rule that relies on the absence of something that would only be present if the classification were already correct.
- **"Without loss of generality" that loses generality.** If the paper substitutes one format for another but later analyzes predicates where the two formats differ, the substitution is invalid.
- **Missing sections** referenced in the text. Forward references to "Section ??" or to a related work section that doesn't exist.
- **Contradiction between sections.** A capability claimed in the approach section but not demonstrated in the evaluation, or vice versa.

### Category 7: Evaluation methodology concerns

**What to look for:**
- **Conceptual baselines only.** Comparing against "manual expert review" or "single-layer metamodeling" without actually running an alternative tool. For tool-oriented venues, reviewers expect at least an attempt at comparison.
- **Results described but not shown.** The text says "experiment X confirms Y" but the data table is missing or empty.
- **Scale claims without justification.** "Exceeds the scale of current deployments" requires a citation or argument for what current deployment scale actually is.
- **Missing quantitative data** where the prose implies measurements were taken.

### Category 8: LLM tells and AI-generated content signals

**What to look for:**

**Vocabulary tells:**
- Cliched academic phrases: "game-changer," "leverage," "unlock potential," "delve," "testament," "at the end of the day," "in today's landscape," "it is important to note that," "this approach leverages."
- Filler intensifiers: "really," "just," "suddenly," "always," "quite," "significantly," "notably," "crucially."
- Hedge stacking: "It might perhaps be possible that..." — multiple hedges where one or zero would suffice.
- Overused metaphors: "journeys," "navigating," "symphonies," "pillars," "tapestry," "landscape."

**Structural tells:**
- Throat-clearing openers: paragraphs that start with generic context-setting for the entire field before getting to the point.
- Unnaturally uniform paragraph structure: every paragraph follows the same template (topic sentence, three supporting sentences, wrap-up).
- Em dash overuse as a stylistic crutch.
- Excessive bullet-point-like enumeration in running prose.
- Paragraphs that could appear in any paper in the field without modification.

**Reasoning tells:**
- Unmotivated passive voice throughout (not just in methods sections where it's conventional).
- Generic transitions that don't advance the argument: "Furthermore," "Moreover," "Additionally" used as paragraph openers without logical connectives.
- Conclusions that merely restate the abstract rather than synthesizing findings.

**Cross-reference:** Compare against the "What to avoid" list in CLAUDE.md. Any phrase on that list appearing in the paper is a flag.

## Steps

### 1. Read all section files

Read `sections/00_abstract.md` through `sections/07_conclusion.md` sequentially. Build a working list of all claims, citations, and forward references as you go.

### 2. Read venue context

Read `context/VENUE.md` for review type (double-blind, single-blind, open), page budget, and reviewer expectations. This determines whether Category 2 applies and calibrates the severity of other findings.

### 3. Per-section audit

For each section, scan every paragraph through all 8 category lenses. Record each finding with:
- **Quote:** the exact sentence or phrase.
- **Location:** `file_name:paragraph_number` or `file_name:heading`.
- **Category:** 1–8.
- **Explanation:** what specifically is wrong and why it matters for this paper at this venue.

### 4. Cross-section checks

After individual sections, check for:
- Claims in one section contradicted by evidence (or lack thereof) in another.
- Forward references to missing content.
- Terminology drift (same concept, different terms across sections).
- Coverage claims in the conclusion that don't match what the evaluation actually demonstrated.

### 5. Bibliography audit

Read the bibliography file. Check for:
- Entries referenced in section files that don't appear in the bibliography.
- Non-English sources used as sole authority for factual claims.
- Wiki or community-edited sources without a primary source backup.
- IETF/W3C drafts — verify the draft number is plausibly current.

### 6. Supplementary material check

Scan all references to supplementary material in section files. Flag:
- Any mention of repositories, tool URLs, or project pages.
- "The complete encoding is provided in the supplementary material" — check whether this creates a deanonymization vector through tool metadata.

### 7. LLM tell scan

Re-read all section files specifically through the Category 8 lens. This is a separate pass because LLM tells are easy to miss when reading for content. Count occurrences of flagged patterns and report density per section.

### 8. Report

Present findings grouped by category (H2 headers), in severity order (Category 1 first, Category 8 last). Within each category, findings are ordered by impact.

Each finding uses this format:

**[Bold label summarizing the issue.]** [Explanation: what the paper says, what's wrong with it, and what specifically should change. Include the exact quote and location.]

End the report with:

**Recommendation:** A prioritized paragraph stating what must be fixed before upload vs. what can wait for the revision window. Name the single most dangerous finding first.

### 9. Create todos

For each Category 1–3 finding (must-fix severity), create a todo in `context/todos/` with appropriate frontmatter.

## When to run

- Before any submission or grace period upload.
- When an advisor requests an ethics or integrity check.
- After `review_final_review` as a final gate.
- After major revisions that introduce new claims or citations.

## Output

- Severity-ordered findings report (8 categories).
- Prioritized recommendation paragraph.
- Todos for critical findings.

## Relationship to other skills

- **Complements** `review_pre_submission_check` — that skill handles mechanical issues; this skill handles substantive integrity.
- **Complements** `review_claim_evidence_audit` — that skill checks whether claims are *delivered*; this skill checks whether claims are *honest*.
- **Can follow** `review_final_review` — as a final integrity gate before upload.
- **Feeds into** `plan_revision_orchestration` — when findings require cross-cutting fixes.
