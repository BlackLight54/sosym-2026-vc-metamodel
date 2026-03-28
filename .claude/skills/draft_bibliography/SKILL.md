---
description: Resolve @CITE markers to BibTeX keys and manage the citation workflow between Obsidian, Zotero, and Overleaf. Use when resolving citations, fixing CITE markers, or checking which citations are missing.
---

# Skill: Bibliography Management

**Purpose:** Resolve `%% @CITE: %%` markers to BibTeX keys and manage the citation workflow between Obsidian (authoring), Zotero (reference management), and Overleaf (Zotero import for `.bib`). The goal is to close the loop: every `%% @CITE: %%` marker either becomes a `\cite{key}` or gets a concrete action item.

## Trigger

- "Resolve citations"
- "Fix the CITE markers"
- "What citations are missing?"
- "I need a reference for [claim]"
- Periodically during writing, especially before `skills/project_overleaf_push`

## Reference pipeline

```
Zotero (library)  ──Overleaf Zotero import──►  .bib in Overleaf project
                                                      │
Section files (%% @CITE: ... %%)                      │
      │                                               │
      ▼                                               ▼
  This skill: resolve markers ◄──── match against known keys
      │
      ├── Key exists in Zotero → replace marker with \cite{key}
      ├── Paper known but not in Zotero → "Add [paper] to Zotero, re-sync in Overleaf"
      └── No paper identified → research prompt or flag for Martin
```

**Source of truth:** Zotero is the canonical reference library. Overleaf's built-in Zotero import syncs the `.bib` file. This skill does not manage the `.bib` directly — it resolves markers and tells Martin what to add to Zotero when something is missing.

## Inputs

- All section files (for `%% @CITE: %%` markers).
- `.bib` file if available locally (for matching against existing keys). If not available locally, Martin provides known keys or Claude works from marker descriptions.
- `context/references/` (structured reference notes from `skills/research_prior_work_import`).

## Steps

### 1. Collect all citation markers

Scan all section files for `%% @CITE: description %%`. For each, record:

| # | Marker description | Section | Line | Context (surrounding sentence) |
|---|-------------------|---------|------|-------------------------------|
| 1 | seminal work on VC revocation | §2 | 47 | "Revocation remains an open challenge in VC ecosystems %% @CITE: seminal work on VC revocation %%." |

### 2. Classify each marker

For each marker, determine what kind of citation is needed:

| Type | Description | Resolution path |
|------|-------------|----------------|
| **Specific paper** | The marker names or clearly implies a specific work | Match to BibTeX key or identify the paper for Zotero |
| **Category** | The marker describes a body of work ("surveys on X", "foundational work on Y") | Identify 1–3 representative papers |
| **Claim support** | The marker needs empirical or theoretical backing for a specific claim | Research needed — may produce a prompt for a research agent |
| **Standard reference** | Well-known definition, framework, or standard (e.g., "W3C DID spec", "Dolev-Yao model") | Identify the canonical reference |

### 3. Resolve against known references

**If a `.bib` file is available locally:**
- Parse it for keys, titles, and authors.
- For each marker, attempt to match the description to an existing entry.
- Report matches with confidence: "high" (exact title match), "medium" (topic match, likely correct), "low" (vague match, needs Martin's confirmation).

**If reference notes exist in `context/references/`:**
- Cross-reference marker descriptions against imported reference notes from `skills/research_prior_work_import`.
- These notes may contain BibTeX keys, DOIs, or structured summaries that help identify the right paper.

**If neither is available:**
- Work from the marker description and Claude's knowledge. Identify the most likely paper but flag that Claude cannot verify it exists in Zotero. Never fabricate a BibTeX key.

### 4. Research unresolved markers

For markers that cannot be resolved from existing references:

**If the needed paper is identifiable** (Claude knows what it is):
- State the full reference: authors, title, year, venue.
- Provide the DOI if known.
- Action for Martin: "Add this to Zotero, then re-sync in Overleaf."

**If research is needed:**
- Generate a targeted research prompt in `prompts/`:
  - The claim that needs support.
  - What kind of evidence is needed (foundational, empirical, definitional).
  - Where the citation will go (section, context).
- File: `prompts/YYYY-MM-DD_bibliography_[description].md`

**Important:** Never invent references. If Claude is unsure whether a paper exists, say so. "I believe there is a paper by [authors] on [topic] from approximately [year], but I cannot confirm the exact title" is acceptable. "Smith et al., 'Verifiable Credential Revocation in Distributed Systems,' IEEE S&P 2023" when Claude is not certain this paper exists is not.

### 5. Produce resolution plan

Present to Martin:

```
## Citation Resolution — [date]

### Ready to resolve ([N] markers)

| # | Marker | Section | Resolved to | Key | Confidence |
|---|--------|---------|------------|-----|-----------|
| 1 | seminal work on VC revocation | §2 | Camenisch & Lysyanskaya, "Dynamic Accumulators..." | camenisch2002dynamic | High |
| 3 | BPMN choreography semantics | §3 | Decker & Weske, "Interaction-centric modeling..." | decker2011interaction | Medium — confirm |

### Need Zotero add ([M] markers)

| # | Marker | Section | Paper to add | DOI |
|---|--------|---------|-------------|-----|
| 4 | recent SSI formal analysis | §2 | Mühle et al., "A Survey on Essential Components..." | 10.1016/j.csi.2018.09.001 |

Action: Add these to Zotero, then sync in Overleaf → Zotero import.

### Need research ([K] markers)

| # | Marker | Section | What's needed | Prompt file |
|---|--------|---------|--------------|-------------|
| 5 | empirical evidence for process compliance costs | §1 | Industry data on compliance overhead | prompts/2026-03-24_bibliography_compliance_costs.md |
```

### 6. Apply resolutions

After Martin confirms:

- For resolved markers with confirmed keys: replace `%% @CITE: description %%` with `\cite{key}` in the section file. If multiple citations: `\cite{key1,key2}`.
- For markers awaiting Zotero add: leave the marker but annotate it: `%% @CITE: description — awaiting Zotero sync, key will be [expected_key] %%`.
- For markers needing research: leave the marker, ensure the research prompt exists in `prompts/`.

### 7. Update TODO.md

- "Add [N] papers to Zotero and re-sync in Overleaf" (with the list).
- "Execute research prompt: `prompts/[filename]`" for each unresolved marker.
- "Re-run `skills/draft_bibliography` after Zotero sync to resolve remaining markers."

## Overleaf Zotero sync reminder

When markers are resolved and papers need to be added to Zotero:

1. Martin adds the papers to the appropriate Zotero collection.
2. In Overleaf: click the Zotero refresh button (or re-link the library) to pull the updated `.bib`.
3. The `.bib` in Overleaf now contains the new keys.
4. Re-run this skill to confirm all markers are resolved and keys match.

## Batch vs. incremental use

**Batch (before overleaf_push or pre-submission):** Resolve all markers at once. This is the primary mode — run it to clear citation debt before pushing.

**Incremental (during writing):** "I need a reference for [claim]" triggers single-marker resolution. Claude identifies the paper, Martin adds to Zotero if needed, marker gets resolved.

## Interaction with other skills

- **`skills/research_prior_work_import`:** Imports produce reference notes in `context/references/` that this skill draws on for resolution.
- **`skills/project_overleaf_push`:** Run bibliography resolution before pushing — the pandoc filter converts `%% @CITE: key %%` to `\cite{key}`, but only if the key is already filled in.
- **`skills/review_pre_submission_check`:** Counts unresolved `%% @CITE: %%` markers. This skill resolves them.
- **`skills/review_claim_evidence_audit`:** May flag claims needing citation support, which feeds markers into this skill.

## Output

- Resolution plan (ready / need Zotero add / need research).
- Updated section files (confirmed resolutions applied).
- Research prompts in `prompts/` for unresolved markers.
- TODO.md updated.
