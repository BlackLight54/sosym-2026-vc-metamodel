# Axis d extension: non-web-PKI error history (AF01 WS2)

Targeted finder-plus-verifier arm added by AF01 (Martin ruling 2026-07-13, amendment to
`context/todos/af01_design_error_taxonomy.md`). The verified axis-d corpus covers only web PKI/TLS;
this arm searches the arguably closer B2B/B2G relatives: eIDAS-1 qualified certificates, S/MIME, and
enterprise/code-signing PKI. Two search modalities per subtopic, adversarial per-candidate
verification, caps logged. Run 2026-07-17.

**Result: 10 of 10 candidates CONFIRMED, 0 UNVERIFIABLE, 0 dropped for integrity.** 29 raw hits, 8
exact duplicates removed, 11 non-survivors displaced by the 10-item cap or by the reconsideration gate.
Honesty verdict on the taxonomy grounding: **PARTIAL** (no longer web-PKI-only; every design-error class
gains a non-web-PKI carrier, but with the residual gaps below).

## Verified carriers (by subtopic → design-error class)

| # | Source | Subtopic | Class ([[M-015 design-error-taxonomy]]) | Locator | Kind |
|---|---|---|---|---|---|
| 1 | Entschew, Hall, Bailey, Nguyen 2022, "A New eIDAS Beginning for QWACs" (DuD 46(4)) | eidas1-qc | expressiveness-gap | 10.1007/s11623-022-1591-x | peer-reviewed |
| 2 | Parsovs 2020, "Estonian eID: Security Flaws in Key Management" (USENIX Sec 20) | eidas1-qc | issuance | usenix.org/.../parsovs | peer-reviewed |
| 3 | Valtna-Dvořák et al. 2021, "Vulnerability of State-Provided eID: ROCA in Estonia" (EGOVIS, LNCS 12926) | eidas1-qc | status-revocation | 10.1007/978-3-030-86611-2_6 | peer-reviewed |
| 4 | Öndarö et al. 2025, "Collecting and Analyzing S/MIME Certificates at Scale" (USENIX Sec 25) | smime | issuance | usenix.org/.../oendaroe | peer-reviewed |
| 5 | Poddebniak et al. 2018, "Efail" (USENIX Sec 18) | smime | expressiveness-gap | usenix.org/.../poddebniak | peer-reviewed |
| 6 | Müller et al. 2019, "Johnny, you are fired! Spoofing S/MIME Signatures" (USENIX Sec 19) | smime | spec-ambiguity | 10.5281/zenodo.3610263 | peer-reviewed |
| 7 | Clark, van Oorschot, Ruoti, Seamons, Zappala 2021, "SoK: Securing Email" (FC 2021, LNCS 12674) | smime | governance-conflict | 10.1007/978-3-662-64322-8_18 | peer-reviewed |
| 8 | Schroeder, Christensen 2021, "Certified Pre-Owned: Abusing AD CS" (SpecterOps whitepaper) | enterprise-pki | issuance | specterops.io/.../Certified_Pre-Owned.pdf | report |
| 9 | Kim, Kwon, Dumitraș 2017, "Certified Malware" (ACM CCS 2017) | enterprise-pki | single-point-of-trust | 10.1145/3133956.3133958 | peer-reviewed |
| 10 | Kim, Kwon, Kozák, Gates, Dumitraș 2018, "The Broken Shield" (USENIX Sec 18) | enterprise-pki | status-revocation | usenix.org/.../kim | peer-reviewed |

Nine are peer-reviewed; Certified Pre-Owned is the authoritative practitioner catalog of the ESC1-ESC8
AD CS error class (no peer-reviewed academic equivalent surfaced). Distinctness check: "SoK: Securing
Email" (Clark, van Oorschot et al. 2021) is the secure-email systematization, genuinely distinct from
the corpus SSL/TLS SoK ([[S-054 clark-vanoorschot-sok-ssl-2013]]). Evidence quality: 9 of 10
verifications are index/metadata plus abstract-derived (publisher bot-blocks logged throughout); only
Certified Pre-Owned was checked against locally extracted full text.

## Residual gaps (state honestly in prose)

1. **TSL/trusted-list governance failure: no carrier.** Targeted searches for a documented list-of-trusted-lists
   or member-state trusted-list incident (expired signing cert, malformed list) found only framework docs
   and a currently-passing status, no primary error incident. The governance-failure dimension for
   qualified-cert infrastructure remains unfilled.
2. **QC/QWAC realized-misissuance record is thin.** The accessible QWAC error literature is dominated by the
   eIDAS-2 Article 45(2) browser-trust policy controversy, not realized qualified-cert misissuance; no
   citable QWAC misissuance measurement was found.
3. **eIDAS-1 evidence is Estonia-concentrated.** The two strongest national qualified-cert incidents
   (Parsovs, Valtna-Dvořák et al.) are both Estonia; they carry distinct classes (issuance vs
   status-revocation) but breadth across member states is not surveyed.
4. **Out-of-subtopic but real, routed elsewhere.** eIDAS-node/SAML authentication errors (Engelbertz et al.
   WOOT'18; SEC Consult CVE-2019-18632/18633 authentication bypass) are documented eIDAS-1 design errors but
   belong to the eID/SAML pillar, not qualified certificates; a sibling eID-arm finder should carry them.

## Reconsideration gate (already-dropped leads)

- EPRS "Qualified certificates for website authentication" briefing (PE 739.285): **prior-drop stands.** Its
  error content is fully dominated by the peer-reviewed Entschew et al. 2022 and carries no independent
  error history.
- eID4U "academic attributes in eIDAS": **prior-drop stands.** Not resurfaced by any finder; not searched
  for or reinstated (no-invented-references rule).

## Integration

The 10 records are appended to `context/slr/candidates.json` (axes ["d-nonweb"]). Priority carriers are
promoted to S-notes S-064..S-073; the two load-bearing SSI quote sources pulled in the same run
(Bochnia, Schmidt) become S-074, S-075. `do_not_cite_additions.md` remains empty (0 unverifiable).
