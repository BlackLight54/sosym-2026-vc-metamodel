---
id: "FR-C4"
short: "abstract-scope-overpromise"
title: "Abstract overpromises scope: 'community-governed decentralized identity systems' not analyzed"
status: pending
priority: high
depends_on: []
binding_claims: []
target: "sections/00_abstract.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Narrow the abstract's scope framing to match the paper's actual coverage.

## Context

Line 24 of `sections/00_abstract.md` states:

```
Such ecosystems are being deployed under diverse governance frameworks, from EU Digital Identity Wallets to community-governed decentralized identity systems, whose design constraints span...
```

The paper analyzes only EU governance context: eIDAS ARF, GDPR, W3C VCDM 2.0. "Community-governed decentralized identity systems" (e.g., Sovrin, Hyperledger Indy communities) are never analyzed, referenced as evaluation targets, or used as constraint sources. The only non-EU governance source in scope is the W3C VCDM specification, which is standards-governed, not community-governed.

This was identified in the final review as **critical** because the Adversarial reviewer will use scope overpromise as evidence of overclaiming: "The abstract claims to address community-governed systems but the evaluation is entirely EU-centric."

## Reviewer impact

- **Adversarial:** Direct attack vector — overclaiming in abstract.
- **Mathematician:** Will note the gap between abstract claim and evaluation scope.
- **Champion:** Undermines the champion argument if the scope is seen as inflated.

## Action

Replace "from EU Digital Identity Wallets to community-governed decentralized identity systems" with phrasing that accurately represents the paper's scope. Options:

**Option A:** "from EU Digital Identity Wallets to W3C standards-governed interoperability frameworks"

**Option B:** "including EU Digital Identity Wallets governed by multiple regulatory and technical specifications"

**Option C:** Simply cut the range: "Such ecosystems are being deployed under diverse governance frameworks whose design constraints span..."

Option C is the most defensive; Option B is the most informative.

Also check: line 24 says "community specifications" later in the paragraph — this is fine (AnonCreds is a community specification), but "community-governed decentralized identity systems" implies a broader class of governance systems the paper doesn't cover.

## Acceptance criteria

- The abstract does not claim coverage of governance contexts the paper does not analyze.
- The framing still conveys that the problem applies broadly (not just to EU), without overpromising.
