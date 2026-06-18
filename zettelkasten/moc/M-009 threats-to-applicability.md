---
id: M-009
title: MOC — threats to applicability (EU legal/regulatory context)
type: moc
maturity: developing
tags: [kind/method, prov/external]
sources: ["sections/05_evaluation.md §5 limitations", "sections/07_conclusion.md"]
related: ["[[M-007 writing-gaps]]", "[[M-005 evaluation]]", "[[K-010 necessity-of-multilayer-modeling]]"]
created: 2026-06-18
---

The threats-to-applicability map, grounded in the June 2026 deep-research pass on the EU digital-identity stack. Read top-down: threats are ordered by reviewer risk. Each links the source that grounds it. The companion finding is that the **problem is real and primary-source-grounded** (bottom).

## Threats, ranked by risk
1. **Relying-party scope gap** ([[C-038 relying-party-scope-gap]], [[C-037 relying-party-registration-regime]], [[S-035 cir-2025-848-rp-registration]]). The issuer-side DCL/CSL/FSL layers do not express verifier-side governance: RP registration, per-intended-use attribute declaration, access entitlements, cross-border matching, breach notification, certified-wallet listing, trust/status governance. Decide explicitly: out-of-scope or extensible verifier layer.
2. **Moving-target regulation** ([[S-036 eidas2-implementing-acts-timeline]]). Three CIR batches Dec 2024 – Aug 2025; CIR 2025/848 in force but only *applicable* 24 Dec 2026. Frame currency as a dated snapshot.
3. **Coarse format reading** ([[S-037 eu-eudiw-technical-standards-2026]], [[C-022 eidas-arf-format-mandate]]). "SD-JWT-VC or mdoc" simplifies a four-realization rule (ETSI TS 119 472-1 v1.2.1). Do not over-correct: W3C VCDM remains barred for PIDs/qualified attestations (refuted softening, 1-2).
4. **Stale ARF version** ([[S-034 eudiw-arf-2.9.0]]). Section files cite v2.7.3; current is v2.9.0 (21 May 2026). The eight evaluation constraints (ARF-C1..C8) need re-verification against v2.9.0 §5.4/§7.4, not just a version bump.
5. **Single-jurisdiction (EU) framing.** The catalogue is EU-specific; generalization beyond eIDAS/GDPR/VCDM is asserted, not shown.
6. **Tool reliance (Refinery).** Portability of the predicates beyond one solver is untested ([[Q-006 portability-beyond-refinery]]).

## Is the problem real? (primary-source evidence)
- **Strongest (regulator's own text):** ARF v2.9.0 §7.4.3.5.1 names Relying-Party *Linkability* as a privacy risk and concedes the salted-hash baseline is linkable ("By comparing the received salt values, the Relying Party may find matching salt values..."), with ZKP (§7.4.3.5.3) a distinct not-yet-baseline mitigation → [[C-034 statutory-unlinkability-gap]], [[S-034 eudiw-arf-2.9.0]].
- **Mechanism in force:** statutory unlinkability duty (Reg. 2024/1183 Art. 5a(16)(b)) + linkable mandated formats; minimization duty (Art. 5b(3)) bound at registration; dual-issuance of two predicate-proof-incapable formats ([[C-033 dual-issuance-mandate]]). Unlinkability-capable ZKP exists as published-but-non-mandated specs ([[S-038 eudiw-zkp-ts13-ts14]]).
- **Institutional corroboration:** a national DPA treats the tension as live ([[S-039 aepd-eudiw-gdpr-analysis]]).
- **Academic / civil-society (verify before citing):** [[S-040 cryptographers-feedback-arf]], [[S-020 biedermann-eudi-web3-sok-2024]], [[S-021 schwalm-ssi-eidas-contradiction-2022]].

## Source
Deep-research synthesis 2026-06-18 (run w7bu5mdj7: 27 sources, 23 confirmed claims). Open follow-ups in [[M-007 writing-gaps]] and `context/todos/`.
