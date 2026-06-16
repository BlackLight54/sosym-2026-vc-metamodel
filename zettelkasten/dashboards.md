# Dashboards

Live views over the base. Requires the Obsidian **Dataview** plugin; without it, these blocks
render as code and you can fall back to `index.md` and `check_links.sh`.

## Binding claims by delivery status

```dataview
TABLE status, maturity, file.link AS note
FROM "zettelkasten/claims"
WHERE type = "claim"
SORT status ASC, id ASC
```

## Seed worklist — what still needs distilling

```dataview
TABLE type, tags, file.link AS note
FROM "zettelkasten"
WHERE maturity = "seed"
SORT type ASC
```

## Sources with unresolved citekeys

```dataview
TABLE citekey, file.link AS note
FROM "zettelkasten/sources"
WHERE type = "source" AND (citekey = null OR citekey = "")
SORT id ASC
```

## Open questions

```dataview
TABLE tags, file.link AS note
FROM "zettelkasten/questions"
WHERE type = "question"
SORT id ASC
```

## Notes by topic tag (example: governance)

```dataview
LIST
FROM #topic/governance
SORT file.name ASC
```

## Orphan finder

Dataview cannot reliably detect MOC-reachability; run `./check_links.sh` for the authoritative
orphan and one-directional-link report.
