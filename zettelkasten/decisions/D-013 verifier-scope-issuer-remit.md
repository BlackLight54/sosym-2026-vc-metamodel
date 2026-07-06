---
id: D-013
title: Verifier-side governance — issuer-side remit, verifier axis named as extension
type: decision
maturity: permanent
tags: [topic/governance, topic/eidas, kind/method, prov/self]
sources: ["context/threats_to_applicability_2026-06-18.html §0 Decision A"]
related: ["[[C-038 relying-party-scope-gap]]", "[[C-040 verifier-side-extension-sketch]]", "[[C-037 relying-party-registration-regime]]", "[[S-035 cir-2025-848-rp-registration]]", "[[D-016 dated-snapshot-method-over-catalogue]]"]
created: 2026-07-04
---

The paper's remit is **issuer-side credential design**. Verifier-side (relying-party) governance —
RP registration under CIR (EU) 2025/848 — is **named explicitly as the adjacent extension axis** of the
same cross-layer-constraint method, cited as breadth evidence that multi-source governance is pervasive.
It is neither modeled nor left silent.

## Rationale
Three options were weighed. Staying silent (the pre-decision draft state) hands the adversarial reviewer
"you model half the governance". Retrofitting the verifier axis under deadline is a missing entity class
and constraint family, not a tweak ([[C-040 verifier-side-extension-sketch]]). Naming the boundary
converts a genuine gap into evidence for the approach: an over-asking check is structurally a cross-layer
predicate (requested attributes against registered attributes), so the *method* carries over even though
the current metamodel does not express it.

## Commits the paper to
A §5.3 external-validity paragraph that names the issuer/verifier boundary and cites CIR 2025/848 as
breadth evidence rather than leaving the verifier axis silent.

## Links
- [[C-038 relying-party-scope-gap]] — the threat this decision resolves.
- [[C-040 verifier-side-extension-sketch]] — what the named extension would take.
- [[S-035 cir-2025-848-rp-registration]] — the instrument cited as breadth evidence.

## Source
eIDAS-expressiveness framing pass (2026-07-04, PR #3), Decision A in
`context/threats_to_applicability_2026-06-18.html`.
