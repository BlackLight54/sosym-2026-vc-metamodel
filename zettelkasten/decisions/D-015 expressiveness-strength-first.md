---
id: D-015
title: eIDAS expressiveness result framed strength-first, partials owned
type: decision
maturity: permanent
tags: [topic/eidas, topic/evaluation, kind/method, prov/self]
sources: ["context/threats_to_applicability_2026-06-18.html §0 Decision C"]
related: ["[[K-006 expressiveness-validation]]", "[[Q-004 attestation-qualification-levels]]", "[[Q-005 claim-granularity-privacy-annotations]]"]
created: 2026-07-04
---

The eIDAS expressiveness result — the highest-risk binding claim — is framed **strength first, then the
partials are owned**: all eight ARF constraints are expressible (three fully, five partially, none
outside the metamodel), immediately followed by a paragraph stating plainly what "partial" means and why,
naming the two root causes.

## Rationale
Two alternatives were rejected. Headlining the result and leaving the partials unexamined invites the
adversarial reviewer to attack the gap; limitation-first undersells a genuinely positive result. Stating
what partial expressibility means, and why, is more credible than a clean headline and disarms the
objection before it is raised.

## Commits the paper to
A short "what partial expressibility means and why" paragraph in §5.1.2 naming the two gaps:
attestation-qualification levels ([[Q-004 attestation-qualification-levels]]) and claim-granularity
privacy annotations ([[Q-005 claim-granularity-privacy-annotations]]).

## Links
- [[K-006 expressiveness-validation]] — the claim this framing protects.
- [[Q-004 attestation-qualification-levels]], [[Q-005 claim-granularity-privacy-annotations]] — the two
  named root causes (closing either strengthens the claim).

## Source
eIDAS-expressiveness framing pass (2026-07-04, PR #3), Decision C in
`context/threats_to_applicability_2026-06-18.html`.
