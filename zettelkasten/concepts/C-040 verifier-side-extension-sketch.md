---
id: C-040
title: Verifier-side extension sketch (what expressing RP governance would take)
type: concept
maturity: developing
tags: [topic/eidas, topic/governance, kind/metamodel, layer/cross, prov/self]
sources: ["context/threats_to_applicability_2026-06-18.html §4"]
related: ["[[C-037 relying-party-registration-regime]]", "[[C-038 relying-party-scope-gap]]", "[[D-013 verifier-scope-issuer-remit]]", "[[C-009 cross-layer-constraint]]"]
created: 2026-07-04
---

Expressing the relying-party regime would require four model elements the metamodel does not have:
a **Verifier/Relying-Party entity** carrying its registered intended-uses and a typed entitlement;
a **request relation** — the attributes an RP may ask for, per intended use; an **access-policy
predicate** over that relation, with over-asking as the violation (request ⊄ registration); and an
**access-certificate artifact** as the trust anchor, in place of the issuer-side trust assumption.
That is a missing entity class and a missing constraint family, not a tweak — the reason retrofitting
under deadline was rejected ([[D-013 verifier-scope-issuer-remit]]).

The method itself carries over: an over-asking check is structurally a cross-layer predicate
([[C-009 cross-layer-constraint]]) comparing request attributes against registered attributes. The
extension is therefore evidence *for* the approach — only the metamodel's entity vocabulary must grow,
not the constraint formalization.

## Links
- [[C-037 relying-party-registration-regime]] — the regime to be expressed.
- [[C-038 relying-party-scope-gap]] — the gap this sketch would close.
- [[D-013 verifier-scope-issuer-remit]] — the decision that names this as the extension axis.
- [[C-009 cross-layer-constraint]] — over-asking as an instance of the paper's core device.

## Source
Verifier-side extension analysis in `context/threats_to_applicability_2026-06-18.html` §4
(eIDAS-expressiveness framing pass, 2026-07-04).
