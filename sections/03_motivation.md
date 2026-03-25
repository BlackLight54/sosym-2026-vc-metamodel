<!--
Section: Motivation
Budget: 1.0 page (~5 paragraphs)
Goal: Introduce the CSOK running example, demonstrate the cross-layer problem, show why single-layer inspection fails. End with problem statement.
Dependencies: Section 02 (VCDM concepts, multi-level modeling, Refinery).
Note: The teaser figure (fig_teaser) is placed before the introduction in ACM sigconf. This section references it but does not carry the figure burden.
-->

# Motivation

<!-- M1: Housing subsidy scenario setup -->
<!-- Job: Introduce the running example — a real-world multi-issuer credential scenario that exercises all three layers. -->
<!-- Key content: Government housing subsidy, 3 issuers, cross-credential dependency, privacy-sensitive income check, EU regulatory context. -->
<!-- Key claim: Real credential ecosystems involve constraints from multiple governance sources spanning multiple abstraction layers. -->

Consider a government housing subsidy where eligibility requires credentials from three independent authorities: family status from a civil registry, property records from a land registry, and income from an employer.^[Based on the Hungarian Family Housing Subsidy (Családi Otthonteremtési Kedvezmény, CSOK), simplified. Additional credentials required in practice — tax clearance, criminal record check — are omitted.] The required property size depends on the number of children — a constraint that spans two credentials — and the income check must satisfy both EU format mandates and data protection requirements.

%% @CITE: 518/2023. (XI. 30.) Korm. rendelet §9 — CSOK floor area requirements by number of children %%

<!-- M2: Cross-layer constraints in the scenario -->
<!-- Job: Walk through the scenario showing constraints at each layer and across layers. -->
<!-- Key content: CPL has cross-property constraint (floor area depends on children). CSL has entity alignment (same Applicant across 3 credentials). FSL has governance conflict (eIDAS vs. GDPR on income credential). -->

At the claim property layer, the applicant's facts — number of children, property floor area, monthly income — form an information graph with domain-level constraints: the minimum floor area is a function of the number of children %% @CITE: 518/2023 Korm. rendelet §9 %%, and income must exceed a regulatory threshold. At the credential schema layer, these facts are distributed across three credentials issued by independent authorities, each with its own credential subject. All three subjects must be aligned — they refer to the same applicant — and each claim must trace to the corresponding domain-level property. At the format-specific layer, EU regulations mandate specific credential formats for government-issued attestations %% @CITE: eIDAS 2.0 ARF — SD-JWT-VC/mdoc mandate %%, while data protection law requires that privacy-sensitive checks — such as whether income exceeds a threshold — disclose only the minimum necessary information %% @CITE: GDPR Art. 5(1)(c), NAIH enforcement precedent %%.

<!-- M3: Why single-layer inspection fails -->
<!-- Job: Show that each layer is consistent in isolation but cross-layer constraints are violated. -->

%% @TODO: Draft — single-layer inspection passes at each layer. Cross-layer analysis reveals two distinct problems: (1) the income credential's format cannot simultaneously satisfy eIDAS format mandates and GDPR data minimization — SD-JWT-VC lacks predicate proofs, AnonCreds lacks VCDM conformance; (2) the floor area constraint requires cross-credential predicate evaluation, which no deployed format supports in zero-knowledge. Both problems are invisible when any single layer is inspected alone. %%

<!-- M4: Governance framework complication -->
<!-- Job: Show that constraints come from multiple, potentially conflicting governance sources. -->

%% @CITE: W3C VCDM 2.0 — structural constraints (credentialSubject, proof types) %%
%% @CITE: eIDAS 2.0 ARF — format mandate (SD-JWT-VC, mdoc) %%
%% @CITE: GDPR Art. 5(1)(c) — data minimization %%
%% @CITE: AnonCreds specification — CL-signature predicate proofs %%
%% @CITE: SD-JWT-VC — IETF draft, hash-based selective disclosure %%

%% @TODO: Draft — The constraints originate from governance frameworks that were not designed to be jointly satisfied: W3C VCDM defines structural conformance, eIDAS mandates credential formats, GDPR requires data minimization, and format-specific capabilities (predicate proofs, selective disclosure) vary across implementations. No existing tool or methodology checks whether these constraints can be simultaneously satisfied for a given credential ecosystem design. %%

<!-- M5: Problem statement -->
<!-- Job: State the problem that the rest of the paper addresses. End the section. -->
<!-- Key claim: Credential ecosystem design requires a formal framework for simultaneous multi-layer, multi-source constraint satisfaction. No existing approach provides this. -->
<!-- Note: This is where Sec 03 ends. The solution comes in Sec 04. Do NOT preview the solution here. -->

%% @CITE: gap claim — no existing multi-level framework for VC ecosystems (confirmed by gap analysis 2026-03-25) %%

%% @TODO: Draft — Credential ecosystem design requires a formal framework that captures constraints at multiple abstraction layers and from multiple governance sources, enabling designers to determine whether a given configuration is jointly satisfiable. No existing approach provides this capability. %%
