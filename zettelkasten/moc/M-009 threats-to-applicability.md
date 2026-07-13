---
id: M-009
title: MOC — threats to applicability (EU legal/regulatory context)
type: moc
maturity: developing
tags: [kind/method, prov/external]
sources: ["sections/05_evaluation.md §5 limitations", "sections/07_conclusion.md", "context/threats_to_applicability_2026-06-18.html"]
related: ["[[M-007 writing-gaps]]", "[[M-005 evaluation]]", "[[K-010 necessity-of-multilayer-modeling]]"]
created: 2026-06-18
---

The threats-to-applicability map, grounded in the June 2026 deep-research pass on the EU digital-identity stack. Read top-down: the committed framing decisions first, then threats ordered by reviewer risk, each with its mitigation. The companion finding is that the **problem is real and primary-source-grounded** (bottom).

## Framing decisions (committed, eIDAS-expressiveness pass 2026-07-04)
- [[D-013 verifier-scope-issuer-remit]] — issuer-side remit; verifier axis named as the extension ([[C-040 verifier-side-extension-sketch]]).
- [[D-014 regulator-documented-conflict]] — motivation headlines ARF §7.4.3.5.1; CSOK instantiates, does not originate.
- [[D-015 expressiveness-strength-first]] — expressiveness result strength-first, partials owned.
- [[D-016 dated-snapshot-method-over-catalogue]] — as-of date June 2026 / ARF v2.9.0; method over catalogue.

**Committed one-paragraph framing:** a method for detecting cross-layer design errors in interrelated verifiable-credential schemas under multiple, independently enacted governance sources (W3C VCDM, eIDAS 2 / ARF, GDPR). The motivation is a conflict the EU's own framework documents, not one we constructed; the eIDAS/GDPR/VCDM stack is a dated instantiation (June 2026, ARF v2.9.0) of a method that outlives it. The remit is issuer-side credential design; verifier-side governance (relying-party registration under CIR 2025/848) is the named, adjacent extension — evidence that multi-source governance is pervasive rather than a gap in the model.

## Threats, ranked by risk
1. **Relying-party scope gap** ([[C-038 relying-party-scope-gap]], [[C-037 relying-party-registration-regime]], [[S-035 cir-2025-848-rp-registration]]). The issuer-side DCL/CSL/FSL layers do not express verifier-side governance: RP registration, per-intended-use attribute declaration, access entitlements, cross-border matching, breach notification, certified-wallet listing, trust/status governance. Raised by the adversarial reviewer ("you model half the governance") and the practitioner. Severity high — touches the central claim. **Mitigation: [[D-013 verifier-scope-issuer-remit]]** — name the boundary, cite CIR 2025/848 as breadth evidence; extension sketch in [[C-040 verifier-side-extension-sketch]].
2. **Moving-target regulation** ([[S-036 eidas2-implementing-acts-timeline]]). Three CIR batches Dec 2024 – Aug 2025; CIR 2025/848 in force but only *applicable* 24 Dec 2026. Severity medium — threatens currency, not correctness. **Mitigation: [[D-016 dated-snapshot-method-over-catalogue]]**.
3. **Coarse format reading** ([[S-037 eu-eudiw-technical-standards-2026]], [[C-022 eidas-arf-format-mandate]]). "SD-JWT-VC or mdoc" simplifies a four-realization rule (ETSI TS 119 472-1 v1.2.1). Severity low. Mitigation: refine the wording; do not over-correct — W3C VCDM remains barred for PIDs/qualified attestations (refuted softening, 1-2). See also [[D-017 mdoc-simplified-wlog]] for the running-example simplification under revisit pressure from [[C-033 dual-issuance-mandate]].
4. **Stale ARF version: RESOLVED 2026-07-13** ([[S-034 eudiw-arf-2.9.0]]). ARF-C1..C8 re-verified against the fetched v2.9.0 primary text (§5.4, §7.4.3.5, Annex 2.02): requirement texts substantively unchanged, ARF-C6/C8 renumbered with chapter 5 (§5.3.x to §5.4.x), classification unchanged (3 full / 5 partial / 0 not expressible). Section prose and decision memory re-pinned to v2.9.0; [[K-006 expressiveness-validation]] unblocked. Old-to-new section map recorded in the S-note.
5. **Single-jurisdiction (EU) framing.** The catalogue is EU-specific; generalization beyond eIDAS/GDPR/VCDM is asserted, not shown. Mitigation: claim only what is shown; position the EU stack as one instantiation of the method ([[D-016 dated-snapshot-method-over-catalogue]]); a second jurisdiction is future work ([[Q-008 broaden-governance-catalog]]).
6. **Tool reliance (Refinery).** Portability of the predicates beyond one solver is untested ([[Q-006 portability-beyond-refinery]]). Mitigation: argue the predicates are framework-independent graph predicates over partial models; flag portability as future work.

## Is the problem real? (primary-source evidence)
- **Strongest (regulator's own text; locus corrected 2026-07-13):** ARF v2.9.0 §7.4.3.5.1 names Relying-Party *Linkability* as a privacy risk (malicious RPs can track Users via unique fixed elements: hash values, salts, public keys, signatures). The explicit salt-matching sentence is in the ARF's **Discussion Paper for Topic A §2.2** (referenced from §7.4.3.5.1), not in the main document; quote it with that attribution ([[M-013 drafting-guardrails]]). The main document's own concession is §7.4.3.5.3: Attestation Provider linkability "cannot be fully eliminated when using attestation formats based on salted hashes" and ZKP is "the only viable mitigation", while no ZKP has been selected; RP linkability is mitigable via once-only technical attestations (§7.4.3.5.2, Topic 10 method A) → [[C-034 statutory-unlinkability-gap]], [[S-034 eudiw-arf-2.9.0]]. Presentation per [[D-014 regulator-documented-conflict]]; the citation needs this two-locus precision.
- **Mechanism in force:** statutory unlinkability duty (Reg. 2024/1183 Art. 5a(16)(b), [[S-030 eidas2-regulation-2024-1183]]) + linkable mandated formats; minimization duty (Art. 5b(3)) bound at registration; dual-issuance of two predicate-proof-incapable formats ([[C-033 dual-issuance-mandate]]) removes the format-choice escape. Unlinkability-capable ZKP exists as published-but-non-mandated specs ([[S-038 eudiw-zkp-ts13-ts14]]): governance does not yet bind the available technology. The CSOK G0–G7 ablation shows the conflict shape is structural — only the full conjunction is unsatisfiable ([[C-025 governance-conflict-vertical]], [[A-004 constraint-sensitivity-variants]]).
- **Institutional corroboration:** a national DPA treats the tension as live ([[S-039 aepd-eudiw-gdpr-analysis]]).
- **Academic / civil-society (verify before citing):** [[S-040 cryptographers-feedback-arf]], [[S-020 biedermann-eudi-web3-sok-2024]], [[S-021 schwalm-ssi-eidas-contradiction-2022]].

## Source
Deep-research synthesis 2026-06-18 (run w7bu5mdj7: 27 sources, 23 confirmed claims); framing decisions added 2026-07-04 (PR #3, `context/threats_to_applicability_2026-06-18.html` §0). Open follow-ups in [[M-007 writing-gaps]] and `context/todos/`.
