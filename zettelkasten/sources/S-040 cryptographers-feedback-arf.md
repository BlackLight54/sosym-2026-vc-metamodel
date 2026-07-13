---
id: S-040
title: Cryptographers' Feedback on the EU Digital Identity's ARF
type: source
maturity: seed
tags: [topic/format, topic/gdpr, prov/external]
citekey: baum_cryptographers-feedback_2024
sources: ["https://hpi.de/oldsite/fileadmin/user_upload/fachgebiete/lehmann/Publications/cryptographers-feedback.pdf"]
related: ["[[C-034 statutory-unlinkability-gap]]", "[[S-038 eudiw-zkp-ts13-ts14]]", "[[S-047 abellan-alvarez-arf-privacy-2026]]", "[[M-009 threats-to-applicability]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-06-18
---

**Expert statement by 16 cryptographers on the EU Digital Identity Wallet ARF, June 2024, submitted to the European Commission EUDI Wallet team.** Consensus that the ARF's mandated selective-disclosure baseline (batch-issuance, salted-hash) is cross-verifier linkable and inadequate, and that a larger redesign toward BBS-family anonymous credentials is needed. The civil-society / academic-cryptography statement of the same gap the ARF now concedes in §7.4.3.5. **Verified 2026-07-13 (proto-SLR); no longer in the "do not cite" state.**

## Verified metadata (2026-07-13)
- Title: Cryptographers' Feedback on the EU Digital Identity's ARF
- Authors: Carsten Baum, Olivier Blazy, Jaap-Henk Hoepman, Anja Lehmann, Anna Lysyanskaya, Rene Mayrhofer, Hart Montgomery, Ngoc Khanh Nguyen, abhi shelat, Daniel Slamanig, Soren Eller Thomsen (additional reviewers: Jan Camenisch, Eysa Lee, Bart Preneel, Stefano Tessaro, Carmela Troncoso)
- Venue: expert statement to the EC EUDI Wallet team; PDF hosted at HPI; also GitHub ARF discussion #211
- Year: 2024 (June 2024; feedback on ARF 1.4.0)
- Locator: https://hpi.de/oldsite/fileadmin/user_upload/fachgebiete/lehmann/Publications/cryptographers-feedback.pdf
- Verification evidence: PDF downloaded from the HPI locator (title page confirms title, June 2024, 16 authors); the 11-plus-5 author/reviewer split matches GitHub discussion #211; mirror at files.dyne.org/eudi/cryptographers-feedback-june2024.pdf
- Verdict: CONFIRMED

Note the HPI server blocks some automated fetchers with HTTP 403 unless a browser User-Agent is sent, so naive fetches may falsely suggest the link is dead.

## Honesty flags
Grey source: an expert statement / report (kind report), not a peer-reviewed publication. Cite with author-consensus framing.

## Target use
RQ0 (canonical anticipation case) and TAX. A documented case of a design error flagged by the research community before deployment, direct evidence that VC-ecosystem design errors are anticipatable from current specs. Must-cite item (axes b, e).

## Relation to this work
The strongest external critique corroborating [[C-034 statutory-unlinkability-gap]] and the "problem is real" argument, complementing the in-regulation evidence and the peer-reviewed privacy analysis in [[S-047 abellan-alvarez-arf-privacy-2026]].

## Links
- [[C-034 statutory-unlinkability-gap]]: the gap this critique targets.
- [[S-038 eudiw-zkp-ts13-ts14]]: the ZKP schemes the critique calls for.
- [[S-047 abellan-alvarez-arf-privacy-2026]]: the peer-reviewed analysis of the same gap.

## Source
Deep-research fetch set 2026-06-18; metadata verified against the proto-SLR corpus 2026-07-13 (candidates.json axes b/e; corpus_map §2, §6, §8 item 5).
