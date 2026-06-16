---
id: C-013
title: Cross-layer constraint taxonomy (C1–C9)
type: concept
maturity: permanent
tags: [layer/cross, kind/predicate, topic/governance]
sources: ["sections/04_approach.md §4.4 tab:constraint_taxonomy"]
related: ["[[C-009 cross-layer-constraint]]", "[[C-025 governance-conflict-vertical]]", "[[C-026 cross-credential-predicate-gap-horizontal]]", "[[C-014 trace-reference]]", "[[C-022 eidas-arf-format-mandate]]", "[[C-035 dependent-claim-bundling]]", "[[C-036 static-dynamic-revocation-mismatch]]"]
created: 2026-06-16
---

Nine constraints exercised in the running example, classified by source and layer scope:

| # | Constraint | Source | Layers |
|---|---|---|---|
| C1 | Entity alignment | Structural | DCL↔CSL |
| C2 | Trace consistency | Structural | DCL→CSL |
| C3 | No empty credential | Structural | CSL |
| C4 | Cross-credential value dependency | Domain rule | DCL horizontal |
| C5 | Format mandate | eIDAS ARF | FSL |
| C6 | Predicate proof required | GDPR Art. 5(1)(c) | DCL↔FSL |
| C7 | VCDM conformance | W3C VCDM 2.0 | CSL↔FSL |
| C8 | **Governance conflict** | C5+C6+C7 | FSL |
| C9 | Cross-credential predicate gap | Format limitation | DCL↔FSL |

C1–C3 are metamodel-enforced; C4 grounded in regulation; C5–C7 originate from independent governance
frameworks; **C8 and C9 are cross-layer results** that emerge only when constraints from multiple
sources and layers are checked jointly. They are the paper's two headline results.

## Links
- [[C-009 cross-layer-constraint]] — the general device.
- [[C-025 governance-conflict-vertical]] — C8.
- [[C-026 cross-credential-predicate-gap-horizontal]] — C9.
- [[C-014 trace-reference]] — C1/C2. [[C-022 eidas-arf-format-mandate]] — C5.

## Source
`sections/04_approach.md §4.4`, constraint taxonomy table.
