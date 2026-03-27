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

# Files to copy into instances/ for import resolution
METAMODEL_FILES = ["vc_metamodel.refinery", "governance_conflict.refinery"]


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
) -> str:
    """Generate a Refinery .problem file for N credentials.

    Args:
        n: Number of credentials.
        variant: "sat" or "unsat". UNSAT imports governance_conflict.
        governance: List of active governance types. Default: [eidas, privacy, vcdm].
        instance_id: Label for the file header comment.
    """
    if governance is None:
        governance = ["eidas", "privacy", "vcdm"]
    if instance_id is None:
        instance_id = f"S{n}_{variant}"

    has_conflict = variant == "unsat"
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
    if has_conflict:
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


def main():
    parser = argparse.ArgumentParser(description="Generate Refinery measurement instances")
    parser.add_argument("--dry-run", action="store_true", help="Print file list without writing")
    args = parser.parse_args()

    config = load_config()
    INSTANCES_DIR.mkdir(parents=True, exist_ok=True)

    files_to_generate = []

    # --- E1/E2: Scalability instances ---
    for n in config["scale_points"]:
        for variant in ["sat", "unsat"]:
            filename = f"scale_{n}_{variant}.problem"
            governance = ["eidas", "privacy", "vcdm"]
            content = generate_instance(n, variant, governance, f"S{n}_{variant}")
            files_to_generate.append((filename, content))

    # --- E3: Sensitivity instances (N=3, governance power-set) ---
    sens_n = config["sensitivity_n"]
    for config_name, gov_list in config["sensitivity_configs"].items():
        # Sensitivity instances always use check (no governance_conflict import needed
        # unless all three are active — but for consistency we use the same logic:
        # G7 with governance_conflict = UNSAT, all others = SAT)
        variant = "unsat" if set(gov_list) == {"eidas", "privacy", "vcdm"} else "sat"
        filename = f"sensitivity_{config_name}.problem"
        content = generate_instance(
            sens_n, variant, gov_list, f"E3_{config_name}"
        )
        files_to_generate.append((filename, content))

    if args.dry_run:
        print(f"Would generate {len(files_to_generate)} instance files in {INSTANCES_DIR}/")
        for fname, content in files_to_generate:
            lines = content.count("\n")
            print(f"  {fname} ({lines} lines)")
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
    for fname, content in files_to_generate:
        path = INSTANCES_DIR / fname
        path.write_text(content, encoding="utf-8")

    print(f"\nGenerated {len(files_to_generate)} instance files in {INSTANCES_DIR}/")

    # Summary table
    print(f"\n{'Instance':<25} {'N':>3} {'Variant':<6} {'Nodes':>5} {'Gov':>4}")
    print("-" * 50)
    for fname, content in files_to_generate:
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
