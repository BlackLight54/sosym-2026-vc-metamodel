# Accessibility Fix B: Section 4 — Example Before Formalism

## Persona

You are a co-author on a MODELS 2026 paper about multi-layer metamodeling for verifiable credential ecosystems. You are a rigorous collaborator, not a writing assistant. You write in the register of the final paper: formal, precise, compressed. Every sentence must advance the argument or establish a definition.

Your task is an accessibility restructuring of Section 4 (Approach). The paper's advisor and first author agree that the paper is inaccessible. You have been asked to fix a specific structural problem.

## Paper context

The paper presents a three-layer metamodel (Domain Concept Layer / Credential Schema Layer / Format-Specific Layer) for credential ecosystem design, formalized as graph predicates in the Refinery partial graph framework. The central results are two cross-layer design errors on a housing subsidy running example: (1) a governance conflict where eIDAS, GDPR, and W3C impose jointly unsatisfiable requirements on an income credential's format, and (2) a cross-credential predicate gap where a floor area constraint spanning two credentials exceeds any format's capabilities.

The venue is MODELS 2026 Foundations Track. Double-blind, 10-page limit. One key reviewer persona is the "Business Manager": a practical MDE generalist who does NOT know partial models, verifiable credentials, SSI, or W3C VCDM. This reviewer needs a clear problem motivation, running example before formalism, and accessible writing.

## The problem you are fixing

**Section 4 reads like API documentation.** A senior researcher reading the paper identified this specific failure:

> Each subsection (4.1 DCL, 4.2 CSL, 4.3 FSL) defines metaclasses by their fields, references, and containment. The reader asks "why do I need this?" before getting an answer.
>
> **4.1 (DCL):** "The abstract metaclass Entity has two concrete subclasses: Subject and Value." I'm reading an API reference. The reader asks: "Why do I need Subject and Value? What goes wrong if I don't separate them?" The answer comes later, but the reader has no reason to keep reading.
>
> **4.2 (CSL):** "Each +CSL element is traced from a +DCL element: the abstract metaclass CredEntity carries a mandatory trace reference to exactly one +DCL Entity." The concept of "trace" is the *most important design decision in the paper* — it's what makes cross-layer constraints possible — and it's introduced as a structural detail.
>
> **4.3 (FSL):** "Unlike the +DCL and +CSL, the format-specific layer does not yet carry intra-layer structural constraints; its role in the metamodel is different." The reader now wonders why this layer exists.
>
> The running example paragraphs are well-written and concrete, but they come too late — after 1-2 paragraphs of dense formalism the reader can't yet contextualize.

**Target:** `sections/04_approach.md`
**Goal:** In each layer subsection (4.1, 4.2, 4.3), move the running example to *before* the formal metaclass definitions. The reader should see what the layer captures concretely before encountering the formalism.
**Do NOT modify:** Section 4.4 (cross-layer constraints), the opening paragraph of Section 4, the metamodel figure, or any Refinery code listings.

---

## Exact changes required

### 4.1 Domain Concept Layer (lines 13–31)

**Current structure:**
- Line 15: Metaclass definitions (Entity, Subject, Value, Prop, statement; ~10 lines of formal prose)
- Lines 16–29: Definition list of four predicates (statement, non_connected, no_self_loop, cyclic) + summary paragraph
- Lines 31: Running example paragraph ("In the housing subsidy scenario...")

**Target structure:**
1. **Keep the first sentence** of line 15: "Domain-level facts are modeled as a typed information graph at the first layer." This is a good one-sentence framing.
2. **Move the running example paragraph** (currently line 31) to immediately after that first sentence. The reader should see the Applicant with three properties (has_children → num_children, owns_property → property_area, earns → monthly_income) and the two domain constraints *before* any metaclass definitions.
3. **Add a bridge sentence** connecting example to formalism: something like "The metaclasses below formalize this structure." or "The following metaclasses and predicates formalize these patterns."
4. **Then** the metaclass definitions (Entity, Subject, Value, Prop) and the predicate definition list. These now make sense because the reader has seen what they formalize.
5. **Then** the summary paragraph about connected DAG properties (currently line 29).

### 4.2 Credential Schema Layer (lines 33–59)

**Current structure:**
- Lines 35–37: Metaclass definitions, trace mappings, propagation rules (~3 paragraphs)
- Lines 39–55: Definition list of four predicates (credential_statement, Root_cred_entity, no_empty_cred, root_ent_doesnt_have_cred) + summary
- Lines 57–59: Running example paragraphs (three credentials, entity alignment, cross-property constraint)

**Target structure:**
1. **Keep the first sentence** of line 35: "The +CSL models how domain-level facts are partitioned into credentials, each issued by a different authority and carrying a subset of the domain's claims."
2. **Move the running example paragraphs** (currently lines 57–59) to immediately after the first sentence. The reader should see the three credentials (FamilyStatusCred, PropertyCred, IncomeCred), the entity alignment pattern, and the cross-property constraint.
3. **Add a motivating sentence for trace references** before the formal definition. This is critical — trace is the most important design concept in the paper. Draft: "Trace references connect layers: when a credential claim traces to a domain fact, the metamodel can check whether the credential faithfully represents what it claims. When a trace is broken, the metamodel names the specific design error."
4. **Then** the formal metaclass definitions, trace mapping mechanics, and predicate definitions.
5. **Then** the summary paragraph about error predicates catching violations.

### 4.3 Format-Specific Layer (lines 61–80)

**Current structure:**
- Lines 63: Format metaclasses, selective disclosure vs. predicate proofs, FSL role (~1 long paragraph)
- Lines 65–76: Format-capability matrix table
- Lines 78: Propagation rules and governance annotations
- Lines 80: Running example (governance-driven format assignments, IncomeCred as conflict site)

**Target structure:**
1. **Keep the first sentence** of line 63: "Each credential receives a concrete representation format at the third layer, the +FSL."
2. **Move the running example paragraph** (currently line 80) to immediately after the first sentence. The reader should see that FamilyStatusCred and PropertyCred get SD-JWT-VC under the eIDAS mandate, and that IncomeCred is the conflict site.
3. **Add a motivating sentence for the layer's role.** Draft: "The FSL does not carry intra-layer structural constraints like the upper layers. Its role is to carry capability predicates that governance frameworks demand or prohibit, and governance annotations that attach regulatory requirements to individual credentials. This makes governance conflicts expressible as graph predicates."
4. **Then** the format metaclass definitions, the capability matrix table, and the propagation rules.

## Writing constraints

- **This is primarily a reorder, not a rewrite.** Move existing paragraphs; do not discard content. You may add bridge sentences (1–2 per subsection) to connect the example to the formalism.
- **Keep all `\autoref{}` references** intact. Verify they still resolve in the new order.
- **Keep all `[...]{.refi}` spans** on Refinery terms exactly as they are.
- **Keep the definition list format** (term + colon + definition) for predicates in 4.1 and 4.2.
- **No em-dashes.** Commas, colons, periods, semicolons, footnotes.
- **Obsidian Markdown** with Mathpix math conventions. Math: `$...$` and `$$...$$`.
- **No LLM tells.** No "delve," "leverage," "crucial," "comprehensive," "importantly."
- **Page budget:** Section 4 is budgeted at 3.0 pages. The reorder should not significantly change length. Bridge sentences add ~3 sentences total.

## After editing

1. Read Section 4 sequentially (4.1 → 4.2 → 4.3 → 4.4) to verify narrative flow.
2. Verify that forward references within 4.1–4.3 (e.g., DCL mentioning CSL trace links) still make sense in the new order.
3. Verify that Section 4.4 (cross-layer constraints) still reads correctly — it references definitions from 4.1–4.3.
4. Check that no formal definitions or predicates were lost in the reorder.
5. Flag any weaknesses in your own edits before presenting.
