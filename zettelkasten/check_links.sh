#!/usr/bin/env bash
# check_links.sh — integrity checks for the Zettelkasten.
# Validates [[wikilink]] targets, flags orphans (notes not reachable from a MOC),
# flags one-directional `related` links, checks tags against tags.md, prints a maturity summary.
# Exit 1 if any hard error (dangling link, orphan, unknown tag) is found.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

python3 - <<'PY'
import os, re, sys, glob

ROOT = "."
WIKILINK = re.compile(r"\[\[([^\]|#]+)")
INFRA = {"README", "index", "tags", "dashboards", "glossary", "INGESTION", "check_links", "_citekey-map"}

def stem(path): return os.path.splitext(os.path.basename(path))[0]

# Scan only real notes plus index/glossary. Infra docs (README, tags, dashboards,
# INGESTION) and templates/ contain illustrative [[links]] and are excluded.
NOTE_DIRS = ("concepts", "claims", "sources", "decisions", "questions", "artifacts", "moc")
files = []
for d in NOTE_DIRS:
    files += glob.glob(f"{d}/*.md")
for extra in ("index.md", "glossary.md"):
    if os.path.exists(extra): files.append(extra)
stems = {stem(f) for f in files}
# Infra docs are valid link targets but are not scanned (they hold illustrative [[links]]).
stems |= {"README", "tags", "dashboards", "INGESTION", "index", "glossary"}

def frontmatter(text):
    if not text.startswith("---"): return {}
    end = text.find("\n---", 3)
    if end == -1: return {}
    fm = {}
    for line in text[3:end].splitlines():
        m = re.match(r"^(\w+):\s*(.*)$", line)
        if m: fm[m.group(1)] = m.group(2).strip()
    return fm

# Load allowed tags from tags.md
allowed = set()
if os.path.exists("tags.md"):
    for m in re.finditer(r"`([a-z]+/[a-z]+|metamodel)`", open("tags.md").read()):
        allowed.add(m.group(1))

errors, warnings = [], []
maturity = {}
related = {}   # stem -> set of related stems
moc_targets = set()

for f in files:
    text = open(f, encoding="utf-8").read()
    fm = frontmatter(text)
    s = stem(f)
    maturity[fm.get("maturity", "—")] = maturity.get(fm.get("maturity", "—"), 0) + 1

    # dangling links
    for link in WIKILINK.findall(text):
        link = link.strip()
        if link not in stems:
            errors.append(f"DANGLING  {f}: [[{link}]] -> no such note")

    # tags
    tagfield = fm.get("tags", "")
    for t in re.findall(r"[a-z]+/[a-z]+|metamodel", tagfield):
        if t not in allowed:
            errors.append(f"BAD-TAG   {f}: tag '{t}' not in tags.md")

    # related (from frontmatter line)
    rel = set(x.strip() for x in WIKILINK.findall(fm.get("related", "")))
    related[s] = rel

    # MOC reachability source
    if f.startswith("moc/") or s == "index":
        moc_targets.update(WIKILINK.findall(text))

# orphans: every non-infra, non-moc note must be linked from a MOC or index
for f in files:
    s = stem(f)
    if s in INFRA or f.startswith("moc/"):
        continue
    if s not in {t.strip() for t in moc_targets}:
        errors.append(f"ORPHAN    {f}: not referenced by any MOC or index")

# one-directional related (warning): skip if either endpoint is a MOC note
moc_stems = {stem(f) for f in files if f.startswith("moc/")}
for a, rels in related.items():
    for b in rels:
        if a in moc_stems or b in moc_stems: continue
        if b in related and a not in related[b]:
            warnings.append(f"ONE-WAY   {a}  ->  {b}  (no reciprocal `related`)")

verbose = "-v" in sys.argv
print(f"Notes scanned: {len(files)}")
print("Maturity:", ", ".join(f"{k}={v}" for k, v in sorted(maturity.items())))
print()
# One-directional `related` links are expected in a Zettelkasten (hub and concept->source
# links are naturally asymmetric); summarize by default, list with -v.
if warnings:
    print(f"{len(warnings)} one-directional `related` link(s) (expected; run with -v to list).")
    if verbose:
        for w in warnings: print("  ", w)
print()
if errors:
    for e in errors: print("ERROR", e)
    print(f"\n{len(errors)} error(s), {len(warnings)} warning(s).")
    sys.exit(1)
print(f"OK — 0 errors, {len(warnings)} warning(s).")
PY
