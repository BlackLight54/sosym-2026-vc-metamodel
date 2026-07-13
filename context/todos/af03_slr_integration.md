---
id: "AF03"
short: "slr-integration"
title: "Integrate proto-SLR results into the vault"
status: in_progress
priority: high
depends_on: []
binding_claims: []
target: "context/references/, zettelkasten/sources/, M-004, M-010, M-012, M-013, spin §2/§3"
pipeline: "advisor-2026-07-06"
assigned: "claude"
created: "2026-07-13"
---

Fold the proto-SLR outputs (`context/slr/`, produced by the 2026-07-13 lights-out workflow)
into the vault. Started in the 2026-07-13 kickoff session; this todo carries the work if the
session ends before integration completes.

Context (self-contained). The proto-SLR ran seven axes: (a) VC/SSI ecosystem definitions and
B2B/B2G deployments, (b) EUDIW ARF / LSPs / member-state wallets, (c) QEAA / Data Spaces /
organizational credentials with an Industry 4.0/5.0 probe, (d) X.509/PKI error taxonomies,
(e) DIDComm and SSI protocol verification (seed DOI supplied by Martin:
https://doi.org/10.1145/3589334.3645426), (f) MDE/ontology cheap pass, (g) the Siemens
Hyperledger Global Forum Dublin talk. Every reported item passed adversarial existence
verification; unverifiable items are in `context/slr/do_not_cite_additions.md`.

Steps:
1. Run keepers (must-cite and differentiate buckets from `corpus_map.md`) through
   `skills/research_prior_work_import`: reference notes in `context/references/`, S-notes and
   `sources/_citekey-map.md` entries, BibTeX presented to Martin (Zotero owns the .bib).
2. Update M-004 (new corpus axes and differentiation needs), M-010 (O3 row gains the X.509
   precedent leg; add any new objections the corpus exposes), M-012 (taxonomy and RQ0 in the
   delta narrative), M-013 (append do_not_cite_additions.md entries).
3. Re-check spin §2/§3 against what the corpus supports: narrow claims if unsupported, never
   inflate. Finalize the RQ0 wording proposal from the corpus (D-020 keeps it `[proposed]`
   until then).
4. Check the corpus map's Industry 5.0 evidence section; if substantial, re-put decision
   D-023 to Martin with evidence.
5. Update K-013 with the verified identity of the axis (e) seed paper.
6. `./check_links.sh` to 0 errors.

Acceptance: keepers imported with verified metadata only; MOC updates in place; spin
re-checked; unverifiable items quarantined in M-013; AF01 unblocked.
