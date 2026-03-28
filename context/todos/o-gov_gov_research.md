---
id: O-GOV
short: "gov-research"
title: "Research governance frameworks beyond eIDAS ARF"
status: pending
depends_on: []
binding_claims: [6]
target: sections/05_evaluation.md
priority: medium
pipeline: "consolidation"
assigned: "imre"
created: "2026-03-28"
---

## Goal

Research additional formal governance specifications (ISO, NIST, sector-specific EU regulations) that impose credential design constraints. This strengthens the expressiveness evaluation (Sec 5.1.2) by demonstrating the metamodel's constraint expressiveness beyond a single governance source.

Currently the expressiveness table evaluates only eIDAS ARF constraints. A reviewer may object that generalizability to other governance contexts is untested (this is also flagged in threats to validity, external validity).

## What to research

1. **ISO 18013-5** (mdoc) — structural constraints on mobile document format
2. **NIST SP 800-63-4** (digital identity guidelines) — any constraints expressible as metamodel predicates
3. **Sector-specific EU regulations** — e.g., PSD2/PSD3 for financial credentials, eHDSI for health credentials
4. For each: extract 2-3 constraints, classify as fully/partially/not expressible

## Output

- Summary in `context/references/governance_frameworks_survey.md`
- If any constraints are fully expressible: propose additions to the expressiveness table
- If the survey finds nothing useful: document that and note in threats to validity

**Assigned to Imre.** Claude can help format findings into the paper once Imre provides them.
