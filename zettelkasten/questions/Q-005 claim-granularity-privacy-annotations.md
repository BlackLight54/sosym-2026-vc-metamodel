---
id: Q-005
title: Should privacy annotations attach at claim granularity?
type: question
maturity: developing
tags: [layer/csl, topic/gdpr, prov/self]
sources: ["sections/05_evaluation.md §5.1.2"]
related: ["[[K-006 expressiveness-validation]]", "[[K-005 coverage-validation]]", "[[C-018 governance-annotations]]"]
created: 2026-06-16
---

Two partially expressible ARF constraints (ARF-C5 per-claim selective disclosability, ARF-C8 salted-hash
vs ZKP disclosure) require privacy annotations at **claim** granularity rather than format level. Should
the metamodel support them?

## Why it matters
Closes the second root cause of partial expressiveness and refines the coverage claim. Claim-level
privacy is also a prerequisite for richer GDPR operationalization.

## Status
Closable by extending the metaclass hierarchy (claim-level privacy markers); no change to the
formalization approach.

## Links
- [[K-006 expressiveness-validation]], [[K-005 coverage-validation]] — claims it strengthens.
- [[C-018 governance-annotations]] — annotations to refine to claim level.

## Source
§5.1.2.
