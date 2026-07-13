---
id: "O-EUTHREAT"
short: "eu-regulatory-threats"
title: "Threats to applicability in the EU legal/regulatory context + currency update"
status: in_progress
priority: high
depends_on: []
binding_claims: [10]
target: "sections/05_evaluation.md §5.3 (threats), sections/07_conclusion.md; feeds T09"
pipeline: ""
assigned: "claude"
created: "2026-06-18"
---

## Goal

Draft the EU-regulatory **threats-to-applicability** material and make the "is the problem real?"
argument primary-source-grounded. Also fix three currency errors. Output feeds T09 §5.3 and the
conclusion. Full evidence is in the Zettelkasten: [[M-009 threats-to-applicability]] and the source
notes S-034..S-040. Source: deep-research run w7bu5mdj7 (2026-06-18), 27 sources, 23 confirmed claims.

**Update 2026-07-04:** the four framing decisions are made and captured as Zettelkasten decision notes
[[D-013 verifier-scope-issuer-remit]] (issuer remit, named verifier extension),
[[D-014 regulator-documented-conflict]] (ARF §7.4.3.5.1 leads the motivation),
[[D-015 expressiveness-strength-first]] (own the partials), and
[[D-016 dated-snapshot-method-over-catalogue]] (as-of June 2026 / ARF v2.9.0). The drafting below
executes those decisions; it no longer needs to make them.

## Currency corrections (do first — these are factual errors in the draft)

1. **ARF version.** Section files and `.claude/memory/decision_three_axis_validation.md` cite ARF
   **v2.7.3**. Current is **v2.9.0 (21 May 2026)** (S-034). Update the version string everywhere AND
   re-verify the eight evaluation constraints (ARF-C1..C8) still hold in v2.9.0 §5.4/§7.4 — a two-minor
   jump, not a cosmetic bump. Specifically re-check PID dual-issuance, proximity/mdoc, encoding-independence.
2. **Format taxonomy.** Replace the coarse "SD-JWT-VC or mdoc" reading where it overstates: ARF v2.9.0
   §5.4 + ETSI TS 119 472-1 v1.2.1 give four EAA realizations (SD-JWT VC, mdoc, JSON-LD W3C VC, X.509-AC)
   (S-037). Do NOT soften "W3C VCDM barred for PIDs/qualified attestations" — that softening was refuted
   (1-2 vote): the ETSI realization catalogue does not override the ARF mandate.
3. **ZKP status.** Replace "single deferred item / draft TS13/TS14" with: two published-but-non-mandated
   specs, TS13 (arithmetic-circuit, v1.0.1, 26 Jan 2026) and TS14 (multi-message-signature, v1.0,
   27 Feb 2026), neither referenced in any CIR, to go to ETSI as TS 119 476-2 (~Feb 2027) (S-038).

## Threats to applicability, ranked (draft into §5.3 external validity + conclusion)

1. **Relying-party scope gap (highest risk).** The three layers (DCL/CSL/FSL) are issuer/credential-
   structure-centric and cannot express verifier-side governance: RP registration + per-intended-use
   attribute declaration (eIDAS 2 Art. 5b; CIR (EU) 2025/848, applicable 24 Dec 2026), access
   entitlements/certificates, cross-border matching (2025/846), breach notification (2025/847),
   certified-wallet listing (2025/849), trust/status governance. **DECIDED (2026-07-04, Decision A →
   [[D-013 verifier-scope-issuer-remit]]):** issuer-side remit; verifier axis named as the extension of
   the same method ([[C-040 verifier-side-extension-sketch]]), CIR 2025/848 cited as breadth evidence.
   Remaining work: write the §5.3 paragraph stating it. See [[C-038 relying-party-scope-gap]],
   [[C-037 relying-party-registration-regime]].
2. **Moving-target regulation.** Three CIR batches Dec 2024 – Aug 2025; 2025/848 in force but applicable
   only 24 Dec 2026. State currency as a dated snapshot. See [[S-036 eidas2-implementing-acts-timeline]].
3. **Single-jurisdiction (EU) framing.** Catalogue is EU-specific; generalization is asserted, not shown.
4. **Tool reliance (Refinery).** Portability of predicates beyond one solver untested ([[Q-006 portability-beyond-refinery]]).

## "Is the problem real?" — strongest evidence (use in motivation/conclusion)

- **Load-bearing (regulator's own text):** ARF v2.9.0 §7.4.3.5.1 names RP *Linkability* as a privacy
  risk and concedes the salted-hash baseline is linkable: "By comparing the received salt values, the
  Relying Party may find matching salt values ... conclude that the corresponding attestations must have
  been the same." ZKP (§7.4.3.5.3) is a distinct not-yet-baseline mitigation. (S-034, [[C-034 statutory-unlinkability-gap]])
- **In-force mechanism:** Reg. 2024/1183 Art. 5a(16)(b) unlinkability duty + linkable mandated formats;
  Art. 5b(3) minimization bound at registration; dual issuance of two predicate-proof-incapable formats (C-033).
- **Institutional:** a national DPA treats the tension as live (S-039 AEPD).
- **Academic/civil-society — VERIFY BEFORE CITING:** S-040 cryptographers' feedback; S-020 Biedermann;
  S-021 Schwalm. None were independently verified this round (no-invented-references rule).

## Verification follow-ups (must close before submission)

- [ ] Locate exact 2025/xxxx OJ numbers + subjects of the 30 Jul 2025 round of eight CIRs (S-036 open).
- [x] Re-verify ARF-C1..C8 against ARF v2.9.0 §5.4/§7.4 (currency #1). **Done 2026-07-13**: fetched
      v2.9.0 and v2.7.3 from GitHub tags (main doc, Annex 2.02, Topic A paper); all eight hold;
      classification unchanged (3 full / 5 partial / 0 not expressible); ARF-C6 renumbered §5.3.4 to
      §5.4.4, ARF-C8 §5.3.3 to §5.4.3 (+ §7.4.3.5.3 stable); per-constraint table and old-to-new
      section map in [[S-034 eudiw-arf-2.9.0]]. Prose re-pinned (§5.1.2, §5 limitations), decision
      memory and claim_06 updated, bib entry re-pinned (mirror in Zotero pending). ANCHOR-QUOTE
      CORRECTION: the M-013 salted-hash sentence is in the ARF Topic A discussion paper §2.2, not
      main-doc §7.4.3.5.1 (both versions); M-013/M-009 corrected with dated notes. The main-doc
      concession at §7.4.3.5.3 concerns Attestation Provider linkability specifically; D-014-based
      motivation prose must cite the two loci precisely.
- [ ] Confirm S-040 (cryptographers' feedback) title/authors/venue; resolve S-020, S-021 citekeys.
- [ ] Confirm AEPD post title/date (S-039); EUR-Lex HTML for 2025/848 (fetched via PDF + secondaries only).

## Acceptance criteria

- [ ] ARF version, format taxonomy, and ZKP status corrected and re-verified, not just string-swapped.
- [ ] §5.3 external-validity paragraph names the RP scope gap and states the in/out-of-scope decision.
- [ ] Motivation/conclusion cite the ARF §7.4.3.5.1 linkability text as primary evidence the problem is real.
- [ ] All four verification follow-ups closed or carried as explicit `::: {.todo}` with the open item named.

## Relation to T09

T09 already drafts generic threats-to-validity (construct/internal/external/reliability) and absorbs the
old O-THREATS. This todo supplies the EU-regulatory substance and currency fixes T09 lacks. Execute this,
then fold the external-validity output into T09 §5.3.
