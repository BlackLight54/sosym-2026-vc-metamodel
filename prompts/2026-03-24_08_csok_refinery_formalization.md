# Prompt: CSOK Refinery formalization (Pass 2)

**Task type:** Formal modeling
**Target:** New `.problem` file for the CSOK running example
**Priority:** Blocks Section 04 code listings and evaluation
**Depends on:** Pass 1 conceptual design (`prompts/2026-03-24_06_csok_running_example.md`) and Refinery guide (`guides/refinery/SKILL.md`)

## Context

Pass 1 produced a conceptual design for the CSOK running example: entities, credentials, format assignments, and the governance conflict. This prompt formalizes that design as a Refinery `.problem` file.

The existing metamodel at `prior_work/dse-vc-refinery/vc_model.new.problem` provides the starting point. The metamodel needs evolution — extensions and modifications — to support the CSOK scenario and the format-based governance conflict.

**Read first:**
- `guides/refinery/SKILL.md` — Refinery language reference
- Pass 1 deliverables (scenario description, three-layer table, governance conflict, metamodel extensions list)
- `prior_work/dse-vc-refinery/vc_model.new.problem` — current metamodel

## Instruction

### 1. Evolve the metamodel

Starting from the existing metamodel structure, add or modify what Pass 1 identified as needed. Likely extensions:

- **Governance source annotations:** A way to tag constraints with their governance source (eIDAS, W3C VCDM, Hungarian law). This might be metadata predicates or a separate class hierarchy.
- **Format capability predicates:** Predicates expressing what each format can do (e.g., `supports_zkp(format)`, `conforms_vcdm(format)`). These enable the governance conflict to surface as a constraint violation.
- **Issuer constraints:** If the CSOK scenario requires that certain credentials come from specific issuers.
- **Any structural changes** needed to support the CSOK entity/credential structure.

Keep changes minimal. The metamodel should remain generic — CSOK-specific details go in the instance, not the metamodel classes.

### 2. Write the CSOK instance

Using the entities, credentials, and format assignments from Pass 1:

- Declare CSOK CIM entities (Applicant, etc.) as `Subject`/`Value` instances
- Assert `statement()` triples for CSOK relationships
- Set up PIM-level credential structure (or leave for generation, depending on what we want to demonstrate)
- Assign format-specific schemas
- Set scope bounds

### 3. Encode the governance conflict

The format conflict (eIDAS SD-JWT-VC vs. AnonCreds ZKP on IncomeCredential) must be expressible as contradictory constraints in the model. When Refinery attempts to generate, it should either:
- Produce no valid models (UNSAT — the conflict is real), or
- Produce models that violate one governance source (showing the trade-off)

The specific encoding depends on how format capability predicates interact with governance constraints. Design this carefully — it's the paper's headline result.

### 4. Surface Martin's FCA results

Memory note: Martin has FCA (formal concept analysis) results relevant to the Format-Specific Layer (Sec 04.3). During this formalization, identify where FCA-derived constraints apply and incorporate 2-3 of them. Ask Martin for the specific FCA results if not already provided.

### 5. Test in Refinery

Run the model in Refinery and verify:
- Without the governance conflict constraints: valid models are generated
- With the governance conflict constraints: the conflict manifests (UNSAT or forced violation)
- Entity alignment works correctly across CSOK credentials
- Scope is reasonable (not too tight, not combinatorially explosive)

## Deliverables

1. **CSOK `.problem` file** — complete Refinery model with evolved metamodel + CSOK instance
2. **Test report** — what Refinery generates, whether the conflict manifests as expected
3. **Metamodel diff summary** — what changed from the existing model and why
4. **Code listings for Sec 04** — key fragments suitable for inclusion in the paper (constraint definitions, propagation rules, governance predicates)

## Constraints

- Follow the Refinery guide (`guides/refinery/SKILL.md`) for syntax.
- Metamodel changes must remain generic — don't hardcode CSOK-specific entities into the metamodel classes.
- Flag any Refinery syntax you're uncertain about.
- If Refinery can't express the governance conflict directly, document the limitation and propose a workaround.
