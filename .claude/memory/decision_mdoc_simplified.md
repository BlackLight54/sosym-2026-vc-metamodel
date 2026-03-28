---
name: "mdoc simplified away"
description: "Running example uses SD-JWT-VC only — mdoc mentioned in Background but simplified away"
type: project
date: 2026-03-24
status: active
affects: "Sec 02 (background), Sec 04.3, Sec 05.1.3, teaser figure"
revisit_when: "If a reviewer demands mdoc coverage"
tags: scope, formats
---

**Decision:** Mention both SD-JWT-VC and mdoc in Background. Running example uses SD-JWT-VC only: "since both lack predicate proof support, we focus on SD-JWT-VC without loss of generality."
**Rationale:** Adding mdoc doubles FSL visual complexity without adding analytical insight. Both formats lack predicate proofs. Conflict is identical.
**Why:** Scope management — avoid doubling complexity for no analytical gain.
**How to apply:** Background introduces both formats. Running example and evaluation use SD-JWT-VC only with explicit justification.