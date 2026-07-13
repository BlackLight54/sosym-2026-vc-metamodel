---
id: "AF01"
short: "error-taxonomy"
title: "Construct the design-error taxonomy (X.509-motivated, corpus-grounded)"
status: pending
priority: high
depends_on: []
binding_claims: []
target: "zettelkasten/ (new K-note + C-notes), later a dedicated section via the spine"
pipeline: "advisor-2026-07-06"
assigned: "claude"
created: "2026-07-13"
---

Build the design-error taxonomy the paper closes with, per the 2026-07-06 advisor consultation
and D-020.

Context (self-contained). The advisor mandated: the closing element of the paper is a
design-error taxonomy for VC ecosystems. Motivation comes from the X.509/PKI precedent (a
documented design and deployment error history), NOT from our own examples ("ne koldokot
nezzunk" / no navel-gazing). The taxonomy must stay in sync with the two headline examples
(vertical income conflict, horizontal floor-area gap, decision memory
decision_two_headline_results) and be systematic rather than anecdotal. The advisor also asked
for an "honest prompt" step: here is where we stand, help identify the design-error threats
worth addressing.

Inputs when unblocked:
- `context/slr/corpus_map.md` section "X.509 precedent grounding" and `context/slr/axis_d.md`
  (verified PKI failure-taxonomy corpus).
- `context/slr/axis_a.md` and `axis_e.md` for ecosystem-level and protocol-level error
  neighbors.
- M-013 guardrails (vocabulary, refuted claims); D-020 (scope of the RQ0/taxonomy promise).

Steps:
1. Threat elicitation ("honest prompt"): from the corpus and the two headline examples,
   enumerate candidate design-error classes; each class needs at least one documented X.509
   precedent or one corpus-verified VC-world instance. No class rests on our own examples
   alone.
2. Organize into a taxonomy whose dimensions map onto the three-layer metamodel where
   possible (which layer or layer-pair the error spans); classes that do not map are named
   explicitly as out-of-model.
3. Record as a new K-note (taxonomy claim) plus C-notes per class; add the M-011 row with the
   corpus map as evidence; keep the claim `[proposed]` until Martin approves wording.
4. Sync check against the two headline examples: each must land in exactly one class.

Acceptance: K-note + M-011 row exist; every class carries a verified precedent citation or a
corpus-verified instance; check_links.sh at 0 errors; no em dashes.
