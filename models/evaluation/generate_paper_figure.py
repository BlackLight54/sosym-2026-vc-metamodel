#!/usr/bin/env python3
"""Generate baseline-corrected scalability plot for the paper.

Reads Hyperfine JSON results, subtracts Docker+JVM baseline overhead,
and produces a square PDF figure suitable for a figure* minipage.

Usage:
    python generate_paper_figure.py
    python generate_paper_figure.py --output pandoc/assets/fig_scalability.pdf
"""

import argparse
import json
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

SCRIPT_DIR = Path(__file__).resolve().parent
RESULTS_DIR = SCRIPT_DIR / "results"
DEFAULT_OUTPUT = SCRIPT_DIR.parent.parent / "pandoc" / "assets" / "fig_scalability.pdf"

SCALE_POINTS = [1, 3, 5, 10, 15, 20, 30]


def load_hyperfine(path: Path) -> dict | None:
    if not path.exists():
        return None
    with open(path) as f:
        data = json.load(f)
    if "results" in data and len(data["results"]) > 0:
        return data["results"][0]
    return None


def compute_nodes(n: int) -> int:
    """Total nodes for N credentials with full governance (9N + 2)."""
    gov = 2 * n + 1
    return 7 * n + 1 + gov


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--results-dir", type=Path, default=RESULTS_DIR)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    # Load baseline
    baseline_result = load_hyperfine(args.results_dir / "e0_baseline.json")
    baseline = baseline_result["mean"] if baseline_result else 3.86

    # Collect data
    series = {
        "SAT": {"files": "e1_check_S{n}_sat.json", "color": "#2196F3", "marker": "o", "ls": "-"},
        "UNSAT": {"files": "e1_check_S{n}_unsat.json", "color": "#F44336", "marker": "s", "ls": "-"},
        "Generation": {"files": "e2_generate_S{n}_sat.json", "color": "#4CAF50", "marker": "^", "ls": "-"},
    }

    plt.rcParams.update({
        "font.family": "serif",
        "font.size": 9,
        "axes.labelsize": 10,
        "legend.fontsize": 8,
        "figure.dpi": 300,
    })

    fig, ax = plt.subplots(figsize=(3.5, 3.5))

    for label, cfg in series.items():
        nodes, means, stds = [], [], []
        for n in SCALE_POINTS:
            fname = cfg["files"].format(n=n)
            result = load_hyperfine(args.results_dir / fname)
            if result is None:
                continue
            corrected = result["mean"] - baseline
            corrected_std = result["stddev"]
            # Clamp negative corrected times to 0
            if corrected < 0:
                corrected = 0.0
            nodes.append(compute_nodes(n))
            means.append(corrected)
            stds.append(corrected_std)

        if not nodes:
            continue

        nodes_arr = np.array(nodes)
        means_arr = np.array(means)
        stds_arr = np.array(stds)

        ax.plot(nodes_arr, means_arr, marker=cfg["marker"], color=cfg["color"],
                label=label, linewidth=1.2, markersize=4, linestyle=cfg["ls"])
        ax.fill_between(nodes_arr, np.maximum(means_arr - stds_arr, 0),
                        means_arr + stds_arr, alpha=0.12, color=cfg["color"])

    ax.set_xlabel("Graph nodes ($|V|$)")
    ax.set_ylabel("Time (s), baseline-corrected")
    ax.legend(loc="upper left", framealpha=0.9)
    ax.grid(True, alpha=0.3)
    ax.set_xlim(left=0)
    ax.set_ylim(bottom=0)

    # Secondary x-axis: credential count
    ax2 = ax.twiny()
    cred_ticks = SCALE_POINTS
    node_ticks = [compute_nodes(n) for n in cred_ticks]
    ax2.set_xlim(ax.get_xlim())
    ax2.set_xticks(node_ticks)
    ax2.set_xticklabels([str(n) for n in cred_ticks], fontsize=8)
    ax2.set_xlabel("Credentials ($N$)", fontsize=9)

    fig.tight_layout()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(args.output, bbox_inches="tight")
    plt.close(fig)
    print(f"Saved {args.output}")


if __name__ == "__main__":
    main()
