# Section 06 Review: Related Work

**Reviewed:** `sections/06_related_work.md` (33 lines)
**Date:** 2026-03-30
**Budget:** 0.75 pages (~4 paragraphs, 3 subsections)

---

## 1. Binding Claim Delivery

**Claim at stake:** C5 (corrected) requires that the novelty claim be scoped to the intersection of multi-level metamodeling + cross-layer constraints + VC credential design, not "MDE has not been applied to SSI."

**Verdict: COMPLIANT.** The section never claims MDE is unapplied to SSI. The closing sentence (line 32) delivers the scoped gap claim:

> "No prior work combines multi-layer metamodeling with formalized cross-layer constraints for verifiable credential ecosystem design under multi-source governance."

This matches the c5_claim_correction formulation almost verbatim. The differentiation mechanism is consistent: each cited MDE-SSI work is acknowledged and then excluded on the grounds that it does not define a multi-layer metamodel or formalize cross-layer constraints (line 21).

**Claim 9 (multi-layer invisibility)** is supported indirectly: line 13 establishes that single-layer formalizations "target protocol-level security or single-format semantics; none operates across the boundary between domain-level claim semantics and format-specific representation capabilities." This sets up the invisibility argument without restating it.

---

## 2. Decision Compliance

### c5_claim_correction: "Cite all four MDE-SSI works"

**Status: EXCEEDED.** The decision names four works: ChorSSI, SecureSSI (Ding), Pattiyanon et al., Barclay et al. Line 21 cites all four plus King et al. (2017):

> `[@cippitelli_chorssi_2024]`, `[@ding_model-driven_2023]`, `[@pattiyanonMethodDetectingCommon2022]`, `[@barclay_towards_2020]`, and `[@king_automated_2017]`

King (2017) was not in the original c5 list. Its inclusion is defensible (it is an MDE-SSI work on compliance checking), but the decision file should be updated to reflect five works rather than four, or the rationale for including King documented.

### gap_analysis_confirmed: "Cite ~20 papers across three tiers"

**Status: PARTIAL.** Counting distinct citation keys across the section:

- Line 13: sporny, noauthor (ARF), curran, _mobile_ (mDL), curry (Braun & Käfer), yamamoto, braun_ssi = 7
- Line 15: tith, turkanovic, davie, naghmouchi = 4
- Line 19: noauthor (UMLsec), basin = 2
- Line 21: cippitelli, ding, pattiyanon, barclay, king = 5
- Line 25: goos (Atkinson/Kühne 2001), atkinson_2008, hutchison (de Lara/Guerra), dingel (Diskin) = 4
- Line 27: marussy = 1
- Line 28: jackson = 1

**Total: ~24 distinct citations.** Exceeds the ~20 target. COMPLIANT.

### domain_mde: "Primary domain is MDE"

**Status: COMPLIANT.** Sec 6.3 foregrounds multi-level modeling (Atkinson/Kühne), graph-based DSE (Refinery), and partial model semantics. The framing is consistently MDE, not formal-methods.

### no_mda_terminology: "No CIM/PIM/PSM"

**Status: COMPLIANT.** Zero occurrences of CIM, PIM, PSM, or "Model-Driven Architecture" in the file. Layer names use the project terminology (domain concepts, credential structure, format-specific representation) and line 30 uses "DCL" implicitly via "domain concepts, credential structure, and format-specific representation" rather than MDA terms.

### no_em_dashes (feedback)

**Status: COMPLIANT.** Zero em-dashes in the file.

### prefer_footnotes

No long parenthetical asides detected. COMPLIANT.

### bg_backref_convention

Line 27 references Refinery with `[@marussy_refinery_2024]` and its partial model semantics but does not carry `\autoref{sec:refinery}` on first mention. **POTENTIAL VIOLATION** of decision_bg_backref_convention, which requires first use of BG-defined Refinery terms in Sec 04/05 to carry the autoref. The decision says "Sec 04/05" so Sec 06 may be exempt, but the reader encountering Refinery terminology in related work would benefit from the backreference. **FLAG for Martin to decide.**

---

## 3. Marker Census

| Line | Type | Content |
|------|------|---------|
| 13 | `[+RDF]{.long}` | Acronym expansion span (not an annotation marker) |

**Annotation markers (`.todo`, `.cite`, `.formal`, `.scaffold`, `.meta`, `.figure`): ZERO.**

The `[+RDF]{.long}` on line 13 is an acronym expansion span, not an annotation marker. The section contains no unresolved work items.

The frontmatter `.meta` block (lines 1-7) is structural metadata, not a prose annotation.

---

## 4. Argument Quality

### 6.1 Credential Ecosystem Design and Formalization (lines 12-15)

**Structure:** Two paragraphs. First (line 13) covers specifications and formal methods applied to individual layers. Second (line 15) covers conceptual models for adjacent concerns.

**Positioning:** Explicit. The differentiation argument appears at the end of each paragraph:
- Line 13: "none operates across the boundary between domain-level claim semantics and format-specific representation capabilities"
- Line 15: "each targets a single concern without formalizing cross-layer constraints spanning domain semantics, credential structure, and format-specific representation"

**Weakness:** The two paragraphs use very similar differentiation phrasing. The repeated "domain semantics, credential structure, and format-specific representation" refrain (lines 13, 15, 21, 30) risks mechanical repetition. A reviewer may read this as formulaic gap-stacking rather than substantive differentiation. However, at 0.75 pages budget this repetition also hammers the message home. **Minor concern.**

**Strength:** The distinction between "protocol-level security or single-format semantics" (line 13) and "single concern without formalizing cross-layer constraints" (line 15) is clear. Braun & Käfer, Yamamoto, and Braun et al. are differentiated by what layer they formalize. The conceptual-model paragraph efficiently covers four works in one sentence.

### 6.2 Model-Driven Engineering for Security and SSI (lines 17-21)

**Structure:** Two paragraphs. First (line 19) covers model-driven security engineering (UMLsec, SecureUML). Second (line 21) covers MDE within SSI specifically.

**Positioning:** Explicit. Both paragraphs end with differentiation:
- Line 19: "Neither targets credential schema design; both operate on software architecture elements rather than the domain-specific structure of verifiable credentials."
- Line 21: "none defines a multi-layer metamodel or formalizes cross-layer constraints connecting domain semantics to format-specific representation."

**Weakness:** Line 19 differentiates UMLsec/SecureUML by domain (software architecture vs. VCs), but does not engage with the *structural* similarity. Both UMLsec and SecureUML add security annotations to metamodels; the present work adds governance constraints to a metamodel. The adversarial reviewer (Persona D) will ask: "How is your approach structurally different from SecureUML but for VCs?" The current text answers with domain difference only, not structural difference. This is the weakest differentiation in the section.

**Strength:** The SSI paragraph (line 21) is efficient and cites all five MDE-SSI works with a single sharp differentiation statement.

### 6.3 Multi-Level Modeling and Graph-Based Design Space Exploration (lines 23-32)

**Structure:** Four paragraphs covering: (1) multi-level metamodeling foundations, (2) Refinery and its role, (3) Alloy/OCL comparison, (4) how this work differs from standard multi-level modeling.

**Positioning:** This is the strongest subsection. The differentiation in lines 30-31 is the most substantive in the section:

> "Unlike standard multi-level modeling applications where layers represent successive instantiation and constraints take the form of potency annotations, the three layers in the present metamodel (domain concepts, credential structure, and format-specific representation) represent independently governed concern spaces."

This directly pre-empts Adversarial Reviewer D's attack ("novelty reduction to multi-layer metamodeling + new domain") by identifying the structural difference: independently governed concern spaces connected by coverage and capability constraints, not instantiation relationships.

**Weakness:** The Alloy comparison (line 28) is detailed (SAT-based enumeration, fully concrete instances, no open decisions) but the OCL comparison is compressed into a single sentence: "OCL constraints on UML metamodels similarly assume fully instantiated models, with no representation of open decisions." Given that OCL is closer to the paper's approach than Alloy (both annotate metamodels with constraints), this deserves more space. The mathematician reviewer (Persona B) will want to know why graph predicates in Refinery are not reducible to OCL + metamodel + model finder.

---

## 5. Coverage Assessment

### Multi-level modeling: Kühne/Atkinson
**COVERED.** Line 25: `[@goos_essence_2001; @atkinson_reducing_2008]`. Both foundational works cited. Deep instantiation also covered via de Lara and Guerra `[@hutchison_deep_2010]`.

### Partial models: Chechik/Famelis/Semerath
**PARTIALLY COVERED.** Semerath is cited via Refinery `[@marussy_refinery_2024]` (line 27). Chechik and Famelis are **not cited**. The VENUE.md mathematician persona explicitly says: "Will attack... missing related work (Chechik/Famelis partial models)." This is a gap. The partial model tradition (Chechik's multi-valued models, Famelis's partial model analysis) is the intellectual foundation for Refinery's four-valued semantics. Not citing them in related work is a vulnerability.

**ISSUE: Missing Chechik and Famelis citations.** These are named in VENUE.md line 36 as expected by the mathematician reviewer. Their absence is a reviewable gap.

### Multi-view consistency: Diskin
**COVERED.** Line 25: `[@dingel_specifying_2011]` with explicit connection: "a problem this work extends by adding independently governed constraint sources as a consistency dimension."

### VC formalization: prior work
**COVERED.** Line 13 cites three VC-specific formalizations (Braun & Käfer, Yamamoto, Braun et al.) and differentiates them.

### MDE-SSI: the four works from c5_claim_correction
**COVERED (plus one).** All four works cited on line 21, plus King et al. (2017).

### Graph transformations / constraint-based modeling (Varro, Taentzer)
**NOT CITED.** VENUE.md line 49 says: "Related work must address... graph-based consistency (Varro, Taentzer)." Varro is indirectly present via the Refinery citation (Marussy/Varro group), but Taentzer is absent. This is a secondary gap; the mathematician reviewer may or may not notice depending on how they weight graph transformation foundations vs. partial model foundations.

---

## 6. Reviewer Persona Vulnerability

### Persona D (Adversarial): "Incremental contribution" framing

**Risk: MEDIUM-LOW.** The strongest defense is in lines 30-31, which explicitly distinguish independently governed concern spaces from standard multi-level instantiation. The closing line (32) stakes the gap claim precisely.

**Remaining vulnerability:** The adversarial reviewer's attack #4 ("PSM layer is empty classes — three-layer claim is aspirational, paper delivers two") is not pre-empted in related work. The related work claims three layers but does not acknowledge that format-specific representation (FSL) has limited depth compared to DCL/CSL. If the approach section acknowledges this, the related work should at least not overclaim. Currently line 30 says "three layers... represent independently governed concern spaces" without qualification. This is consistent with the rest of the paper if FSL is substantiated in Sec 04, but the related work section itself does not hedge.

**Attack surface:** The Alloy comparison (line 28) claims Alloy "cannot represent open design decisions" and "re-encoding the entire problem for each candidate instance." An adversarial reviewer familiar with Alloy's incremental SAT solving (Aluminum, etc.) may push back on the re-encoding claim. The claim is defensible for standard Alloy but should be precise.

### Persona B (Mathematician): Related formalism coverage

**Risk: MEDIUM-HIGH.** Two gaps:

1. **Chechik/Famelis partial models not cited.** This is the most likely attack vector. Refinery's four-valued semantics descend from this tradition. Not citing Chechik (multi-valued model merging) or Famelis (partial model analysis, product line modeling) in the related work of a paper that relies on partial model semantics is an oversight the mathematician reviewer will notice.

2. **OCL comparison too thin.** One sentence (end of line 28) for the primary competing constraint language in MDE. The mathematician will want to know: can the cross-layer constraints be expressed in OCL? If yes, what does Refinery add? If no, what specifically cannot be expressed?

---

## Summary of Issues

| # | Severity | Issue | Lines |
|---|----------|-------|-------|
| 1 | **HIGH** | Missing Chechik/Famelis citations (mathematician reviewer expectation from VENUE.md) | 27-28 |
| 2 | **MEDIUM** | OCL comparison too compressed; does not explain why graph predicates are not reducible to OCL | 28 |
| 3 | **MEDIUM** | UMLsec/SecureUML differentiated by domain only, not by structural difference from the present approach | 19 |
| 4 | **LOW** | Missing Varro/Taentzer graph transformation citations (VENUE.md expectation) | 25-28 |
| 5 | **LOW** | Repetitive differentiation phrasing across subsections (formulaic gap-stacking) | 13, 15, 21 |
| 6 | **INFO** | King (2017) added beyond the four c5 works; decision_c5_claim_correction should be updated | 21 |
| 7 | **INFO** | bg_backref_convention: no `\autoref{sec:refinery}` on Refinery first mention; may be exempt for Sec 06 | 27 |
