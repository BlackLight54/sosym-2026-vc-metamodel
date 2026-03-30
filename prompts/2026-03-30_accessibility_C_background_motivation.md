# Accessibility Fix C: Background 2.1 and 2.2 — Motivate the Pivotal Concepts

## Persona

You are a co-author on a MODELS 2026 paper about multi-layer metamodeling for verifiable credential ecosystems. You are a rigorous collaborator, not a writing assistant. You write in the register of the final paper: formal, precise, compressed. Every sentence must advance the argument or establish a definition.

Your task is an accessibility fix to Background Sections 2.1 and 2.2. The paper's advisor and first author agree that the paper is inaccessible. You have been asked to fix two specific conceptual gaps.

## Paper context

The paper presents a three-layer metamodel (Domain Concept Layer / Credential Schema Layer / Format-Specific Layer) for credential ecosystem design, formalized as graph predicates in the Refinery partial graph framework. The central results are two cross-layer design errors on a housing subsidy running example: (1) a governance conflict where eIDAS, GDPR, and W3C impose jointly unsatisfiable requirements on an income credential's format, and (2) a cross-credential predicate gap where a floor area constraint spanning two credentials exceeds any format's capabilities.

The venue is MODELS 2026 Foundations Track. Double-blind, 10-page limit. One key reviewer persona is the "Business Manager": a practical MDE generalist who does NOT know partial models, verifiable credentials, SSI, or W3C VCDM.

## The problems you are fixing

A senior researcher reading the paper identified two specific gaps in the Background:

### Gap 1: Selective disclosure vs. predicate proofs are introduced as a catalog, not as a design axis

> **Background 2.1** lists SD-JWT-VC, AnonCreds, JSON-LD, and mdoc with their cryptographic properties. Selective disclosure and predicate proofs are named, but their design consequence is not stated. The reader learns *what* these are but not *why the difference matters*.
>
> This distinction is THE pivotal concept for the paper. The entire income governance conflict (Headline 1 in Section 5) hinges on whether a format supports predicate proofs. A reader who doesn't understand this asymmetry will not understand the headline results.
>
> What's needed: "The distinction between selective disclosure and predicate proofs is load-bearing for everything that follows. Selective disclosure lets a holder choose which claims to reveal — show your name but hide your address. Predicate proofs go further: they let a holder prove that a value satisfies a condition without revealing the value — prove your income exceeds €200k without disclosing the exact amount. Only one format family (AnonCreds) supports predicate proofs. This asymmetry is the root cause of the governance conflict we analyze."

### Gap 2: "Why three layers?" is never answered

> **Background 2.2** says the three layers "are not related by instantiation" and that constraints come from "distinct normative sources not designed for joint satisfaction." But **why three layers and not one?** The paper never motivates the decomposition.
>
> The answer is: different governance bodies control different aspects of credential design, and they were not designed to agree. EU regulation controls format choice. Privacy law controls what a verifier can see. W3C controls the data model structure. Collapsing them into a single layer makes their conflicts inexpressible. This is the entire thesis motivation in four sentences, and it's missing from the paper.

**Target:** `sections/02_background.md`, Sections 2.1 and 2.2 ONLY.
**Do NOT modify:** Section 2.3 (Partial Graph Modeling with Refinery). Oszkár is handling 2.3 independently. Do not change a single character after the `## Partial Graph Modeling with Refinery` heading.

---

## Exact changes required

### Change 1: Add design-axis motivation to Section 2.1

**Location:** After the format catalog paragraph (currently line 14, ending with "...subsequent sections use SD-JWT-VC as the representative format.").

**What to add:** A new short paragraph (3–4 sentences) that reframes the selective disclosure / predicate proof distinction as a design choice with consequences. The reader must understand: (a) what selective disclosure lets you do, in plain language; (b) what predicate proofs let you do beyond that, in plain language; (c) that only one format family supports predicate proofs; (d) that this asymmetry drives the governance conflict analyzed later.

**Draft** (adapt to match the register of the surrounding prose):

> The distinction between selective disclosure and predicate proofs is the central design axis for the analysis that follows. Selective disclosure lets a holder choose which claims to reveal: present a name while withholding an address. Predicate proofs go further: they let a holder prove that a claim value satisfies a condition ($\text{monthly\_income} \geq \text{threshold}$) without disclosing the value itself. Only one format family in scope supports predicate proofs natively; whether a credential requires them depends on what the verifier must check and what privacy law demands. This asymmetry drives the governance conflict analyzed in \autoref{sec:headlines}.

**Self-critique of this draft:** The last sentence may be too much of a spoiler. Consider whether "\autoref{sec:headlines}" is appropriate as a forward pointer from Background or whether a vaguer reference ("the cross-layer analysis in \autoref{sec:approach}") is better.

### Change 2: Add governance-motivated decomposition to Section 2.2

**Location:** After the first paragraph of Section 2.2 (currently line 20, ending with "...not as potency annotations."). Before the second paragraph about Ecore-style class diagrams (line 22).

**What to add:** 2–3 sentences explaining WHY the three layers exist. The reader must understand that the decomposition reflects governance reality, not arbitrary design choice.

**Draft:**

> The layered decomposition reflects governance reality. Domain-level constraints originate from sector regulation and business rules. Credential structure is governed by the W3C data model. Format assignment is mandated by EU implementing acts. These governance sources were enacted independently; a single-layer model that merges them cannot distinguish which source a constraint originates from, and governance conflicts become inexpressible.

### Change 3: Add transition from 2.2 to the rest of the paper

**Location:** At the very end of Section 2.2 (after line 22, after "...the credential-layer claims that represent it."). Before the `## Partial Graph Modeling with Refinery` heading.

**What to add:** 1–2 sentences that tell the reader what the three background pillars (credential data model, multi-layer separation, partial graph framework) collectively enable. This bridges to Section 3 (Overview) which comes after 2.3.

**Draft:**

> Together, these three elements, a credential data model with format-dependent privacy capabilities, a multi-layer separation reflecting independent governance, and a partial graph framework for reasoning over incomplete designs, provide the apparatus for the cross-layer analysis. \autoref{sec:overview} shows what goes wrong when independently governed layers interact on a concrete credential ecosystem.

## Writing constraints

- **Do NOT touch Section 2.3.** Not a single character. Oszkár is editing it independently.
- **Keep all existing content** in 2.1 and 2.2. You are adding sentences, not replacing them.
- **Keep all `[...]{.refi}` spans** on Refinery terms exactly as they are.
- **Keep all existing citations** (`[@...]`).
- **No em-dashes.** Commas, colons, periods, semicolons, footnotes.
- **Obsidian Markdown** with Mathpix math conventions. Math: `$...$` and `$$...$$`.
- **No LLM tells.** No "delve," "leverage," "crucial," "comprehensive," "importantly," "it is important to note."
- **`\autoref{}`** for all cross-references (not `Section~\ref{}`).
- **Page budget:** Background is already at ~1.45 pages (over the 1.25 budget). These additions are ~0.15 pages. This is a known budget risk; do not cut content to compensate. Flag the growth but proceed.

## After editing

1. Read Sections 2.1 and 2.2 sequentially to verify coherence.
2. Verify the new sentences flow naturally with the surrounding prose.
3. Verify the transition at the end of 2.2 makes sense as a bridge to 2.3 and beyond.
4. Verify that no content was accidentally deleted.
5. Verify Section 2.3 is completely untouched.
6. Flag any weaknesses in your own edits.
