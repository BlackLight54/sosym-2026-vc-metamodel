# Guides

Precision reference files for technical domains. Each guide is a folder with a `SKILL.md` entry point.

```
guides/
├── README.md
├── reviewer_archetypes/
│   └── SKILL.md          ← the four reviewer archetypes (champion, mathematician, business manager, adversarial)
├── running_example/
│   └── SKILL.md
└── [domain_name]/
    ├── SKILL.md          ← entry point
    └── [supporting files]
```

## Built-in guides

| Guide | Purpose |
|-------|---------|
| `reviewer_archetypes` | Four reusable reviewer archetypes that `skills/reviewer_personas` instantiates per paper |
| `running_example` | How to design, introduce, and thread a running example through a formal methods paper |

## Naming

Name folders after the domain: `formal_verification/`, `ssi_credential_stack/`, `process_modeling/`. Tool-specific: `formal_verification_tamarin/`.

## When to create a guide

- The paper uses a formalism or domain where imprecise terminology could damage the argument.
- Claude encounters terminology it can reason about generally but not at the required precision.
- The paper makes distinctions that are non-obvious or easily confused.

## SKILL.md format

- **Purpose** — one line.
- **Terminology** — precise definitions. Note divergences from common usage.
- **Key distinctions** — what must not be conflated. What breaks if confused.
- **Modeling conventions** — conventions this project follows.
- **Common pitfalls** — mistakes Claude is likely to make.

## What a guide should not contain

- Tutorial-level exposition.
- Paper-specific claims (section files handle that).
- Full tool documentation (link instead).
