---
name: "Error detection vs. DSE: two distinct modalities"
description: "Distinguish error detection (concrete model + error edge) from design space exploration (diverse graph generation) as two evaluation modalities"
type: project
status: active
date: "2026-03-25"
source: "Imre (meeting 2026-03-25 18:00)"
affects: ["Sec 03.2 functional overview", "Sec 04 usage modes", "Sec 05 evaluation"]
revisit_when: "if Refinery usage modes are redefined"
---

Two distinct modalities of the Refinery-based approach must be clearly separated:

1. **Error detection / consistency checking** — given a concrete (fully specified) model, determine whether it satisfies all constraints. Output: OK or NOT_OK(errors) with specific error predicates identifying which constraints are violated.
2. **Design space exploration (DSE)** — given a partial model with underspecified elements, generate diverse valid completions. Output: GENERATED(possible_design) or UNVIABLE(reasons) if no valid completion exists.

**Rationale (Imre's words):** "Error detection: concrete model + error edge, DSE: diverse graph generation."

These map to different use cases and different evaluation strategies. Error detection validates a given design; DSE helps explore the design space when the designer hasn't committed to specific choices.

**Status in prose:** Three output modes defined in Sec 03.2 (Functional Overview): OK, NOT_OK(errors), GENERATED/UNVIABLE.
