# Prompt: Research CPL Layer Rename

**Phase:** 1 (parallel with P02)
**Execution:** Can run simultaneously with `2026-03-26_02_arf_gap_analysis.md`
**Chain edits:** After completion, edit `prompts/2026-03-26_07_cpl_rename_propagate.md` — insert the chosen name and the full list of files/locations to update.

---

## Context

The paper uses a three-layer metamodel. The current layer names are:
- **Claim Property Layer (CPL)** — domain-level information graph
- **Credential Schema Layer (CSL)** — abstract credential schemas
- **Format-Specific Layer (FSL)** — format-specific representations

Advisor feedback (Imre, 2026-03-25): The name "Claim Property Layer" is non-standard and may confuse reviewers familiar with multi-level modeling literature. Research established terminology for the domain-level layer and propose alternatives.

## Task

### Step 1 — Research

Search for established terminology in multi-level modeling literature for "the layer that captures domain-level semantics / real-world facts before they are grouped into credentials or technical artifacts." Focus on:

1. **Atkinson & Kühne** — deep instantiation, potency-based multi-level modeling. What do they call the domain-level layer? ("domain model," "linguistic extension," "ontological level"?)
2. **de Lara et al.** — multi-level metamodeling in MetaDepth. Layer naming conventions.
3. **Kühne (2006)** — "Matters of (Meta-)Modeling" — level naming conventions.
4. **Rossini et al.** — DPF (Diagrammatic Predicate Framework) — if they have level names.
5. **Atkinson & Gerbig** — Melanee tool — how levels are named in deep metamodeling.
6. **General MDE convention** — is "domain model" the standard term for the top user-level?

Use web search if needed. Do NOT fabricate paper titles or quotes.

### Step 2 — Propose alternatives

Propose 3–5 alternative names for the CPL. For each, state:
- The name
- Where it comes from (which paper/convention)
- Pros: how well it communicates the layer's role to MODELS reviewers
- Cons: any ambiguity, clash with other uses, mismatch with our content

The name must satisfy:
- Recognizable to MODELS Foundations Track reviewers
- Distinguishes this layer from the credential schema layer (CSL) and format-specific layer (FSL)
- Does NOT use MDA terminology (no CIM — see context/DECISIONS.md "2026-03-24 — Terminology: multi-level metamodeling, no MDA")
- Works naturally in the compound forms used throughout the paper: "[Name] Layer," "at the [name] layer," "[name]-layer constraints"

### Step 3 — Recommend

State your recommendation with a clear rationale. Consider the reviewer personas in context/VENUE.md — especially Reviewer B (Mathematician, graph modeling expert) and Reviewer D (Adversarial, competing formalism advocate).

### Step 4 — Record decision

**Do NOT apply the rename yet.** Record the recommendation (or multiple candidates if the decision needs Martin's input) in context/DECISIONS.md with the standard format:

```
### 2026-03-26 — Claim Property Layer rename

**Decision:** [chosen name or candidates for Martin]
**Rationale:** [why — literature basis, reviewer-facing argument]
**Affects:** All section files, CLAUDE.md thesis, models/*.problem, abstract, TODO.md
**Revisit when:** [condition]
```

### Step 5 — Chain edit (CRITICAL)

After completing Steps 1–4, edit the downstream prompt file `prompts/2026-03-26_07_cpl_rename_propagate.md`:

1. Replace the placeholder `<<CPL_NEW_NAME>>` with the chosen name (or top candidate if presenting options to Martin).
2. Replace the placeholder `<<CPL_OLD_NAME>>` with "Claim Property Layer".
3. In the "Files to update" section, confirm or adjust the file list based on what you found during research (e.g., if any additional files reference CPL that aren't listed).

This ensures P07 can execute the rename mechanically without re-doing the research.

## Constraints

- Do NOT rename anything in section files or models yet — that's P07's job.
- Do NOT use MDA terms (CIM, PIM, PSM).
- If you cannot confidently determine the standard terminology from your knowledge, say so explicitly and recommend a web search. Do not guess.
- Present in plan mode. Martin decides.
