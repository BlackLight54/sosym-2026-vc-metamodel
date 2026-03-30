---
id: "CUT-6"
short: "abstract-community-overpromise"
title: "Remove 'community guidelines' overpromise from abstract"
status: done
priority: high
depends_on: []
binding_claims: []
target: "sections/00_abstract.md"
pipeline: "final-cut"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Remove or soften the "community guidelines" mention in the abstract that promises governance source diversity the paper does not deliver.

## Context

From the paper audit synthesis (Z01, item H5/X1): The abstract (00_abstract.md, line ~11) lists "W3C standards, EU regulations, and community guidelines" as governance framework types. The paper analyzes only W3C and EU sources. "Community guidelines" (e.g., from decentralized identity communities) are never analyzed anywhere. This is an overpromise that the Adversarial reviewer will flag.

## Action

Either:
- **Delete** "community guidelines" entirely, leaving "W3C standards and EU regulations" (saves a few words)
- **Soften** to "such as W3C standards and EU regulations" making the list illustrative, not exhaustive

The first option also saves a small amount of space.

## Acceptance criteria

- The abstract does not promise analysis of governance sources not covered in the paper
