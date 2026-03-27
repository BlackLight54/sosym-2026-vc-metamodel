# Other Tasks Pipeline (2026-03-27)

Prompts O01 through O05. Execute in waves below.

```text
Wave 0 (parallel with T00/T00b):
  O01  Citation verification ─────────┐
  O02  Supplementary search (OPTIONAL) │
                                       │
Wave 0.5 (after O01):                 │
  O03  C5 softening (abstract+intro) ←┘

         ┌─── T01+T02+T03 (consolidation Wave 1) ───┐
         │                                           │
Wave 1.5 (parallel, after T01-T03):                  │
  O04  Evaluation design ──→ T08                     │
  O05  Figure design ──→ T10                         │
```

## Wave 0

**O01 — Citation verification**
- Verify Ding & Sato 2023 — "Model-Driven Security Analysis of SSI Systems" IEEE TrustCom 2023
- Verify Schardong & Custodio 2024 — "RAF Framework for Understanding Digital Identity Models" ER 2024
- Update `[VERIFY]` markers in `sections/06_related_work.md`

**O02 — Supplementary literature search** (OPTIONAL)
- Search ACM DL/DBLP: "metamodel" AND "verifiable credential", "model-driven" AND "decentralized identity"
- Write findings to `archive/supplementary_search_2026-03-27.md`

## Wave 0.5

**O03 — C5 claim softening** (after O01)
- Soften C5 in `sections/00_abstract.md` gap sentence
- Soften C5 in `sections/01_introduction.md` P2
- Verify corrected claim matches DECISIONS.md 2026-03-25 wording

## Wave 1.5

**O04 — Evaluation design** (after T01–T03)
- Run `skills/evaluation_design`
- Map 3 contributions to evaluation questions
- Verify existing Sec 05 structure covers all evaluation questions
- Martin reviews plan before T08 proceeds

**O05 — Figure design** (after T01–T03)
- Design fig_teaser (CSOK three-layer visual, full-width)
- Design fig_metamodel (three-layer class diagram)
- Write `figures/STYLE.md` with visual vocabulary
- Uncomment teaser block in `tex/main.tex`
