---
name: "No MDA terminology"
description: "Do not use CIM/PIM/PSM or Model-Driven Architecture terminology — hard constraint from advisor"
type: project
date: 2026-03-24
status: active
affects: "All section files, Sec 02.2, approach subsection titles, CLAUDE.md thesis"
revisit_when: "Never — hard constraint from advisor"
tags: terminology, advisor
---

**Decision:** Do not use MDA-specific terminology (CIM, PIM, PSM, Model-Driven Architecture). Use "multi-level metamodeling" framing.
**Rationale:** Advisor's direction. MDA is OMG-branded from 2001; MODELS community has moved beyond strict MDA. Using CIM/PIM/PSM invites reviewer objections.
**Why:** Avoid tying contribution to outdated framework.
**How to apply:** Any reference to MDA terms must be replaced with multi-level metamodeling equivalents. Layer names: DCL, CSL, FSL.