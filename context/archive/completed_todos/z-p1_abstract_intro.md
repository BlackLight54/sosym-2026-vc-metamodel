---
id: "Z-P1"
short: "abstract-intro"
title: "Abstract + Introduction overclaim fixes and restructuring"
status: done
depends_on: ["Z-P2"]
binding_claims: [1, 10]
target: "sections/00_abstract.md, sections/01_introduction.md"
priority: high
pipeline: "z01-triage"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Fix overclaims in abstract, restructure introduction paragraphs, and compress redundancy. This todo bundles Z01 items T05, T06, T10, T19, T20, T21, T22, T27, T42, T43.

**Prerequisite:** Z-P2 must run first (multi-layer rename must be stable before editing intro prose).

## Read before writing

1. `sections/00_abstract.md` — current abstract text
2. `sections/01_introduction.md` — current introduction
3. `sections/03_overview.md` — running example name (for T43)
4. `.claude/memory/claim_*.md` — binding claims #1-#10

## What to draft

### Abstract fixes

**T05 — "no existing tool" overclaim (line 25):**
The phrase "no existing tool checks their cross-layer consistency" is a universal negative. Replace with a scoped claim: "yet no formal framework captures their cross-layer interactions or checks their joint consistency." This avoids asserting the non-existence of all tools.

**T06 — "prerequisite" necessity overclaim (line 27):**
The final sentence "These results establish multi-layer formal modeling as a prerequisite for rigorous credential ecosystem design" claims necessity. Replace with sufficiency: "These results demonstrate that multi-layer formal modeling reveals credential ecosystem design errors invisible to single-layer approaches."

**T27 — "information graphs" undefined (line 26):**
The phrase "captures domain-level claim properties as information graphs" uses "information graphs" without definition. Replace with "as typed graph structures" or drop the prepositional phrase entirely.

### Introduction fixes

**T10 — Gap claim scope (line 20):**
The phrase "yet no existing approach integrates these cross-layer constraints into a single multi-level formal model" is too broad. Scope to match the C5 correction (already applied by O03): "yet no multi-layer formalization captures the cross-layer constraints spanning domain semantics, credential structure, and format-specific representation."

**T19 — Split P2 (line 22):**
Introduction P2 is overloaded — it covers cross-source interaction, the income example, the tool gap, AND the per-layer tool enumeration. Split into:
- P2a (3 sentences): Cross-source constraint interaction. The income example: eIDAS mandates format, GDPR requires privacy, neither anticipates the other. Independent governance peers whose design goals may be formally irreconcilable.
- P2b (3 sentences): Tool gap. Existing tools operate at single layers. No tool checks cross-layer consistency. A credential schema well-formed in isolation may violate cross-layer constraints.

**T20 — C3 headline preview (line 32):**
Contribution C3 currently reads "A three-axis validation demonstrating..." but does not preview the headline results. Add: "...including the detection of two cross-layer design errors — a governance conflict and a format expressiveness gap — undetectable by single-layer analysis."

**T21 — C2 usage mode cleanup (line 31):**
C2 currently says "supporting consistency checking, error identification, and design space exploration." Remove — usage modes belong in Sec 3.2, not the contribution list. Keep C2 focused on the formalization itself.

**T22 — P4 compression (line 34):**
P4 (the paragraph after the contribution list) restates the three layers redundantly with the contribution list. Cut the layer enumeration. Keep only: (a) that cross-layer constraints are formalized as graph predicates in Refinery, (b) that Refinery generates model instances or reveals contradictions, and (c) a forward reference to the running example.

**T42 — Structure paragraph compression (line 38):**
The structure paragraph is currently 7 lines. Compress to 4-5 sentences by removing internal subsection references (\autoref{sec:motivation}, \autoref{sec:functional-overview}, \autoref{sec:usage-workflow}) — just reference each top-level section with its purpose.

**T43 — Name running example in intro (line 34):**
The running example (CSOK housing subsidy scenario) is not named in the introduction. Add a phrase in P4 or the structure paragraph: "A housing subsidy credential scenario serves as the running example throughout."

### Verification after edits

**O03 (soften C5) and X01 (GDPR hedge) are already done** — verify their corrections are present in the current text before editing. Do not revert them.

## Constraints

- Preserve all 10 binding claims — verify each is still present after edits
- Stay within ~1.25-page intro budget (7 paragraphs + contribution list)
- No LLM tells, no academic filler
- Match existing register — formal, compressed
- Use `\autoref{}` for cross-references
- Note: "multi-level" will already be "multi-layer" after Z-P2 runs

## Acceptance criteria

- [ ] No universal negative claims in abstract ("no existing tool" → scoped)
- [ ] Final abstract sentence claims sufficiency not necessity
- [ ] "information graphs" absent from abstract
- [ ] Intro P2 split into two focused paragraphs
- [ ] C3 previews headline results
- [ ] C2 does not list usage modes
- [ ] P4 compressed — no redundant layer enumeration
- [ ] Structure paragraph ≤5 sentences
- [ ] Running example named in intro
- [ ] All 10 binding claims still present
- [ ] O03 and X01 corrections preserved
