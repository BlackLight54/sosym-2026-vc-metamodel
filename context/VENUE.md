# Venue

Derived from CFP.md. Contains interpreted, project-specific settings. Populate using `skills/setup_cfp_import/SKILL.md` or manually.

%% Re-populated 2026-07-13 under todo O-VENUE after the venue retarget to SoSyM (D-018). All facts were verified on 2026-07-13 against fetched pages: link.springer.com/journal/10270 (journal home and submission guidelines), sosym.org (home, /submission, /review_process). Anything not verifiable from a fetched page is marked UNVERIFIED. The superseded MODELS'26 record is in context/archive/venue_models26.md. %%

## Budget and format

- **Venue:** Software and Systems Modeling (SoSyM), Springer, journal no. 10270. Category: regular research paper.
- **Editors-in-chief:** Marsha Chechik (Toronto), Benoit Combemale (Rennes), Bernhard Rumpe (RWTH Aachen).
- **Page limit:** None. sosym.org/submission states there are no page restrictions. No fetched page documents a typical length for regular research papers; treat any specific number as UNVERIFIED and do not calibrate against one.
- **Submission format:** Font no smaller than 11pt, 1.5 line spacing (sosym.org/submission). Springer's submission guidelines direct authors to the Springer Nature LaTeX template with the `[iicol]` (double-column) formatting option; sosym.org describes the template as recommended, not required. The class file distributed with that template is `sn-jnl.cls` (standard name of the Springer Nature template distribution; the guidelines page names the template, not the file, so the file name itself is UNVERIFIED against the fetched page). Springer performs final typesetting on accepted papers.
- **Abstract:** 150 to 250 words (Springer submission guidelines).
- **References:** Numbered citations in square brackets; include DOIs as full links where available (Springer submission guidelines).
- **Source files:** Complete editable source files (text, style files, figures) must accompany every submission and revision, or the article is not sent to review (Springer submission guidelines).
- **Publication model:** Hybrid (subscription with open-access option). Impact factor 3.0 (2025) per the Springer journal page.

## Deadlines

- **Submission deadline:** None. Continuous submission; publication is first come, first served with possible fast-track exceptions (sosym.org/submission).
- **Internal target:** Not set. Martin sets the project-internal submission target. CLAUDE.md time awareness has no external deadline to count against until then.
- **Review timeline:** Editor assigned within 2 weeks of submission; reviews targeted within 8 weeks of reviewer acceptance; stated goal of contacting authors within 12 weeks of initial submission (sosym.org/review_process); editors-in-chief aim to obtain final reviews within sixteen weeks (sosym.org/submission). The Springer journal page reports a median of 4 days from submission to first decision, which plausibly reflects desk-stage decisions; treat the 12 to 16 week figures as the operative expectation.
- **Decision categories:** Accept; accept with minor modifications; conditionally accept with major changes (second review round); reject. A manuscript can undergo a major revision only once; needing a second major revision means rejection (sosym.org/review_process).

## Review type

%% Controls Rule 7 in CLAUDE.md. %%
**Type:** single-blind. The Springer submission guidelines state: "This journal follows a single-blind reviewing procedure." Author names appear on the submission; own prior work may be cited in first person. Each paper is reviewed by at least three reviewers (sosym.org/submission).

## Submission channel and policies

- **Submission system:** Manuscript Central (ScholarOne), https://mc.manuscriptcentral.com/sosym (sosym.org/submission and the Springer journal page).
- **No simultaneous submission** to other journals or conferences (sosym.org/submission).
- **Self-plagiarism thresholds:** Publication is prohibited when 75% or more of the content previously appeared in non-journal sources, or 40% or more in journal sources (sosym.org/submission). The withdrawn MODELS'26 submission was never published, so it does not count against these thresholds.
- **Paper types:** Regular papers, special section papers, theme section papers, tool papers, experience papers (sosym.org/submission).

## Theme sections

Open theme sections as of 2026-07-13 (sosym.org): Engineering of Digital Twins (open continuously); Software and Systems Modeling in Industry 5.0 (submissions close 2026-07-15); Data-intensive Software Product Lines (closed 2026-02-15); Large Language Models for Generative Software Engineering (closed 2026-02-15); Modeling for Simulation (closed 2025-04-01). None fits this paper; Industry 5.0 as a framing was already rejected (D-023). Target the regular research paper category. SoSyM also runs journal-first papers presented at MODELS (mentioned on sosym.org; eligibility windows and mechanics UNVERIFIED).

## Reviewer personas

%% Generated 2026-07-13 from skills/ref_reviewer_archetypes via skills/setup_reviewer_personas. SoSyM instantiation: single-blind journal, core-MDE audience, no page limit, 12 to 16 week review cycle with one possible major revision round. Objection IDs O1..O12 resolve in the M-010 ledger; ranking per context/spin_2026-07-06.md section 6. Journal difference from the MODELS instantiation: there is no PC meeting, so each persona acts through a written report and a recommendation to the handling editor; arguments must be recoverable from the paper's own text. Re-run after drafting; run skills/review_champion_test once the spine is frozen. %%

### A. Champion: "MDE-for-Regulated-Domains Advocate"

**Background:** Senior MDE researcher, plausibly on the SoSyM editorial board; applies metamodeling and model analysis to regulated or emerging domains (CPS, safety, compliance). Publishes on domain-specific modeling and validation; comfortable with EMF/Ecore; aware of the VIATRA/Refinery graph-solver lineage.

**What they value:** An archival contribution: a reusable method with evidence it outlives its instantiation, not a polished case study. The crisp insight that independently enacted governance sources impose formally conflicting cross-layer constraints, and that a layered metamodel with graph predicates makes those conflicts detectable during design.

**What they struggle with:** SSI format specifics (SD-JWT-VC vs mdoc capability differences); they take the format-layer facts on trust.

**What they attack:** Framing drift. If the paper reads as an eIDAS case study with modeling decoration, they will not argue for it. The method-over-catalogue claim (D-016) must be visible in the abstract and the introduction.

**Their likely question:** "What, concretely, must a reader change to re-instantiate the three layers and the predicate set for a non-EU governance stack, and which parts carry over unchanged?"

**Recommendation range:** Accept with minor revisions if the one-sentence significance argument is recoverable from the abstract and intro P3; major revisions if the method claim rests on the single EU instantiation with no stated re-instantiation path.

**Champion argument:** "Credential ecosystems are governed by independently enacted sources (W3C VCDM, eIDAS 2/ARF, GDPR) whose constraints can formally conflict across design layers; this paper gives a three-layer metamodel with cross-layer graph predicates that makes such conflicts detectable during design, demonstrated on a conflict the EU's own framework documents."

### B. Mathematician: "Partial Models and Graph Constraints Expert"

**Background:** Works on partial or uncertain models, graph constraints, or automated model generation. Knows Refinery's foundations (4-valued logic, refinement) or the adjacent partial-model line (Famelis, Salay, Chechik; one editor-in-chief works in exactly this area, so a reviewer from that lineage is plausible). Knows the related work better than the authors.

**What they value:** Precise layer metamodel definitions; well-defined cross-layer predicate semantics; correct characterization of partial model semantics and refinement; expressiveness claims delimited predicate by predicate (the D-015 strength-first, partials-owned structure).

**What they struggle with:** Little. They will skim the regulatory content and trust the legal reading.

**What they attack:** Informal use of 4-valued semantics; predicate satisfaction left ambiguous between per-layer evaluation connected by trace morphisms and evaluation over a merged model; "formalized" where the encoding is partial (O8: five of eight ARF constraints only partial); missing or mischaracterized related work on multi-level modeling (Atkinson, Kühne), multi-view consistency (Diskin), graph constraints (Taentzer, Varró), and OCL/Alloy alternatives.

**Their likely question:** "Is satisfaction of a cross-layer predicate monotone under Refinery refinement, and if not, what does a MAY verdict on a partial design commit the designer to?"

**Recommendation range:** Accept with minor revisions if definitions are complete at journal depth; major revisions if partial-model semantics stay informal or the O8 partials are not precisely delimited.

### C. Business Manager: "Applied Modeling Generalist / SSI-Adjacent Practitioner"

**Background:** Applied MDE (DSL tooling, code generation, UML-based analysis) or an identity-management practitioner who reads SoSyM for usable methods. Knows metamodels and constraints in practice; does not know Refinery, partial models, or the W3C VCDM in detail; knows eIDAS at the headline level.

**What they value:** Motivation grounded in a real regulation; a running example that makes each layer tangible; a workflow they can place in a design process; an evaluation whose questions they can assess without checking the formalism.

**What they struggle with:** Graph predicate notation and 4-valued verdicts. They follow the argument through the running example and the figures (F1, F2, F8), not the definitions.

**What they attack:** Unmotivated formalism; a missing practitioner workflow (who runs the analysis, at which design stage, on which inputs, with what output); writing that presumes SSI vocabulary. Signature rejection: technically sound but limited impact.

**Their likely question:** "When the ARF changes version mid-design, which of my models and constraints must be re-checked, and does the tooling tell me?"

**Recommendation range:** Minor revisions if the motivation and running example stand alone without MDE or SSI jargon; major revisions if the paper is unreadable without both vocabularies.

### D. Adversarial: "Competing Formalism Advocate"

**Background:** Invested in multi-level modeling, OCL-based validation, or Alloy-style model finding. Sees a layered metamodel plus constraint solving as their own toolbox applied to a new domain, and reviews accordingly.

**What they value:** Nothing gratis. Every weakness is ammunition.

**What they attack** (M-010 ledger ranked for SoSyM, spin section 6): O1 novelty reduction ("multi-level metamodeling applied to VCs"); O3 evaluation ("synthetic, hand-crafted anti-patterns"); O2 tool dependency ("remove Refinery and what remains"); O5 conflict provenance ("manufactured by over-reading GDPR"); O8 expressiveness partials; O7 currency ("the regulation moved while this was in review"), which the journal cycle elevates above its conference rank; O4 thin format layer ("three layers claimed, two delivered").

**Their likely question:** "The anti-pattern catalogue was authored by the same people who built the metamodel that detects it; what evidence shows these design errors occur outside the authors' own constructions?"

**Recommendation range:** Reject by default. Movable to major revisions if the related work distinguishes the contribution from standard multi-level metamodeling head-on, the tooling section justifies the approach independently of Refinery, every anti-pattern is grounded in a cited external source (S-034, S-041, S-042, S-043), and the dated snapshot plus currency sweep are visible in the threats discussion.

### Calibration guidance

- **Significance framing (Champion):** The champion argument above must be recoverable from the abstract's final sentence and intro P3, in quotable form, because the journal champion argues on paper rather than in a PC room. The method-over-catalogue framing (D-016) is the load-bearing element: the EU stack is the instantiation, the method is the contribution.
- **Rigor ceiling (Mathematician):** Journal depth; the absence of a page limit removes the sketch excuse, and material deferred to an external supplement reads as undelivered. All three layer metamodels fully defined; cross-layer predicate semantics stated formally, including behavior under refinement or an explicit scoping statement; expressiveness claims delimited predicate by predicate (D-015). Related work must cover multi-level modeling (Atkinson, Kühne), partial and uncertain models (Famelis, Salay, Chechik), multi-view consistency (Diskin), graph constraint approaches (Taentzer, Varró), and OCL/Alloy alternatives.
- **Explanation floor (Business Manager):** Define VC, credential schema, issuer/holder/verifier, and selective disclosure in one to two sentences each. Motivate the three-layer structure on the running example before any formal definition. Make the practitioner workflow explicit: inputs, invocation point in the design process, and what a violation report looks like. A reader who skips the formalism must be able to follow the argument from prose, running example, and figures alone.
- **Defense points (Adversarial):** The pre-emptions and their landing sections are fixed in spin section 6 (O1 in related work and contribution framing; O3 in the evaluation sourcing sentences plus the taxonomy legs; O2 in the tooling justification and threats; O5 in the motivation; O8 in the partials paragraph; O4 in the format layer section and limitations). O7 is venue-specific: with a 12 to 16 week review target plus one possible major revision round, cited facts can be six months old at decision time; the pre-emption is the D-016 dated snapshot plus `skills/research_currency_sweep` before submission and again at each revision.

## Exemplar papers

%% Verified 2026-07-13 against fetched Springer article pages. Style and audience anchors, not content references. The previous exemplars (Semeráth et al., MODELS 2013/2020) are archived with the MODELS'26 record; the first entry below is the same research lineage in the target venue. %%

1. **Semeráth, Barta, Horváth, Szatmári, Varró.** "Formal validation of domain-specific languages with derived features and well-formedness constraints." SoSyM 16, pp. 357-392, 2017. doi:10.1007/s10270-015-0485-x. Why: journal-length treatment from the same lineage as the project's toolchain; maps metamodels with graph-query constraints to a solver; a model for presenting metamodel, constraints, and solver mapping at journal depth.
2. **Torre, Alferez, Soltana, Sabetzadeh, Briand.** "Modeling data protection and privacy: application and experience with GDPR." SoSyM 20, pp. 2071-2087, 2021. doi:10.1007/s10270-021-00935-5. Why: precedent that regulation-grounded conceptual modeling with constraint checking (GDPR, OCL) is in SoSyM scope; a model for presenting a regulation-derived model and its compliance rules to an MDE audience.
3. **Kühne.** "Matters of (Meta-) Modeling." SoSyM 5, pp. 369-385, 2006. doi:10.1007/s10270-006-0017-9. Why: canonical SoSyM metamodeling-foundations paper; calibrates the audience's shared vocabulary (model, metamodel, type/token, metaness) that the background and formalization sections must align with.

Note: searches on 2026-07-13 found no SoSyM-published paper on verifiable credentials or self-sovereign identity. This supports the novelty framing but is an absence claim from two searches, not a systematic review; treat as indicative only.

## Supplementary material strategy

%% What goes in the paper vs. appendix vs. artifact. Journal calculus differs from the conference one: depth is expected, deferral is suspect. %%

- **In the paper:** With no page limit, the complete formalization belongs in the paper body or an in-document appendix: full layer definitions, full predicate semantics, the complete anti-pattern catalogue with sources, and the full evaluation. Journal-depth review means complete definitions rather than proof sketches.
- **As artifact:** Tool encoding (Refinery `.problem` files), generated instances, and measurement scripts as a linked repository. Single-blind review, so no anonymization requirement on the repository or on prior-work citations.
- **Electronic supplementary material:** Springer ESM policy for this journal was not checked on a fetched page (UNVERIFIED); the repository-link strategy does not depend on it.

## Rebuttal format

%% Journal process: no rebuttal stage. Populated further by skills/plan_rebuttal when reviews arrive. %%

- **Process:** Revisions respond to reviews through a response letter accompanying the revised manuscript. Decision categories and the one-major-revision limit are listed under Deadlines above.
- **Constraint that matters:** A manuscript can undergo a major revision only once (sosym.org/review_process). The first revision must fully resolve the majors; a partially responsive major revision is terminal.
