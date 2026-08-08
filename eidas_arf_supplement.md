# eIDAS ARF constraint supplement — ARF-C1..C8 against the model

Supplementary material for §5.1.2 (constraint expressiveness). One row per normative constraint:
where the obligation is written in the eIDAS ARF, what it demands, and which element of
`models/` encodes it — or, for the five partial cases, that nothing encodes it and which proposed
extension would.

**Status of this file.** Bookkeeping, not new evidence. Every classification (3 full, 5 partial,
0 inexpressible) is copied from the vault claim `K-006 expressiveness-validation` and the
version-pinned source note `S-034 eudiw-arf-2.9.0`; no constraint was re-classified here, and no
requirement text was re-fetched. The file exists because §5.1.2 asserts a per-constraint mapping
that no artifact previously exhibited (D-029 register: the promise register stays, the delivery
work is done).

**Source pin.** eIDAS ARF **v2.9.0**, released 21 May 2026, re-verified against the primary text on
2026-07-13 (S-034). Requirement identifiers cite ARF Annex 2.02 (high-level requirements by topic);
section numbers cite the ARF main document at v2.9.0. Per D-016 (dated snapshot, method over
catalogue) this pin is deliberate and dated, not a currency claim. **Currency flag:** ARF v3.0.0 was
released 2026-07-22 and is not covered by this table (S-034 currency alert; open item for the
pre-submission currency sweep).

**Reading the encoding column.** `vc_metamodel.refinery` line anchors are given at the state of the
2026-08-03 model (post-D-045). "Not encoded" is literal: there is no predicate, class, or rule in
`models/` that reads the obligation. Those rows are the five partials the paper owns as partials.

## Per-constraint mapping

| ID | ARF v2.9.0 locus | Obligation (paraphrase; verbatim texts in S-034 / C-033) | Encoding in `models/` | Verdict (K-006) |
|---|---|---|---|---|
| ARF-C1 | PID_02, Annex 2.02 Topic 3 (A.2.3.2) | A PID Provider SHALL issue any PID in **both** ISO/IEC 18013-5 (mdoc) **and** SD-JWT VC. Conjunctive, not disjunctive (C-033). | `EidasMandate` (`vc_metamodel.refinery:304`) marks the credential; the two mandated families exist as `MdocSchema` and `SdJwtVcSchema` (`:202`, `:201`); assignment runs through `Credential.format` (`:179`). **Fidelity gap, see note 1:** `contains Formatted_Credential[1] format` is arity 1, so one credential cannot carry two format assignments at once. | Full |
| ARF-C2 | ARB_01, Annex 2.02 Topic 12 (A.2.3.9) | QEAA / PuB-EAA: two formats admitted (mdoc, SD-JWT VC); W3C VCDM is not admitted. | **Not encoded.** Eligibility is conditioned on attestation qualification level, which the metamodel does not distinguish (root cause Q-004). Nearest elements: the `Formatted_Credential` subclasses (`:198`–`:202`), which carry no qualification tier. | Partial |
| ARF-C3 | ARB_01a, Annex 2.02 Topic 12 (A.2.3.9) | Non-qualified EAA: three formats admitted; W3C VCDM added relative to ARB_01. | **Not encoded.** Same root cause as C2 (Q-004): the model cannot state "non-qualified" and therefore cannot state the widened admissibility. | Partial |
| ARF-C4 | ARB_02, Annex 2.02 Topic 12 (A.2.3.9) | Proximity presentation requires the mdoc format. | `supports_offline_verification` (`:230`, true of `MdocSchema` only) plus the four elimination rules `cap_offline_not_jwt` / `_sdjwt` / `_anoncreds` / `_jsonld` (`:273`, `:279`, `:285`, `:291`), which narrow the format design space to mdoc once offline verification is required. **See note 2:** no delivered instance asserts a proximity requirement, so this encoding is present but unexercised. | Full |
| ARF-C5 | PID_21, Annex 2.02 Topic 3 (A.2.3.2) | Per-claim selective disclosability: the User must be able to disclose attributes individually. | **Not encoded at the required granularity.** `supports_selective_disclosure` (`:212`) is a *format*-level capability and `PrivacyRequirement` (`:309`) targets a *whole credential*; neither expresses a per-claim disclosure obligation (root cause Q-005). | Partial |
| ARF-C6 | Main doc §5.4.4 (was §5.3.4 in v2.7.3) | W3C VCDM conformance as a meta-level property of the format profile, admitted only for the non-qualified tier. | **Not encoded as a meta-level property.** `conforms_vcdm` (`:220`) is a boolean over format classes and `VcdmConformance` (`:314`) is a per-credential requirement marker; the tier-conditioned meta-level reading needs the qualification level (root cause Q-004). The enforced reading of the requirement side exists only as the standalone instrument `spec_ambiguity.refinery` (`vcdm_conformance_violation`), which no CSOK entry point imports (D-050). | Partial |
| ARF-C7 | ARB_06, Annex 2.02 Topic 12 (A.2.3.9) | Attributes SHALL be defined independently of their encoding. | The **layer architecture itself**, not a single predicate: domain properties live in the DCL (`Prop`, `:43`), are traced into the CSL by `Prop::trace` / `CredEntity::trace` (`:45`, `:85`), and only the CSL→FSL edge `Credential.format` (`:179`) introduces encoding. Attribute identity is therefore format-independent by construction. | Full |
| ARF-C8 | Main doc §5.4.3 (salted-hash mechanism, was §5.3.3); §7.4.3.5.3 (ZKP contrast, number stable) | Salted-hash selective disclosure leaves Attestation Provider linkability irreducible; ZKPs are the only viable mitigation. | **Not encoded.** The distinction is between disclosure *mechanisms* at claim granularity; the model carries `supports_selective_disclosure` (`:212`) and `supports_zkp` (`:226`) as format-level booleans and cannot express which claim is disclosed by which mechanism (root cause Q-005). | Partial |

**Totals: 3 encoded (C1, C4, C7), 5 not encoded (C2, C3, C5, C6, C8), 0 inexpressible.** Identical
to the K-006 classification. "Not encoded" is a statement about the delivered model, not about
expressive reach: K-006's claim is that each partial closes under one metaclass extension
(Q-004 attestation qualification levels; Q-005 claim-granularity privacy annotations) without
changing the constraint-formalization approach.

## Root causes of the five partials

| Root cause | Constraints | Proposed extension |
|---|---|---|
| Attestation qualification level (PID / QEAA / non-qualified EAA) undistinguished | C2, C3, C6 | Q-004 — qualification metaclasses on the FSL side, so format eligibility can be conditioned on tier |
| Privacy annotation lives at format and credential level, not claim level | C5, C8 | Q-005 — a claim-level privacy annotation, so per-claim disclosability and mechanism are statable |

## Notes

**Note 1 — ARF-C1 and format arity.** The dual-issuance obligation is conjunctive (C-033: "in both
the format specified in ISO/IEC 18013-5 and the format specified in SD-JWT VC"), while
`Credential` declares `contains Formatted_Credential[1] format`. A single credential in the
delivered model therefore holds exactly one format assignment. This mismatch is an open loop item,
`L5-dual-issuance-asserted-but-format-is-arity-1` in
`zettelkasten/reports/loop-register-2026-08-03.md` (evidence: `04_approach.md:120/:123`,
`03_overview.md:29`, `vc_metamodel.refinery:179`, `csok_standalone.problem:161`); its default
action is either to encode the two-format arity or to mark the prose `[proposed]`. **This
supplement records the mismatch and does not resolve it**; the C1 verdict column reproduces K-006
unchanged, since resolving it is a claim change, not a bookkeeping edit.

**Note 2 — encoded is not the same as exercised.** C4's encoding is present in the metamodel but no
delivered instance asserts a proximity/offline requirement, so `supports_offline_verification` and
its four elimination rules never fire in the instance battery. The same holds for
`supports_selective_disclosure`, `supports_zkp`, and `supports_multi_credential_proof`. The
per-instance evidence map is `models/coverage_instance_map.md`; the unexercised-instrument pattern
is also tracked as `L5-c7-instrument-claimed-but-unenforced-in-delivered-instances`.

**Note 3 — one marker class, several obligations.** `EidasMandate` is a marker: it records that a
credential falls under an eIDAS format mandate, and `governance_conflict.refinery` reads only its
presence, never which ARF requirement it stands for. The mapping from ARF requirement identifiers
to model elements is therefore many-to-one on the annotation side, and this file is the only place
that mapping is written down.

## Sources

- `zettelkasten/sources/S-034 eudiw-arf-2.9.0.md` — version pin, ARF-C1..C8 re-verification table,
  verbatim requirement texts, section renumbering, v3.0.0 currency alert.
- `zettelkasten/claims/K-006 expressiveness-validation.md` — the classification this table
  reproduces.
- `zettelkasten/concepts/C-033 dual-issuance-mandate.md`, `C-022 eidas-arf-format-mandate.md` —
  the conjunctive PID mandate and the format-mandate concept.
- `zettelkasten/questions/Q-004 attestation-qualification-levels.md`,
  `Q-005 claim-granularity-privacy-annotations.md` — the two root causes.
- `zettelkasten/decisions/D-016 dated-snapshot-method-over-catalogue.md` — why the pin is dated.
- Citekey for the ARF: `noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026`.
