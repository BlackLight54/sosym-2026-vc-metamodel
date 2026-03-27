# Reference Gathering: @CITE Markers → Zotero + PDF

## Goal

Produce a single, deduplicated master reference list by extracting every cited work from the paper and its supporting artifacts. For each reference, determine: (a) whether it already exists in `tex/references.bib`, (b) whether a PDF exists in `references/`, and (c) what action Martin needs to take (add to Zotero, download PDF, verify existence, or nothing).

## Context

The paper cites works through `%% @CITE: description %%` markers in section files. Additional references appear in the gap analysis synthesis and in DECISIONS.md. The `.bib` file (`tex/references.bib`, 322 entries) is a Zotero export from a broader collection — many entries are irrelevant to this paper, and many needed references may be missing.

Two references need verification before citing: Ding & Sato 2023 (TrustCom) and Schardong & Custodio 2024 (ER) — marked `[VERIFY]` in the markers.

Nour's STAF/JOT paper is BLOCKED on a double-blind citation strategy decision (see TODO.md). Flag it but do not resolve.

## Step 1: Extract all references

Read these files and extract every unique reference (by author+year or by document name):

**Section files (all @CITE markers):**
- `sections/00_abstract.md`
- `sections/01_introduction.md`
- `sections/02_background.md`
- `sections/03_overview.md`
- `sections/04_approach.md`
- `sections/05_evaluation.md`
- `sections/06_related_work.md`
- `sections/07_conclusion.md`

**Gap analysis (Tier 1/2/3 paper lists):**
- `archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md`

**Decisions (referenced works that inform decisions):**
- `DECISIONS.md`

**Existing reference tracking:**
- `references/REFERENCES_TO_ADD_IN_ZOTERO.md` (may be empty or stale)

## Step 2: Match against existing .bib

For each extracted reference, search `tex/references.bib` for a matching entry. Match on: author surname + year, or DOI if present in the marker. Record the BibTeX key if found.

Note: the .bib file is large (322 entries, ~261KB). Search by grepping for author surnames and years rather than reading the whole file.

## Step 3: Check for PDFs

List the contents of `references/` (excluding `venue exemplar papers/`). For each extracted reference, note whether a PDF exists.

## Step 4: Classify references

Classify each reference into one of these categories:

| Category | Description | Action for Martin |
|---|---|---|
| **READY** | In .bib + has PDF | None — ready to cite |
| **BIB_ONLY** | In .bib, no PDF | Download PDF to `references/` |
| **PDF_ONLY** | Has PDF, not in .bib | Add to Zotero, re-export .bib |
| **MISSING** | Neither in .bib nor PDF | Add to Zotero + download PDF |
| **STANDARD** | W3C/ISO/EU specification (no traditional PDF) | Add to Zotero as @misc or @techreport with URL |
| **VERIFY** | Existence or details need verification | Verify first, then add |
| **BLOCKED** | Citation strategy undecided | Flag, do not resolve |

## Step 5: Produce the reference list

Output a single Markdown table with these columns:

| # | Short label | Authors | Year | Venue | DOI/URL (if known) | BibTeX key (if exists) | PDF? | Category | Cited in | Priority |
|---|---|---|---|---|---|---|---|---|---|---|

Priority = Tier 1 (must cite) / Tier 2 (should cite) / Tier 3 (if space permits) / Standard (specifications) — derived from the gap analysis tiers and from how many sections reference the work.

Sort by: Category (MISSING first, then VERIFY, then BIB_ONLY, then STANDARD, then READY), then by Priority within each category.

## Step 6: Generate Zotero action list

Produce a checklist Martin can work through:

```
## Add to Zotero (MISSING + STANDARD)
- [ ] Author et al. (Year) — "Title" — Venue — DOI/URL
- [ ] ...

## Download PDF (BIB_ONLY)
- [ ] Author et al. (Year) — BibTeX key: xyz — DOI/URL
- [ ] ...

## Verify before adding (VERIFY)
- [ ] Ding & Sato 2023 — claimed: TrustCom — search IEEE Xplore
- [ ] Schardong & Custodio 2024 — claimed: ER 2024 — search Springer/DBLP
- [ ] ...

## Blocked
- [ ] Al-Gburi, Földvári et al. — STAF/JOT 2026 — awaiting double-blind decision
```

## Step 7: Update REFERENCES_TO_ADD_IN_ZOTERO.md

Write the Zotero action list (Step 6) to `references/REFERENCES_TO_ADD_IN_ZOTERO.md`, replacing any stale content. This becomes Martin's working checklist.

## Constraints

- Do NOT fabricate DOIs, URLs, or paper details. If a @CITE marker lacks a DOI, leave the field blank and note "DOI unknown — Martin to verify."
- Do NOT modify section files or the .bib file.
- Do NOT resolve the Nour/STAF double-blind question.
- The "CSCS 2024 short paper" reference in Sec 06 is the authors' own prior work — flag it as needing third-person citation (double-blind) but include it in the list.
- Standards (W3C, ISO, EU regulations, IETF drafts) are references too — they need BibTeX entries.
- Use `/model opus[1m]` for this task — the .bib file is large and many section files need scanning.
