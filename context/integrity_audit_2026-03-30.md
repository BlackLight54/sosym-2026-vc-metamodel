# Integrity Audit — MODELS 2026 Submission

**Audit date:** 2026-03-30
**Deadline:** 2026-03-29 AoE (grace period; effective ~2026-03-30 13:00 CET)
**Review type:** Double-blind
**Days remaining:** <1 (emergency)

---

## Category 1: Broken References and Incomplete Content

**1.1 Three unresolved `.formal` placeholders in Background.** [02_background.md:47–49](sections/02_background.md#L47-L49), [:85–87](sections/02_background.md#L85-L87), [:109–111](sections/02_background.md#L109-L111). Three `::: {.formal}` divs request definitions from Oszkar (refinement ordering, propagation rule semantics, soundness/completeness guarantee). In submission mode the filter strips them entirely — no visible artifact in the PDF. However, the content they request is *missing*: the paper claims formal grounding in Refinery but the formal statements backing three key mechanisms are absent. A Mathematician reviewer will notice the gap between informal prose and missing formal statements. **Severity: medium.** Prose descriptions are adequate for MODELS Foundations, but the paper's own annotations signal the authors know something is missing.

**1.2 Inline `.todo` annotation in Background prose.** [02_background.md:45](sections/02_background.md#L45): `[do we have diagrams?]{.todo}` appeared mid-sentence. Now resolved — the sentence has been revised to remove the diagram reference. The `.todo` span is stripped in submission mode. **Severity: resolved** (verified in updated file).

**1.3 Figure placeholders.** Already tracked as IA01. `fig_functional_overview` (Sec 03) and `fig_constraint_taxonomy` (Sec 04) are planned but not produced. `fig_scalability` is commented out with data in the table instead (acceptable). `fig_teaser` and `fig_metamodel` exist as PDFs. No broken `\autoref` references result because the missing figures are not referenced via `\autoref` in the current text. **Severity: low** (no broken references, but the Business Manager reviewer will want more figures).

---

## Category 2: Double-Blind and Anonymity Violations

**2.1 Refinery + Hungarian running example = strong deanonymization signal.** Refinery is developed by the Graphs4Value group at BME (Budapest). The running example is the Hungarian Family Housing Subsidy (CSOK). The NAIH enforcement decision cited is Hungarian. The scalability measurement references `ghcr.io/graphs4value/refinery-cli`. A reviewer familiar with the MDE community can identify the author group from the Refinery + Hungary combination alone. **Severity: HIGH.** This is the single most dangerous anonymity issue.

Mitigation options: (a) Replace CSOK with a generic EU housing subsidy (loses concrete regulatory grounding); (b) Remove Hungarian attribution from the NAIH footnote and cite only the GDPRhub case number without naming the country; (c) Accept the risk — Refinery is published and any paper using it would cite BME authors regardless of the example.

**2.2 Docker image URL reveals author group.** [05_evaluation.md:83](sections/05_evaluation.md#L83): `ghcr.io/graphs4value/refinery-cli` — the `graphs4value` organization name directly identifies the research group. **Severity: HIGH.** Should be anonymized (e.g., "the Refinery CLI container image") or the URL omitted from the paper body and placed only in anonymized supplementary material.

**2.3 NAIH footnote localizes to Hungary.** [03_overview.md:17](sections/03_overview.md#L17): "the Hungarian data protection authority (NAIH) fined a bank 35M HUF for copying applicants' entire pregnancy booklets" — explicitly names Hungary, Hungarian currency, and a Hungarian authority. Combined with Refinery, this is a second independent signal. **Severity: medium** (the NAIH case is a legitimate regulatory example, but its Hungarian specificity compounds the Refinery signal).

**2.4 CSOK footnote names Hungary explicitly.** [03_overview.md:15](sections/03_overview.md#L15): "Based on the Hungarian Family Housing Subsidy (Családi Otthonteremtési Kedvezmény, CSOK), simplified." **Severity: medium** (same compounding effect).

---

## Category 3: Factual Claims Requiring Verification

**3.1 GDPR data minimization operationalized as predicate proof requirement.** The paper repeatedly operationalizes GDPR Art. 5(1)(c) data minimization as requiring predicate proof capability ([01_introduction.md:10](sections/01_introduction.md#L10), [03_overview.md:17](sections/03_overview.md#L17), [05_evaluation.md:34](sections/05_evaluation.md#L34)). GDPR Art. 5(1)(c) says personal data shall be "adequate, relevant and limited to what is necessary." The leap from "limited to what is necessary" to "must support predicate proofs so the exact value is not disclosed" is an *interpretive* step, not a direct reading. The paper hedges this correctly ("operationalized in this paper as a credential-layer requirement"). **Risk: medium.** The operationalization is defensible; the current hedging language is adequate and must not be removed.

**3.2 NAIH enforcement action interpretation.** [03_overview.md:17](sections/03_overview.md#L17): "A directly analogous enforcement action supports this operationalization." The NAIH case (pregnancy booklet copying) concerned *data collection scope*, not *cryptographic disclosure mechanisms*. The paper draws an analogy between "collecting too much data" and "disclosing a value when only a threshold check is needed." The word "analogous" is doing heavy lifting. A reviewer who checks the NAIH decision will find it concerns data collection practices, not credential presentation protocols. The analogy holds at the principle level but not at the mechanism level. **Risk: medium.**

**3.3 "No existing modeling tool is available to detect this."** [01_introduction.md:10](sections/01_introduction.md#L10). Universal negative. The paper has done gap analysis but cannot have surveyed every tool. The related work section supports this claim well, and Sec 06 already uses the more cautious "We are not aware of an alternative multi-layer credential ecosystem formalization." The introduction's phrasing is stronger than the evidence. **Risk: low-medium.** Consider softening to "We are not aware of an existing modeling tool."

---

## Category 4: Overclaimed or Imprecise Statements

**4.1 `supports_zkp` vs `supports_predicate_proof` — redundant or distinct?** [04_approach.md:80–87](sections/04_approach.md#L80-L87). The capability matrix lists both, both marked only for AnonCreds. If extensionally identical in the current analysis, this inflates the predicate count (six vs. five distinct). The paper should clarify whether `supports_zkp` captures something beyond `supports_predicate_proof`. **Severity: low** (the Mathematician reviewer will notice).

**4.2 Supplementary-dependent claim.** [05_evaluation.md:60](sections/05_evaluation.md#L60): "a detailed format capability analysis accompanies this result" — this analysis is in supplementary material that must be anonymized and may not be reviewed. If the analysis is essential to the claim, its absence from the paper body is a gap. **Severity: low.**

**4.3 `supports_multi_credential_proof` — universally false.** [04_approach.md:87](sections/04_approach.md#L87). Every format shows "—" for this capability. The predicate's inclusion is analytically meaningful (it makes a structural limitation visible), but this should be stated explicitly. Without explanation, it looks like padding. **Severity: low.**

**4.4 Baseline comparison is conceptual only.** [05_evaluation.md:72](sections/05_evaluation.md#L72). "Single-layer metamodeling (a UML class diagram with OCL constraints per layer) detects intra-layer violations but cannot express cross-layer trace predicates." The paper does not run a UML/OCL alternative. For MODELS Foundations this is likely acceptable. **Severity: low.**

---

## Category 5: Citation and Attribution Issues

**5.1 NAIH citation via GDPRhub (wiki source).** The NAIH enforcement decision is cited via `gdprhub.eu`, a community-edited wiki ([references.bib: noauthor_naih_2020](pandoc/bibliography/references.bib)). The primary source is the NAIH decision itself (in Hungarian). A reviewer cannot verify the attributed content from an English-language wiki. The footnote does provide the case number (NAIH-2020-2546-5), which is good — a reviewer could locate it. Consider adding a note that the primary decision is in Hungarian and GDPRhub provides the English summary. **Risk: medium.**

**5.2 Unverified citations from gap analysis.** Todo O01 flags that Ding & Sato 2023 and Schardong & Custodio 2024 need verification. Both appear in the bibliography with DOIs and venue metadata — likely real but Martin should confirm they exist. **Risk: low.**

**5.3 eIDAS ARF version currency.** The paper cites ARF v2.7.3. The ARF is updated frequently. The threats section acknowledges version dependency. **Risk: low.**

**5.4 AnonCreds specification is not standards-track.** `curran2022anoncreds` cites the Hyperledger AnonCreds spec, a community specification. The paper does not overclaim its status. **Risk: low.**

---

## Category 6: Logical and Structural Gaps

**6.1 `cyclic` error predicate claimed but not shown.** [04_approach.md:39–40](sections/04_approach.md#L39-L40). The predicate is listed as enforcing acyclicity via transitive closure of `neighbours`, but its definition appears in no code listing. The Background listing shows `disconnected` (preventing unreachable pairs, not cycles). `no_self_loop` prevents self-loops but not longer cycles. The Mathematician reviewer will want to see the predicate or verify it prevents cycles and not just self-loops. **Risk: medium.**

**6.2 Missing formal definitions for three Refinery mechanisms.** The three `.formal` placeholders in Sec 02 (refinement ordering, propagation rule semantics, soundness/completeness) mean the paper relies on informal prose. The paper cites Semerath et al. and Marussy et al. for formal backing, which is appropriate for a 10-page paper. **Risk: medium** (acceptable but the Mathematician reviewer may note the gap).

**6.3 `Root_cred_entity` naming inconsistency.** Todo T12 flags that evaluation instances use a simplified metamodel copy with different naming. If supplementary Refinery files use different names than the paper, a reviewer checking the artifact will be confused. **Risk: low** (supplementary, not paper body).

**6.4 Threats section acknowledges silent Subject promotion.** [05_evaluation.md:125](sections/05_evaluation.md#L125). Honest disclosure of a design limitation. No action needed — noted as good practice.

---

## Category 7: Evaluation Methodology Concerns

**7.1 Single running example for all validation.** The entire validation uses the CSOK housing subsidy scenario or its synthetic extensions. The threats section acknowledges this. **Risk: medium** (the Adversarial reviewer's attack #3). The paper's defense is that anti-patterns are grounded in cited W3C/EU sources, not invented.

**7.2 Scalability instances are structurally uniform.** [05_evaluation.md:125](sections/05_evaluation.md#L125) acknowledges this honestly. **Risk: low.**

**7.3 No empirical evaluation with practitioners.** [05_evaluation.md:129](sections/05_evaluation.md#L129) acknowledges this as a limitation and future work. **Risk: low** (appropriate for Foundations track).

---

## Category 8: LLM Tells and AI-Generated Content Signals

**8.1 Em-dashes in definition lists.** [04_approach.md](sections/04_approach.md) uses em-dashes as separators in definition list terms (e.g., "statement(s, p, v): ternary predicate"). Updated versions now use colons instead of em-dashes. No stylistic em-dashes remain in prose. **Severity: resolved.**

**8.2 Prose quality — no LLM tells detected.** Full scan: zero instances of "Furthermore," "Moreover," "Additionally," "It is important to note," "delve," "leverage," "unlock," "testament," "landscape," "tapestry," "pillar," "journey," "navigat-" in section file prose. One instance of "pillars" in YAML frontmatter only. Sentence structure varies appropriately. No throat-clearing openers. Paragraphs start with their point. **Severity: none.**

**8.3 Abstract structure is natural.** Clear problem-approach-results structure without template monotony. No LLM tells. **Severity: none.**

---

## Recommendation

**Must-fix before upload (priority order):**

1. **Anonymize the Docker image URL** ([05_evaluation.md:83](sections/05_evaluation.md#L83)): Remove `ghcr.io/graphs4value/refinery-cli` from the paper body. Replace with "the Refinery CLI container image" or similar. Easiest fix for the highest-impact anonymity issue.

2. **Assess the Hungary + Refinery deanonymization risk** (2.1–2.4): The combination of Refinery (BME tool), CSOK (Hungarian subsidy), NAIH (Hungarian DPA), and HUF (Hungarian currency) is a strong identifying signal. The Docker URL fix removes one signal. For CSOK and NAIH: these are load-bearing for the argument and cannot be easily replaced. Accept the residual risk, but consider whether the NAIH footnote could cite just the case number without "Hungarian" (the case number NAIH-2020-2546-5 already identifies the jurisdiction).

3. **Verify the `cyclic` error predicate** (6.1): The paper claims acyclicity enforcement but does not show the predicate. Either add the predicate definition (1–2 lines of Refinery code) or soften the claim to "the predicate is provided in supplementary material."

**Should-fix if time permits:**

4. Soften "No existing modeling tool" to "We are not aware of an existing modeling tool" in the introduction (consistency with Sec 06 phrasing).
5. Add a note to the NAIH citation clarifying it is a GDPRhub English summary of a Hungarian-language decision.
6. Clarify the `supports_zkp` vs `supports_predicate_proof` distinction in the capability matrix, or merge them.

**No action needed:** LLM tells (none found), submitted abstract (already submitted), `.formal` placeholders (stripped in submission mode), figure count (adequate with teaser + metamodel + scalability table).

---

## Todos to Create

Existing: IA01 (placeholder figures), IA02 (headline demo), IA03 (supplementary readiness). Additional:

- **IA04**: Anonymize Docker image URL in Sec 05 scalability measurement
- **IA05**: Review Hungary-identifying language in Sec 03 footnotes for double-blind risk
- **IA06**: Add or reference `cyclic` predicate definition in Sec 04
