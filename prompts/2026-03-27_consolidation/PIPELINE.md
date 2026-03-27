# Consolidation Workflow Pipeline (2026-03-27)

12 prompt files (T00–T10).
Full plan: `.claude/plans/linked-petting-prism.md`.
Critical path: **T00 → T00b → T01/T02 → T07 → T08 → T09 → T10**

```text
T00 (restructure) ✅
 │
T00b (merge scaffolds)
 │
 ├──────────────────────────────────────────────┐
 │              Wave 1 (parallel)               │
 ├────────┬────────┬────────┬────────┬──────────┤
 │        │        │        │        │          │
T01      T02      T03     T04      T05        T06
(DCL)   (CSL)   (FSL)  (background) (related) (conclusion)
 │        │        │
 └───┬────┘        │
     │             │
    T07            │
 (cross-layer)     │
     │             │
     └──────┬──────┘
            │
           T08
     (evaluation)
            │
           T09
   (threats+scalability)
            │
           T10
        (polish)
```

## Task summary

| Task  | Section | Content | Dependencies | Binding claims |
| ----- | ------- | ------- | ------------ | -------------- |
| T00   | All     | File restructuring — rename, LaTeX labels, cross-refs, stale metadata, duplicate markers | — | — |
| T00b  | All     | Scaffold/placeholder merging — merge `@SCAFFOLD`+`@TODO: PLACEHOLDER` pairs into clean `@TODO` blocks | T00 | — |
| T01   | Sec 04  | Preamble + DCL definitions (A1, A2) | T00b | #1, #3 |
| T02   | Sec 04  | CSL definitions (A4, A5, A6) | T00b | #1, #3 |
| T03   | Sec 04  | FSL definitions (A8, A9) | T00b | #1 |
| T04   | Sec 02  | Background (B1–B7, all) — predicate proofs MUST be introduced here | T00b | — |
| T05   | Sec 06  | Related Work (R1–R4, all) — D5 preemption critical | T00b | — |
| T06   | Sec 07  | Conclusion (C1–C4, all) | T00b | — |
| T07   | Sec 04  | Cross-layer constraints (A12–A15) | T01+T02 | #3 CORE |
| T08   | Sec 05  | Elaboration (coverage, expressiveness, anti-patterns, baseline) | T01-T03+T07 | #5, #6, #7, #9 |
| T09   | Sec 05  | Threats + Scalability — scalability data may be interactive | T08 | — |
| T10   | All     | Final polish (eval preamble, Intro P5, abstract numbers) | T08+T09 | #10 |
