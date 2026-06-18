---
id: C-016
title: Format-capability matrix
type: concept
maturity: permanent
tags: [layer/fsl, topic/format, kind/metamodel]
sources: ["sections/04_approach.md §4.3 tab:format_capabilities", "sections/02_background.md §2.1"]
related: ["[[C-004 format-specific-layer]]", "[[C-017 capability-driven-format-elimination]]", "[[C-025 governance-conflict-vertical]]", "[[C-026 cross-credential-predicate-gap-horizontal]]", "[[C-033 dual-issuance-mandate]]", "[[S-028 eudiw-arf-status-2026]]", "[[Q-009 functional-extrafunctional-capability-matrix]]"]
created: 2026-06-16
---

Six capability predicates derived from the format class hierarchy, over the five in-scope formats:

| Capability | AnonCreds | JSON-LD | JWT-VC | SD-JWT-VC | mdoc |
|---|:--:|:--:|:--:|:--:|:--:|
| `supports_predicate_proof` | ✓ | — | — | — | — |
| `supports_selective_disclosure` | ✓ | ✓ | — | ✓ | ✓ |
| `conforms_vcdm` | — | ✓ | ✓ | ✓ | — |
| `supports_zkp` | ✓ | — | — | — | — |
| `supports_offline_verification` | — | — | — | — | ✓ |
| `supports_multi_credential_proof` | — | — | — | — | — |

The decisive asymmetry: **selective disclosure is broadly available; predicate proofs are restricted to
AnonCreds; AnonCreds does not conform to VCDM**. And `supports_multi_credential_proof` is empty for
every format. These two facts directly produce the two headline results.

## Links
- [[C-004 format-specific-layer]] — where capabilities live.
- [[C-017 capability-driven-format-elimination]] — capabilities drive propagation.
- [[C-025 governance-conflict-vertical]] — predicate-proof vs VCDM asymmetry.
- [[C-026 cross-credential-predicate-gap-horizontal]] — empty multi-credential column.

## Source
`sections/04_approach.md §4.3`, format-capability table; `sections/02_background.md §2.1`.
