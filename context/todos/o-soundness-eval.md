---
id: "O-SOUND"
short: "soundness-eval"
title: "Add soundness/completeness model properties to evaluation"
status: pending
priority: high
depends_on: ["O-REFBG"]
binding_claims: [4, 9]
target: "sections/05_evaluation.md"
pipeline: ""
assigned: "claude"
created: "2026-03-28"
---

## Goal

Add a "Model Properties" subsection to Sec 05 (evaluation) that states the soundness and completeness guarantees of the Refinery-based formalization. Connect to CORE-DISC properties framework.

## Context (from consultation notes)

Oszkár: "6.3-ba el kell mondani a modellek jó tulajdonságait: helyesek! sound and complete." (In 6.3 [our Sec 05] we must state the good properties of the models: they are correct! Sound and complete.)

The CORE-DISC framework (Consistency, Realistic, Diverse, Scalable) structures Refinery's graph generation properties. Our contribution primarily delivers Consistency. The evaluation must:

1. **Soundness claim:** If the tool reports a constraint violation, the violation is real (no false positives). If we generate a model, it satisfies all declared constraints.
2. **Completeness claim:** If a constraint is violated in the design, the tool detects it.
3. **CORE-DISC mapping:** State which properties the approach addresses:
   - Consistency: primary (soundness/completeness)
   - Diverse: briefly — design space exploration produces distinct valid configurations
   - Scalable: briefly — connect to scalability evaluation subsection
   - Realistic: explicitly out of scope
4. **Positioning:** Better guarantees than random (Erdős-Rényi) graph generation or LLM-based approaches — neither provides formal constraint satisfaction.

## Dependencies

- Depends on `O-REFBG`: the mathematical foundations in Background must define the terms used here.
- See `decision_soundness_completeness.md` and `decision_core_disc_properties.md` for full rationale.

## Acceptance criteria

- [ ] Sec 05 contains a subsection stating soundness and completeness properties
- [ ] Each CORE-DISC property addressed (even if "out of scope")
- [ ] Positioning against random/LLM baselines stated
- [ ] All terms used are defined in Background or at first use
