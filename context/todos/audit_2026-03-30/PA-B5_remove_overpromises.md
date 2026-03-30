---
id: "PA-B5"
short: "remove-overpromises"
title: "Remove unfulfilled forward reference and abstract scope overpromise"
status: pending
priority: high
depends_on: []
binding_claims: []
target: "sections/05_evaluation.md, sections/00_abstract.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Two quick cuts that remove claims the paper does not deliver.

## Fix 1 — Unfulfilled ARF-C7 forward reference (B5)

`sections/05_evaluation.md` line 21 contains a forward reference stating that the significance of ARF-C7 for the layered architecture is "discussed in \autoref{sec:conclusion}." The conclusion never mentions ARF-C7.

**Action:** Delete the forward reference clause. Keep the ARF-C7 observation itself — just remove the promise that the conclusion will discuss it. If the sentence reads naturally without the clause, simply delete it. If not, rephrase to make the ARF-C7 observation self-contained in the evaluation.

## Fix 2 — Abstract "community guidelines" overpromise (H5)

`sections/00_abstract.md` line 24 (approximate) references "community-governed decentralized identity systems" or "community guidelines" as a governance source. The paper analyzes only three governance sources: eIDAS ARF, GDPR, and W3C VCDM 2.0. No community governance system is examined anywhere.

**Action:** Either delete "community guidelines" / "community-governed" from the abstract, or soften the phrasing to make the list illustrative rather than exhaustive (e.g., "governance frameworks such as W3C standards and EU regulations").

## Acceptance criteria

- [ ] No forward reference to conclusion about ARF-C7 remains in Sec 05
- [ ] Abstract does not promise governance source types the paper does not analyze
