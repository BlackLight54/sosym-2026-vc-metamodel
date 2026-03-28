# S02: Background Review

**Reviewed:** 2026-03-27 | **Deadline:** 2026-03-29 AoE (2 days) | **Budget:** 1.25 pages

## Section Assessment

- **Overall verdict:** NEEDS WORK (minor — fixable in one editing pass)
- **Reviewer A (Champion): weak accept (5)** — Background motivates the multi-layer separation well; the final sentence of 2.1 explicitly points forward. Governance paragraph (cutcandidate) is the one piece that makes the champion argument land in Background — cutting it weakens motivation.
- **Reviewer B (Mathematician): borderline (4–5)** — Refinery semantics are competently summarized but imprecise in two places. "Open-world assumption" characterization needs tightening. Propagation rules are described but negative elimination is introduced without grounding. Would want a citation for the three-valued interpretation claim.
- **Reviewer C (Business Manager): weak accept (5)** — VC concepts are accessible. Selective disclosure and predicate proofs defined by example. Multi-level modeling paragraph is dense but workable. The Refinery subsection, however, introduces four mechanisms in one paragraph with no example — a non-expert will lose the thread.
- **Reviewer D (Adversarial): borderline (4)** — The Refinery subsection reads as a tool advertisement. No mention of alternative partial-model frameworks or model finders (Alloy, USE/OCL, FORMULA). The adversarial reviewer will say the paper stacks the deck for Refinery without justifying the choice.

## Critique

### Issue 1: "Open-world assumption" is imprecise for Refinery's semantics

- **Location:** 2.3, sentence "the framework evaluates them under an open-world assumption, so an unsatisfied constraint in a partial model does not constitute a violation unless it is definite"
- **Severity:** IMPORTANT
- **Issue:** Refinery uses three-valued logic (must/must not/unknown) with a refinement-based semantics, not an open-world assumption in the OWL/description-logic sense. The OWA means absence of information does not entail negation; Refinery's semantics is stronger — an unknown edge is a *design choice yet to be made*, not missing information. A partial models expert (Reviewer B) will flag this as a category error. The correct framing: constraints are evaluated over partial interpretations where unknown elements may be refined in either direction, so a constraint violation is definite only when it holds under all possible refinements (i.e., the constraint's error predicate has value *must*).
- **Which reviewer catches it:** Reviewer B (Mathematician) — score drops to 4 if uncorrected; may trigger a "misunderstands the formalism" comment.
- **Suggested fix:** Replace "open-world assumption" with a precise characterization: constraints are evaluated over partial interpretations, and a violation is confirmed only when the error predicate evaluates to *must* (definite) — i.e., it holds in every possible refinement.

### Issue 2: Negative elimination introduced without motivation or example

- **Location:** 2.3, sentence "a special case is *negative elimination*, where the rule removes design choices that would necessarily violate a constraint"
- **Severity:** POLISH
- **Issue:** Negative elimination is a Refinery-internal term. It appears once here, is not used again in 2.3, and Section 04 would need to re-introduce it anyway. For a 1.25-page budget, either ground it with a one-clause example ("e.g., removing a format assignment that would violate a governance constraint") or defer it entirely to Section 04 where it earns its space.
- **Which reviewer catches it:** Reviewer C (Business Manager) — opaque jargon without payoff.
- **Suggested fix:** Add a parenthetical example tied to the running example domain, or cut the term here and introduce it in Section 04.

### Issue 3: No alternative partial-model tools mentioned

- **Location:** 2.3 (entire subsection)
- **Severity:** IMPORTANT
- **Issue:** The Background establishes Refinery as the partial graph modeling framework without acknowledging alternatives. Reviewer D's attack #2 is "tool dependency — remove Refinery and what remains?" The defense (per VENUE.md calibration) is that the metamodel is the contribution and the tool enables validation. But the background must at least acknowledge that other model finders exist (Alloy, USE/OCL, FORMULA) and state why partial graph modeling specifically is needed — namely, three-valued interpretation over incomplete designs, which Alloy's two-valued semantics does not provide. Without this, Reviewer D scores reject.
- **Which reviewer catches it:** Reviewer D (Adversarial) — this is attack vector #2.
- **Suggested fix:** Add 1-2 sentences at the start of 2.3 or as a transition from 2.2: "Several model-finding approaches support constraint-based generation (Alloy, USE/OCL), but they operate over fully specified models. Partial graph modeling is needed here because credential ecosystem designs are inherently incomplete — format assignments, claim mappings, and subject bindings may remain open during design exploration." Then introduce Refinery as the framework that provides this.

### Issue 4: The cutcandidate governance paragraph should be kept

- **Location:** 2.1, the `:::cutcandidate` block (B3)
- **Severity:** IMPORTANT
- **Issue:** This paragraph does three things: (a) anchors eIDAS as a hard format mandate, (b) introduces GDPR data minimization as operationally binding, (c) states the governance sources were not designed for joint satisfaction. All three are load-bearing for Section 03's motivation, which builds directly on the governance conflict. The cutcandidate note says "eIDAS/ARF anchor in B2 final sentence suffices," but B2's final sentence only mentions mdoc simplification — it does not establish the GDPR data-minimization demand. Cutting this paragraph forces Section 03 to re-introduce GDPR, costing the same or more space there.
- **Which reviewer catches it:** Reviewer A (Champion) — loses the governance framing that makes cross-layer conflicts non-trivial. Reviewer C — loses the accessible "these rules conflict" setup.
- **Suggested fix:** Keep the paragraph. Remove the cutcandidate wrapper. If budget is tight, compress by cutting "These governance sources were not designed for joint satisfaction" (already implied and stated explicitly in 2.2 and 03).

### Issue 5: Section 2.2 conflates multi-level modeling definition with this paper's specific design choices

- **Location:** 2.2, second paragraph starting "Layer definitions in \autoref{sec:approach} use Ecore-style class diagrams..."
- **Severity:** IMPORTANT
- **Issue:** The second paragraph of 2.2 belongs in Background conceptually but mixes Background content (what partial models are, what trace relationships are) with forward-looking design decisions (Ecore-style class diagrams, partial models with must/absent/open status, cross-layer trace references). A Background section should establish the concepts the reader needs; the specific modeling choices should appear in Section 04. This conflation causes two problems: (a) it front-loads approach decisions into background, and (b) it partially duplicates what 2.3 says about partial models ("model elements may have definite (must), absent (must not), or open (unknown) status") — the three-valued interpretation is introduced twice, once in 2.2 and once in 2.3.
- **Which reviewer catches it:** Reviewer B (Mathematician) — will note the redundancy. Reviewer D — will say the paper is smuggling design decisions into background.
- **Suggested fix:** Split the paragraph. Keep in 2.2 only the general claim: multi-level metamodeling defines types at one layer whose instances populate the layer below, and the three layers in this paper are abstraction layers in this sense. Move the Ecore-style notation, partial model characterization, and trace relationship details to Section 04 where they are approach-specific decisions.

### Issue 6: Potency concept is named but not defined

- **Location:** 2.2, "a mechanism called *potency* controls how many such instantiation steps each element can undergo"
- **Severity:** POLISH
- **Issue:** Potency is introduced by name and given a one-clause definition, which is sufficient for the Champion and Business Manager. However, Section 03 and Section 04 never use potency explicitly — if it is not used later, why introduce it? If it is used later, it needs a slightly more precise definition (e.g., "an element with potency $n$ can be instantiated $n$ times across successive layers; potency 0 marks a fully instantiated element"). As written, it occupies space without payoff.
- **Which reviewer catches it:** Reviewer B — either wants it precise or wants it gone.
- **Suggested fix:** Check whether potency appears in Section 04. If yes, add a parenthetical example. If no, cut the potency clause and cite Atkinson & Kuhne for the general framework only.

### Issue 7: Citation density in 2.1 paragraph 2 is high but appropriate — one gap

- **Location:** 2.1, paragraph 2
- **Severity:** POLISH
- **Issue:** The paragraph correctly cites SD-JWT-VC, AnonCreds, Data Integrity, BBS, ISO 18013-5, and eIDAS ARF. However, the claim "BBS+ signatures can in principle support predicate proofs, and specification work is ongoing" has no citation. This is a factual claim about W3C specification status that needs a reference — either to a W3C working group charter, a BBS+ spec draft, or a community group note.
- **Which reviewer catches it:** Reviewer B — unsubstantiated technical claim.
- **Suggested fix:** Add a citation to the W3C BBS Signature draft or the Decentralized Identity Foundation's work on BBS+ predicate proofs, or soften to "BBS signatures have been proposed for predicate proof extensions" with a citation.

### Issue 8: The @TODO marker in 2.2 should be resolved before submission

- **Location:** 2.2, line 27: `%% @TODO: Review B5 with Oscar — verify partial model and trace characterization matches Refinery semantics %%`
- **Severity:** CRITICAL (if unresolved at submission) / POLISH (if addressed)
- **Issue:** This TODO asks to verify technical correctness with the advisor. With 2 days to deadline, this must be resolved or the TODO removed. If the characterization is wrong, it could trigger Reviewer B's reject.
- **Which reviewer catches it:** N/A (invisible in rendered output), but the underlying concern is real.
- **Suggested fix:** Resolve with Oscar before submission. If not possible, flag it as a known risk.

## Cross-Section Dependency Check: Does Sec 02 set up what Sec 03 needs?

Section 03 uses these concepts from the VC domain: claim, issuer, holder, verifier, selective disclosure, predicate proofs, credential format diversity (SD-JWT-VC, AnonCreds), eIDAS format mandate, GDPR data minimization. **All are introduced in 2.1.** Good.

Section 03 uses these modeling concepts: multi-level abstraction layers, partial models, cross-layer constraints. **Multi-level layers are in 2.2. Partial models are in 2.2 and 2.3. Cross-layer constraints are in 2.3 (error predicates).** Adequate.

One gap: Section 03.1 mentions "cross-credential predicate evaluation spanning the family status and property credentials, which no deployed format supports in zero-knowledge." The concept of cross-credential arithmetic is not set up in Background — Section 2.1 discusses predicate proofs within a single credential only. This is minor (Section 03 can introduce it as a novel requirement), but a sentence in 2.1 noting that existing predicate proof mechanisms operate per-credential would make the Section 03 argument cleaner.

## Fix-It Prompt

```
# Fix Background Section (02_background.md)

## Context
You are editing the Background section of a MODELS 2026 Foundations Track paper.
Read: sections/02_background.md, context/DECISIONS.md, context/VENUE.md.
Budget: 1.25 pages. Deadline: 2 days. Changes must be surgical — no rewriting.

## Changes (in priority order)

### 1. Fix "open-world assumption" in 2.3 (IMPORTANT)
Replace the sentence containing "open-world assumption" with precise Refinery semantics:
constraints are evaluated over partial interpretations; a violation is confirmed only when
the error predicate evaluates to *must* — i.e., it holds under every possible refinement
of the partial model. Do not use the term "open-world assumption."

### 2. Add tool justification to 2.3 (IMPORTANT)
Add 1-2 sentences at the start of 2.3 (before "Refinery is a partial graph...") that:
(a) acknowledge alternative model finders (Alloy, USE/OCL) operate on fully specified models,
(b) state why partial graph modeling is needed: credential ecosystem designs are inherently
incomplete — format assignments, claim mappings, subject bindings remain open during design.
Then Refinery is introduced as the framework providing this. Keep tight — max 2 sentences.

### 3. Keep the governance paragraph in 2.1 (IMPORTANT)
Remove the ::: cutcandidate wrapper around the eIDAS/GDPR paragraph. Keep the paragraph.
Optionally compress the final sentence if budget is tight.

### 4. Split 2.2 paragraph 2 (IMPORTANT)
Move the Ecore-style notation, partial model status characterization, and trace relationship
details out of 2.2 into a note for Section 04. Keep in 2.2 only: "Layer definitions in
\autoref{sec:approach} use typed metamodel definitions; their formal structure is presented
in \autoref{sec:approach}." or similar forward pointer. The three-valued interpretation
should appear only once, in 2.3.

### 5. Ground negative elimination (POLISH)
In 2.3, after "negative elimination," add a parenthetical: "(e.g., removing a format
assignment that would necessarily violate a governance constraint)".

### 6. Resolve potency (POLISH)
Check whether potency is used in Section 04. If not, cut the potency clause from 2.2.
If yes, add a one-sentence example.

### 7. Add citation for BBS+ predicate proof claim (POLISH)
In 2.1 paragraph 2, add a citation after "specification work is ongoing" — either to a
W3C BBS draft or soften the claim.

### 8. Add cross-credential predicate proof gap (POLISH)
In 2.1, add one sentence noting that existing predicate proof mechanisms operate
per-credential (within a single credential's claims), setting up Section 03's
cross-credential constraint.

### 9. Resolve or remove the @TODO in 2.2
Verify with Oscar or remove the marker.

## Constraints
- Do not exceed 1.25-page budget.
- Do not use MDA terminology (CIM/PIM/PSM). See DECISIONS.md.
- Maintain Obsidian Markdown with Mathpix conventions.
- Use \autoref{} for all cross-references.
```
