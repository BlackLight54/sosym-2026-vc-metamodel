---
id: O01
short: "verify-refs"
title: "Verify Ding & Sato 2023, Schardong & Custodio 2024"
status: done
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

- [x] Both citations verified or confirmed absent
- [x] Related work section updated accordingly (no change needed; see results)
- [x] O03 unblocked with verified paper count (O03 completed earlier; count confirmed below)

## Verification results (2026-07-13)

Both citations are confirmed real. Verification used the Crossref DOI registry, DBLP, and arXiv;
nothing was accepted on the strength of the local bib file alone.

### Ding & Sato 2023: CONFIRMED as cited

- Exact title: "Model-Driven Security Analysis of Self-Sovereign Identity Systems"
- Authors: Yepeng Ding, Hiroyuki Sato (The University of Tokyo)
- Venue: 2023 IEEE 22nd International Conference on Trust, Security and Privacy in Computing and
  Communications (TrustCom), Exeter, UK, 1 to 3 Nov 2023, pp. 1687-1694, IEEE
- DOI: 10.1109/TrustCom60117.2023.00230
- Evidence: <https://api.crossref.org/works/10.1109/TrustCom60117.2023.00230> (registry record),
  DBLP publication search (TrustCom 2023 entry plus extended preprint arXiv:2406.00620),
  <https://arxiv.org/abs/2406.00620> (abstract confirms temporal logic / model checking, SecureSSI)
- Bib entry `ding_model-driven_2023` matches the verified record exactly; the citation in
  `sections/06_related_work.md` section 6.2 stands. No `[VERIFY]` tags existed in the section.
  Source note S-009 and the citekey map now carry the verified record.

### Schardong & Custódio: CONFIRMED, with corrected metadata

- The claimed title "RAF Framework for Understanding Digital Identity Models" was an abbreviation.
  Exact title: "The Role-Artifact-Function Framework for Understanding Digital Identity Models"
- Authors: Frederico Schardong, Ricardo Custódio
- Venue: ER 2024 (43rd International Conference on Conceptual Modeling, Pittsburgh, PA, USA,
  28 to 31 Oct 2024), proceedings volume Conceptual Modeling, LNCS 15238, Springer, pp. 377-395
- DOI: 10.1007/978-3-031-75872-0_20; online 21 Oct 2024, print year 2025 (which explains the
  year 2025 in the Zotero-exported bib entry)
- Evidence: <https://api.crossref.org/works/10.1007/978-3-031-75872-0_20> (registry record),
  DBLP publication search (venue ER, 2024, pp. 377-395)
- Bib entry `maass_role-artifact-function_2025` matches the verified record. The paper is cited
  nowhere in `sections/` and has no S-note; a "verified but uncited" note in
  `zettelkasten/sources/_citekey-map.md` records the verdict so the entry is neither silently
  kept nor lost.

### MDE-for-SSI count (downstream of O03)

O03 (soften C5) was completed from the gap-analysis count of four MDE-for-SSI papers. Ding & Sato
is verified real, so that count stands. Section 6.2 currently cites five model-driven works in the
SSI cluster: `cippitelli_chorssi_2024`, `ding_model-driven_2023`,
`pattiyanonMethodDetectingCommon2022`, `barclay_towards_2020`, `king_automated_2017`.
