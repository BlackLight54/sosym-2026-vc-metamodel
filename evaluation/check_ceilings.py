#!/usr/bin/env python3
"""Wall-clock ceiling gate for tier 3.

Reads the Hyperfine JSON in results/ and fails if any benchmark's mean exceeds
CEILING_SECONDS. The gate is deliberately blunt: an absolute ceiling catches a
solver blowup and nothing subtler. A ratio-against-baseline gate would be more
sensitive but needs a stored baseline per machine, and these runs happen on at
least two (WSL2 and native Windows).

CEILING_SECONDS default: 60. Calibrated 2026-08-05 against a `perf quick` run on
a Ryzen 9 7950X3D under WSL2: ten benchmarks, slowest `generate_S30_sat` at
5.51 s +/- 0.13 s against a 4.1 s container-startup baseline. The ceiling sits
about an order of magnitude above that, so ordinary machine-to-machine variation
never trips it while a runaway solver still does. Override for slower hardware:

    CEILING_SECONDS=120 just perf
"""

import json
import os
import sys
from pathlib import Path

RESULTS_DIR = Path(__file__).parent / "results"
CEILING = float(os.environ.get("CEILING_SECONDS", "60"))


def main() -> int:
    files = sorted(RESULTS_DIR.glob("*.json"))
    files = [f for f in files if f.name != "environment.json"]
    if not files:
        print(f"No result JSON in {RESULTS_DIR}/ — run a perf tier first.")
        return 1

    breaches = []
    slowest = ("", 0.0)
    for path in files:
        data = json.loads(path.read_text(encoding="utf-8"))
        for result in data.get("results", []):
            name = result.get("command_name") or result.get("command", path.stem)
            mean = float(result["mean"])
            if mean > slowest[1]:
                slowest = (name, mean)
            if mean > CEILING:
                breaches.append((name, mean))

    print(f"Ceiling: {CEILING:.1f}s — {len(files)} result file(s) checked")
    print(f"Slowest: {slowest[0]} at {slowest[1]:.2f}s")

    if breaches:
        print(f"\nFAIL: {len(breaches)} benchmark(s) over the ceiling")
        for name, mean in sorted(breaches, key=lambda b: -b[1]):
            print(f"  {name}: {mean:.2f}s")
        return 1

    print("PASS: no benchmark over the ceiling")
    return 0


if __name__ == "__main__":
    sys.exit(main())
