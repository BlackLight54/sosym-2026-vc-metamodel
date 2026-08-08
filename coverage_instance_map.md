# Coverage buckets against the delivered instances (K-005 evidence map)

Which of the coverage-validation buckets of §5.1.1 each delivered `.problem` instance actually
populates, and which buckets no instance exercises.

**What this is.** Bookkeeping over the committed model files, computed mechanically (method below).
It answers one question the coverage prose does not: the metamodel maps onto W3C VCDM 2.0 across
five relation kinds plus a capability mapping, but *which of those elements do the executable
instances ever put on the table?* A bucket populated by no instance is prose-only coverage.

**What this is not.** It does not re-run the solver, does not change any K-005 wording, and does not
close the K-005 residual recorded at `05_evaluation.md:31`. That residual is about **unmodeled VCDM
concepts** (credential schema, terms of use, evidence, refresh service, render method, related
resource, validity period) being bucketed in `fig:coverage-map`; it is a figure-and-prose obligation
and remains open. This file is the instance-side complement.

**Snapshot.** **17** instances — the `models/*.problem` files present at the start of this run
(2026-08-03, ~18:20 local). The loop register does not enumerate instances; 17 is the count observed
then, not a figure copied from it. By the time of writing, 22 exist: five probe files
(`probe_cross_cred_gap{,_control}`, `probe_trace_misalign_{source,target,control}`) were added later
the same day by the concurrent model-evidence run. All 22 are listed; the five later additions are
marked. Regenerating the table after that run lands is a mechanical re-derivation, not a rewrite.

## The buckets

From §5.1.1 / `K-005 coverage-validation`. **Mapping A** is the 19 metaclasses against VCDM 2.0
concepts, decomposed into five relation kinds; **Mapping B** is the six capability predicates
against format-family properties.

| Bucket | Relation to VCDM 2.0 | Metaclasses counted here |
|---|---|---|
| A1 CSL structural trace | traces directly to VCDM structural concepts | `Credential`, `CredentialSubject`, `CredentialValue`, `Claim` |
| A2 FSL, VCDM-conformant | conforms as a VCDM-admitted representation | `JsonLdCredentialSchema`, `JwtVCCredentialSchema`, `SdJwtVcSchema` |
| A3 FSL, admitted from outside VCDM | deliberately outside VCDM | `AnoncredsCredentialSchema`, `MdocSchema` |
| A4 DCL refines below VCDM | refines below the standard | `Subject`, `Value`, `Prop` |
| A5 governance annotations | traces to governance sources, not to VCDM | `EidasMandate`, `PrivacyRequirement`, `VcdmConformance` |
| B capability predicates | format-family properties read from format specs | the six `supports_*` / `conforms_vcdm` predicates |
| Completeness (exclusions) | VCDM concepts excluded as usage-time | — |

**The completeness side is not instance-evidenceable by construction.** Excluded concepts are absent
from the metamodel, so no instance can populate them; its emptiness is a category fact, not a thin
bucket. Its evidence is the exclusion argument and `fig:coverage-map`, not the model files.

## Method (reproducible)

For each `models/*.problem` entry point: resolve the `import` closure one file at a time; split the
closure into *definition* files (`vc_metamodel.refinery`, `governance_conflict.refinery`,
`spec_ambiguity.refinery`, `revocation_mismatch.refinery`) and *instance data* (everything else,
including the entry point); strip `%` comments; count unindented top-level atom assertions of the
form `Class(id).` in the instance data. Indentation separates instance assertions from predicate
bodies, which matters for `csok_standalone.problem`, the one file that inlines the metamodel. Open
format slots are `format(c, f)` edges whose `f` carries no asserted format class: there the solver
ranges over all five `Formatted_Credential` subclasses.

## Mapping A — population per instance

Counts are asserted atoms, not distinct metaclasses. "Open fmt" is the number of unpinned format
slots. Verdicts are copied from `A-004 constraint-sensitivity-variants` (batteries of 2026-07-28 and
2026-08-03) and `models/README.md`; instances with no recorded verdict are marked as such rather
than inferred from their header comments. The 2026-08-05 battery (independent per-source C5/C6/C7 in
`governance_sources.refinery`) moved exactly one verdict in this table: `csok_no_eidas.problem`,
SAT to UNSAT. Every other recorded verdict, including all 36 `evaluation/instances` outside E3,
reproduced unchanged.

| Instance | A1 CSL | A2 FSL-conf | A3 FSL-out | A4 DCL | A5 gov | Open fmt | Recorded verdict |
|---|---|---|---|---|---|---|---|
| `csok.problem` | 12 | 2 | 0 | 7 | 7 | 1 | UNSAT (`check -k`) |
| `csok_2x.problem` | 24 | 4 | 0 | 13 | 14 | 2 | UNSAT (`check -k`) |
| `csok_3x.problem` | 36 | 6 | 0 | 19 | 21 | 3 | UNSAT (`check -k`) |
| `csok_no_eidas.problem` | 12 | 2 | 0 | 7 | 6 | 1 | UNSAT (`check -k`, 2026-08-05; SAT before) |
| `csok_no_gdpr.problem` | 12 | 2 | 0 | 7 | 6 | 1 | SAT (`check -k`) |
| `csok_no_conflict.problem` | 12 | 2 | 0 | 7 | 7 | 1 | SAT (`check -k`) |
| `csok_standalone.problem` | 12 | 2 | 0 | 7 | 7 | 1 | SAT (`check -k`); `generate` exit 0 |
| `csok_generated.problem` | 24 | 4 | 1 | 14 | 7 | 0 | **none recorded** |
| `csok_2x_gen.problem` | 24 | 4 | 0 | 13 | 14 | 2 | **none recorded** |
| `csok_3x_gen.problem` | 36 | 6 | 0 | 19 | 21 | 3 | **none recorded** |
| `spec_ambiguity.problem` | 12 | 2 | 1 | 7 | 1 | 0 | UNSAT (`check -k`) |
| `revocation_mismatch_instance.problem` | 8 | 2 | 0 | 5 | 0 | 0 | UNSAT (`check -k`) |
| `revocation_mismatch_control.problem` | 8 | 2 | 0 | 5 | 0 | 0 | SAT (`check -k`) |
| `probe_common_parent.problem` | 12 | 2 | 0 | 7 | 0 | 1 | UNSAT (`generate`) |
| `probe_common_parent_control.problem` | 12 | 2 | 0 | 7 | 0 | 1 | SAT (`generate`) |
| `probe_cyclic.problem` | 12 | 3 | 0 | 6 | 0 | 0 | UNSAT (`check -k`) |
| `probe_cyclic_control.problem` | 8 | 2 | 0 | 5 | 0 | 0 | SAT (`check -k`) |
| `probe_cross_cred_gap.problem` † | 12 | 2 | 0 | 7 | 7 | 1 | not recorded here (concurrent run) |
| `probe_cross_cred_gap_control.problem` † | 12 | 2 | 0 | 7 | 7 | 1 | not recorded here (concurrent run) |
| `probe_trace_misalign_source.problem` † | 8 | 2 | 0 | 5 | 0 | 0 | not recorded here (concurrent run) |
| `probe_trace_misalign_target.problem` † | 8 | 2 | 0 | 5 | 0 | 0 | not recorded here (concurrent run) |
| `probe_trace_misalign_control.problem` † | 8 | 2 | 0 | 5 | 0 | 0 | not recorded here (concurrent run) |

† added after the 2026-08-03 register snapshot; the 17 rows above the marker are the register's set.

**Bucket totals over the 17 snapshot instances:** A1 populated by 17/17, A2 by 17/17, A4 by 17/17,
A5 by 11/17, A3 by **2/17** (`csok_generated`, one AnonCreds atom; `spec_ambiguity`, one mdoc atom).

**A3 is thinner than the count suggests, and less thin than it looks.** Only two instances *assert*
an out-of-VCDM format atom, but eleven instances leave at least one format slot open, and an open
slot ranges over all five subclasses including AnonCreds and mdoc. The out-of-VCDM formats are
therefore present in the search space of most instances and pinned in the delivered structure of
two. Both readings are true; the honest statement is that A3 is exercised mainly through the solver's
format assignment rather than through authored instance structure.

**A5 gap.** Six instances carry no governance annotation at all: both `common_parent` probes, both
`cyclic` probes, and both revocation-mismatch files. `spec_ambiguity` carries one
(`VcdmConformance`) and no eIDAS or privacy annotation. These are single-predicate probes, so the
absence is by design, but it means the governance-annotation bucket is evidenced by the CSOK family
alone: all three annotation classes together appear only there.

## Mapping B — capability predicates against the instances

A capability predicate is *exercised* by an instance when a constraint in that instance's import
closure reads it **and** the instance can trigger that constraint. Closure-reachability alone is
uninformative: every instance imports the metamodel, so all six predicates are always in scope.

| Capability predicate | Read by | Exercised in | Count |
|---|---|---|---|
| `conforms_vcdm` | `error governance_conflict`; `error vcdm_format_violation` and two `vcdm_not_*` propagation rules (`governance_sources.refinery`, C7); `error vcdm_conformance_violation` (`spec_ambiguity.refinery`) | `csok`, `csok_2x`, `csok_3x`, `csok_no_eidas`, `csok_no_gdpr`, `spec_ambiguity` | 6 |
| `supports_predicate_proof` | `error governance_conflict`; `error privacy_format_violation` and four `privacy_not_*` propagation rules (`governance_sources.refinery`, C6); four `cap_predicate_not_*` propagation rules | `csok`, `csok_2x`, `csok_3x`, `csok_no_eidas`, `csok_no_gdpr` (error); `csok_generated` (rules, via its asserted AnonCreds atom, though vacuously: the node is already typed and `!exists(::new)` holds, so the rules eliminate nothing) | 6 |
| `supports_offline_verification` | four `cap_offline_not_*` propagation rules | `spec_ambiguity` (asserted mdoc atom); reachable in any instance whose open format slot the solver assigns to mdoc | 1 asserted |
| `supports_multi_credential_proof` | `shadow pred cross_cred_predicate_gap` only — display-only, never constrains the solver | **none among the 17**; the post-snapshot `probe_cross_cred_gap` pair inlines it as an enforced error to close exactly this gap | 0 (in flight) |
| `supports_selective_disclosure` | nothing in `models/` | **none** | 0 |
| `supports_zkp` | nothing in `models/` | **none** | 0 |

## Thin buckets

1. **`supports_selective_disclosure` and `supports_zkp` are read by no constraint anywhere in
   `models/`.** They are declared capability predicates that nothing consumes, so no instance can
   exercise them. This is the same shape as the pre-`spec_ambiguity` state of `conforms_vcdm`
   (register item `L5-c7-instrument-claimed-but-unenforced-in-delivered-instances`, ruled accept)
   and the same shape as `cross_cred_predicate_gap` before the probe now in flight. §5.1.1's
   Mapping-B claim is unaffected: a capability predicate maps to a format-family property whether or
   not a constraint reads it. What this adds is the finer statement that of the six, four are wired
   into a constraint and two are declarations only.
2. **`supports_multi_credential_proof` is wired only into a shadow predicate**, and its body is
   `f != f` — false for every format by construction. The post-snapshot `probe_cross_cred_gap` pair
   is the true-positive instrument for it; until that run's verdicts are recorded, the count for
   this bucket among delivered instances is zero.
3. **`supports_offline_verification` has exactly one asserted exercise** (`spec_ambiguity`, which
   pins mdoc for an unrelated reason). No instance states a proximity or offline-presentation
   requirement, which is the ARF-C4 obligation the predicate encodes; see
   `models/eidas_arf_supplement.md` note 2.
4. **A3 (formats admitted from outside VCDM) is asserted in 2 of 17 instances.** See the reading
   above: the search space is wider than the authored structure.
5. **Three instances have no recorded solver verdict at all** (`csok_generated`, `csok_2x_gen`,
   `csok_3x_gen`). They are the generation-mode entry points; the E2 campaign runs `generate` over
   the generated `evaluation/instances/` set, not over these three. Their expected-SAT headers are
   unverified claims.

## Sources

- `zettelkasten/claims/K-005 coverage-validation.md`; `paper-latex-overleaf/sections/05_evaluation.md`
  §5.1.1 — the bucket definitions.
- `zettelkasten/artifacts/A-004 constraint-sensitivity-variants.md` — recorded verdicts (batteries of
  2026-07-28 and 2026-08-03, Refinery CLI image digest recorded there).
- `zettelkasten/artifacts/A-003 csok-instance-models.md`, `A-005 evaluation-harness.md` — the instance
  families and the harness that generates the other 43 instances under `evaluation/instances/`.
- `models/README.md` — `probe_cyclic` pair verdicts.
- `zettelkasten/reports/loop-register-2026-08-03.md` — the D-029 delivery obligations this file funds.
