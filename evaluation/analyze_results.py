#!/usr/bin/env python3
"""Analyze Hyperfine measurement results and generate figures + tables.

Reads JSON output from Hyperfine benchmarks and produces:
  - fig_scalability_check.pdf   (E1: check time vs. model size)
  - fig_scalability_generate.pdf (E2: generate time vs. model size + check overlay)
  - fig_constraint_sensitivity.pdf (E3: governance power-set bar chart)
  - timing_summary.md           (markdown table for quick review)
  - timing_summary.tex          (LaTeX table fragment for paper)

Usage:
    python analyze_results.py                    # Default: read results/, write figures/
    python analyze_results.py --results-dir X    # Custom results directory
"""

import argparse
import json
import sys
from pathlib import Path

import matplotlib
matplotlib.use("Agg")  # non-interactive backend
import matplotlib.pyplot as plt
import numpy as np

SCRIPT_DIR = Path(__file__).resolve().parent
RESULTS_DIR = SCRIPT_DIR / "results"
FIGURES_DIR = SCRIPT_DIR / "figures"
INSTANCES_DIR = SCRIPT_DIR / "instances"

# Node formula: 9N + 2 for full governance (eidas + privacy + vcdm)
SCALE_POINTS = [1, 3, 5, 10, 15, 20, 30]

# ED (AF02 / Q-007) diverse instance parameters — must match config.yaml `diverse:`
DIVERSE_DEPTH_N = 12
DIVERSE_DEPTHS = [1, 2, 3, 4, 6, 12]
DIVERSE_SCALE_DEPTH = 4


def read_scope_nodes(problem_path: Path) -> int | None:
    """Read the exact `scope node = N` count from a generated .problem file."""
    if not problem_path.exists():
        return None
    for line in problem_path.read_text(encoding="utf-8").splitlines():
        s = line.strip()
        if s.startswith("scope node"):
            # e.g. "scope node = 110, GovernanceAnnotation = 25."
            try:
                return int(s.split("=")[1].split(",")[0].strip())
            except (IndexError, ValueError):
                return None
    return None

# Governance config labels for E3
GOV_LABELS = {
    "G0": "None",
    "G1": "eIDAS",
    "G2": "Privacy",
    "G3": "VCDM",
    "G4": "eIDAS+Priv",
    "G5": "eIDAS+VCDM",
    "G6": "Priv+VCDM",
    "G7": "All three",
}

# Style
plt.rcParams.update({
    "font.family": "serif",
    "font.size": 10,
    "axes.labelsize": 11,
    "axes.titlesize": 12,
    "legend.fontsize": 9,
    "figure.dpi": 150,
})


def load_hyperfine_json(path: Path) -> dict | None:
    """Load a Hyperfine JSON result file. Returns None if missing."""
    if not path.exists():
        return None
    try:
        with open(path) as f:
            data = json.load(f)
    except (json.JSONDecodeError, OSError):
        # Partial/empty file (e.g. read mid-write). Treat as absent.
        return None
    # Hyperfine JSON has {"results": [{"command": ..., "mean": ..., "stddev": ..., "times": [...], ...}]}
    if "results" in data and len(data["results"]) > 0:
        return data["results"][0]
    return None


def s_to_ms(seconds: float) -> float:
    return seconds * 1000.0


def _fmt(result: dict | None, sep: str) -> str:
    """Format 'mean ± stddev' in ms. Robust to missing files and null fields
    (hyperfine writes stddev=null for single-run benchmarks)."""
    if result is None or result.get("mean") is None:
        return "---"
    mean = s_to_ms(result["mean"])
    std = result.get("stddev")
    if std is None:
        return f"{mean:.0f}"
    return f"{mean:.0f} {sep} {s_to_ms(std):.0f}"


def fmt(result):
    return _fmt(result, "±")


def tex_fmt(result):
    return _fmt(result, "$\\pm$")


def compute_nodes(n: int) -> int:
    """Total nodes for N credentials with full governance."""
    gov = 2 * n + 1  # n eidas + 1 privacy + n vcdm
    return 7 * n + 1 + gov  # = 9n + 2


def plot_scalability_check(results_dir: Path, figures_dir: Path):
    """E1: Check time vs. model size, SAT and UNSAT lines."""
    fig, ax = plt.subplots(figsize=(7, 4))

    for variant, color, marker, label in [
        ("sat", "#2196F3", "o", "SAT (no conflict)"),
        ("unsat", "#F44336", "s", "UNSAT (governance conflict)"),
    ]:
        nodes_list = []
        means = []
        stds = []

        for n in SCALE_POINTS:
            result = load_hyperfine_json(results_dir / f"e1_check_S{n}_{variant}.json")
            if result is None:
                continue
            nodes_list.append(compute_nodes(n))
            means.append(s_to_ms(result["mean"]))
            stds.append(s_to_ms(result["stddev"]))

        if not nodes_list:
            continue

        nodes_arr = np.array(nodes_list)
        means_arr = np.array(means)
        stds_arr = np.array(stds)

        ax.plot(nodes_arr, means_arr, marker=marker, color=color, label=label, linewidth=1.5, markersize=5)
        ax.fill_between(nodes_arr, means_arr - stds_arr, means_arr + stds_arr, alpha=0.15, color=color)

    ax.set_xlabel("Model size (nodes)")
    ax.set_ylabel("Check time (ms)")
    ax.set_title("E1: Consistency Check Scalability")
    ax.legend(loc="upper left")
    ax.grid(True, alpha=0.3)
    ax.set_xlim(left=0)
    ax.set_ylim(bottom=0)

    # Add secondary x-axis with credential count
    ax2 = ax.twiny()
    cred_ticks = SCALE_POINTS
    node_ticks = [compute_nodes(n) for n in cred_ticks]
    ax2.set_xlim(ax.get_xlim())
    ax2.set_xticks(node_ticks)
    ax2.set_xticklabels([str(n) for n in cred_ticks])
    ax2.set_xlabel("Number of credentials")

    fig.tight_layout()
    outpath = figures_dir / "fig_scalability_check.pdf"
    fig.savefig(outpath, bbox_inches="tight")
    plt.close(fig)
    print(f"  Saved {outpath}")


def plot_scalability_generate(results_dir: Path, figures_dir: Path):
    """E2: Generate time vs. model size, with check-SAT overlay."""
    fig, ax = plt.subplots(figsize=(7, 4))

    # Check-SAT (dashed reference)
    check_nodes, check_means = [], []
    for n in SCALE_POINTS:
        result = load_hyperfine_json(results_dir / f"e1_check_S{n}_sat.json")
        if result:
            check_nodes.append(compute_nodes(n))
            check_means.append(s_to_ms(result["mean"]))

    if check_nodes:
        ax.plot(check_nodes, check_means, "--", color="#9E9E9E", marker="o",
                label="Check (SAT)", linewidth=1, markersize=4, alpha=0.7)

    # Generate-SAT
    gen_nodes, gen_means, gen_stds = [], [], []
    for n in SCALE_POINTS:
        result = load_hyperfine_json(results_dir / f"e2_generate_S{n}_sat.json")
        if result:
            gen_nodes.append(compute_nodes(n))
            gen_means.append(s_to_ms(result["mean"]))
            gen_stds.append(s_to_ms(result["stddev"]))

    if gen_nodes:
        gen_nodes_arr = np.array(gen_nodes)
        gen_means_arr = np.array(gen_means)
        gen_stds_arr = np.array(gen_stds)

        ax.plot(gen_nodes_arr, gen_means_arr, "o-", color="#4CAF50",
                label="Generate (SAT)", linewidth=1.5, markersize=5)
        ax.fill_between(gen_nodes_arr, gen_means_arr - gen_stds_arr,
                        gen_means_arr + gen_stds_arr, alpha=0.15, color="#4CAF50")

    ax.set_xlabel("Model size (nodes)")
    ax.set_ylabel("Time (ms)")
    ax.set_title("E2: Model Generation Scalability")
    ax.legend(loc="upper left")
    ax.grid(True, alpha=0.3)
    ax.set_xlim(left=0)
    ax.set_ylim(bottom=0)

    # Secondary x-axis
    ax2 = ax.twiny()
    cred_ticks = SCALE_POINTS
    node_ticks = [compute_nodes(n) for n in cred_ticks]
    ax2.set_xlim(ax.get_xlim())
    ax2.set_xticks(node_ticks)
    ax2.set_xticklabels([str(n) for n in cred_ticks])
    ax2.set_xlabel("Number of credentials")

    fig.tight_layout()
    outpath = figures_dir / "fig_scalability_generate.pdf"
    fig.savefig(outpath, bbox_inches="tight")
    plt.close(fig)
    print(f"  Saved {outpath}")


def plot_constraint_sensitivity(results_dir: Path, figures_dir: Path):
    """E3: Bar chart of 8 governance configs with SAT/UNSAT coloring."""
    fig, ax = plt.subplots(figsize=(8, 4))

    configs = [f"G{i}" for i in range(8)]
    means = []
    stds = []
    colors = []
    labels_display = []

    for cfg in configs:
        result = load_hyperfine_json(results_dir / f"e3_sensitivity_{cfg}.json")
        if result:
            means.append(s_to_ms(result["mean"]))
            stds.append(s_to_ms(result["stddev"]))
        else:
            means.append(0)
            stds.append(0)

        # G7 is UNSAT, all others SAT
        colors.append("#F44336" if cfg == "G7" else "#2196F3")
        labels_display.append(GOV_LABELS.get(cfg, cfg))

    x = np.arange(len(configs))
    bars = ax.bar(x, means, yerr=stds, color=colors, capsize=3, alpha=0.85, edgecolor="white")

    ax.set_xlabel("Governance configuration")
    ax.set_ylabel("Check time (ms)")
    ax.set_title("E3: Constraint Sensitivity (N=3)")
    ax.set_xticks(x)
    ax.set_xticklabels(labels_display, rotation=30, ha="right", fontsize=8)
    ax.grid(True, axis="y", alpha=0.3)
    ax.set_ylim(bottom=0)

    # Legend for SAT/UNSAT colors
    from matplotlib.patches import Patch
    legend_elements = [
        Patch(facecolor="#2196F3", label="SAT"),
        Patch(facecolor="#F44336", label="UNSAT"),
    ]
    ax.legend(handles=legend_elements, loc="upper left")

    fig.tight_layout()
    outpath = figures_dir / "fig_constraint_sensitivity.pdf"
    fig.savefig(outpath, bbox_inches="tight")
    plt.close(fig)
    print(f"  Saved {outpath}")


def generate_timing_summary(results_dir: Path, figures_dir: Path):
    """Generate markdown and LaTeX timing summary tables."""
    md_lines = []
    tex_lines = []

    # --- EC/E1/E2 Summary ---
    # EC (plain check) returns SAT on every instance including _unsat variants;
    # only E1 (check -k) distinguishes them. Consistency column reports the SAT
    # variant (UNSAT variant times are within noise of it — both are "consistent").
    md_lines.append("## Scalability Summary (EC + E1 + E2)\n")
    md_lines.append("| N | Nodes | Consistency (ms) | Check-k SAT (ms) | Check-k UNSAT (ms) | Generate (ms) |")
    md_lines.append("|--:|------:|-----------------:|-----------------:|-------------------:|--------------:|")

    tex_lines.append("% Scalability timing summary — auto-generated by analyze_results.py")
    tex_lines.append("\\begin{tabular}{rrrrrr}")
    tex_lines.append("\\toprule")
    tex_lines.append("$N$ & Nodes & Consistency (ms) & Check-k SAT (ms) & Check-k UNSAT (ms) & Generate (ms) \\\\")
    tex_lines.append("\\midrule")

    for n in SCALE_POINTS:
        nodes = compute_nodes(n)
        cons = load_hyperfine_json(results_dir / f"ec_consistency_S{n}_sat.json")
        check_sat = load_hyperfine_json(results_dir / f"e1_check_S{n}_sat.json")
        check_unsat = load_hyperfine_json(results_dir / f"e1_check_S{n}_unsat.json")
        gen_sat = load_hyperfine_json(results_dir / f"e2_generate_S{n}_sat.json")

        md_lines.append(
            f"| {n} | {nodes} | {fmt(cons)} | {fmt(check_sat)} | {fmt(check_unsat)} | {fmt(gen_sat)} |"
        )
        tex_lines.append(
            f"{n} & {nodes} & {tex_fmt(cons)} & {tex_fmt(check_sat)} & {tex_fmt(check_unsat)} & {tex_fmt(gen_sat)} \\\\"
        )

    tex_lines.append("\\bottomrule")
    tex_lines.append("\\end{tabular}")

    # --- E3 Summary ---
    md_lines.append("\n## Constraint Sensitivity (E3, N=3)\n")
    md_lines.append("| Config | eIDAS | Privacy | VCDM | Outcome | Time (ms) |")
    md_lines.append("|--------|:-----:|:-------:|:----:|:-------:|----------:|")

    gov_flags = {
        "G0": (False, False, False),
        "G1": (True, False, False),
        "G2": (False, True, False),
        "G3": (False, False, True),
        "G4": (True, True, False),
        "G5": (True, False, True),
        "G6": (False, True, True),
        "G7": (True, True, True),
    }

    for cfg in [f"G{i}" for i in range(8)]:
        result = load_hyperfine_json(results_dir / f"e3_sensitivity_{cfg}.json")
        e, p, v = gov_flags[cfg]
        outcome = "UNSAT" if cfg == "G7" else "SAT"
        time_str = f"{s_to_ms(result['mean']):.0f} ± {s_to_ms(result['stddev']):.0f}" if result else "---"
        e_str = "X" if e else "-"
        p_str = "X" if p else "-"
        v_str = "X" if v else "-"
        md_lines.append(f"| {cfg} | {e_str} | {p_str} | {v_str} | {outcome} | {time_str} |")

    # Write files
    md_path = figures_dir / "timing_summary.md"
    md_path.write_text("\n".join(md_lines) + "\n", encoding="utf-8")
    print(f"  Saved {md_path}")

    tex_path = figures_dir / "timing_summary.tex"
    tex_path.write_text("\n".join(tex_lines) + "\n", encoding="utf-8")
    print(f"  Saved {tex_path}")


def generate_diverse_summary(results_dir: Path, figures_dir: Path, instances_dir: Path):
    """ED (AF02 / Q-007): summarize diverse (chained) instance measurements.

    Two tables:
      (a) Depth sweep at fixed N=12 — does chain depth degrade check-k / generate?
      (b) Depth-fixed N-sweep vs uniform — does the sublinear-in-N scaling survive?
    """
    md = []
    tex = []

    # (a) Depth sweep
    md.append("## Diverse: Depth Sweep (N=12, chained)\n")
    md.append("| Depth | Breadth | Nodes | Check-k (ms) | Generate (ms) |")
    md.append("|------:|--------:|------:|-------------:|--------------:|")
    tex.append("% Diverse depth sweep — auto-generated")
    tex.append("\\begin{tabular}{rrrrr}")
    tex.append("\\toprule")
    tex.append("Depth & Breadth & Nodes & Check-k (ms) & Generate (ms) \\\\")
    tex.append("\\midrule")
    for d in DIVERSE_DEPTHS:
        breadth = (DIVERSE_DEPTH_N + d - 1) // d
        nodes = read_scope_nodes(instances_dir / f"diverse_depth_D{d}_N{DIVERSE_DEPTH_N}_sat.problem")
        chk = load_hyperfine_json(results_dir / f"ed_depth_check_D{d}_N{DIVERSE_DEPTH_N}.json")
        gen = load_hyperfine_json(results_dir / f"ed_depth_generate_D{d}_N{DIVERSE_DEPTH_N}.json")
        nodes_s = "---" if nodes is None else str(nodes)
        md.append(f"| {d} | {breadth} | {nodes_s} | {fmt(chk)} | {fmt(gen)} |")
        tex.append(f"{d} & {breadth} & {nodes_s} & {tex_fmt(chk)} & {tex_fmt(gen)} \\\\")
    tex.append("\\bottomrule")
    tex.append("\\end{tabular}")

    # (b) Depth-fixed N-sweep vs uniform
    md.append(f"\n## Diverse: N-sweep at depth={DIVERSE_SCALE_DEPTH} vs uniform\n")
    md.append("| N | Nodes | Uniform check-k (ms) | Diverse check-k SAT (ms) | Diverse check-k UNSAT (ms) | Diverse generate (ms) |")
    md.append("|--:|------:|---------------------:|-------------------------:|---------------------------:|----------------------:|")
    tex.append("\n% Diverse N-sweep vs uniform — auto-generated")
    tex.append("\\begin{tabular}{rrrrrr}")
    tex.append("\\toprule")
    tex.append("$N$ & Nodes & Uniform check-k & Diverse SAT & Diverse UNSAT & Diverse gen. \\\\")
    tex.append("\\midrule")
    for n in SCALE_POINTS:
        nodes = read_scope_nodes(instances_dir / f"diverse_scale_D{DIVERSE_SCALE_DEPTH}_S{n}_sat.problem")
        nodes_s = "---" if nodes is None else str(nodes)
        uni = load_hyperfine_json(results_dir / f"e1_check_S{n}_sat.json")
        dvs = load_hyperfine_json(results_dir / f"ed_scale_check_D{DIVERSE_SCALE_DEPTH}_S{n}_sat.json")
        dvu = load_hyperfine_json(results_dir / f"ed_scale_check_D{DIVERSE_SCALE_DEPTH}_S{n}_unsat.json")
        dvg = load_hyperfine_json(results_dir / f"ed_scale_generate_D{DIVERSE_SCALE_DEPTH}_S{n}.json")
        md.append(f"| {n} | {nodes_s} | {fmt(uni)} | {fmt(dvs)} | {fmt(dvu)} | {fmt(dvg)} |")
        tex.append(f"{n} & {nodes_s} & {tex_fmt(uni)} & {tex_fmt(dvs)} & {tex_fmt(dvu)} & {tex_fmt(dvg)} \\\\")
    tex.append("\\bottomrule")
    tex.append("\\end{tabular}")

    (figures_dir / "diverse_summary.md").write_text("\n".join(md) + "\n", encoding="utf-8")
    (figures_dir / "diverse_summary.tex").write_text("\n".join(tex) + "\n", encoding="utf-8")
    print(f"  Saved {figures_dir / 'diverse_summary.md'}")
    print(f"  Saved {figures_dir / 'diverse_summary.tex'}")


def plot_diverse_comparison(results_dir: Path, figures_dir: Path):
    """Overlay uniform vs diverse (chained) check-k scaling across N."""
    fig, ax = plt.subplots(figsize=(7, 4))
    series = [
        ("Uniform (star)", "#2196F3", "o", lambda n: results_dir / f"e1_check_S{n}_sat.json"),
        (f"Diverse (depth {DIVERSE_SCALE_DEPTH})", "#FF9800", "s",
         lambda n: results_dir / f"ed_scale_check_D{DIVERSE_SCALE_DEPTH}_S{n}_sat.json"),
    ]
    have_any = False
    for label, color, marker, pather in series:
        nodes_list, means, stds = [], [], []
        for n in SCALE_POINTS:
            r = load_hyperfine_json(pather(n))
            if r is None:
                continue
            nodes_list.append(compute_nodes(n))
            means.append(s_to_ms(r["mean"]))
            stds.append(s_to_ms(r["stddev"]))
        if not nodes_list:
            continue
        have_any = True
        na, ma, sa = np.array(nodes_list), np.array(means), np.array(stds)
        ax.plot(na, ma, marker=marker, color=color, label=label, linewidth=1.5, markersize=5)
        ax.fill_between(na, ma - sa, ma + sa, alpha=0.15, color=color)
    if not have_any:
        plt.close(fig)
        return
    ax.set_xlabel("Model size (nodes)")
    ax.set_ylabel("Check-k time (ms)")
    ax.set_title("Uniform vs. structurally diverse scaling")
    ax.legend(loc="upper left")
    ax.grid(True, alpha=0.3)
    ax.set_xlim(left=0)
    ax.set_ylim(bottom=0)
    fig.tight_layout()
    outpath = figures_dir / "fig_diverse_comparison.pdf"
    fig.savefig(outpath, bbox_inches="tight")
    plt.close(fig)
    print(f"  Saved {outpath}")


def main():
    parser = argparse.ArgumentParser(description="Analyze Hyperfine measurement results")
    parser.add_argument("--results-dir", type=Path, default=RESULTS_DIR)
    parser.add_argument("--figures-dir", type=Path, default=FIGURES_DIR)
    args = parser.parse_args()

    args.figures_dir.mkdir(parents=True, exist_ok=True)

    # Check we have any results
    json_files = list(args.results_dir.glob("*.json"))
    env_files = [f for f in json_files if f.name == "environment.json"]
    result_files = [f for f in json_files if f.name != "environment.json"]

    if not result_files:
        print(f"No result files found in {args.results_dir}/")
        print("Run run_measurements.sh first.")
        sys.exit(1)

    print(f"Found {len(result_files)} result files in {args.results_dir}/")
    print()

    # Load environment
    env_path = args.results_dir / "environment.json"
    if env_path.exists():
        with open(env_path) as f:
            env = json.load(f)
        print(f"Environment: {env.get('cpu', '?')}, {env.get('ram_gb', '?')} GB RAM")
        print(f"Refinery: {env.get('refinery_image', '?')}")
        print(f"Runs/benchmark: {env.get('runs_per_benchmark', '?')}, warmup: {env.get('warmup_runs', '?')}")
        print()

    print("Generating figures...")
    plot_scalability_check(args.results_dir, args.figures_dir)
    plot_scalability_generate(args.results_dir, args.figures_dir)
    plot_constraint_sensitivity(args.results_dir, args.figures_dir)
    plot_diverse_comparison(args.results_dir, args.figures_dir)

    print("\nGenerating tables...")
    generate_timing_summary(args.results_dir, args.figures_dir)
    generate_diverse_summary(args.results_dir, args.figures_dir, INSTANCES_DIR)

    print("\nDone.")


if __name__ == "__main__":
    main()
