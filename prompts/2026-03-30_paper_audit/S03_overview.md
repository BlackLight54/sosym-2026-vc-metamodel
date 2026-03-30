# S03 Overview -- Section Audit

**Auditor:** Claude (paper audit skill)
**Date:** 2026-03-30
**File:** `sections/03_overview.md` (39 lines)
**Budget:** 1.5 pages (Motivation ~0.7p, Functional Overview ~0.5p, Usage Workflow ~0.3p)

---

## 1. Binding Claim Delivery

| Claim | Status in Sec 03 | Notes |
|-------|------------------|-------|
| C1 (three-layer metamodel) | **Previewed.** Line 17: "three metamodel layers" introduced via teaser. Formal delivery deferred to Sec 04. | Appropriate for overview. |
| C3 (cross-layer constraints as graph predicates) | **Previewed.** Line 36: "cross-layer constraints, expressed as graph predicates, are evaluated by the Refinery partial graph modeling framework." | Correct forward reference. |
| C4 (automated consistency checking) | **Previewed.** Line 38: three usage modes defined (consistency checking, error identification, DSE). | This is actually where the three modes are *defined*, not merely previewed. Claim_04 evidence field confirms: "Three usage modes defined in Sec 03.2." |
| C8 (contradictory cross-framework constraints) | **Previewed.** Line 19: "The income credential cannot simultaneously satisfy the eIDAS ARF format mandate... and GDPR data minimization." | Concrete conflict stated. Formal delivery in Sec 05.1.3. |
| C9 (multi-layer invisibility) | **Previewed.** Line 19: "Neither problem is visible when any single layer is inspected alone." | Core invisibility claim stated cleanly. |
| C10 (necessity of multi-layer modeling) | **Previewed.** Line 19: single-layer failure framed; line 21: governance sources "enacted independently." | Necessity argument seeded; delivery in Sec 05/07. |

**Assessment:** Section correctly previews six of ten binding claims without front-loading results. Appropriate scope for an overview section.

---

## 2. Decision Compliance

### decision_sec03_overview_restructure
**Required:** Three subsections -- 3.1 Motivation, 3.2 Functional Overview, 3.3 Usage Workflow.

**Status: PARTIAL COMPLIANCE.** Only two subsections exist:
- 3.1 Motivation (`## Motivation {#sec:motivation}`, line 13) -- present
- 3.2 Functional Overview (`## Functional Overview {#sec:functional-overview}`, line 34) -- present
- 3.3 Usage Workflow -- **MISSING**

The decision explicitly prescribes 3.3: "designer walkthrough on CSOK example: specify credentials -> run consistency checking -> see error -> adjust -> re-check -> explore alternatives." This content is partially absorbed into the final sentences of Sec 3.2 (line 38: "A typical workflow chains these modes...") but is not a separate subsection. The decision also notes "3.3 is most compressible" as a page-budget cut candidate, so this may be an intentional compression. If so, the decision should be updated to reflect the merge.

The decision also prescribes a "box/pipeline diagram" (`fig_functional_overview`) for Sec 3.2. No such figure is present or referenced. The section references only `fig:teaser`. This figure is either missing or was merged into the teaser.

### decision_csok_running_example
**Required:** Single running example based on CSOK. Must exercise all three layers with both vertical and horizontal constraints.

**Status: COMPLIANT.** Line 15-19 introduce the scenario exercising:
- Domain concept layer: "number of children, property floor area, monthly income" (line 17)
- Credential schema layer: "distributed across three credentials issued by independent authorities" (line 17)
- Format-specific layer: "EU regulations mandate specific credential formats" (line 17)
- Vertical constraint: income credential eIDAS vs. GDPR conflict (line 19)
- Horizontal constraint: floor area cross-credential predicate (line 19)

### decision_csok_naming
**Required:** "family housing subsidy" in body text, Hungarian name in footnote only.

**Status: COMPLIANT.** Line 15: "a government housing subsidy" in body text. Footnote on the same line: "Based on the Hungarian Family Housing Subsidy (Családi Otthonteremtési Kedvezmény, CSOK), simplified." Line 11 uses "The housing subsidy scenario" for back-reference. The acronym "CSOK" never appears in body text.

### decision_motivation_problem_statement
**Required:** Sec 03 ends with problem statement, not demonstrated detected error.

**Status: COMPLIANT.** Line 23: "The remainder of this section defines a framework that captures constraints across these layers and governance sources and demonstrates how it can be used by a designer." This is a problem-statement-to-framework transition, not a result demonstration.

However, line 19 *does* state the concrete errors: "SD-JWT-VC supports selective disclosure but not predicate proofs" and "no widely used format supports it in zero-knowledge." These are factual observations about format capabilities, not demonstrated detection results. The distinction holds but is narrow -- an adversarial reviewer might read this as front-loading.

### decision_competing_peer_requirements
**Required:** Frame governance sources as competing peer requirements, not hierarchical.

**Status: COMPLIANT.** Line 21: "These sources were enacted independently; no single source anticipates the constraints imposed by the others." This captures the peer/competing framing. Line 17: three "independent authorities" reinforces non-cooperation.

The decision asks for explicit framing that "stakeholder goals may be irreconcilable." Line 19 delivers this implicitly (income credential *cannot* simultaneously satisfy both mandates) but the word "irreconcilable" or equivalent does not appear. The prose shows the irreconcilability rather than stating it as a general principle. This is defensible but less direct than the decision prescribes.

### decision_teaser_figure
**Required:** Teaser shows all three layers + at least one vertical + one horizontal constraint.

**Status: COMPLIANT (by reference).** Line 17: "illustrates this scenario across three metamodel layers." Line 28 (caption): "from domain facts through credential schemas to format-specific representations. Error identification detects conflicting governance requirements on the income credential; design space exploration confirms no valid format assignment exists." Both headline results referenced in caption.

The `\Description{Teaser figure description.}` on line 29 is a placeholder. This must be filled for ACM accessibility compliance before submission.

### decision_error_detection_vs_dse
**Required:** Three usage modes: consistency checking, error identification, DSE.

**Status: COMPLIANT.** Line 38 defines all three:
- "Consistency checking confirms that a complete design satisfies all constraints."
- "Error identification pinpoints which constraints conflict and where."
- "design space exploration generates diverse valid completions or proves that no satisfying configuration exists."

Output signatures match the decision: OK (implied by "confirms"), NOT_OK(errors) (via "reports that the income credential's format assignment simultaneously violates..."), GENERATED/UNVIABLE (via "generates diverse valid completions or proves that no satisfying configuration exists").

### decision_novel_tooling_justification
**Required:** Justify why existing tools are insufficient.

**Status: NOT DELIVERED in Sec 03.** This is expected -- the decision assigns delivery to Sec 05.1. However, Sec 03.2 mentions Refinery without justifying why it specifically (line 36: "evaluated by the Refinery partial graph modeling framework"). The Adversarial reviewer will note this gap: Refinery appears as an assertion, not a justified choice, at this point. A forward reference to the baseline comparison would help.

### decision_emergent_constraint_interactions
**Required:** Explicitly state that constraints show emergent behaviour / interaction effects.

**Status: PARTIAL.** Line 18-19: "Inspected in isolation, each layer is well-formed... Cross-layer analysis, however, reveals two problems." This captures the isolation-vs-joint-analysis contrast but does not use the language of "emergent behaviour" or "interaction effects." The decision (from Oszkar) specifically asks for this framing. The concept is present; the vocabulary is not.

### decision_modeling_first_framing
**Required:** Frame contribution as modeling, not detection. Use "formalization reveals" / "becomes visible through."

**Status: MOSTLY COMPLIANT.** Line 11 uses "the formalization detects" -- this is borderline. The decision permits "detects" when the subject is a specific predicate or tool, and here "the formalization" is the subject. Line 19 uses "Neither problem is visible" (passive, consistent). Line 28 (caption) uses "Error identification detects" -- acceptable per the refined policy since error identification is a specific usage mode. No violations, but line 11's "formalization detects" is at the boundary.

### decision_gdpr_two_tier
**Required:** Distinguish hard eIDAS mandate from operationally binding GDPR principle.

**Status: COMPLIANT.** Line 17: "EU regulations mandate specific credential formats" (hard). Same line: "data protection law's minimization principle, operationalized here as a credential-layer requirement" (scoped, operationalized). The NAIH footnote (line 17) provides the enforcement precedent. The phrase "operationalized here as" is a precise hedge that does not overclaim.

---

## 3. Marker Census

| Line | Type | Content |
|------|------|---------|
| 38 | `[+DSE]{.full}` | Inline span -- presumably expands an acronym. Not an annotation marker per the annotation system. |

**Annotation markers (.todo, .cite, .formal, .figure, .scaffold, .meta): ZERO.**

The section has no open annotation markers. This is clean, but notable given that `\Description{Teaser figure description.}` on line 29 is a placeholder that should arguably carry a `.todo` marker.

**Raw LaTeX block:** Lines 25-31 contain a `{=latex}` fenced block for the teaser figure. This is acceptable per CLAUDE.md ("use raw LaTeX only for constructs with no Pandoc Markdown equivalent"). A `figure*` environment spanning two columns has no Markdown equivalent in ACM sigconf.

---

## 4. Argument Quality

### 4.1 Does Sec 3.1 motivate the problem without VC expertise?

**Mostly yes, with caveats.** The opening (line 15) uses accessible language: "government housing subsidy," "credentials from three independent authorities: family status from a civil registry, property records from a land registry, and income from an employer." A reader unfamiliar with VCs can follow this.

**Problem areas:**
- Line 17: "credential subject" is VC jargon introduced without definition. The background section should define it, but a reader entering at Sec 03 (following the teaser) may stumble.
- Line 17: "claim must trace to the corresponding domain-level property" -- "trace" in the MDE sense? In the VC sense? Ambiguous for the Business Manager.
- Line 19: "SD-JWT-VC supports selective disclosure but not predicate proofs" -- both "SD-JWT-VC" and "selective disclosure" and "predicate proofs" are format-specific terms. The Business Manager reviewer needs these defined in Sec 02 and the reader needs to have read Sec 02 first. This is a format-layer sentence in a motivation section -- it may feel like premature technical detail.
- Line 19: "which no widely used format supports in zero-knowledge" -- "zero-knowledge" appears without context. This is a cryptographic concept that the Business Manager will not follow.

**Verdict:** The scenario is accessible. The cross-layer problem statement is accessible. The specific format-capability claims in lines 19 assume background that a generalist reader may lack. The section leans on Sec 02 having done its job.

### 4.2 Does the teaser figure reference work?

Line 17: `\autoref{fig:teaser} illustrates this scenario across three metamodel layers.`
Line 36: `\autoref{fig:teaser} illustrates the framework on the housing subsidy scenario.`

Two references to the teaser figure. The first (line 17) introduces it during the scenario walkthrough; the second (line 36) reuses it for the functional overview. This is good -- the teaser carries double duty.

The figure caption (line 28) is substantive and names both headline results. The `\Description{}` is a placeholder (line 29).

### 4.3 Does Sec 3.2 define the three usage modes clearly?

**Yes.** Line 38 defines all three modes with:
- What each does (one sentence each)
- Concrete output for each (consistency: confirms; error identification: "reports that the income credential..."; DSE: "generates diverse valid completions or proves that no satisfying configuration exists")
- A workflow chaining them (final sentence)

**Weakness:** The modes are defined entirely in a single dense paragraph. For a concept that recurs throughout the paper (Sec 04, Sec 05), a more visually distinct presentation (definition list, numbered list) would aid scannability. This is a formatting observation, not a content gap.

---

## 5. Running Example Introduction

### Is the CSOK scenario introduced accessibly?

**Yes.** The scenario opens with a concrete, real-world situation (housing subsidy eligibility, line 15). The footnote correctly places the Hungarian name and simplification note. The three credentials (family status, property records, income) are named with their issuing authorities. The floor-area-to-children dependency is grounded in a cited decree with specific numbers (40-80 m^2), which makes it tangible.

### Does it exercise all three layers?

| Layer | Content | Line |
|-------|---------|------|
| Domain concept | "number of children, property floor area, monthly income" as an "information graph with domain-level constraints" | 17 |
| Credential schema | "distributed across three credentials issued by independent authorities, each with its own credential subject" | 17 |
| Format-specific | "EU regulations mandate specific credential formats for government-issued attestations" + SD-JWT-VC / AnonCreds contrast | 17, 19 |

All three layers are exercised. Both cross-layer constraint types (vertical: income governance conflict; horizontal: floor area cross-credential gap) are present.

### Concern: Layer 3 introduced via regulation, not via design choice

The decision_csok_running_example requires the example to exercise the format-specific layer. It does, but only through external governance mandates (eIDAS ARF). The format layer does not appear as a *design choice* the designer makes -- it appears as a constraint imposed from outside. This is arguably correct (the format layer *is* externally constrained in the EU context), but it means the running example does not demonstrate the format layer as a design space the framework explores. DSE over format assignments is mentioned in Sec 3.2 (line 38: "runs DSE to search for valid format assignments") but not grounded in the Sec 3.1 scenario walkthrough.

---

## 6. Reviewer Persona Vulnerability

### Business Manager (Reviewer C)

**Risk: MEDIUM.**
- The scenario is accessible and concrete. Good.
- "credential subject," "selective disclosure," "predicate proofs," "zero-knowledge" (lines 17, 19) are unexplained in this section. If Sec 02 defines them, the Business Manager can follow. If not, this section will feel opaque from the format-layer discussion onward.
- The three usage modes (line 38) are clear and practical. The workflow sentence at the end of Sec 3.2 is exactly what this reviewer wants.
- **Missing: 3.3 Usage Workflow.** The decision prescribed a designer walkthrough subsection. Its absence removes the most Business-Manager-friendly content from the section.

### Adversarial (Reviewer D)

**Risk: HIGH on two fronts.**

1. **Contrived motivation.** The Adversarial will test whether the CSOK scenario is cherry-picked to produce a conflict. The defense is the NAIH enforcement precedent (footnote, line 17) and the cited decree (line 15). These are real sources. However, the floor-area cross-credential constraint ("no widely used format supports it in zero-knowledge," line 19) is a stronger claim that needs a citation or explicit scoping. As written, it reads as an assertion.

2. **Refinery as unjustified choice.** Line 36 introduces Refinery without justification. The Adversarial's attack #2 ("remove Refinery and what remains?") is not pre-empted in Sec 03. A sentence in Sec 3.2 explaining *why* partial graph modeling (not OCL, not Alloy) would blunt this. Currently the reader must wait until Sec 05.1.

3. **PSM thinness.** The format-specific layer in the motivation is entirely about external mandates and format capabilities. The Adversarial's attack #4 ("PSM layer is empty classes") is not addressed here, and Sec 03 does not set expectations for what the FSL contributes beyond constraint checking.

---

## 7. Summary of Issues

### Critical (blocks reviewer acceptance)

1. **Missing `\Description{}` text** (line 29). ACM will reject without alt-text for figures. Must be filled before submission.

### Major (reviewer will notice and may score down)

2. **Missing Sec 3.3 Usage Workflow.** The decision_sec03_overview_restructure explicitly prescribes it. If intentionally compressed into Sec 3.2's final sentences, the decision file should be updated. If unintentionally omitted, the designer-walkthrough content is absent.

3. **Missing `fig_functional_overview` box diagram.** The decision prescribes an Input/Processing/Output box diagram for Sec 3.2. Not present or referenced. If cut for page budget, decision should record this.

4. **"Zero-knowledge" and "predicate proofs" unexplained** (line 19). Business Manager vulnerability. These terms need prior definition in Sec 02 or brief inline glossing.

### Minor (polish-level)

5. **Emergent-behaviour vocabulary absent.** Decision_emergent_constraint_interactions asks for explicit "emergent behaviour" / "interaction effects" language. The concept is present; the terminology is not.

6. **Line 11: "the formalization detects"** -- borderline per decision_modeling_first_framing. Consider "the formalization reveals" for consistency.

7. **Teaser figure `\Description{}` placeholder** -- duplicate of issue #1 but also a .todo marker should flag it.

8. **No `.todo` markers for known gaps.** The section reads as finished, but issues #1-3 are open. Markers would make this visible.
