#!/usr/bin/env bash
# pre-push guard: run the tier-1 smoke test before a push leaves this repository.
#
# Contract (same as the superproject's harvest guard):
#  - WARN-ONLY. Always exits 0. A failing smoke must never block a push; the gate
#    is the human reading the verdict.
#  - Writes to stderr only, so it cannot corrupt git's stdout protocol.
#  - Silent when there is nothing to say.
#
# It lives here, not in the superproject, because model edits are committed and
# pushed from inside this repository — a hook in the parent never runs for them,
# and the parent sees only the submodule pointer, i.e. it would fire after the
# model changes had already shipped.
#
# Install (per clone). Resolve both paths with git: worktrees have a `.git` FILE,
# so a hardcoded `.git/hooks` destination silently does nothing.
#   ln -sf "$(git rev-parse --show-toplevel)/scripts/pre-push-smoke.sh" \
#          "$(git rev-parse --git-common-dir)/hooks/pre-push"
# Uninstall:
#   rm "$(git rev-parse --git-common-dir)/hooks/pre-push"
#
# Budget: smoke is six concurrent solver runs, ~7 s wall clock. Anything heavier
# does not belong in a push hook — use `just validate` for that.

set -u

root=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0
cd "$root" 2>/dev/null || exit 0

warn() { printf 'pre-push: %s\n' "$1" >&2; }

if ! command -v docker >/dev/null 2>&1; then
    warn "docker not available — smoke test skipped (push not blocked)."
    exit 0
fi

if ! docker image inspect ghcr.io/graphs4value/refinery-cli:latest >/dev/null 2>&1; then
    warn "refinery-cli image not present — smoke test skipped (push not blocked)."
    warn "  docker pull ghcr.io/graphs4value/refinery-cli:latest"
    exit 0
fi

if output=$(bash "$root/run_tests.sh" smoke 2>&1); then
    exit 0
fi

warn "SMOKE TEST FAILED — pushing anyway, but the model is not in a good state."
printf '%s\n' "$output" | sed 's/^/  /' >&2
warn "  reproduce with: just smoke"
exit 0
