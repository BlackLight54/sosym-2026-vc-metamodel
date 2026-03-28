---
id: "X01"
short: "gdpr-hedge"
title: "Hedge 'formally contradictory' in abstract for GDPR operationalization"
status: done
priority: medium
depends_on: []
binding_claims: [8]
target: "sections/00_abstract.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

The abstract states that governance constraints are "formally contradictory" without qualifying that constraint C6 (GDPR data minimization requiring predicate proof capability) depends on the authors' operationalization of GDPR, not on a direct regulatory mandate.

The paper body correctly hedges this in Sec 05.1.3 Headline 1, which explicitly labels C6 as "authors' operationalization" with two inferential steps and cites the NAIH 35M HUF enforcement precedent (bank fined for copying pregnancy booklets). This two-tier framing was a deliberate design decision (Decision 10 in project decisions).

However, the abstract says "formally contradictory" without this qualification. A legal-literate reviewer could object that the governance conflict's strength depends on an authorial reading of GDPR.

## Source

- X02 (Claim-Evidence Audit): Issue I-1 (GDPR operationalization is authorial interpretation), H-4 (under-hedging "formally contradictory")
- X03 (Reviewer Simulation): Reviewer A Question 2 ("How would the result change if a less aggressive reading of GDPR is adopted?")

## Goal

Add a minimal qualification in the abstract so that "formally contradictory" is not presented as an unqualified fact. The hedge must be light — the abstract cannot carry the full two-tier framing.

## Suggested fix

In the abstract, near the phrase about formally contradictory constraints, add a qualifier such as "under a data-minimization operationalization of GDPR" or "including a GDPR-derived predicate proof requirement." The exact wording depends on the current abstract text — read `sections/00_abstract.md` and find the relevant sentence.

## Acceptance criteria

- The abstract no longer presents "formally contradictory" as unqualified
- The qualification is concise (5-10 words added, not a full explanation)
- The body's two-tier framing in Sec 05.1.3 remains unchanged
- Binding Claim #8 ("formally contradictory cross-framework constraints") is still delivered
