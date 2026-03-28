---
id: "X04"
short: "tool-demo"
title: "Include concrete Refinery tool output for automated checking claim"
status: pending
priority: high
depends_on: []
binding_claims: [4]
target: "sections/05_evaluation.md, sections/04_approach.md"
pipeline: "x-crosscutting"
assigned: "martin"
created: "2026-03-28"
---

## Problem

The paper claims "automated consistency checking through design space exploration" (abstract) and describes three usage modes (consistency checking, error identification, design space exploration). However, all three modes are described narratively — no actual Refinery output is shown anywhere in the paper. The reader must trust the tool produces what is described.

This is a contribution delivery issue for Binding Claim #4 ("automated consistency checking demonstration"). The abstract's "automated" qualifier is load-bearing: without tool output, the contribution reduces to "a metamodel that could be checked automatically if someone ran the tool."

@TODO markers at Sec 04 line 113 and Sec 05 line 62 explicitly flag this gap but Z01 triage item T08 only strips the markers without addressing the underlying content gap.

## Source

- X02 (Claim-Evidence Audit): Critical issue C-2
- X03 (Reviewer Simulation): Reviewer A Q1 ("Can you provide scalability measurements?"), Q3 ("Could you clarify what 'diverse model instances' means operationally?")
- X04 (CFP Compliance): Marker inventory item 19

## Goal

Include at least one concrete piece of Refinery tool output in the paper. Options (in decreasing impact order):

1. **UNSAT result for Headline 1** — Show the Refinery `check -k` output demonstrating that the governance conflict (C5+C6+C7 conjunction) yields unsatisfiability. This directly supports the strongest result. Could appear in Sec 05.1.3.
2. **Generated model excerpt** — Show 3-4 lines of a generated partial model for the CSOK scenario with N=3 credentials. Could appear in Sec 04.4 usage mode walkthrough.
3. **Error predicate firing** — Show the `income_governance_conflict` error predicate evaluating to MUST in the three-valued interpretation. Could appear in Sec 05.1.3 Headline 1.

## Constraints

- Decision 15 prohibits code listings in the paper body. Tool output is not code — it is experimental evidence. A solver result (SAT/UNSAT with statistics) or a model excerpt (graph notation) is appropriate.
- Page budget is tight. The output should be 3-5 lines maximum, possibly as an inline listing or a small figure.
- Martin needs to run Refinery and capture the actual output. This todo is assigned to Martin for the tool run; Claude can format the output into the paper once provided.

## Acceptance criteria

- At least one concrete Refinery output appears in the paper (Sec 04.4 or Sec 05.1.3)
- The output directly supports Binding Claim #4 (automated consistency checking)
- The output is presented as experimental evidence, not as a code listing
- The @TODO at Sec 05 line 62 is resolved with actual content (not just stripped)
