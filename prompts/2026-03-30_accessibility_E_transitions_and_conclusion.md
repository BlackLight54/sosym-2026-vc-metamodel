# Accessibility Fix E: Section Transitions + Conclusion Grounding

## Persona

You are a co-author on a MODELS 2026 paper about multi-layer metamodeling for verifiable credential ecosystems. You are a rigorous collaborator, not a writing assistant. You write in the register of the final paper: formal, precise, compressed. Every sentence must advance the argument or establish a definition.

Your task is an accessibility fix addressing two problems: (1) missing "so what" transitions between sections, and (2) a conclusion that is too abstract to leave a lasting impression. The paper's advisor and first author agree that the paper is inaccessible. You have been asked to fix these specific gaps.

## Paper context

The paper presents a three-layer metamodel (Domain Concept Layer / Credential Schema Layer / Format-Specific Layer) for credential ecosystem design, formalized as graph predicates in the Refinery partial graph framework. The central results are two cross-layer design errors on a housing subsidy running example:

- **Headline 1 (vertical governance conflict):** eIDAS mandates SD-JWT-VC or mdoc for government attestations. GDPR data minimization requires predicate proof capability for the income threshold check. W3C VCDM requires data model conformance. No format satisfies all three. SD-JWT-VC satisfies eIDAS + W3C but lacks predicate proofs. AnonCreds has predicate proofs but fails eIDAS + W3C conformance. The configuration is unsatisfiable.
- **Headline 2 (horizontal expressiveness gap):** The floor area constraint (property_area ≥ min_area(num_children)) requires combining values from two credentials (PropertyCred from land registry, FamilyStatusCred from civil registry). No deployed format supports cross-credential arithmetic predicates in zero-knowledge. The verifier must see both raw values, defeating privacy.

The venue is MODELS 2026 Foundations Track. Double-blind, 10-page limit.

## The problems you are fixing

A senior researcher reading the paper identified two specific failures:

### Problem 1: No "so what" transitions between sections

> The reader finishes Background and enters Overview (Section 3) with no bridge. The housing subsidy scenario appears but the reader doesn't know why it's here or what to watch for.
>
> After reading 2+ pages of background material (VCDM data model, multi-layer modeling theory, Refinery formalism), the reader enters Section 3 cold. There should be a sentence or two that tells the reader: "Those were the building blocks. Now we show what goes wrong when they interact."

### Problem 2: Conclusion doesn't ground in the running example

> The conclusion (currently two paragraphs) is entirely abstract. It says "a multi-layer formal model reveals cross-layer design conflicts" and "no single-layer formalization can express them without collapsing the governance-source distinction." True, but the reader finishes the paper without a concrete takeaway.
>
> After 10 pages, the reader should remember: "No credential format simultaneously satisfies EU format mandates, data protection requirements, and W3C conformance on the income credential." That's the money sentence. It's missing from the conclusion.
>
> A good conclusion of a case-study-driven paper starts with what the case study showed, then generalizes. This conclusion only generalizes.

**Targets:** `sections/03_overview.md` (add 1–2 transition sentences) and `sections/07_conclusion.md` (add 2–3 opening sentences).
**Do NOT modify:** Any other section file. Do not touch the body of Section 3 (Motivation, Functional Overview, Usage Workflow) beyond adding an introductory sentence. Do not remove existing conclusion content.

---

## Exact changes required

### Change 1: Add a section-level introduction to Section 3 (Overview)

**File:** `sections/03_overview.md`

**Location:** After the `# Overview {#sec:overview}` heading (line 9), BEFORE the `## Motivation {#sec:motivation}` heading (line 11).

Currently there is nothing between the section heading and the first subsection heading. The reader jumps straight from the title "Overview" to the subsection "Motivation" with no framing.

**What to add:** 1–3 sentences that tell the reader what this section does and what they should watch for. The sentences should bridge from the background (which established the three pillars: credential data model, multi-layer separation, partial graph reasoning) to the concrete scenario.

**Draft:**

> This section develops the housing subsidy scenario that motivates the multi-layer metamodel. The scenario exhibits both types of cross-layer design error the formalization is designed to detect: a governance conflict on a single credential's format (\autoref{sec:headline-income-conflict}) and a format capability gap spanning two credentials (\autoref{sec:headline-predicate-gap}). \autoref{sec:motivation} introduces the scenario and its problems; \autoref{sec:functional-overview} defines the three usage modes the formalization must support.

**Self-critique of this draft:** The forward references to sec:headline-income-conflict and sec:headline-predicate-gap may be premature — those are in Section 5. Consider whether vaguer language ("a vertical governance conflict and a horizontal format expressiveness gap") is better here, or whether the autorefs help the reader know where the payoff comes.

### Change 2: Ground the conclusion in the running example

**File:** `sections/07_conclusion.md`

**Location:** After the `\label{sec:conclusion}` line (line 10), BEFORE the current first paragraph ("This paper showed that a multi-layer formal model reveals..." at line 12).

**Current conclusion (lines 12–14):**

```
This paper showed that a multi-layer formal model reveals cross-layer design conflicts
in credential ecosystems that no single-layer check detects. The three-layer metamodel
(+DCL, +CSL, +FSL), grounded in +VCDM 2.0 and formalized as graph predicates in Refinery
(\autoref{sec:approach}), makes cross-layer constraints from heterogeneous governance
frameworks jointly evaluable. A three-axis validation confirmed coverage against the W3C
specification, expressiveness against regulatory and standards sources, and error visibility
against known design anti-patterns (\autoref{sec:evaluation}).

Both headline results and two of five anti-pattern categories require predicates that
reference elements from independently governed layers; no single-layer formalization can
express them without collapsing the governance-source distinction that makes the constraints
meaningful. Cross-layer design errors are structural consequences of multi-source governance,
not edge cases; detecting them requires a formalization that preserves governance-source
boundaries as first-class structural elements, which the multi-layer metamodel provides.
```

This is competent but entirely abstract. A reader finishing the paper should remember the concrete result.

**What to add:** A new opening paragraph (2–3 sentences) that states what the running example demonstrated, concretely, before the existing abstract summary. The existing paragraphs then follow as the generalization.

**Draft:**

> In the housing subsidy scenario, the metamodel revealed that no credential format simultaneously satisfies EU format mandates (eIDAS ARF), data protection requirements (GDPR Art. 5(1)(c)), and W3C VCDM 2.0 conformance on the income credential: three governance frameworks, each internally consistent, whose joint requirements are unsatisfiable. The floor area constraint further exposed that cross-credential predicate evaluation, required to verify a property size threshold against family size across two independently issued credentials, exceeds the capabilities of every deployed format. These are not hypothetical risks; they are structural consequences of multi-source governance that existing single-layer tools cannot detect.

**Then** the current first paragraph ("This paper showed that...") follows naturally as the generalization from the concrete.

## Writing constraints

- **Keep all existing content** in both files. You are adding sentences, not replacing them.
- **Keep all `[...]{.refi}` spans** on Refinery terms if any appear.
- **Keep all existing citations** (`[@...]`).
- **No em-dashes.** Commas, colons, periods, semicolons, footnotes.
- **Obsidian Markdown** with Mathpix math conventions. Math: `$...$` and `$$...$$`.
- **No LLM tells.** No "delve," "leverage," "crucial," "comprehensive," "importantly," "in conclusion," "to summarize."
- **`\autoref{}`** for all cross-references.
- **Conclusion page budget:** Currently ~0.2 pages of a 0.75-page budget. There is room to grow.
- **Overview page budget:** Currently ~1.0 pages of a 1.5-page budget. There is room for 1–3 sentences.

## After editing

1. Read the Section 3 opening (the new intro sentences → Motivation → Functional Overview) to verify it flows.
2. Read the full conclusion to verify the concrete opening connects to the abstract summary without redundancy.
3. Verify all `\autoref{}` references resolve.
4. Verify no existing content was accidentally deleted.
5. Flag any weaknesses in your own edits.
