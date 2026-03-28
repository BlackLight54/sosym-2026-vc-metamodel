---
name: "Comparative claims need the 'why', not just the 'what'"
description: "When comparing tools/approaches, explain WHY one is better — mechanism, not just difference"
type: feedback
---

When drafting comparative claims (e.g., tool A vs. tool B), don't just state that they differ — explain WHY the difference matters. Name the mechanism.

**Why:** In Z-P2, the Alloy/OCL differentiation paragraph stated that Alloy uses SAT-based enumeration vs. Refinery's constraint propagation. Martin said: "say why set-based enumeration rather than constraint propagation is better." The approved version added: "re-encoding the entire problem for each candidate instance" — naming the mechanism that makes the difference consequential.

**How to apply:** For every "X does A, Y does B" comparison, add a sentence explaining the operational consequence. "Alloy relies on SAT-based enumeration rather than incremental constraint propagation, re-encoding the entire problem for each candidate instance" beats "Alloy uses SAT-based enumeration, not constraint propagation."