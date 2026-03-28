# O01: Citation Verification

**Wave:** 0 (parallel with consolidation T00/T00b)
**Execution:** Single agent, research mode. Web search to confirm or refute two unverified citations.
**Dependencies:** None.
**Target file:** `sections/06_related_work.md` — update `[VERIFY]` markers.
**Downstream:** T05 (Related Work drafting) — verification results determine whether these papers are cited or removed from the scaffold.

---

## Context

The gap analysis (2026-03-25) found two papers via web search that have not been independently verified. Both appear in `sections/06_related_work.md` scaffolds with `[VERIFY]` markers. T05 (Related Work drafting) cannot proceed confidently without knowing whether these citations are real.

## What to Do

### Citation 1: Ding & Sato 2023

**Claimed details:**
- Title: "Model-Driven Security Analysis of Self-Sovereign Identity Systems"
- Authors: Ding, Sato
- Venue: IEEE TrustCom 2023
- Role in paper: classified as "SecureSSI" — MDE applied to SSI for security analysis (gap analysis RQ3, differentiation D2)

**Verification steps:**
1. Search IEEE Xplore for the exact title or close variants.
2. Search DBLP for author "Ding" + "Sato" + year 2023.
3. Search Google Scholar for the title in quotes.
4. If found: record exact title, all authors, venue, year, DOI, and any abstract snippet confirming it is about model-driven security analysis of SSI.
5. If NOT found: record what was searched and what was found instead. Note whether a different paper by these authors on a related topic exists.

### Citation 2: Schardong & Custodio 2024

**Claimed details:**
- Title: "RAF Framework for Understanding Digital Identity Models"
- Authors: Schardong, Custodio
- Venue: ER 2024 (International Conference on Conceptual Modeling)
- Role in paper: meta-metamodel for comparing identity models, protocol level (scaffold in §6.1)

**Verification steps:**
1. Search DBLP for ER 2024 proceedings + author "Schardong."
2. Search Google Scholar for the title in quotes.
3. Search ACM DL or Springer (ER proceedings are typically Springer LNCS).
4. If found: record exact title, all authors, venue, year, DOI.
5. If NOT found: record what was searched and what was found instead.

## After Verification

For each citation:

**If confirmed:**
- Remove the `[VERIFY]` tag from the corresponding `%% @CITE: ... %%` line in `sections/06_related_work.md`.
- Update the citation line with corrected details (exact title, DOI) if they differ from the claimed details.

**If not found or materially different:**
- Remove the citation from the `%% @CITE: ... %%` line.
- Remove references to the paper from `@SCAFFOLD` and `@TODO` blocks in `sections/06_related_work.md`.
- Note what was removed so T05 can adjust the drafting plan.

**In all cases:**
- Check off the corresponding items in TODO.md (§ Other tasks and § Other tasks — Prompt Pipeline → Wave 0).

## Constraints

- Do NOT fabricate bibliographic details. If uncertain, say so.
- If a paper exists but with a different title, venue, or year, record the correct details.
- Do not draft prose. Only update markers and scaffold lines.
- Do not modify any other section files.
