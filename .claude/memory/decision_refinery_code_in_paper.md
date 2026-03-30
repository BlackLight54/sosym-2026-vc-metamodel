---
name: "Refinery code listings in paper body"
description: "Add Refinery .problem code listings to BG and approach sections to make formalization concrete and precise"
type: project
date: 2026-03-29
status: active
source: "Oszkár (meeting 2026-03-29)"
affects: "Sec 02.3 (BG), Sec 04 (approach), pandoc/preamble.tex"
revisit_when: "If page budget forces cuts; code listings are compressible"
---

Paper needs Refinery code listings in the body, not just prose+math. Advisor feedback (2026-03-29): "Shallow a cikk. Kellene bele refinery kod, hogy precizebb legyen."

The prose-only predicate descriptions make the paper feel shallow. Code makes the formalization concrete and verifiable. The Rebus paper (Oszkar's group) serves as the style reference.

**How to apply:**
- Add `\lstdefinelanguage{refinery}` to preamble (A-LST)
- Add a small BG example in Sec 2.3 demonstrating class declaration, error predicate, propagation rule (A-BG1)
- Add key predicate listings in Sec 04: governance_conflict, cross_cred_predicate_gap, trace consistency (A-CODE)
- Each listing replaces verbose prose, not adds to it; net page impact must be neutral (offset by A-SHORT)
- Partially supersedes `decision_no_code_listings.md`; supplementary still holds the full encoding
