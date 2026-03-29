---
id: "A-BG2"
short: "notation-consistency"
title: "Introduce Refinery notation in BG, reference consistently in Sec 04"
status: pending
priority: medium
depends_on: ["A-BG1"]
binding_claims: [3, 4]
target: "sections/02_background.md, sections/04_approach.md"
pipeline: "advisor-2026-03-29"
assigned: "claude"
created: "2026-03-29"
---

## Goal

Ensure Sec 04 references the Refinery notation introduced in Sec 2.3 (BG) rather than re-introducing concepts. Every Refinery term used in Sec 04 and 05 must have a corresponding definition or gloss in Sec 2.3.

## Context

Advisor feedback (2026-03-29): "be kell vezetni egy nyelvezetet a backgroundban a refinery-re, és akkor azt kell használni" (Introduce a notation for Refinery in background, then use it consistently). "a background utáni szövegek nem a backgroundra hivatkoznak, hanem csak úgy lebegnek" (Text after background doesn't reference background, concepts just float).

**Overlaps with X14** (Refinery terminology introduction). A-BG2 subsumes X14 with the additional requirement that BG must define the notation first (via A-BG1's code example).

## What to do

1. **Audit Sec 04 for first-use of Refinery terms.** For each, verify it is either:
   - Defined in Sec 2.3 (BG) — add `\autoref{sec:refinery}` reference at first use in Sec 04
   - New to this paper's contribution — define inline in Sec 04 with a forward/back reference

   Terms to check (from X14's audit list):
   - `error predicate`, `propagation rule`, `shadow predicate`, `scope constraint` — should be in BG
   - `partial model`, `four-valued interpretation`, `concretization` — should be in BG
   - `graph predicate`, `negative elimination`, `refinement` — should be in BG
   - `check`, `check -k`, `generate` (solver operations) — should be in BG

2. **Add `\autoref{sec:refinery}` references** in Sec 04 where Refinery concepts are used. Example: "propagation rules (\autoref{sec:refinery}) narrow the design space" instead of re-explaining what a propagation rule is.

3. **Verify Sec 05** (evaluation) similarly references BG or Sec 04, not free-floating terms.

## Acceptance criteria

- [ ] Every Refinery term in Sec 04 has a BG definition or is explicitly new
- [ ] First use of BG-defined terms in Sec 04 includes `\autoref{sec:refinery}`
- [ ] No Refinery concept is explained from scratch in both BG and Sec 04
- [ ] X14 can be marked as done after this todo completes
