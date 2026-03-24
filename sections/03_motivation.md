<!--
Section: Motivation
Budget: 1.0 page (~5 paragraphs)
Goal: Introduce both running examples, demonstrate the cross-layer problem, show why single-layer inspection fails. End with problem statement.
Dependencies: Section 02 (VCDM concepts, multi-level modeling, Refinery).
Note: The teaser figure (fig_teaser) is placed before the introduction in ACM sigconf. This section references it but does not carry the figure burden.
-->

# Motivation

<!-- M1: Diploma running example setup (vertical constraint) -->
<!-- Job: Introduce Example A — the simplest possible scenario that demonstrates format→claim dependency. -->
<!-- Key content: University issues diploma credential with GPA. Employer needs to verify GPA above threshold without learning exact value. Format choice (JSON-LD vs. AnonCreds) determines whether this privacy requirement can be satisfied. -->
<!-- Key claim: The format-specific layer constrains what is achievable at the claim property layer. -->

%% @TODO: Draft — Diploma scenario. Student GPA credential. JSON-LD discloses exact value; AnonCreds supports ZKP range proof. If a governance framework requires privacy-preserving verification but the credential format is JSON-LD, the design has a cross-layer inconsistency — invisible when inspecting any single layer. %%

<!-- M2: Alice running example setup (horizontal constraint) -->
<!-- Job: Introduce Example B — cross-credential entity alignment spanning layers. -->
<!-- Key content: Alice owns a property and has an identity document. Two credentials (property_sheet, id_card) share the same subject (Alice) at the claim property layer, but at the credential schema layer each credential has its own CredentialSubject entity. The alignment constraint — that both credential subjects trace to the same claim-layer entity — spans the claim→credential layer boundary. -->
<!-- Key claim: Cross-credential entity alignment is a constraint that spans layers. -->

%% @TODO: Draft — Alice scenario. Two credentials, shared subject. Entity alignment constraint spans claim→credential boundary. Reference teaser figure (right panel). %%

<!-- M3: Why single-layer inspection fails -->
<!-- Job: Walk through both examples showing that each layer is consistent in isolation but cross-layer constraints are violated. -->
<!-- Key content for Diploma: Claim layer sees a valid claim (has_gpa). Format layer sees a valid format (JSON-LD). But the cross-layer requirement (ZKP for GPA threshold) is violated. -->
<!-- Key content for Alice: Claim layer is connected. Each credential schema is well-formed. But the trace from credential subject to claim entity can be incorrect (a_Alice1 traces to plot_num_387 instead of Alice), and this error is invisible to single-layer inspection. -->

%% @TODO: Draft — single-layer inspection passes in both cases. Cross-layer errors only visible when layers are checked together. %%

<!-- M4: Governance framework complication -->
<!-- Job: Show that constraints come from multiple, potentially conflicting governance sources. -->
<!-- Key content: W3C VCDM defines structural constraints. EU eIDAS/ARF imposes format and disclosure constraints. Community guidelines (e.g., AnonCreds best practices) add further requirements. These sources were not designed to be jointly satisfied — formal consistency is not guaranteed. -->

%% @CITE: W3C VCDM 2.0 — structural constraints %%
%% @CITE: eIDAS 2.0 / ARF — format and disclosure constraints %%
%% @CITE: AnonCreds community guidelines %%

%% @TODO: Draft — multiple governance sources, not designed for joint satisfaction. Formal consistency not guaranteed. %%

<!-- M5: Problem statement -->
<!-- Job: State the problem that the rest of the paper addresses. End the section. -->
<!-- Key claim: Credential ecosystem design requires a formal framework for simultaneous multi-layer, multi-source constraint satisfaction. No existing approach provides this. -->
<!-- Note: This is where Sec 03 ends. The solution comes in Sec 04. Do NOT preview the solution here. -->

%% @CITE: gap claim — verify no existing multi-level framework for VC ecosystems %%

%% @TODO: Draft — problem statement. Need formal framework for multi-layer, multi-source constraint satisfaction in VC ecosystems. %%
