---
description: Scan section files for LLM writing tells — excess vocabulary, em-dash overuse, repeated template phrases, structural monotony. Use after drafting, before submission, or when prose feels machine-generated.
---

# Skill: Prose Naturalness Audit

**Purpose:** Deep prose scan for signals that reviewers or AI detectors associate with LLM-generated text. Distinct from `review_integrity_audit` Category 8 (which flags tells as pass/fail within a broad checklist): this skill runs three focused passes with concrete rewrite proposals. Based on Kobak et al. 2024 excess vocabulary research and documented AI detection heuristics.

## Trigger

- "LLM tell cleanup"
- "Prose naturalness check"
- "Does this read like AI?"
- "Check for AI writing patterns"
- After any major drafting pass

## Inputs

- All files in `sections/*.md` (excluding `abstract_submitted.md`)
- `CLAUDE.md` "What to avoid" section (authoritative style rules)

## Steps

### Pass 1: Vocabulary tells

Grep `sections/*.md` for research-backed excess vocabulary. Report file, line, full sentence context.

**High signal** (flag every occurrence):
delve, delves, delving, showcase, showcasing, underscore, underscores, underscoring, intricate, meticulous, meticulously, pivotal, realm, multifaceted, nuanced, noteworthy, groundbreaking, tapestry, fostering, bolstering, harnessing, spearheading, navigating, streamlining, revolutionizing, commendable, invaluable, indispensable, imperative

**Medium signal** (flag if 2+ occurrences or context is generic):
comprehensive, crucial, enhancing, notably, particularly, additionally, furthermore, moreover, consequently, importantly, specifically, novel, innovative, landscape, paradigm, robust, facilitate, leverage, utilize, encompasses, overarching, underpinning

**Structural tells** (grep + manual check):
- "It is important to note", "It is worth noting", "plays a crucial role", "In this context"
- Throat-clearing openers: sentence-initial "It is..." followed by hedge
- Generic transitions without logical content ("Furthermore," "Moreover," "Additionally" at sentence start)

For each finding: report location, quote context, classify as high/medium signal, propose a replacement or flag for human decision.

### Pass 2: Em-dash audit

**Policy: zero em-dashes.** The em-dash (—) is a documented LLM detection signal due to overuse in training data and RLHF preference.

1. Grep for `—` in all `sections/*.md` files
2. Count per file and per paragraph
3. For each em-dash, propose a specific replacement:
   - Parenthetical asides (>15 words): footnote (per project convention in `decision_prefer_footnotes.md`)
   - Short parenthetical asides: commas
   - Appositive lists after a clause: colon
   - Clause joiners: period + new sentence, or semicolon
   - "that is" / "for example" interjections: ", that is," / ", for example,"
4. Target: zero em-dashes remaining

### Pass 3: Repetition audit

1. Find any non-technical phrase appearing 3+ times across `sections/*.md`
2. Check for >3 consecutive sentences starting with the same word within a section
3. Check for uniform paragraph openers across sections (e.g., every paragraph starting with "The...")
4. For repeated phrases: propose variations that preserve the technical claim while varying expression

## Output

Summary table with columns: **File**, **Line**, **Pass** (1/2/3), **Issue**, **Severity** (high/medium), **Suggested fix**

Group by file for easy execution. High-severity items first within each file.

## Relationship to other skills

- **Complements** `review_integrity_audit`: Category 8 of the integrity audit covers LLM tells at a surface level; this skill goes deeper with research-backed patterns and rewrite proposals
- **Run after** any major drafting pass (consolidation pipeline, section rewrite)
- **Run before** `review_final_review` and `review_pre_submission_check`
