---
id: M-013
title: MOC — drafting guardrails (prohibitions, refuted claims, anchor quotes)
type: moc
maturity: developing
tags: [kind/method, prov/self]
sources: [".claude/memory/decision_no_mda_terminology.md", "context/threats_to_applicability_2026-06-18.md §4-5", "sources/_citekey-map.md"]
related: ["[[M-009 threats-to-applicability]]", "[[M-010 objection-ledger]]", "[[M-001 journal-paper-outline]]"]
created: 2026-07-05
---

Negative knowledge, consolidated. Prohibitions are distributed across notes and are exactly what a
drafting pass violates first, because no single note screams them. **Load this before writing or
revising any prose.** Positive framing lives in the D-notes; this map is what must *not* happen.

## Vocabulary prohibitions
- **No MDA vocabulary.** Never CIM/PIM/PSM, never "platform-independent/-specific". Hard advisor
  constraint → [[D-003 no-mda-terminology]]. The precursor's MDA terms map per
  [[S-027 own-tdk-thesis-mda]].
- The metamodel figure caption says **"type graph"**, not "metamodel"; "metamodel" stays in prose
  (`.claude/memory/decision_type_graph_rename.md`).
- Gap framing is **"collected and formalized"**, never "scattered across" →
  [[D-004 gap-framing-collected-and-formalized]].
- The running example is the **"family housing subsidy"** in the body; "CSOK" and the Hungarian origin
  go in a footnote → [[C-021 csok-running-example]].

## Framing prohibitions
- Do not present the paper as an error-detection tool paper; detection and DSE are consequences of the
  metamodel → [[D-001 modeling-first-framing]].
- Do not present the income conflict as author-constructed; the regulator's text leads →
  [[D-014 regulator-documented-conflict]].
- Do not state K-010 as a necessity *proof*; it is calibrated as sufficiency + structural prerequisite
  → [[K-010 necessity-of-multilayer-modeling]].
- Do not claim the Realistic axis; it is declared out of scope → [[D-009 core-disc-properties-scope]].
- Do not headline the expressiveness result without the partials paragraph →
  [[D-015 expressiveness-strength-first]].
- No page-budget arithmetic in any pipeline artifact (CLAUDE.md rule 3); flag budget risk instead.

## Refuted claims — do not assert (adversarial verification, June 2026)
- Runtime wallet comparison of request-vs-registration as a settled, format-orthogonal enforcement
  mechanism: a discussion-topic proposal, **not in force** (0-3 vote) → [[S-035 cir-2025-848-rp-registration]].
- That ETSI TS 119 472-1's JSON-LD realization overrides the ARF rule barring W3C VCDM for
  PIDs/qualified attestations (1-2 vote). **Do not soften the bar** → [[S-037 eu-eudiw-technical-standards-2026]].

## Do not cite before verification (no-invented-references rule)
- [[S-040 cryptographers-feedback-arf]] — title/authors/venue unverified.
- [[S-020 biedermann-eudi-web3-sok-2024]], [[S-021 schwalm-ssi-eidas-contradiction-2022]] — not
  independently verified; citekeys unresolved.
- [[S-039 aepd-eudiw-gdpr-analysis]] — confirm post title/date (multi-part series).
- [[S-042 naih-minimization-fine-2020]] — confirm the NAIH decision number/date.
- [[S-031 hegedus-guided-dse-2015]] — title/venue unconfirmed against the `.bib`.
- The in-regulation evidence carries the motivation without any of these ([[M-009 threats-to-applicability]]).

## Legal-citation precision traps
- RP registration *certificates* were made optional (April 2025 comitology); cite the **registration
  record** for the mandatory backstop → [[S-035 cir-2025-848-rp-registration]].
- The minimization duty attaches to **Art. 5b(3)** of Reg. 910/2014, not to ETSI TS6 text.
- Entitlement *types* come from CIR 2025/848 **Annex I**; ETSI TS 119 475 defines only their URIs.
- Cite implementing acts by **OJ number**; batch-3 numbers are still unlocated →
  [[S-036 eidas2-implementing-acts-timeline]].
- Re-pin the ARF bib entry to **v2.9.0 (21 May 2026)** before reuse → [[S-034 eudiw-arf-2.9.0]].

## Anchor quotes (verbatim; do not paraphrase-drift)
- ARF v2.9.0 §7.4.3.5.1: "By comparing the received salt values, the Relying Party may find matching
  salt values ... conclude that the corresponding attestations must have been the same."
- Reg. 910/2014 Art. 5b(3): "Relying parties shall not request users to provide any data other than
  that indicated pursuant to paragraph 2, point (c)."
- CIR 2025/848 Annex I point 9: "For each intended use, a list of the data, including attestations and
  attributes, that the relying party intends to request."
- Running-example scoping sentence: "since both lack predicate proof support, we focus on SD-JWT-VC
  without loss of generality" → [[D-017 mdoc-simplified-wlog]].

## Source
Memory decisions; deep-research caveats and refutations (2026-06-18); framing pass (2026-07-04);
citekey map.
