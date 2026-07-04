---
id: D-017
title: mdoc simplified away in the running example (w.l.o.g.)
type: decision
maturity: permanent
tags: [topic/format, kind/example, kind/method, prov/self]
sources: [".claude/memory/decision_mdoc_simplified.md"]
related: ["[[C-021 csok-running-example]]", "[[C-033 dual-issuance-mandate]]", "[[C-016 format-capability-matrix]]", "[[C-022 eidas-arf-format-mandate]]"]
created: 2026-07-04
---

The background introduces both mandated formats (SD-JWT-VC and mdoc); the running example and evaluation
use **SD-JWT-VC only**, with the explicit justification "since both lack predicate proof support, we
focus on SD-JWT-VC without loss of generality."

## Rationale
Adding mdoc doubles the FSL's visual complexity without analytical gain: both mandated formats lack
predicate proofs ([[C-016 format-capability-matrix]]), so the income conflict is identical under either.

## Revisit for the journal
The dual-issuance mandate ([[C-033 dual-issuance-mandate]]) makes the format rule conjunctive — a PID
must be issued in *both* formats — which strengthens Headline 1 (no escape by picking the more capable
format) but is invisible under the w.l.o.g. simplification. The journal version should decide whether to
model dual issuance explicitly rather than simplify mdoc away; a reviewer demanding mdoc coverage is the
recorded revisit trigger.

## Links
- [[C-021 csok-running-example]] — where the simplification applies.
- [[C-033 dual-issuance-mandate]] — the rule that pressures this decision.

## Source
`.claude/memory/decision_mdoc_simplified.md` (2026-03-24).
