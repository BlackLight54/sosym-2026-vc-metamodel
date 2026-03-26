# Prompt: ARF 5.3.4 Focused Gap Analysis

**Phase:** 1 (parallel with P01)
**Execution:** Can run simultaneously with `2026-03-26_01_cpl_rename_research.md`
**Chain edits:** After completion, edit `prompts/2026-03-26_04_sec05_restructure.md` — insert ARF constraint findings into the expressiveness table section.

---

## Context

The paper's evaluation (Section 05) includes a constraint expressiveness table showing which governance-source constraints our metamodel can/cannot express. Advisor feedback (Imre, 2026-03-25): perform a focused gap analysis of the EU Architecture Reference Framework (ARF), specifically section 5.3.4 (the section addressing W3C Verifiable Credentials or equivalent credential format requirements).

The ARF is publicly available. The current version is ARF 1.4.0 (or the latest available). The relevant section discusses technical requirements for credential formats in the EU Digital Identity Wallet ecosystem.

## Task

### Step 1 — Locate and read ARF 5.3.4

Search for the EU Architecture Reference Framework (ARF) document. The full title is typically "European Digital Identity Wallet Architecture and Reference Framework." Look for section 5.3.4 or the section that discusses W3C Verifiable Credentials format requirements.

If web search is needed to find the document, use it. The ARF is a public EU document.

Read the relevant section carefully. Extract every statement that imposes a constraint on credential design — structural, format-related, governance, interoperability, or capability requirements.

### Step 2 — Extract constraints

For each constraint found, record:

| # | Constraint description | ARF reference (section/paragraph) | Constraint type | Layer(s) affected | Expressible in our metamodel? | Predicate name (if yes) | Notes |
|---|---|---|---|---|---|---|---|

**Constraint types:** structural, format, capability, interoperability, governance, privacy, security.

**Layer mapping:** Which of our three layers (CPL, CSL, FSL) does this constraint affect? Some may be cross-layer.

**Expressible?** Three values:
- **Yes** — we have or can straightforwardly write a Refinery predicate for it
- **Partial** — the metamodel captures part of it but not fully (explain what's missing)
- **No** — fundamentally outside our metamodel's scope (explain why)

### Step 3 — Analyze coverage

Summarize:
- How many constraints extracted total?
- How many expressible / partial / not expressible?
- What categories of constraints fall outside our scope? (e.g., runtime, protocol-level, key management)
- Are there any surprising constraints that our metamodel *should* capture but currently doesn't? Flag these as potential metamodel extensions.

### Step 4 — Write findings

Save the analysis to `archive/arf_5_3_4_gap_analysis.md` with:
- The full constraint table from Step 2
- The coverage summary from Step 3
- Specific recommendations for which constraints to include in the Sec 05 expressiveness table (pick the 5-8 most representative/interesting ones)

### Step 5 — Chain edit (CRITICAL)

After completing Steps 1-4, edit the downstream prompt file `prompts/2026-03-26_04_sec05_restructure.md`:

1. Find the placeholder `<<ARF_CONSTRAINTS>>` in the Elaboration subsection guidance.
2. Replace it with a summary of your findings: the recommended 5-8 constraints for the expressiveness table, their expressibility status, and any metamodel gaps identified.
3. If you found constraints that suggest metamodel extensions, add a note in the "Metamodel gap" placeholder `<<METAMODEL_GAPS>>`.

This ensures P04 (Sec 05 restructure) incorporates the ARF findings directly.

## Constraints

- Do NOT edit section files — this is a research task. Output goes to `archive/`.
- Do NOT fabricate ARF content. If you cannot access the document, state so explicitly and recommend Martin provide the relevant section.
- Focus on section 5.3.4 (or equivalent). Do not attempt a full ARF analysis — that's out of scope for a 10-page paper with <2 days to deadline.
- Be precise about what "expressible" means: can a Refinery graph predicate in our current metamodel structure capture this constraint? Not "could a metamodel in general capture it."
