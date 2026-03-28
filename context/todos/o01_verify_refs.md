---
id: O01
short: "verify-refs"
title: "Verify Ding & Sato 2023, Schardong & Custodio 2024"
status: pending
depends_on: []
binding_claims: []
target: sections/06_related_work.md
priority: low
pipeline: "consolidation"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Verify two unconfirmed citations from the gap analysis (2026-03-25) and update related work section accordingly. These papers have not been independently verified — they may be fabricated by the research agent.

## Citation 1: Ding & Sato 2023

**Claimed:** "Model-Driven Security Analysis of Self-Sovereign Identity Systems" — IEEE TrustCom 2023. Role: classified as "SecureSSI" — MDE applied to SSI for security analysis.

**Verification steps:**

1. Search IEEE Xplore for exact title or close variants
2. Search DBLP for "Ding" + "Sato" + 2023
3. Search Google Scholar for title in quotes
4. If found: record exact title, authors, venue, year, DOI
5. If NOT found: record what was searched; note whether related paper by these authors exists

## Citation 2: Schardong & Custodio 2024

**Claimed:** "RAF Framework for Understanding Digital Identity Models" — ER 2024. Role: meta-metamodel for comparing identity models.

**Verification steps:**

1. Search DBLP for ER 2024 proceedings + "Schardong"
2. Search Google Scholar for title in quotes
3. Search Springer LNCS (ER proceedings)
4. If found: record exact title, authors, venue, year, DOI
5. If NOT found: record what was searched

## After verification

**If confirmed:** Remove `[VERIFY]` tags from `sections/06_related_work.md`. Update citation details if they differ.

**If not found:** Remove the citation entirely from related work scaffolds. Note removal so O03 (C5 softening) can adjust the count of MDE-for-SSI papers.

## Constraints

- Do NOT fabricate bibliographic details
- Do not draft prose — only update markers
- Downstream: O03 depends on knowing the verified count of MDE-for-SSI papers

## Acceptance criteria

- [ ] Both citations verified or confirmed absent
- [ ] Related work section updated accordingly
- [ ] O03 unblocked with verified paper count
