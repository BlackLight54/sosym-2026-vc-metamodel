---
id: M-010
title: MOC — objection ledger (attack → committed rebuttal → landing spot)
type: moc
maturity: developing
tags: [kind/method, prov/self]
sources: ["context/VENUE.md reviewer personas", "context/archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md", "context/threats_to_applicability_2026-06-18.html"]
related: ["[[M-004 novelty-and-positioning]]", "[[M-009 threats-to-applicability]]", "[[M-011 claim-delivery-matrix]]"]
created: 2026-07-05
---

The argumentation plane of the base: every anticipated reviewer attack, the committed rebuttal, and
where the rebuttal lands in prose. The spin document must position every contribution against this
ledger; paragraph engineering must not contradict a committed rebuttal. Personas (Champion,
Mathematician, Practitioner, Adversarial) are instantiated in `context/VENUE.md` and will be
regenerated for the journal venue; the attacks below are venue-independent.

| # | Objection (raiser) | Committed rebuttal | Lands in |
|---|---|---|---|
| O1 | "Just MLM applied to a new domain" (Adversarial) | Layers are independently governed concern spaces coupled by coverage/capability constraints, not instantiation; predicates, not potency; the contribution is constraint formalization under multi-source governance → [[K-015 differentiation-mlm-new-domain]], [[C-001 three-layer-metamodel-overview]] | Related work §6.3 + intro contribution framing |
| O2 | "Remove Refinery and what remains?" (Adversarial) | The metamodel and constraint catalogue are the contribution; the tool validates. Predicates are framework-independent graph patterns over partial models; four-valued semantics is what alternatives lack, not a crutch → [[C-006 partial-graph-modeling-refinery]], [[Q-006 portability-beyond-refinery]] | Background §2.3 tooling justification + threats |
| O3 | "Synthetic evaluation, hand-crafted anti-patterns" (Adversarial) | Constraints and anti-patterns trace to cited normative sources: ARF rules ([[S-034 eudiw-arf-2.9.0]]), GDPR + enforcement ([[S-041 gdpr-2016-679]], [[S-042 naih-minimization-fine-2020]]), decree ([[S-043 csok-decree-518-2023]]), W3C bundling case ([[C-035 dependent-claim-bundling]]). Journal additions (2026-07-13): the X.509 precedent leg grounds the taxonomy in documented incident history, not our own constructions (proto-SLR axis d: anticipation precedent, taxonomizability, per-class carriers; `context/slr/corpus_map.md` §4), and Q-007 diverse instances add an empirical leg ([[D-021 q007-structurally-diverse-instances]]) | Evaluation §5.1 sourcing sentences + taxonomy section motivation |
| O4 | "FSL is thin; three-layer claim is aspirational" (Adversarial) | FSL carries the capability predicates that do the causal work (both headlines run through it); no intra-layer constraints is a defended scope choice with upward propagation as the payoff → [[C-004 format-specific-layer]], [[D-012 format-driven-restructuring]]; journal elaboration in [[Q-002 fsl-intra-layer-constraints]] | Approach §4.3 + limitations |
| O5 | "The conflict is manufactured by over-reading GDPR" (Mathematician/Adversarial) | Two-tier grading ([[C-024 two-tier-governance-framing]], [[D-011 gdpr-two-tier-operationalization]]) + enforcement precedent ([[S-042 naih-minimization-fine-2020]]) + the regulator documents the same conflict shape itself ([[D-014 regulator-documented-conflict]], [[C-034 statutory-unlinkability-gap]]) + G0–G7 minimality ([[A-004 constraint-sensitivity-variants]]) | Motivation §3 + evaluation §5.1.3 |
| O6 | "You model half the governance — verifiers are regulated too" (Adversarial/Practitioner) | Issuer-side remit stated, verifier axis named as the extension of the same method; over-asking is structurally a cross-layer predicate → [[D-013 verifier-scope-issuer-remit]], [[C-040 verifier-side-extension-sketch]] | §5.3 external validity |
| O7 | "Citations superseded; regulation moved" (Practitioner) | Dated snapshot + method-over-catalogue framing; v2.9.0 re-verification before submission → [[D-016 dated-snapshot-method-over-catalogue]], [[S-036 eidas2-implementing-acts-timeline]] | As-of footnote + threats |
| O8 | "Five of eight ARF constraints only partial — the model can't handle eIDAS" (Mathematician) | Strength-first, partials owned: two named root causes, both closable by metaclass extension without changing the formalization → [[D-015 expressiveness-strength-first]], [[Q-004 attestation-qualification-levels]], [[Q-005 claim-granularity-privacy-annotations]] | Evaluation §5.1.2 partials paragraph |
| O9 | "No user study; can practitioners use this?" (Practitioner) | Realistic axis declared out of scope, not hidden ([[D-009 core-disc-properties-scope]], [[Q-001 empirical-evaluation-with-designers]]) | Limitations |
| O10 | "One domain, one jurisdiction" (Generalizability) | Claim only what is shown; EU stack positioned as one instantiation of the method; second jurisdiction named as future work → [[Q-008 broaden-governance-catalog]], [[D-016 dated-snapshot-method-over-catalogue]] | Threats + future work |
| O11 | "Necessity of multi-layer modeling is overclaimed" (Mathematician) | Calibrated as sufficiency + structural prerequisite, not a necessity proof; the graduated-visibility argument carries it → [[K-010 necessity-of-multilayer-modeling]], [[C-027 multilayer-invisibility]] | Evaluation §5.1.4 + conclusion |
| O12 | "Baseline comparison has a definitional advantage" (Mathematician) | Acknowledged explicitly; the residual claim is systematicity (all five anti-pattern categories detected in one framework) → [[C-027 multilayer-invisibility]], [[K-009 multilayer-invisibility]] | Evaluation §5.1.5 |
| O13 | "RQ0 is speculative: the B2B/B2G ecosystems whose errors you anticipate do not exist" (Adversarial/Practitioner; added 2026-07-13 with RQ0, [[D-020 rq0-relevance-and-error-taxonomy]]) | Own the hypothesis explicitly, then argue three fully citable legs (proto-SLR verdict, `context/slr/corpus_map.md` §2): (1) the definitional gap and emergence evidence, 2020-2026 gap chain plus pilots and one production counterpoint; (2) design errors already visible pre-deployment in the EUDI B2C build-out; (3) the X.509 anticipation precedent, risks named in 2000 that materialized as documented incidents. Claims narrowed to "errors visible in specifications and pilots"; no post-deployment VC evidence is asserted | Introduction RQ0 paragraph + motivation §3 + taxonomy section |

## Reading rule
An objection with no committed rebuttal is a gap: add the rebuttal here *before* drafting the section
it would land in. New objections discovered during review join the ledger; rebuttals that harden into
framing become D-notes.

## Source
Reviewer personas (`context/VENUE.md`, to be re-instantiated for the journal venue); gap-analysis
differentiations D1–D5; threats synthesis 2026-06-18; framing pass 2026-07-04.
