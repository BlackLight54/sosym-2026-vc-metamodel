---
name: "Competing peer requirements framing"
description: "VC ecosystems have competing peer stakeholder requirements, not hierarchical ones like automotive — stakeholder goals may be irreconcilable"
type: project
status: active
date: "2026-03-25"
source: "Oszkár (meeting 2026-03-25 18:30)"
affects: ["Sec 01 motivation", "Sec 03.1", "Sec 05.1.3 conflict analysis"]
revisit_when: "if framing shifts to cooperative stakeholder model"
---

Unlike hierarchical requirement systems (e.g., automotive design where tier-1 decomposes to tier-2), verifiable credential ecosystems have competing, peer-level requirements from non-cooperating stakeholders. Stakeholder goals cannot necessarily be brought together into a coherent whole.

**Rationale (Oszkár's words):** "Hierarchikus követelményrendszer, mint az autótervezés helyett itt egymással versengő, Peer követelményeink vannak. A stakeholderek nem működnek feltétlenül együtt. Ha az összes stakeholdernek a céljai nem feltétlenül hozhatók egy koherens egésszé össze."

This motivates the formal contradiction result: eIDAS and GDPR impose constraints that are individually valid but jointly unsatisfiable for certain credential designs. The metamodel must handle this — not assume requirements can be reconciled.

**Status in prose:** Incorporated into Sec 03.1 motivation (eIDAS vs. GDPR as competing governance) and Sec 05.1.3 conflict analysis.
