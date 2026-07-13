---
id: S-034
title: EUDI Wallet ARF v2.9.0 (verified against primary text 2026-07-13)
type: source
maturity: developing
tags: [topic/eidas, topic/governance, topic/format, prov/external]
citekey: noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026
sources: ["https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/releases", "https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/v2.9.0/docs/architecture-and-reference-framework-main.md", "https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/v2.9.0/docs/annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md", "https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/v2.9.0/docs/discussion-topics/a-privacy-risks-and-mitigations.md"]
related: ["[[S-028 eudiw-arf-status-2026]]", "[[C-022 eidas-arf-format-mandate]]", "[[C-034 statutory-unlinkability-gap]]", "[[C-033 dual-issuance-mandate]]", "[[M-009 threats-to-applicability]]", "[[K-006 expressiveness-validation]]", "[[M-013 drafting-guardrails]]"]
created: 2026-06-18
---

**EUDI Wallet Architecture and Reference Framework, European Commission, v2.9.0, released 21 May 2026.**
Re-pinned against the primary text on **2026-07-13**: GitHub releases page confirms v2.9.0 (21 May) as
the latest release; the main document, Annex 2.02 (high-level requirements by topic), and the Topic A
discussion paper were fetched from the `v2.9.0` git tag and, for comparison, from the `v2.7.3` tag.
Cite as: EUDI Wallet ARF, EC, v2.9.0, 21 May 2026 (fetched 2026-07-13).

Section 5.4 *Technical attestation formats and proof mechanisms*: 5.4.1 Overview, 5.4.2 ISO/IEC
18013-5 and ISO/IEC 23220-2 (mdoc), 5.4.3 SD-JWT VC, 5.4.4 W3C Verifiable Credentials. Section
7.4.3.5 *Risks and mitigation measures related to User privacy*: 7.4.3.5.1 Linkability, 7.4.3.5.2
Mitigating Relying Party linkability, 7.4.3.5.3 Zero-Knowledge Proofs.

## Section renumbering, v2.7.3 to v2.9.0 (verified by diff of the two tags)

v2.9.0 inserts a new §5.3 *Logical versus technical PIDs and attestations*; everything after it in
chapter 5 shifts by one:

| v2.7.3 | v2.9.0 | Content |
|---|---|---|
| §5.3 (5.3.1..5.3.4) | §5.4 (5.4.1..5.4.4) | Attestation formats: overview, mdoc, SD-JWT VC, W3C VC |
| §5.4 | §5.5 | Attestation Rulebooks and schemes |
| §5.5 | §5.6 | Catalogues of attributes and schemes |
| §5.6 | §5.7 | Data exchange protocols |
| §7.4.3.5.1/2/3 | §7.4.3.5.1/2/3 | Unchanged numbering (Linkability / Mitigating RP linkability / ZKPs) |

The renumbering is visible inside the ARF itself: the PID_02 note in v2.9.0 Annex 2.02 still links
to the stale anchor "Section 5.3.4" for W3C Verifiable Credentials.

## ARF-C1..C8 re-verification (2026-07-13, v2.9.0 vs v2.7.3)

| ID | v2.9.0 source | Verdict | Expressiveness |
|---|---|---|---|
| ARF-C1 | PID_02 (Annex 2.02, Topic 3, A.2.3.2) | Unchanged (whitespace only) | Full (stands) |
| ARF-C2 | ARB_01 (Annex 2.02, Topic 12, A.2.3.9) | Unchanged (quote marks dropped) | Partial (stands) |
| ARF-C3 | ARB_01a (Annex 2.02, Topic 12, A.2.3.9) | Unchanged (quote marks dropped) | Partial (stands) |
| ARF-C4 | ARB_02 (Annex 2.02, Topic 12, A.2.3.9) | Reworded, non-normative: note text "request and release" became "request and present" | Full (stands) |
| ARF-C5 | PID_21 (Annex 2.02, Topic 3, A.2.3.2) | Identical | Partial (stands) |
| ARF-C6 | Main doc §5.4.4 (was §5.3.4) | Moved (renumbered); body unchanged except citation label [W3C VCDM 2.0] to [W3C VCDM v2.0] | Partial (stands) |
| ARF-C7 | ARB_06 (Annex 2.02, Topic 12, A.2.3.9) | Identical | Full (stands) |
| ARF-C8 | Main doc §5.4.3 (was §5.3.3) for the salted-hash mechanism; §7.4.3.5.3 for the ZKP contrast (stable number) | Moved (format side renumbered); §7.4.3.5.3 reworded with the clarifying opener "Unlike Relying Party linkability, ..." | Partial (stands) |

**Classification outcome: 3 fully expressible (C1, C4, C7), 5 partially expressible (C2, C3, C5, C6,
C8), 0 not expressible. Identical to the v2.7.3 classification; no constraint was reclassified.**
PID dual-issuance (PID_02: "A PID Provider SHALL issue any PID in both the format specified in
ISO/IEC 18013-5 [ISO/IEC 18013-5] and the format specified in [SD-JWT VC]"), proximity/mdoc
(ARB_02), and encoding-independence (ARB_06) were each re-checked verbatim.

## W3C VCDM bar (do not soften; refuted claim stays refuted)

v2.9.0 §5.4.1, verbatim: "Within the EUDI Wallet ecosystem, Wallet Units will support the first two
formats above. Support for the third format is optional and meant for non-qualified EAAs only."
ARB_01 (QEAA/PuB-EAA: two formats, no W3C VCDM) and ARB_01a (non-qualified EAA: three formats,
W3C VCDM added) are substantively unchanged from v2.7.3. The bar on W3C VCDM for PIDs and qualified
attestations holds in v2.9.0 ([[S-037 eu-eudiw-technical-standards-2026]], [[M-013 drafting-guardrails]]).

## Anchor-quote locus (correction, 2026-07-13)

The salted-hash sentence quoted in [[M-013 drafting-guardrails]] is **not in main-document
§7.4.3.5.1** (neither in v2.9.0 nor in v2.7.3). It is in the **Discussion Paper for Topic A,
"A - Privacy risks and mitigation", §2.2 Relying Party linkability**, part of the ARF v2.9.0 release
(`docs/discussion-topics/a-privacy-risks-and-mitigations.md`), which main-doc §7.4.3.5.1 references
("This topic is discussed in more detail in the Discussion Paper for Topic A"). Verbatim, Topic A
§2.2: "For example, a Relying Party that requests and receives age_over_18 attributes from multiple
PIDs may store the salt it receives. By comparing the received salt values, the Relying Party may
find matching salt values. It can then conclude that the corresponding attestations must have been
the same, and hence that it must have been interacting with the same person." This is a
mis-attribution fixed at the source, not drift between ARF versions.

What the main document itself says: §7.4.3.5.1 names **Relying Party linkability** ("Malicious
Relying Parties could exploit these values to track Users by storing and comparing them across
multiple transactions, identifying recurring patterns") and **Attestation Provider linkability**;
§7.4.3.5.2 states RP linkability can be mitigated **fully** by once-only technical attestations
(Topic 10 method A, mandatory wallet support); §7.4.3.5.3 states, verbatim: "Unlike Relying Party
linkability, Attestation Provider linkability cannot be fully eliminated when using attestation
formats based on salted hashes. The only viable mitigation is to adopt Zero-Knowledge Proofs (ZKPs)
as a verification mechanism instead of relying on salted-attribute hashes." The ZKP NOTE box ("No
specific ZKP has been selected to be supported by components in the EUDI Wallet ecosystem") is
present in both v2.7.3 and v2.9.0.

## Other v2.9.0 deltas relevant to this work

- New §5.3 logical-versus-technical PID/attestation distinction; §7.4.3.5.2 rewritten around it
  ("issuing multiple technical PIDs or attestations to the same Wallet Unit, all representing the
  same logical PID or attestation").
- No new format family; the §5.4 format catalogue is the same three (mdoc, SD-JWT VC, W3C VCDM).

## Relation to this work

Supersedes the Notion-compiled [[S-028 eudiw-arf-status-2026]] as the primary, version-pinned
source. **Closed (2026-07-13):** the currency risk opened on 2026-06-18 is resolved; ARF-C1..C8
were re-verified against the fetched v2.9.0 text (table above), the classification is unchanged,
and [[K-006 expressiveness-validation]] is unblocked. The §7.4.3.5 material remains regulator-side
confirmation of [[C-034 statutory-unlinkability-gap]], with the locus correction above: the
irreducible salted-hash residue the ARF concedes is Attestation Provider linkability (§7.4.3.5.3);
the explicit salt-matching mechanism is documented in Topic A §2.2.

## Links
- [[C-022 eidas-arf-format-mandate]]: §5.4 format taxonomy (finer than "SD-JWT-VC or mdoc").
- [[C-033 dual-issuance-mandate]]: PID_02 verified unchanged in v2.9.0.
- [[C-034 statutory-unlinkability-gap]]: §7.4.3.5.1/.3 and Topic A §2.2, per the locus correction.
- [[M-013 drafting-guardrails]]: anchor quote corrected 2026-07-13.
- [[S-028 eudiw-arf-status-2026]]: the Notion compilation this version-pins and corrects.

## Source
Deep-research synthesis 2026-06-18; primary-text re-verification 2026-07-13 (GitHub tags v2.9.0 and
v2.7.3, files listed in frontmatter). Bib entry re-pinned to v2.9.0 (21 May 2026), urldate
2026-07-13; mirror the version note in Zotero before the next export.
