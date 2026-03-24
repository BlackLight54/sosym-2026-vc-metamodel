# Venue

Derived from CFP.md. Contains interpreted, project-specific settings. Populate using `skills/cfp_import/SKILL.md` or manually.

## Budget and format

- **Venue:** MODELS 2026 — Foundations Track (Research Papers)
- **Page limit:** 10 pages (main text, including figures, tables, appendices) + 2 pages references only. Violations → desk reject.
- **Format:** ACM `sigconf`. `\documentclass[sigconf,review]{acmart}` with `\bibliographystyle{ACM-Reference-Format}`. Templates: https://www.acm.org/publications/proceedings-template

## Deadlines

- **Abstract deadline:** 2026-03-20 (AoE) — PASSED
- **Submission deadline:** 2026-03-27 (AoE)
- **Notification:** 2026-06-17
- **Camera-ready:** 2026-07-31
- **Rebuttal window:** 2026-05-27 – 2026-05-29 (author response period, only for papers with "sufficient support for potential acceptance")

## Review type

%% Controls Rule 7 in CLAUDE.md. %%
**Type:** double-blind (double-anonymous). Authors not identified to reviewers, reviewers not identified to authors. No author names in submission. Own prior work in third person. No preprint links to MODELS 2026. Supplemental material must not reveal identity.

## Reviewer personas

%% Generated 2026-03-24 from guides/reviewer_archetypes. Re-run after drafting for recalibration. %%

### A — Champion: "MDE-for-New-Domains Advocate"

Senior MDE researcher applying metamodeling to emerging domains (CPS, IoT, regulatory). Knows EMF/Ecore. Excited by papers showing modeling reveals otherwise-invisible problems in a new domain — and enables collaboration between stakeholders with conflicting governance requirements. Will champion if the cross-layer conflict insight is clear and the contribution is framed as a metamodeling advance that mediates tough multi-stakeholder design, not a domain tutorial. Score range: weak accept → accept if "so what" lands; neutral if buried.

**Champion argument:** "This paper shows credential ecosystem design has formally conflicting cross-layer constraints — imposed by independent governance stakeholders — invisible to single-layer inspection, and a layered metamodel with graph predicates makes them detectable and negotiable; a clean MDE contribution to an important emerging domain with real multi-stakeholder coordination challenges."

### B — Mathematician: "Graph Modeling / Partial Models Expert"

Graph transformations, partial models, or constraint-based modeling. Knows Refinery or its foundations. Could be someone aligned with Semerath/Varro/Chechik/Famelis. Will check every predicate and propagation rule, metamodel definitions, trace link properties, correct characterization of Refinery's 3-valued semantics. Will attack imprecise definitions, mischaracterized partial model semantics, missing related work (Chechik/Famelis partial models, Kuehne/Atkinson multi-level modeling, Diskin multi-view consistency). Score range: accept if formalism is precise and novel; reject if definitions are sloppy.

### C — Business Manager: "MDE Practitioner / Generalist"

Practical MDE (model transformations, code generation, DSL tooling). Knows metamodels and EMF. Does NOT know partial models, VCs, SSI, or W3C VCDM. Needs clear problem motivation without VC expertise, running example before formalism, accessible evaluation. Will attack inaccessible writing, insufficient VC domain background, "technically sound but limited impact." Score range: borderline → weak accept; drops to reject if paper is inaccessible without VC knowledge.

### D — Adversarial: "Competing Formalism Advocate"

Multi-level modeling, OCL constraints, or Alloy-style model finding. Predisposed to see contribution as incremental ("multi-layer metamodeling applied to VCs") or tool-dependent ("Refinery demo"). Four attacks: (1) novelty reduction to multi-layer metamodeling + new domain; (2) tool dependency — remove Refinery and what remains?; (3) synthetic evaluation with hand-crafted anti-patterns; (4) PSM layer is empty classes — three-layer claim is aspirational, paper delivers two. Score range: reject by default; borderline if paper explicitly distinguishes from standard multi-layer metamodeling, justifies Refinery's role, grounds evaluation in real sources.

### Calibration guidance

- **Significance framing** (Champion): The champion argument above must be recoverable from the abstract's final sentence and introduction P3. If it can't be stated in one sentence, the framing needs work.
- **Rigor ceiling** (Mathematician): Each layer needs a clear metamodel definition and well-formedness constraints. Cross-layer constraints presented as graph predicates. The paper can rely on Refinery's established soundness (cite Semerath et al.) rather than re-proving tool properties — appropriate for a 10-page paper. Focus rigor on: precise layer definitions, well-motivated constraint formalization, correct use of Refinery concepts. Related work must address multi-level modeling (Kuehne/Atkinson) and graph-based consistency (Varro, Taentzer).
- **Explanation floor** (Business Manager): Define VC, credential schema, issuer/holder/verifier, selective disclosure in 1–2 sentences each. Motivate three-layer structure via concrete example before any formal definition. Running example must make each layer tangible and carry through to evaluation. A reader who skips formal definitions should follow the argument from prose + running example alone.
- **Defense points** (Adversarial): Pre-empt: (1) "not just multi-layer metamodeling for VCs" — multi-source constraint reconciliation across independently governed layers, not standard top-down refinement; (2) "why Refinery" — partial model semantics enable reasoning over incomplete designs during exploration; metamodel is the contribution, tool enables validation; (3) "PSM is thin" — either demonstrate one PSM-level constraint interacting with PIM, or scope explicitly to CIM/PIM with PSM as future work; (4) "synthetic evaluation" — ground anti-patterns in cited W3C/EU sources.

## Exemplar papers

%% 2-3 papers whose writing style the current paper should emulate. Style targets, not content references.
   Martin: I cannot confidently name specific MODELS papers without risk of fabrication.
   Please replace these with 2-3 well-written papers from recent MODELS proceedings
   (2022–2025) whose style you want to emulate. Prioritize papers that:
   - Are in the Foundations Track
   - Combine formal modeling with a domain application
   - Successfully explain formal content to a mixed MDE audience %%

- [Martin to fill — pick 2-3 style models from recent MODELS proceedings]

## Supplementary material strategy

%% What goes in the paper vs. appendix / technical report / artifact?
   This is a strategic decision: too much proof in the paper loses the non-expert reviewer;
   too little makes the expert reviewer say "the proof sketch is unconvincing." %%

- **In the paper:** Key definitions, main theorem/property statements, proof sketches, running example, case study summary
- **In appendix/supplement:** Appendices count within the 10-page limit, so no separate appendix. Supplementary material (full proofs, extended tool output) can be linked but must not reveal author identity.
- **As artifact:** Optional artifact evaluation track (post-acceptance, does not affect paper acceptance). Tool implementation, replication package, datasets. Seal of approval if accepted.
- **Venue appendix policy:** No separate appendix — anything within the 10 pages is reviewed. Supplementary repositories allowed but must be anonymized.

## Rebuttal format

%% Leave empty until reviews arrive. Populated by skills/rebuttal. %%

- **Word/page limit:** Not specified in CFP (author response period, not a formal rebuttal document)
- **Format:** Authors "answer specific questions from the program committee"
- **Scope of allowed changes:** Not specified — only papers with "sufficient support for potential acceptance" reach this stage
