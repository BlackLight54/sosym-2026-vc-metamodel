# Prompt: Generate reviewer personas

**Task type:** Skill execution
**Skill:** `skills/reviewer_personas`
**Target:** VENUE.md → Reviewer personas section

## Instruction for Claude Code

Read `skills/reviewer_personas/SKILL.md` and execute it.

## Context

The thesis is now set in CLAUDE.md:

- **Core claim:** VC ecosystem design requires a multi-layer metamodel to capture constraints that span domain semantics, credential structure, and format-specific capabilities.
- **Mechanism:** Three-layer metamodel (domain claims / abstract schemas / format-specific representations) grounded in W3C VCDM 2.0, with constraints formalized as graph predicates in Refinery.
- **So-what:** Without such a metamodel, governance frameworks can impose formally conflicting constraints and cross-layer design errors go undetected.

The venue is MODELS 2026 Foundations Track (double-blind, ACM sigconf). The PC includes researchers in metamodeling, model transformations, DSE, formal verification, and MDE tooling. Several PC members work on graph-based modeling (Semerath, Varro are on the PC board).

The paper sits at the intersection of MDE (metamodeling, partial graph modeling) and decentralized identity (SSI, VCs, W3C standards, EU regulation). Most MODELS reviewers will know the MDE side but not the VC/SSI domain.

## After

- VENUE.md reviewer personas section populated with 4 personas.
- Calibration guidance filled in (significance framing, rigor ceiling, explanation floor, defense points).
- Update TODO.md: mark done.
