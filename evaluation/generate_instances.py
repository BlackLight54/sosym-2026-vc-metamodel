#!/usr/bin/env python3
"""Generate scaled Refinery problem instances for measurement campaign.

Creates .problem files of increasing size for scalability (E1/E2) and
constraint sensitivity (E3) experiments. Also copies metamodel files
into the instances/ directory so Refinery import resolution works.

Usage:
    python generate_instances.py              # Uses config.yaml defaults
    python generate_instances.py --dry-run    # Print file list, don't write
"""

import argparse
import shutil
from pathlib import Path

import yaml

SCRIPT_DIR = Path(__file__).resolve().parent
INSTANCES_DIR = SCRIPT_DIR / "instances"
MODELS_DIR = SCRIPT_DIR.parent  # models/
CONFIG_PATH = SCRIPT_DIR / "config.yaml"

# Files to copy into instances/ for import resolution.
# NOTE (T12): vc_metamodel.refinery is intentionally NOT copied. The measurement
# harness mounts models/ as /work, so `import vc_metamodel.` resolves against the
# single canonical metamodel at the repository root. Copying it here would
# reintroduce the metamodel drift T12 eliminated (a stale local copy shadowing the
# root). governance_conflict.refinery is small, tracked, and imported by the UNSAT
# instances and by every E3 sensitivity instance; it is copied so import resolution
# works from the instances/ directory.
# governance_sources.refinery (C5/C6/C7 as independent per-source rules, added
# 2026-08-05) is imported by governance_conflict.refinery, so it is copied for the
# same reason and must not be allowed to drift from the root copy.
METAMODEL_FILES = ["governance_conflict.refinery", "governance_sources.refinery"]


def load_config() -> dict:
    with open(CONFIG_PATH) as f:
        return yaml.safe_load(f)


def compute_scope(n: int, has_governance_conflict: bool, governance: list[str]) -> tuple[int, int]:
    """Compute (total_nodes, governance_annotation_count) for N credentials.

    Node formula (K=1 property per credential):
      DCL: 1 Subject + N Props + N Values = 2N + 1
      CSL: N CredentialSubjects + N Claims + N CredentialValues + N Credentials = 4N
      FSL: N Formatted_Credential = N
      Gov: count(eidas)*N + count(privacy)*1 + count(vcdm)*N
    Total = 2N+1 + 4N + N + gov = 7N + 1 + gov
    """
    gov_count = 0
    if "eidas" in governance:
        gov_count += n
    if "privacy" in governance:
        gov_count += 1  # only on last credential
    if "vcdm" in governance:
        gov_count += n
    total = (2 * n + 1) + (4 * n) + n + gov_count
    return total, gov_count


def generate_instance(
    n: int,
    variant: str,
    governance: list[str] | None = None,
    instance_id: str | None = None,
    import_conflict: bool | None = None,
) -> str:
    """Generate a Refinery .problem file for N credentials.

    Args:
        n: Number of credentials.
        variant: "sat" or "unsat". UNSAT imports governance_conflict.
        governance: List of active governance types. Default: [eidas, privacy, vcdm].
        instance_id: Label for the file header comment.
        import_conflict: Override for whether `governance_conflict` is imported.
            Defaults to the variant (UNSAT imports it). The E3 sensitivity
            instances set this True for every configuration so that the SAT
            verdicts are taken with the error predicate loaded.
    """
    if governance is None:
        governance = ["eidas", "privacy", "vcdm"]
    if instance_id is None:
        instance_id = f"S{n}_{variant}"

    has_conflict = variant == "unsat"
    if import_conflict is None:
        import_conflict = has_conflict
    total_nodes, gov_count = compute_scope(n, has_conflict, governance)

    lines = []

    # Header
    lines.append(f"% {'=' * 72}")
    lines.append(f"% Instance: {instance_id} — N={n} credentials, variant={variant}")
    lines.append(f"% Governance: {', '.join(governance) if governance else 'none'}")
    lines.append(f"% Total nodes: {total_nodes}, GovernanceAnnotation: {gov_count}")
    lines.append(f"% {'=' * 72}")
    lines.append("")

    # Imports
    lines.append("import vc_metamodel.")
    if import_conflict:
        lines.append("import governance_conflict.")
    lines.append("")
    lines.append("")

    # === DCL ===
    lines.append("% === DCL: domain facts ===")
    lines.append("")

    # Declarations
    dcl_props = [f"prop_{i}" for i in range(1, n + 1)]
    dcl_vals = [f"val_{i}" for i in range(1, n + 1)]
    lines.append("declare Applicant.")
    lines.append(f"declare {', '.join(dcl_props)}.")
    lines.append(f"declare {', '.join(dcl_vals)}.")
    lines.append("")

    # Type assertions
    lines.append("Subject(Applicant).")
    for i in range(1, n + 1):
        lines.append(f"Prop(prop_{i}).")
    for i in range(1, n + 1):
        lines.append(f"Value(val_{i}).")
    lines.append("")

    # Containment: property and value
    for i in range(1, n + 1):
        lines.append(f"property(Applicant, prop_{i}).")
    for i in range(1, n + 1):
        lines.append(f"value(prop_{i}, val_{i}).")
    lines.append("")

    # Close DCL
    lines.append("% Close DCL")
    lines.append("!exists(Subject::new).")
    lines.append("!exists(Value::new).")
    lines.append("!exists(Prop::new).")
    lines.append("")
    lines.append("")

    # === CSL ===
    lines.append("% === CSL: credential decomposition ===")
    lines.append("")

    # Declarations
    cs_nodes = [f"cs_{i}" for i in range(1, n + 1)]
    claim_nodes = [f"claim_{i}" for i in range(1, n + 1)]
    cv_nodes = [f"cv_{i}" for i in range(1, n + 1)]
    cred_nodes = [f"cred_{i}" for i in range(1, n + 1)]
    lines.append(f"declare {', '.join(cs_nodes)}.")
    lines.append(f"declare {', '.join(claim_nodes)}.")
    lines.append(f"declare {', '.join(cv_nodes)}.")
    lines.append(f"declare {', '.join(cred_nodes)}.")
    lines.append("")

    # Type assertions
    for i in range(1, n + 1):
        lines.append(f"CredentialSubject(cs_{i}).")
    for i in range(1, n + 1):
        lines.append(f"Claim(claim_{i}).")
    for i in range(1, n + 1):
        lines.append(f"CredentialValue(cv_{i}).")
    for i in range(1, n + 1):
        lines.append(f"Credential(cred_{i}).")
    lines.append("")

    # Trace mappings: Prop -> Claim
    lines.append("% Trace: Prop -> Claim")
    for i in range(1, n + 1):
        lines.append(f"Prop::trace(prop_{i}, claim_{i}).")
    lines.append("")

    # Claims: source and target
    lines.append("% Claims: source and target")
    for i in range(1, n + 1):
        lines.append(f"Claim::source(claim_{i}, cs_{i}).")
        lines.append(f"Claim::target(claim_{i}, cv_{i}).")
    lines.append("")

    # Credential containment: CredentialSubject -> Credential
    lines.append("% Credential containment")
    for i in range(1, n + 1):
        lines.append(f"_(cs_{i}, cred_{i}).")
    lines.append("")

    # Entity alignment: all credential subjects trace to Applicant
    lines.append("% Entity alignment: all credential subjects trace to Applicant")
    for i in range(1, n + 1):
        lines.append(f"CredEntity::trace(cs_{i}, Applicant).")
    lines.append("")

    # Value traces
    lines.append("% Value traces")
    for i in range(1, n + 1):
        lines.append(f"CredEntity::trace(cv_{i}, val_{i}).")
    lines.append("")

    # Close CSL
    lines.append("% Close CSL")
    lines.append("!exists(CredentialSubject::new).")
    lines.append("!exists(CredentialValue::new).")
    lines.append("!exists(Claim::new).")
    lines.append("!exists(Credential::new).")
    lines.append("default !CredEntity::trace(*, *).")
    lines.append("")
    lines.append("")

    # === FSL ===
    lines.append("% === FSL: format assignments ===")
    lines.append("")

    # Declarations
    fmt_nodes = [f"fmt_{i}" for i in range(1, n + 1)]
    lines.append(f"declare {', '.join(fmt_nodes)}.")
    lines.append("")

    # First N-1 credentials: assigned to SdJwtVcSchema
    for i in range(1, n):
        lines.append(f"SdJwtVcSchema(fmt_{i}).")
        lines.append(f"format(cred_{i}, fmt_{i}).")
    lines.append("")

    # Last credential: format left open for solver
    lines.append(f"% cred_{n}: format class left open for solver")
    lines.append(f"Formatted_Credential(fmt_{n}).")
    lines.append(f"format(cred_{n}, fmt_{n}).")
    lines.append("")

    # Close FSL
    lines.append("% Close FSL")
    lines.append("!exists(AnoncredsCredentialSchema::new).")
    lines.append("!exists(JsonLdCredentialSchema::new).")
    lines.append("!exists(JwtVCCredentialSchema::new).")
    lines.append("!exists(SdJwtVcSchema::new).")
    lines.append("!exists(MdocSchema::new).")
    lines.append("")
    lines.append("")

    # === Governance ===
    if governance:
        lines.append("% === Governance markers ===")
        lines.append("")

        gov_decls = []
        gov_idx = 0

        if "eidas" in governance:
            for i in range(1, n + 1):
                gov_idx += 1
                name = f"eidas_{i}"
                gov_decls.append(name)
                lines.append(f"EidasMandate({name}).")
                lines.append(f"EidasMandate::target({name}, cred_{i}).")
            lines.append("")

        if "privacy" in governance:
            gov_idx += 1
            name = "privacy_1"
            gov_decls.append(name)
            lines.append(f"PrivacyRequirement({name}).")
            lines.append(f"PrivacyRequirement::target({name}, cred_{n}).")
            lines.append("")

        if "vcdm" in governance:
            for i in range(1, n + 1):
                gov_idx += 1
                name = f"vcdm_{i}"
                gov_decls.append(name)
                lines.append(f"VcdmConformance({name}).")
                lines.append(f"VcdmConformance::target({name}, cred_{i}).")
            lines.append("")

        # Close governance
        lines.append("% Close governance")
        lines.append("!exists(EidasMandate::new).")
        lines.append("!exists(PrivacyRequirement::new).")
        lines.append("!exists(VcdmConformance::new).")
        lines.append("")
    else:
        # No governance — still need to close the classes
        lines.append("% No governance markers")
        lines.append("!exists(EidasMandate::new).")
        lines.append("!exists(PrivacyRequirement::new).")
        lines.append("!exists(VcdmConformance::new).")
        lines.append("")

    lines.append("")

    # Scope
    lines.append(f"scope node = {total_nodes}, GovernanceAnnotation = {gov_count}.")
    lines.append("")

    return "\n".join(lines)


def generate_chain_instance(
    n: int,
    depth: int,
    variant: str = "sat",
    governance: list[str] | None = None,
    instance_id: str | None = None,
) -> tuple[str, int]:
    """Generate a structurally diverse instance (AF02 / Q-007).

    Where ``generate_instance`` builds a uniform depth-1 star (all N credentials
    describe the single Applicant, one property each), this builds credentials
    arranged in *chains*: a credential can be about the *value* of its parent
    credential. Two structural phenomena Q-007 flags are realized this way:

      * Deeper claim hierarchies — a chain of length ``depth`` produces a domain
        path Applicant -> v1 -> v2 -> ... of that length, stressing the
        transitive-closure predicates (neighbours+, directed_edge+, non_connected,
        cyclic) that a diameter-2 star never exercises.
      * Multi-subject credentials — each chain level is a *distinct* subject; the
        parent's credential value and the child's credential subject trace the same
        domain entity, exercising the alignment predicates (aligned,
        cross_cred_predicate_gap) on a different topology than the star.

    N credentials are packed into ceil(N/depth) parallel chains, each up to
    ``depth`` long, all rooted at Applicant (keeping the domain graph connected).
    depth=1 reduces to the uniform star (breadth = N). Governance markers mirror
    generate_instance: eIDAS + VCDM per credential, Privacy on the last credential;
    the last credential's format is left open for the solver.

    Returns (file_text, total_nodes).
    """
    if governance is None:
        governance = ["eidas", "privacy", "vcdm"]
    if instance_id is None:
        instance_id = f"D{depth}_N{n}_{variant}"
    has_conflict = variant == "unsat"

    # --- Lay out credentials into chains -----------------------------------
    # creds[c] is a list of levels; creds[c][k] is the (c, k) credential.
    breadth = (n + depth - 1) // depth  # ceil(N / depth)
    creds: list[list[int]] = [[] for _ in range(breadth)]
    placed = 0
    level = 0
    # Round-robin by level so chains grow evenly and every chain reaches depth
    # before any exceeds it; the final (partial) level is left-packed.
    while placed < n:
        for c in range(breadth):
            if placed >= n:
                break
            if len(creds[c]) < depth:
                creds[c].append(level)
                placed += 1
        level += 1
    # Flatten to a stable credential order; the LAST one gets the open format.
    order = [(c, k) for c in range(breadth) for k in range(len(creds[c]))]
    last_c, last_k = order[-1]

    def cred_name(c, k):
        return f"cred_{c}_{k}"

    nodes: list[str] = []  # every declared node, for exact scope counting
    L: list[str] = []

    def emit(line=""):
        L.append(line)

    # subject count = Applicant + every non-root chain level
    subject_count = 1 + sum(max(0, len(creds[c]) - 1) for c in range(breadth))

    # Header
    emit(f"% {'=' * 72}")
    emit(f"% Instance: {instance_id} — N={n} credentials, depth={depth}, "
         f"breadth={breadth}, subjects={subject_count}, variant={variant}")
    emit(f"% Governance: {', '.join(governance) if governance else 'none'}")
    emit(f"% Structure: chained credentials (a credential can describe the value "
         f"of its parent credential)")
    emit(f"% {'=' * 72}")
    emit("")
    emit("import vc_metamodel.")
    if has_conflict:
        emit("import governance_conflict.")
    emit("")
    emit("")

    # === DCL ===
    emit("% === DCL: domain facts (chained) ===")
    emit("")
    emit("declare Applicant.")
    nodes.append("Applicant")
    dp = {}   # (c,k) -> domain prop name
    dv = {}   # (c,k) -> domain value name
    for (c, k) in order:
        dp[(c, k)] = f"dp_{c}_{k}"
        dv[(c, k)] = f"dv_{c}_{k}"
        emit(f"declare {dp[(c,k)]}, {dv[(c,k)]}.")
        nodes.extend([dp[(c, k)], dv[(c, k)]])
    emit("")
    emit("Subject(Applicant).")
    for (c, k) in order:
        emit(f"Prop({dp[(c,k)]}).")
    for (c, k) in order:
        emit(f"Value({dv[(c,k)]}).")
    emit("")
    # Containment: parent entity -> prop -> value
    for (c, k) in order:
        parent = "Applicant" if k == 0 else dv[(c, k - 1)]
        emit(f"property({parent}, {dp[(c,k)]}).")
    for (c, k) in order:
        emit(f"value({dp[(c,k)]}, {dv[(c,k)]}).")
    emit("")
    emit("% Close DCL")
    emit("!exists(Subject::new).")
    emit("!exists(Value::new).")
    emit("!exists(Prop::new).")
    emit("")
    emit("")

    # === CSL ===
    emit("% === CSL: credential decomposition (chained) ===")
    emit("")
    cs = {}
    claim = {}
    cv = {}
    cred = {}
    for (c, k) in order:
        cs[(c, k)] = f"cs_{c}_{k}"
        claim[(c, k)] = f"claim_{c}_{k}"
        cv[(c, k)] = f"cv_{c}_{k}"
        cred[(c, k)] = cred_name(c, k)
        emit(f"declare {cs[(c,k)]}, {claim[(c,k)]}, {cv[(c,k)]}, {cred[(c,k)]}.")
        nodes.extend([cs[(c, k)], claim[(c, k)], cv[(c, k)], cred[(c, k)]])
    emit("")
    for (c, k) in order:
        emit(f"CredentialSubject({cs[(c,k)]}).")
    for (c, k) in order:
        emit(f"Claim({claim[(c,k)]}).")
    for (c, k) in order:
        emit(f"CredentialValue({cv[(c,k)]}).")
    for (c, k) in order:
        emit(f"Credential({cred[(c,k)]}).")
    emit("")
    emit("% Trace: Prop -> Claim")
    for (c, k) in order:
        emit(f"Prop::trace({dp[(c,k)]}, {claim[(c,k)]}).")
    emit("")
    emit("% Claims: source (subject) and target (value)")
    for (c, k) in order:
        emit(f"Claim::source({claim[(c,k)]}, {cs[(c,k)]}).")
        emit(f"Claim::target({claim[(c,k)]}, {cv[(c,k)]}).")
    emit("")
    emit("% Credential containment")
    for (c, k) in order:
        emit(f"_({cs[(c,k)]}, {cred[(c,k)]}).")
    emit("")
    emit("% Entity alignment: subject traces to its domain anchor,")
    emit("% value traces to its domain value. A child credential's subject and its")
    emit("% parent credential's value trace the SAME domain entity (multi-subject).")
    for (c, k) in order:
        anchor = "Applicant" if k == 0 else dv[(c, k - 1)]
        emit(f"CredEntity::trace({cs[(c,k)]}, {anchor}).")
    for (c, k) in order:
        emit(f"CredEntity::trace({cv[(c,k)]}, {dv[(c,k)]}).")
    emit("")
    emit("% Close CSL")
    emit("!exists(CredentialSubject::new).")
    emit("!exists(CredentialValue::new).")
    emit("!exists(Claim::new).")
    emit("!exists(Credential::new).")
    emit("default !CredEntity::trace(*, *).")
    emit("")
    emit("")

    # === FSL ===
    emit("% === FSL: format assignments ===")
    emit("")
    fmt = {}
    for (c, k) in order:
        fmt[(c, k)] = f"fmt_{c}_{k}"
        nodes.append(fmt[(c, k)])
    emit(f"declare {', '.join(fmt[(c,k)] for (c,k) in order)}.")
    emit("")
    for (c, k) in order:
        if (c, k) == (last_c, last_k):
            continue
        emit(f"SdJwtVcSchema({fmt[(c,k)]}).")
        emit(f"format({cred[(c,k)]}, {fmt[(c,k)]}).")
    emit("")
    emit(f"% {cred[(last_c,last_k)]}: format class left open for solver")
    emit(f"Formatted_Credential({fmt[(last_c,last_k)]}).")
    emit(f"format({cred[(last_c,last_k)]}, {fmt[(last_c,last_k)]}).")
    emit("")
    emit("% Close FSL")
    emit("!exists(AnoncredsCredentialSchema::new).")
    emit("!exists(JsonLdCredentialSchema::new).")
    emit("!exists(JwtVCCredentialSchema::new).")
    emit("!exists(SdJwtVcSchema::new).")
    emit("!exists(MdocSchema::new).")
    emit("")
    emit("")

    # === Governance ===
    gov_count = 0
    emit("% === Governance markers ===")
    emit("")
    if "eidas" in governance:
        for idx, (c, k) in enumerate(order, 1):
            name = f"eidas_{c}_{k}"
            nodes.append(name)
            gov_count += 1
            emit(f"EidasMandate({name}).")
            emit(f"EidasMandate::target({name}, {cred[(c,k)]}).")
        emit("")
    if "privacy" in governance:
        name = "privacy_1"
        nodes.append(name)
        gov_count += 1
        emit(f"PrivacyRequirement({name}).")
        emit(f"PrivacyRequirement::target({name}, {cred[(last_c,last_k)]}).")
        emit("")
    if "vcdm" in governance:
        for idx, (c, k) in enumerate(order, 1):
            name = f"vcdm_{c}_{k}"
            nodes.append(name)
            gov_count += 1
            emit(f"VcdmConformance({name}).")
            emit(f"VcdmConformance::target({name}, {cred[(c,k)]}).")
        emit("")
    emit("% Close governance")
    emit("!exists(EidasMandate::new).")
    emit("!exists(PrivacyRequirement::new).")
    emit("!exists(VcdmConformance::new).")
    emit("")
    emit("")

    total_nodes = len(nodes)
    emit(f"scope node = {total_nodes}, GovernanceAnnotation = {gov_count}.")
    emit("")

    return "\n".join(L), total_nodes


def expectations(variant: str, generate: str | None = None) -> tuple[str, str]:
    """Verdict expectations for one instance: (check -k, generate).

    UNSAT instances are not generation entry points — generating from an instance
    that is already not concretizable is unsatisfiable by construction. Callers
    pass `generate="SKIP"` to opt a SAT instance out as well.
    """
    check_k = "UNSAT" if variant == "unsat" else "SAT"
    if generate is not None:
        return check_k, generate
    return check_k, ("SKIP" if variant == "unsat" else "SAT")


def write_expectations(entries: list[tuple[str, str, str, str]]) -> None:
    """Write the manifest run_tests.sh reads for the generated instances.

    Paths are written relative to models/ (the Docker mount), matching the
    hand-authored ../expectations.tsv, so one parser covers both.
    """
    path = INSTANCES_DIR / "expectations.tsv"
    lines = [
        "# Verdict expectations for the generated measurement instances.",
        "#",
        "# GENERATED by generate_instances.py — do not hand-edit; regenerate instead.",
        "# Hand-authored entry points are declared in models/expectations.tsv.",
        "#",
        "# file\tcheck_k\tgenerate\tsource",
    ]
    for fname, _content, check_k, gen in sorted(entries):
        lines.append(
            f"evaluation/instances/{fname}\t{check_k}\t{gen}\tgenerate_instances.py"
        )
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {path.name} ({len(entries)} rows)")


def main():
    parser = argparse.ArgumentParser(description="Generate Refinery measurement instances")
    parser.add_argument("--dry-run", action="store_true", help="Print file list without writing")
    args = parser.parse_args()

    config = load_config()
    INSTANCES_DIR.mkdir(parents=True, exist_ok=True)

    # Each entry is (filename, content, check_k_expectation, generate_expectation).
    # The expectations come from `variant`, which is the generator's intent, so the
    # manifest written below cannot drift from what was generated. E3 rows carry
    # generate=SKIP: the sensitivity experiment is about `check -k` verdicts and no
    # campaign generates from those instances.
    files_to_generate = []

    # --- E1/E2: Scalability instances ---
    for n in config["scale_points"]:
        for variant in ["sat", "unsat"]:
            filename = f"scale_{n}_{variant}.problem"
            governance = ["eidas", "privacy", "vcdm"]
            content = generate_instance(n, variant, governance, f"S{n}_{variant}")
            files_to_generate.append((filename, content, *expectations(variant)))

    # --- E3: Sensitivity instances (N=3, governance power-set) ---
    sens_n = config["sensitivity_n"]
    for config_name, gov_list in config["sensitivity_configs"].items():
        # Every sensitivity instance imports governance_conflict, including the
        # proper subsets: the ablation claim is that dropping any one governance
        # annotation makes the conflict predicate unable to fire, so the predicate
        # must be loaded in all eight configurations for the SAT verdicts to
        # exercise it. `variant` still labels the expected verdict (G7 = unsat,
        # all proper subsets = sat) and drives nothing else here.
        variant = "unsat" if set(gov_list) == {"eidas", "privacy", "vcdm"} else "sat"
        filename = f"sensitivity_{config_name}.problem"
        content = generate_instance(
            sens_n, variant, gov_list, f"E3_{config_name}", import_conflict=True
        )
        # The expected verdict is NOT `variant`. Since the 2026-08-05 per-source
        # encoding of C5/C6/C7 (governance_sources.refinery), a privacy requirement
        # conflicts with eIDAS and with VCDM conformance independently, so G4
        # {eIDAS, privacy} and G6 {privacy, VCDM} are UNSAT alongside G7. Only the
        # triple conjunction was UNSAT under the single-clause encoding. Verbatim
        # verdicts: vault A-004 constraint-sensitivity-variants.
        gov = set(gov_list)
        e3_unsat = "privacy" in gov and bool(gov & {"eidas", "vcdm"})
        files_to_generate.append(
            (filename, content, "UNSAT" if e3_unsat else "SAT", "SKIP")
        )

    # --- ED: Structurally diverse instances (AF02 / Q-007) ---
    diverse = config.get("diverse")
    if diverse:
        gov = ["eidas", "privacy", "vcdm"]
        # (a) Depth sweep at fixed N
        dn = diverse["depth_sweep_n"]
        for d in diverse["depth_sweep_depths"]:
            content, _nodes = generate_chain_instance(
                dn, d, "sat", gov, f"ED_depth_D{d}_N{dn}"
            )
            files_to_generate.append(
                (f"diverse_depth_D{d}_N{dn}_sat.problem", content, *expectations("sat"))
            )
        # (b) Depth-fixed N-sweep, SAT and UNSAT
        sd = diverse["scale_depth"]
        for n in diverse["scale_points"]:
            for variant in ["sat", "unsat"]:
                content, _nodes = generate_chain_instance(
                    n, sd, variant, gov, f"ED_scale_D{sd}_N{n}_{variant}"
                )
                files_to_generate.append(
                    (
                        f"diverse_scale_D{sd}_S{n}_{variant}.problem",
                        content,
                        *expectations(variant),
                    )
                )

    if args.dry_run:
        print(f"Would generate {len(files_to_generate)} instance files in {INSTANCES_DIR}/")
        for fname, content, check_k, gen in files_to_generate:
            lines = content.count("\n")
            print(f"  {fname} ({lines} lines) check-k={check_k} generate={gen}")
        print(f"\nWould copy {len(METAMODEL_FILES)} metamodel files")
        return

    # Copy metamodel files
    for mf in METAMODEL_FILES:
        src = MODELS_DIR / mf
        dst = INSTANCES_DIR / mf
        if src.exists():
            shutil.copy2(src, dst)
            print(f"Copied {mf}")
        else:
            print(f"WARNING: {src} not found!")

    # Write instance files
    for fname, content, _check_k, _gen in files_to_generate:
        path = INSTANCES_DIR / fname
        path.write_text(content, encoding="utf-8")

    print(f"\nGenerated {len(files_to_generate)} instance files in {INSTANCES_DIR}/")

    write_expectations(files_to_generate)

    # Summary table
    print(f"\n{'Instance':<25} {'N':>3} {'Variant':<6} {'Nodes':>5} {'Gov':>4}")
    print("-" * 50)
    for fname, content, _check_k, _gen in files_to_generate:
        # Parse from header comment
        for line in content.split("\n"):
            if "N=" in line and "variant=" in line:
                parts = line.split("—")[1].strip() if "—" in line else ""
                break
        # Extract from scope line
        for line in content.split("\n"):
            if line.startswith("scope node"):
                scope_parts = line.replace("scope node = ", "").replace(".", "").split(",")
                nodes = scope_parts[0].strip()
                gov = scope_parts[1].strip().split("=")[1].strip() if len(scope_parts) > 1 else "0"
                break
        n_str = fname.split("_")[1] if "scale" in fname else "3"
        var_str = "unsat" if "unsat" in fname else "sat"
        print(f"{fname:<25} {n_str:>3} {var_str:<6} {nodes:>5} {gov:>4}")


if __name__ == "__main__":
    main()
