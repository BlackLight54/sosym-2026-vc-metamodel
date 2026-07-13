---
name: "Three-axis validation framing"
description: "Evaluation structured as coverage (vs. W3C VCDM), expressiveness (vs. eIDAS ARF), error detection (vs. anti-patterns) — load-bearing for §5 structure"
type: project
status: active
date: "2026-03-29"
source: "Emerged organically during drafting; recorded during prior decision audit"
affects: ["Sec 00 (abstract)", "Sec 01 (introduction, contribution 3)", "Sec 05 (evaluation structure)"]
revisit_when: "if evaluation axes are added or removed"
---

The evaluation is framed as a "three-axis validation":

1. **Coverage** — metamodel coverage against W3C VCDM 2.0 (§5.1 Coverage)
2. **Expressiveness** — constraint expressiveness against EU regulatory sources, specifically eIDAS ARF v2.9.0 (§5.1 Expressiveness; re-verified against the v2.9.0 primary text 2026-07-13, see S-034)
3. **Error detection** — detection against known credential design anti-patterns, including two headline results (§5.1 Headlines, Anti-Patterns)

This framing appears in the abstract ("We validate coverage against the W3C specification, expressiveness against EU regulatory sources, and error detection against known anti-patterns"), the introduction (contribution 3), and structures the entire elaboration subsection of §5.

**Why:** The three axes map to three distinct validation concerns: does the metamodel cover the standard it claims to formalize (coverage), can the constraints express real governance requirements (expressiveness), and does the formalization catch real design problems (error detection). Each axis has a different evidence type.

**How to apply:** Any change to §5 structure must preserve this three-axis framing or update all three locations (abstract, intro, eval) simultaneously.
