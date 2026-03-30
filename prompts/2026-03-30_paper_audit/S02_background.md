# Section 02 (Background) Audit Review

**File:** `sections/02_background.md`
**Date:** 2026-03-30
**Lines:** 1--114

---

## 1. Binding Claim Delivery

### Claim #2 (VCDM grounding) -- SUPPORTS

Sec 2.1 (lines 10--18) introduces VCDM 2.0, the issuer/holder/verifier roles, claim-as-triple structure, and the gap between structural vocabulary and format-specific concerns. This is the necessary background for Claim #2's evidence in Sec 04. The four formats are named (SD-JWT-VC, AnonCreds, JSON-LD with BBS, ISO mdoc) with their privacy capability distinctions. The section correctly identifies the "asymmetry between these format families" (line 18) as the central design axis.

**Verdict:** Adequate support. The reader has what they need to understand the VCDM grounding argument in Sec 04.

### Claim #3 (Cross-layer constraints) -- SUPPORTS PARTIALLY

The section motivates cross-layer constraints in two places:
- Line 12: "This gap between structural vocabulary and the format-specific concerns that govern real deployments motivates the multi-layer separation"
- Lines 26--27: "A single-layer model that merges them cannot attribute a constraint to its source, so conflicts between governance sources become undetectable"

The second sentence (line 26) is the key setup for Claim #3. However, the connection between "independently governed layers" (Sec 2.2) and "graph predicates as the constraint language" (Sec 2.3) is made only in the bridge paragraph (line 28), which reads as a list rather than an argument.

**Verdict:** Functional but the bridge paragraph (line 28) is the weakest link in the claim chain.

### Claim #4 (Automated checking) -- SUPPORTS

Sec 2.3 introduces partial models, four-valued semantics, graph predicates, propagation rules, error predicates, and the soundness/completeness guarantee (line 107). This is the technical vocabulary needed for Claim #4. The section also introduces a code example (lines 65--81, 91--105) demonstrating the mechanisms.

**Verdict:** Strong support, contingent on the three `.formal` placeholders being filled (see Section 5 below).

---

## 2. Decision Compliance

### `decision_no_mda_terminology` -- COMPLIANT

No CIM, PIM, PSM, or "Model-Driven Architecture" appears anywhere in the section. Layer names use the project terminology (DCL referenced at line 89 via shadow predicate). Sec 2.2 uses "multi-layer modeling" (line 20 heading) and "abstraction layers" (line 22).

### `decision_domain_mde` -- COMPLIANT

Background covers multi-level modeling with Atkinson/Kuhne citation (line 24, footnote `[^ml-distinction]`). Register is MDE, not formal methods.

### `decision_dcl_rename` -- COMPLIANT

Line 89: "The *shadow predicate* [DCL]{.refi} marks all entities and properties as belonging to the domain concept layer." Uses DCL, not CPL.

### `decision_mdoc_simplified` -- COMPLIANT

Line 16 (footnote `[^other-formats]`): "Other formats in scope (JSON-LD with BBS [...], ISO mdoc [...]) support selective disclosure but not predicate proofs." mdoc is mentioned in Background but simplified away. SD-JWT-VC is positioned as the representative format (line 14: "subsequent sections use it as the representative format").

### `decision_soundness_completeness` -- PARTIALLY COMPLIANT

Line 107: "Generation is refinement-based: every generated model is guaranteed to satisfy all specified constraints (soundness), and if a constraint is violated in every possible completion, the tool detects the violation (completeness)." The claim is stated in prose, but the `.formal` placeholder at lines 109--111 marks the formal statement as undelivered. The decision says "Sec 02 (background, Refinery intro)" must cover these guarantees; the prose does so but the formal backing is missing.

### `decision_refinery_code_in_paper` -- COMPLIANT

Two Refinery code listings are present: `lst:refinery-metamodel` (lines 65--81) and `lst:refinery-mechanisms` (lines 91--105). These demonstrate class declaration, error predicate, propagation rule, shadow predicate, and scope constraint, matching the decision's requirement for "a small BG example in Sec 2.3."

### `decision_no_code_listings` (superseded) -- N/A

Superseded by `decision_refinery_code_in_paper`. Code listings are now expected in Sec 2.3.

### `decision_bg_notation_consistency` -- COMPLIANT

Notation is introduced incrementally: signature (line 37--39), partial model (line 41--43), four-valued interpretation (line 45), predicate satisfaction (line 57--59). Terms are used consistently after introduction.

### `decision_formal_claims_required` -- PARTIALLY COMPLIANT

The section introduces the technical vocabulary but defers formal claims to the `.formal` placeholders. Three formal elements are marked for Oszkar. The prose around them is adequate framing, but the formal content itself is absent.

### `bg_backref_convention` (from MEMORY.md) -- CANNOT VERIFY

The memory file `decision_bg_backref_convention.md` is referenced in MEMORY.md but does not exist on disk. The convention states: "First use of BG-defined Refinery terms in Sec 04/05 must carry `\autoref{sec:refinery}`." This is a convention for other sections referencing Sec 02, not a constraint on Sec 02 itself. Compliance must be checked in Sec 04/05 reviews.

### `decision_modeling_first_framing` -- COMPLIANT

Line 107 uses "generation is refinement-based" and "the tool detects the violation" (tool as subject, not paper). Line 113 says "Refinery evaluates constraints *during* refinement." Framing is consistent with modeling-first.

---

## 3. Marker Census

| Line | Type | Content |
|------|------|---------|
| 47--49 | `.formal` | "Oscar: refinement ordering definition (partial model $A$ refines $B$...)" |
| 85--87 | `.formal` | "Oscar: propagation rule semantics (precondition = must pattern, consequent = forced assignment). Boolean encoding and fixpoint computation." |
| 109--111 | `.formal` | "Oscar: formal statement of soundness and completeness guarantees for Refinery's refinement-based generation." |

**Total: 3 `.formal` markers, 0 `.todo`, 0 `.cite`, 0 `.scaffold`.**

Note: the task description mentions "3 `.formal` placeholders and 1 `.todo`" but I find zero `.todo` markers in the file. Either the `.todo` was resolved since the task was written or it is in a different section.

---

## 4. Argument Quality

### Sec 2.1 (VCDM) -- Business Manager accessibility

The subsection defines VC, claim, issuer, holder, verifier in a single dense sentence (line 12). For the Business Manager reviewer who "does NOT know partial models, VCs, SSI, or W3C VCDM," this may be too compressed. The VENUE.md explanation floor says: "Define VC, credential schema, issuer/holder/verifier, selective disclosure in 1--2 sentences each." Currently:

- VC: defined in one clause ("a tamper-evident set of claims made by an issuer about one or more credential subjects")
- Claim: defined ("a subject-property-value triple")
- Issuer/holder/verifier: one sentence, three roles
- Selective disclosure: defined in line 14 ("allowing a holder to reveal a chosen subset of claims while withholding others")
- Predicate proofs: defined in line 14 ("ZKP that a claim value satisfies a predicate...without disclosing the value itself")
- Credential schema: NOT defined in Sec 2.1

The explanation floor is mostly met, but credential schema is missing from Background. This matters because CSL is a full layer. The term "credential schema" appears only in Sec 2.2 line 22 as part of the layer list, not as a defined concept.

**Risk:** Business Manager reviewer may not understand what a credential schema is when they encounter it in Sec 04.

### Sec 2.2 (Multi-Layer Modeling) -- MDA avoidance

No MDA terminology. The subsection correctly distinguishes the paper's layers from instantiation-based multi-level metamodeling (footnote line 23--24: "Our layers do not: a credential schema is not an instance of a domain concept"). This preempts the Adversarial reviewer's "not just multi-layer metamodeling" attack.

However, line 22 claims "Each layer defines its own types, instances, and well-formedness rules" but the section never explains what "well-formedness rules" means for each layer. This is a forward reference to Sec 04 that may leave the reader without traction.

The governance-source argument (line 26) is the strongest paragraph in Sec 2.2: "These sources were enacted independently. A single-layer model that merges them cannot attribute a constraint to its source, so conflicts between governance sources become undetectable." This is the core motivation. It works.

### Sec 2.3 (Refinery) -- Formal contribution foundation

This subsection does substantial work: three definitions (Signature, Partial model, Predicate satisfaction), two code listings, and an example. It introduces the four-valued logic, propagation rules, negative elimination, shadow predicates, and scope constraints.

**Strengths:**
- Incremental notation introduction
- Code listings make mechanisms concrete (per advisor feedback)
- The example (lines 61--63) shows four-valued evaluation on a partial model, making the semantics tangible

**Weaknesses:**
- The opening paragraph (lines 32--33) starts with a generic statement about partial modeling before getting to Refinery. "During the early phase of development, our knowledge about models is often incomplete" is throat-clearing that could appear in any partial modeling paper. It should be cut or replaced with a sentence that connects directly to the credential design problem.
- Line 33: "Refinery uses a four-valued logic interpretation" has a missing space before the citation `[@Belnap77useful]` -- this will produce a rendering artifact.
- The three `.formal` placeholders break the argument flow. A reader encounters the refinement ordering placeholder (line 47) between the Partial model definition and the code listing, creating a gap in the logical sequence.
- Line 55 ("Graph predicates define structural constraints and derived properties over partial models") is a topic sentence for a paragraph that then re-explains what was already shown in the code listing. This paragraph could be cut or merged.

---

## 5. Formal Placeholder Assessment

### `.formal` at lines 47--49: Refinement ordering

**What it needs:** A definition stating that partial model $A$ refines $B$ iff every [true]{.refi}/[false]{.refi} commitment in $B$ is preserved in $A$ (monotonic information ordering). 1--2 sentences + a definition block.

**Blocking?** Moderately. Without this, the reader has no formal anchor for what "refinement" means when the paper says "generated models are refinements of the partial specification." The prose at line 45 ("unknown values are gradually refined to either true or false") gives the intuition, but the Mathematician reviewer will want the ordering.

### `.formal` at lines 85--87: Propagation rule semantics

**What it needs:** A formal statement that propagation rules fire when their precondition matches under [must]{.refi} interpretation, and the consequent is forced (positive) or eliminated (negative). Boolean encoding and fixpoint computation. 3--5 sentences.

**Blocking?** Yes, for the Mathematician reviewer. Lines 83--84 describe propagation in prose but do not formalize the firing condition or the fixpoint. Without this, the claim that propagation "narrows the space of possible completions" (line 83) is informal hand-waving.

### `.formal` at lines 109--111: Soundness and completeness

**What it needs:** A formal claim: (1) every concrete model generated by Refinery satisfies all specified constraints (soundness), and (2) if no consistent completion exists, Refinery reports unsatisfiability (completeness). Reference Semerath et al. 2018.

**Blocking?** Yes. This is the formal backbone of Claims #4, #9, and #10. Line 107 states the guarantee in prose, but the Mathematician reviewer will expect a precise formulation, especially since `decision_soundness_completeness` requires it. Per VENUE.md calibration: "The paper can rely on Refinery's established soundness (cite Semerath et al.) rather than re-proving tool properties." So a cited formal claim, not a proof, is needed.

**Summary:** All three are assigned to Oszkar. The soundness/completeness placeholder is the most critical. If none are filled, the Mathematician reviewer has grounds to reject on insufficient formalization of the tool's guarantees. If only one can be filled, it should be the soundness/completeness statement.

---

## 6. Reviewer Persona Vulnerability

### A -- Champion (MDE-for-New-Domains Advocate)

**Attack vector:** The bridge paragraph (line 28) is the only place that synthesizes all three concerns into a single argument. If the Champion cannot recover the "three pillars converge to enable cross-layer analysis" message quickly, the section fails its structural job. Currently the bridge is a list ("format-dependent privacy capabilities, independently governed layers, and partial graph reasoning") without stating *why* their convergence matters.

**Severity:** Low. The Champion will likely fill in the gap from the rest of the paper.

### B -- Mathematician (Graph Modeling / Partial Models Expert)

**Attack vectors:**

1. **Three missing formal definitions.** The Mathematician will note that refinement ordering, propagation semantics, and soundness/completeness are promised but absent. This is the primary vulnerability.

2. **Four-valued vs. three-valued.** Line 33 says "four-valued logic interpretation" citing Belnap. Line 42 defines the four values. But the VENUE.md says the Mathematician will "check correct characterization of Refinery's 3-valued semantics." There is a discrepancy: does Refinery use three-valued or four-valued? The section says four-valued (citing Belnap), but if Refinery's implementation is three-valued (as VENUE.md implies), this is a factual error that the Mathematician will catch. This needs verification.

3. **Predicate satisfaction definition (lines 57--59).** "A conjunction of conditions evaluates to the least committed value among its operands" -- this is informal. The Mathematician will ask: what is the ordering? Is [unknown]{.refi} less committed than [true]{.refi} or [false]{.refi}? The information ordering ($\bot \leq \text{unknown} \leq \text{true}, \text{false}$) is never stated. Without the refinement ordering (placeholder at line 47), this definition floats.

4. **Negation semantics.** Line 58 says "Negation and transitive closure extend analogously over the four values" but does not define the extension. For a four-valued logic, negation of [unknown]{.refi} is [unknown]{.refi} but negation of [error]{.refi} is [error]{.refi}. The Mathematician may demand this.

5. **Missing reference to Famelis/Chechik.** VENUE.md says the Mathematician will check for "Chechik/Famelis partial models" in related work. The section cites `@famelisPartialModelsModeling2012` (line 32) but only in passing. If the related work section does not elaborate, this background mention may be insufficient.

**Severity:** High. The Mathematician is the most dangerous reviewer for this section.

### C -- Business Manager (MDE Practitioner)

**Attack vectors:**

1. **Credential schema undefined.** As noted in Section 4 above. The Business Manager needs this term defined before Sec 04.

2. **Sec 2.3 is dense.** Two code listings, three definitions, an example, and three placeholders in ~80 lines. The Business Manager may skim this section entirely. The saving grace is that the code listings are concrete and readable. But if the Business Manager cannot follow the argument from prose alone (skipping definitions), the section fails the explanation floor.

3. **"Why do I care about four-valued logic?"** The connection between partial models and credential ecosystem design appears only in the final paragraph (line 113). The Business Manager who loses patience before line 113 never learns why Refinery matters for the domain.

**Severity:** Medium. The Business Manager will likely forgive a dense Background if the running example (Sec 03) is accessible.

### D -- Adversarial (Competing Formalism Advocate)

**Attack vectors:**

1. **"Why not Alloy/OCL?"** Sec 2.3 presents Refinery without comparing to alternatives. The Adversarial reviewer's attack #2 ("tool dependency -- remove Refinery and what remains?") starts here. If Background presents Refinery as the only option without justifying the choice, the tool-dependency attack gains strength. The justification appears in the final paragraph (line 113: "requirements arrive incrementally... so the designer must reason over partial specifications") but it is buried.

2. **"Your error predicate is just a constraint violation check."** Lines 79--80 define `disconnected` as an error predicate using transitive closure. The Adversarial reviewer may argue this is a standard OCL invariant or Alloy assertion, not a novel mechanism. The section does not distinguish Refinery's error predicates from standard constraint languages.

3. **Shadow predicate is unexplained.** Line 89 introduces shadow predicates ("records derived information for inspection without constraining generation") but does not explain why this mechanism matters or how it differs from a derived attribute. The Adversarial reviewer will dismiss it as trivial.

**Severity:** Medium. These attacks target the tool justification, which is addressed in related work (line 113 references `\autoref{sec:rw-multilevel}`).

---

## Summary of Findings

| Category | Status | Critical Issues |
|----------|--------|----------------|
| Claim support | Adequate | Bridge paragraph (line 28) is weak for Claim #3 |
| Decision compliance | Mostly compliant | `soundness_completeness` formal content missing; `bg_backref_convention` memory file missing from disk |
| Markers | 3 `.formal` | All assigned to Oszkar; soundness/completeness is most critical |
| Argument quality | Mixed | Sec 2.1 meets floor except credential schema; Sec 2.2 is solid; Sec 2.3 opening is throat-clearing |
| Formal placeholders | All blocking | Mathematician reviewer needs at least the soundness/completeness statement |
| Reviewer vulnerability | High (Mathematician) | Missing formals, possible 3-valued vs 4-valued discrepancy, undefined information ordering |

**Top 3 actions by submission risk:**

1. Fill the soundness/completeness `.formal` placeholder (lines 109--111). Without it, Claim #4 has no formal anchor in Background.
2. Verify the three-valued vs. four-valued characterization of Refinery. VENUE.md says "3-valued"; the section says "four-valued" citing Belnap. If both are correct (Refinery extends to four-valued), the section must clarify the relationship. If the section is wrong, fix it.
3. Define "credential schema" somewhere in Sec 2.1 or 2.2 to meet the Business Manager explanation floor.
