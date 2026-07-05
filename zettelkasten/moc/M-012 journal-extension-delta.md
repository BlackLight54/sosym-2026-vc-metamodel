---
id: M-012
title: MOC — journal extension delta (what makes this more than the conference paper)
type: moc
maturity: developing
tags: [kind/method, prov/self]
sources: ["inbox/todoist/publication-threads.md", "moc/M-007 writing-gaps.md", "context/threats_to_applicability_2026-06-18.md"]
related: ["[[M-001 journal-paper-outline]]", "[[M-007 writing-gaps]]", "[[M-011 claim-delivery-matrix]]", "[[M-009 threats-to-applicability]]"]
created: 2026-07-05
---

The conference paper (MODELS'26, withdrawn — [[S-027 own-tdk-thesis-mda]] records the history) becomes
a journal article only if the delta is substantive, not cosmetic. This map fixes what the delta *is*,
ranked by claim impact, so the research-proposal step selects rather than invents. Working venue
target: **SoSyM** (Todoist thread "Write the SoSyM paper", due 2026-06-17; venue-fit analysis pending,
task 6g86Rjv3VxvFvMmv). `context/VENUE.md` still describes MODELS'26 and must be re-populated before
the spin commits to format claims.

## Extension narrative (one sentence)
The journal article extends the conference formalization with a broadened, re-verified governance
catalogue, a strengthened expressiveness result, and an explicit external-validity treatment grounded
in the regulator's own June-2026 text.

## Delta candidates, ranked by claim impact

**Tier 1 — strengthens a binding claim directly:**
- Close [[Q-004 attestation-qualification-levels]] (attestation subtypes in the metaclass hierarchy):
  moves three ARF constraints from partial to full → [[K-006 expressiveness-validation]].
- Close [[Q-005 claim-granularity-privacy-annotations]] (claim-level privacy markers): moves the other
  two partials → [[K-006 expressiveness-validation]], refines [[K-005 coverage-validation]].
- Re-verify ARF-C1..C8 against v2.9.0 and re-run the expressiveness classification (O-EUTHREAT) —
  mandatory regardless of other choices ([[D-016 dated-snapshot-method-over-catalogue]]).
- §5.3 external validity: RP boundary + threats, from [[M-009 threats-to-applicability]]
  ([[D-013 verifier-scope-issuer-remit]]).

**Tier 2 — broadens the contribution visibly:**
- Catalogue extensions from the precursor: [[C-035 dependent-claim-bundling]] and
  [[C-036 static-dynamic-revocation-mismatch]] as C10/C11 (both "must be together" and "must be apart"
  partitioning rules — a new constraint family axis).
- Model dual issuance explicitly instead of the w.l.o.g. simplification
  ([[D-017 mdoc-simplified-wlog]] revisit, [[C-033 dual-issuance-mandate]]): a conjunctive format
  mandate is a new constraint shape and tightens Headline 1.
- Regulator-documented motivation ([[D-014 regulator-documented-conflict]]) and the disclosure
  spectrum as background structure ([[C-039 disclosure-spectrum]]).

**Tier 3 — evaluation robustness:**
- Structurally diverse scalability instances ([[Q-007 scalability-deeper-hierarchies]]).
- FSL intra-layer constraints ([[Q-002 fsl-intra-layer-constraints]]) and range proofs
  ([[Q-003 range-proof-semantics]]) if Tier 1 leaves room.
- Portability probe or precise characterization of what four-valued semantics buys
  ([[Q-006 portability-beyond-refinery]]).

**Tier 4 — future-work paragraphs only (scope risk if more):**
[[Q-008 broaden-governance-catalog]], [[Q-009 functional-extrafunctional-capability-matrix]],
[[Q-010 fca-ecosystem-maturity-metrics]], [[Q-011 wallet-provider-eudiw-landscape]],
[[Q-012 llm-schema-generation-formal-guardrails]], verifier extension realized
([[C-040 verifier-side-extension-sketch]]).

## Heilmeier pre-answers (research-proposal seed)
1. *What are you trying to do?* Make cross-layer design errors in credential ecosystems detectable
   before deployment, by formalizing multi-source governance constraints over a three-layer metamodel
   ([[K-001 three-layer-metamodel]], [[C-009 cross-layer-constraint]]).
2. *How is it done today, and what are the limits?* Per-layer inspection and informal layered models
   (ToIP); single-layer checks cannot express, let alone detect, cross-layer conflicts
   ([[C-027 multilayer-invisibility]], [[S-015 davie-trust-over-ip-2019]]).
3. *What is new, and why will it succeed?* Cross-layer constraints as graph predicates over partial
   models, with governance sources first-class; succeeds because the solver inherits soundness and
   bounded completeness ([[K-003 cross-layer-constraints-as-predicates]], [[C-019 soundness-completeness-guarantee]]).
4. *Who cares?* Ecosystem designers under eIDAS 2 deadlines and the regulators whose own framework
   documents the conflict ([[C-034 statutory-unlinkability-gap]], [[S-039 aepd-eudiw-gdpr-analysis]]).
5. *What difference does it make if it works?* Governance conflicts surface as model-checking verdicts
   at design time instead of deployment failures; the EU stack instance is already jointly
   unsatisfiable ([[K-008 contradictory-cross-framework-constraints]]).
6. *What are the risks?* The objection ledger, ranked: [[M-010 objection-ledger]]; the applicability
   threats: [[M-009 threats-to-applicability]].
7. *How will progress be checked?* Claim by claim against [[M-011 claim-delivery-matrix]] — a claim is
   done when its row has evidence, figure, and an empty Open cell.

## Source
Todoist publication threads (2026-06-17 pull); M-007 gaps; threats and framing passes 2026-06/07.
