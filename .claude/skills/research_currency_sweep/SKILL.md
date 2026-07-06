---
description: Re-verify every time-sensitive regulatory and standards fact against primary sources — ARF version, CIR statuses and dates, TS13/TS14 status, ETSI versions — updating the S-notes, M-009, and the as-of snapshot. Use before submission and again before camera-ready; the O-EUTHREAT pattern, generalized.
---

# Skill: Regulatory Currency Sweep

**Purpose:** The paper's governance catalogue is a dated instantiation of a moving stack
(three CIR batches in eight months; the ARF advanced two minor versions in six). The committed
framing survives that motion only if the snapshot is actually current at each publication event.
This sweep re-verifies every dated fact and moves the as-of date forward, so currency is a checked
property, not a hope.

## Trigger

- "Run the currency sweep" / "Is the EU material still current?"
- Twice per submission cycle: once before submission, once before camera-ready. Also after any
  known regulatory event (new CIR batch, ARF release).

## Inputs

- `zettelkasten/moc/M-009` (the threat map and its evidence) and the EU-cluster source notes:
  `S-030`, `S-034`–`S-040`.
- `zettelkasten/moc/M-013` §"Legal-citation precision traps" and §"Do not cite before verification"
  (the sweep is also the natural moment to close those verifications).
- `zettelkasten/sources/_citekey-map.md` for which instruments the paper actually cites.

## Steps

### 1. Inventory the dated facts

Extract every versioned or dated assertion from the EU-cluster notes and the prose that uses them:
ARF version and section numbers (§5.4, §7.4.3.5.x), CIR numbers with adopted/applicable dates,
TS13/TS14 versions and their non-mandated status, ETSI TS/TR versions, the four-realization
taxonomy, the dual-issuance rule, and the standing open items (batch-3 OJ numbers, AEPD post
title/date, cryptographers' feedback citation, NAIH decision number).

### 2. Verify each fact against primary sources (independent agents, adversarial)

One search agent per fact cluster, instructed to *confirm or refute from the primary source*
(EUR-Lex, EC repos, ETSI deliverables, eudi.dev), not from secondary reporting. Every verdict
carries the fetched identifier and date. Facts whose primary source is unreachable are marked with
the fallback used, mirroring the caveat convention in the S-notes.

### 3. Classify and propagate

- **UNCHANGED** — record the verification date in the S-note.
- **MOVED** — the stack changed: update the S-note, every C-note that states the fact, `M-009`, and
  open a todo for each prose site (the v2.7.3 → v2.9.0 lesson applies: a version bump is a
  re-verification of dependent claims, never a string swap — section numbers move between minors).
- **STILL-OPEN** — the standing verification items that remain unresolved; they stay listed in
  `M-013` and block the citations they gate.
- **NEW** — a new instrument or spec in scope: new `S-` note, linked into `M-009`, citekey-map row.

### 4. Move the snapshot

Update the as-of date that `D-016` commits the paper to (the footnote and `M-009`'s committed
framing paragraph), and re-check that the expressiveness claim's version pin (`K-006`) matches the
verified ARF version.

## Output

`context/currency_sweep_[date].md`: the fact table (fact, source, verdict, identifier, date),
updated S-notes/M-009, new todos for MOVED facts' prose sites, and the new as-of date. Run
`zettelkasten/check_links.sh` after the note edits.

## Failure modes

- **String-swap version bumps.** Bumping "v2.9.0" to "v2.10.0" without re-locating the cited
  sections and re-checking ARF-C1..C8 repeats the exact defect the June 2026 pass had to fix.
- **Secondary-source verification.** EC press pages summarize; only EUR-Lex/ETSI/eudi.dev text
  verifies. If the primary will not render, say so in the S-note caveat, as S-035 does.
- **Sweeping the notes but not the prose.** Every MOVED fact needs its prose sites enumerated as
  todos in the same pass; notes that are current while the paper is stale is the worst outcome,
  because it *looks* verified.
