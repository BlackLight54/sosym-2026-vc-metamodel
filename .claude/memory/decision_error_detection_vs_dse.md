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

The Refinery-based approach supports three usage modes (evolved from Imre's original two-modality distinction):

1. **Consistency checking** — given a complete or near-complete design, confirm it satisfies all constraints. Output: **OK** or **UNSAT**.
2. **Error identification** — given a partial or complete design with suspected problems, evaluate error predicates and return specific violations. Output: **NOT_OK(errors)** with named constraint violations.
3. **Design space exploration (DSE)** — given a partial model with open design choices, generate diverse valid completions or prove none exist. Output: **GENERATED(possible_design)** or **UNVIABLE(reasons)**.

**Origin (Imre, 2026-03-25):** "Error detection: concrete model + error edge, DSE: diverse graph generation." The paper refined this into three modes by separating the "everything OK" confirmation (mode 1) from the "here are the specific errors" diagnostic (mode 2).

**Status in prose:** Three usage modes defined in Sec 03.2 (Functional Overview) and exercised throughout Sec 04–05.
