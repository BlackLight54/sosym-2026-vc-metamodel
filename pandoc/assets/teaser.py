#!/usr/bin/env python3
"""Generate the MODELS 2026 teaser figure SVG — v12b-style.

Matches the hand-tuned v12b layout:
  - Compact DCL (h=72) with elbowed bus-bar connectors
  - Compact CSL (h=72)
  - Expanded FSL (h=160) with room for constraint annotation cards
  - Individual "CX: desc / detail" annotation cards, color-coded by source
  - Columns shifted inward for better centering
"""

import argparse, sys

# ── Dimensions ────────────────────────────────────────────────────

W, H = 1300, 460

# Panels — more space between them
PNL_GAP = 10                                 # gap between panels
IN_X, IN_W   = 6, 180
MD_X, MD_W   = IN_X + IN_W + PNL_GAP + 30, 730   # 226
RS_X, RS_W   = MD_X + MD_W + PNL_GAP + 30, 268   # 996
PNL_Y, PNL_H = 6, H - 12                         # 448

# Header area
HDR_H = 30                                  # space for "INPUT" / "MODEL" / "RESULT" headers
CONTENT_Y = PNL_Y + HDR_H + 4               # usable content starts here (40)
CONTENT_H = PNL_H - HDR_H - 10              # usable content height (~408)

# Columns (credential X-centers — centered within model frame)
C1 = MD_X + 174;  C2 = MD_X + 364;  C3 = MD_X + 554
APP_CX = (C1 + C2) // 2

# Model band positions — vertically balanced (≈1 : 1 : 1.3), centered in content area
DCL_H, CSL_H, FSL_H = 100, 100, 130
GAP = 22                                     # uniform gap between bands
TOTAL_MODEL_H = DCL_H + GAP + CSL_H + GAP + FSL_H   # 374
MODEL_TOP = CONTENT_Y + (CONTENT_H - TOTAL_MODEL_H) // 2  # centered
DCL_Y = MODEL_TOP
CSL_Y = DCL_Y + DCL_H + GAP
FSL_Y = CSL_Y + CSL_H + GAP

# Result/input card alignment — with margin from panel border
CARD_PAD = 10                                # padding inside panel border
CARD1_Y = CONTENT_Y + CARD_PAD
CARD1_H = (CONTENT_H - 3 * CARD_PAD) * 36 // 100    # ~36% for metamodel
CARD2_Y = CARD1_Y + CARD1_H + CARD_PAD
CARD2_H = (CONTENT_H - 3 * CARD_PAD) * 30 // 100    # ~30% for scenario
CARD3_Y = CARD2_Y + CARD2_H + CARD_PAD
CARD3_H = CONTENT_Y + CONTENT_H - CARD3_Y - CARD_PAD  # remainder for governance

# ── Colors ────────────────────────────────────────────────────────

BG      = "#f1f3f5"
BDR     = "#adb5bd"
GRAY    = "#868e96"
DARK    = "#343a40"
LTGRAY  = "#dee2e6"
WHITE   = "white"

BLUE    = "#4c6ef5";  BLUE_LT = "#dbe4ff";  BLUE_DK = "#1c3d8f"
TEAL    = "#0b7285";  TEAL_LT = "#c3fae8";  TEAL_ST = "#20c997"; TEAL_BD = "#66d9a8"
AMBER   = "#e8890c";  AMBR_LT = "#fff3bf";  AMBR_ST = "#fab005"; AMBR_DK = "#795508"; AMBR_BD = "#fcc419"
RED     = "#e03131";  RED_DK  = "#c92a2a";  RED_LT  = "#ffc9c9"
GREEN   = "#2b8a3e";  GRN_LT  = "#d3f9d8"
PURPLE  = "#7048e8"
ORANGE  = "#e8590c"
BLU_GOV = "#1c7ed6"

FONT = "system-ui, -apple-system, 'Segoe UI', sans-serif"


# ── SVG builder (minimal) ─────────────────────────────────────────

class S:
    """Tiny SVG builder — just string accumulation."""
    def __init__(self): self.p = []
    def _(self, s):     self.p.append(s); return self

    def rect(s, x, y, w, h, rx=5, f=WHITE, st=BDR, sw=.8, fo=None, da=None):
        a = f'x="{x}" y="{y}" width="{w}" height="{h}" rx="{rx}" fill="{f}" stroke="{st}" stroke-width="{sw}"'
        if fo: a += f' fill-opacity="{fo}"'
        if da: a += f' stroke-dasharray="{da}"'
        return s._(f'<rect {a}/>')

    def text(s, x, y, t, sz=8, f="#495057", a="start", w=None, st=None, sp=None):
        at = f'x="{x}" y="{y}" font-size="{sz}" fill="{f}"'
        if a != "start": at += f' text-anchor="{a}"'
        if w:  at += f' font-weight="{w}"'
        if st: at += f' font-style="{st}"'
        if sp: at += f' letter-spacing="{sp}"'
        return s._(f'<text {at}>{t}</text>')

    def line(s, x1, y1, x2, y2, st="#495057", sw=1, da=None, me=None, op=None):
        a = f'x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" stroke="{st}" stroke-width="{sw}"'
        if da: a += f' stroke-dasharray="{da}"'
        if me: a += f' marker-end="url(#{me})"'
        if op: a += f' opacity="{op}"'
        return s._(f'<line {a}/>')

    def path(s, d, f="none", st="#495057", sw=1, da=None):
        a = f'd="{d}" fill="{f}" stroke="{st}" stroke-width="{sw}"'
        if da: a += f' stroke-dasharray="{da}"'
        return s._(f'<path {a}/>')

    def circle(s, cx, cy, r, f="white", st=BDR, sw=1, fo=None):
        a = f'cx="{cx}" cy="{cy}" r="{r}" fill="{f}" stroke="{st}" stroke-width="{sw}"'
        if fo: a += f' fill-opacity="{fo}"'
        return s._(f'<circle {a}/>')

    def badge(s, x, y, w, label, f=BG, st="#ced4da", tf="#495057", tw=None, h=14, tsz=6.5, fo=None):
        s.rect(x, y, w, h, rx=3, f=f, st=st, sw=.5, fo=fo)
        a = f' font-weight="{tw}"' if tw else ""
        return s._(f'<text x="{x+w/2}" y="{y+h*.72}" text-anchor="middle" font-size="{tsz}" fill="{tf}"{a}>{label}</text>')

    def sq(s, x, y, ch, col, sz=18):
        """Square icon (M, S, G)."""
        s.rect(x, y, sz, sz, rx=3, f=col, st=col, sw=1.2, fo=".15")
        return s.text(x+sz/2, y+sz*.72, ch, sz=9, f=col, a="middle", w="bold")

    def ccard(s, x, y, cid, color, title, detail, w=80, h=24):
        """Constraint annotation card: 'CX: title' + gray detail."""
        s.rect(x, y, w, h, rx=3, f=WHITE, st=color, sw=.7, fo=".95")
        s.text(x+6, y+10, f"{cid}:", sz=6, f=color, w="700")
        s.text(x+6+len(cid)*5+4, y+10, title, sz=5.5, f="#495057")
        return s.text(x+6, y+19, detail, sz=4.5, f=GRAY)

    def render(s): return '\n'.join(s.p)


# ── Defs ──────────────────────────────────────────────────────────

def defs(s):
    s._(f'''<defs>
<marker id="a" viewBox="0 0 10 7" refX="9" refY="3.5" markerWidth="8" markerHeight="6" orient="auto"><path d="M0 0L10 3.5 0 7z" fill="#495057"/></marker>
<marker id="ab" viewBox="0 0 10 7" refX="9" refY="3.5" markerWidth="7" markerHeight="5" orient="auto"><path d="M0 0L10 3.5 0 7z" fill="#5c7cfa"/></marker>
<marker id="ao" viewBox="0 0 10 7" refX="9" refY="3.5" markerWidth="7" markerHeight="5" orient="auto"><path d="M0 0L10 3.5 0 7z" fill="{AMBER}"/></marker>
<marker id="abig" viewBox="0 0 14 10" refX="13" refY="5" markerWidth="11" markerHeight="8" orient="auto"><path d="M0 0L14 5 0 10z" fill="{GRAY}"/></marker>
<pattern id="hatch" patternUnits="userSpaceOnUse" width="6" height="6" patternTransform="rotate(45)"><line x1="0" y1="0" x2="0" y2="6" stroke="{RED}" stroke-width=".7" opacity=".25"/></pattern>
</defs>''')


# ── Input panel ───────────────────────────────────────────────────

def input_panel(s):
    s._('<!-- INPUT PANEL -->')
    s.rect(IN_X, PNL_Y, IN_W, PNL_H, rx=8, f=BG, st="#ced4da", sw=1.2)
    s.text(IN_X+IN_W/2, PNL_Y+20, "INPUT", sz=12, f="#495057", a="middle", w="bold", sp="1.5")
    hdr_line_y = PNL_Y + HDR_H
    s.line(IN_X+12, hdr_line_y, IN_X+IN_W-12, hdr_line_y, st=LTGRAY, sw=.8)

    cx, cw = IN_X+12, IN_W-24

    # Card 1: METAMODEL
    s.rect(cx, CARD1_Y, cw, CARD1_H, rx=5)
    s.sq(cx+4, CARD1_Y+8, "M", BLUE)
    s.text(cx+30, CARD1_Y+21, "METAMODEL", sz=11, f=DARK, w="bold")
    s.badge(cx+4, CARD1_Y+32, 46, "DCL", f=BLUE_LT, st=BLUE, tf=BLUE, tw="600")
    s.badge(cx+54, CARD1_Y+32, 46, "CSL", f=TEAL_LT, st=TEAL_ST, tf=TEAL, tw="600")
    s.badge(cx+104, CARD1_Y+32, 46, "FSL", f=AMBR_LT, st=AMBR_ST, tf=AMBER, tw="600")
    s.badge(cx+4, CARD1_Y+54, 68, "Predicates C1–C9")
    s.badge(cx+76, CARD1_Y+54, 76, "Traces + format[1]")
    s.badge(cx+4, CARD1_Y+76, cw-8, "Cross-layer graph predicates")

    # Card 2: SCENARIO
    s.rect(cx, CARD2_Y, cw, CARD2_H, rx=5)
    s.sq(cx+4, CARD2_Y+8, "S", TEAL)
    s.text(cx+30, CARD2_Y+21, "SCENARIO", sz=11, f=DARK, w="bold")
    s.badge(cx+4, CARD2_Y+34, cw-8, "Housing subsidy (CSOK)", f=TEAL_LT, st=TEAL_ST, tf=TEAL)
    s.badge(cx+4, CARD2_Y+56, 68, "3 credentials", f=TEAL_LT, st=TEAL_ST, tf=TEAL)
    s.badge(cx+76, CARD2_Y+56, 72, "3 ind. issuers", f=TEAL_LT, st=TEAL_ST, tf=TEAL)
    s.badge(cx+4, CARD2_Y+76, cw-8, "Cross-credential deps.", f=TEAL_LT, st=TEAL_ST, tf=TEAL)
    s.badge(cx+4, CARD2_Y+94, 90, "Value constraints", f=TEAL_LT, st=TEAL_ST, tf=TEAL)

    # Card 3: GOVERNANCE CONSTRAINTS
    s.rect(cx, CARD3_Y, cw, CARD3_H, rx=5)
    s.sq(cx+4, CARD3_Y+8, "G", PURPLE)
    s.text(cx+30, CARD3_Y+17, "GOVERNANCE", sz=9.5, f=DARK, w="bold")
    s.text(cx+30, CARD3_Y+28, "CONSTRAINTS", sz=9.5, f=DARK, w="bold")
    s.badge(cx+4, CARD3_Y+34, 68, "eIDAS ARF", f=ORANGE, st=ORANGE, tf=ORANGE, tw="600", fo=".1")
    s.badge(cx+76, CARD3_Y+34, 72, "GDPR 5(1)(c)", f=PURPLE, st=PURPLE, tf=PURPLE, tw="600", fo=".1")
    s.badge(cx+4, CARD3_Y+56, 72, "W3C VCDM 2.0", f=BLU_GOV, st=BLU_GOV, tf=BLU_GOV, tw="600", fo=".1")
    s.badge(cx+4, CARD3_Y+82, 68, "Format mandates")
    s.badge(cx+76, CARD3_Y+82, 72, "Privacy reqs.")
    s.badge(cx+4, CARD3_Y+104, cw-8, "Data model conformance")


# ── DCL — compact, elbowed tree ───────────────────────────────────

def dcl(s):
    s._('\n<!-- DCL -->')
    bx = MD_X+10; bw = MD_W-20
    s.rect(bx, DCL_Y, bw, DCL_H, f=BLUE_LT, st="#8da0cb", sw=1.2, fo=".3")
    s.rect(bx+6, DCL_Y+6, 36, 18, rx=3, f=BLUE, sw=0, fo=".15")
    s.text(bx+24, DCL_Y+18, "DCL", sz=10, f=BLUE, a="middle", w="bold")

    # Applicant — positioned between C1 and C2
    aw, ah = 80, 26
    ay = DCL_Y + 4
    s.rect(APP_CX-aw/2, ay, aw, ah, rx=6, f=BLUE_LT, st=BLUE, sw=1.5, fo=".85")
    s.text(APP_CX, ay+12, "Applicant", sz=9, f=BLUE_DK, a="middle", w="600")
    s.text(APP_CX, ay+21, "Subject", sz=5.5, f="#748ffc", a="middle", st="italic")

    # Elbow: trunk → bar → drops
    trunk_bot = ay + ah
    bar_y     = trunk_bot + 8
    drop_end  = bar_y + 10
    s.line(APP_CX, trunk_bot, APP_CX, bar_y, sw=1)
    s.line(C1, bar_y, C3, bar_y, sw=1)
    for cx in (C1, C2, C3):
        s.line(cx, bar_y, cx, drop_end, sw=1, me="a")

    # Edge labels on horizontal bar segments
    s.text((C1+APP_CX)/2, bar_y-3, "has_children", sz=5.5, a="middle")
    s.text((APP_CX+C2)/2, bar_y-3, "owns_property", sz=5.5, a="middle")
    s.text((C2+C3)/2, bar_y-3, "earns", sz=5.5, a="middle")

    # Value nodes
    val_y = drop_end + 2
    for cx, label, vw in [(C1, "num_children", 88), (C2, "property_area", 88), (C3, "monthly_income", 96)]:
        s.rect(cx-vw/2, val_y, vw, 20, rx=4, f=BLUE_LT, st=BLUE, sw=1, fo=".85")
        s.text(cx, val_y+12, label, sz=7.5, f=BLUE_DK, a="middle")

    # C4 arc + card — crosses DCL bottom boundary into gap
    arc_y = DCL_Y + DCL_H - 6
    arc_peak = DCL_Y + DCL_H + 12
    s.path(f"M{C1+30} {arc_y}Q{(C1+C2)/2} {arc_peak} {C2-30} {arc_y}",
           st=BLUE, sw=1, da="3,2")
    s.ccard((C1+C2)/2-40, DCL_Y+DCL_H+2, "C4", BLUE, "area ≥ f(children)", "cross-cred value dep.")


# ── Constraints C1, C2, C4 (between DCL and CSL) ─────────────────

def constraints_dcl_csl(s):
    s._('\n<!-- C1, C2 constraint cards (DCL↔CSL gap) -->')
    dcl_bot = DCL_Y + DCL_H  # 128

    # C1 + C2 combined card
    ann_x = MD_X + 19
    s.rect(ann_x, dcl_bot+2, 108, 26, rx=3, f=WHITE, st="#5c7cfa", sw=.7, fo=".95")
    s.text(ann_x+6, dcl_bot+12, "C1:", sz=5.5, f="#5c7cfa", w="700")
    s.text(ann_x+22, dcl_bot+12, "entity alignment", sz=5, f="#495057")
    s.text(ann_x+6, dcl_bot+22, "C2:", sz=5.5, f="#5c7cfa", w="700")
    s.text(ann_x+22, dcl_bot+22, "trace consistency", sz=5, f="#495057")

    # Trace arrows DCL → CSL
    for cx in (C1, C2, C3):
        s.line(cx, dcl_bot, cx, CSL_Y, st="#5c7cfa", sw=1.5, da="4,3", me="ab", op=".6")

    # Alignment line
    s.line(C1-20, dcl_bot+15, C3+36, dcl_bot+15, st="#5c7cfa", sw=.6, da="2,3", op=".25")


# ── CSL ───────────────────────────────────────────────────────────

def csl(s):
    s._('\n<!-- CSL -->')
    bx = MD_X+10; bw = MD_W-20
    s.rect(bx, CSL_Y, bw, CSL_H, f=TEAL_LT, st=TEAL_BD, sw=1.2, fo=".3")
    s.rect(bx+6, CSL_Y+6, 34, 18, rx=3, f=TEAL_ST, sw=0, fo=".15")
    s.text(bx+23, CSL_Y+18, "CSL", sz=10, f=TEAL, a="middle", w="bold")

    creds = [
        (C1, "FamilyStatusCred", "Civil registry", "CS_App₁", "num_ch₁"),
        (C2, "PropertyCred",     "Land registry",  "CS_App₂", "prop_a₁"),
        (C3, "IncomeCred",       "Employer",       "CS_App₃", "mon_inc₁"),
    ]
    cw, ch = 140, 56
    for cx, name, issuer, subj, val in creds:
        x = cx - cw/2
        y = CSL_Y + 6
        s.rect(x, y, cw, ch, rx=5, f=TEAL_LT, st=TEAL_ST, sw=1, fo=".15", da="5,3")
        s.text(cx, y+11, name, sz=7.5, f=TEAL, a="middle", w="600")
        s.text(cx, y+20, issuer, sz=5.5, f=GRAY, a="middle", st="italic")
        # Subject → Value
        nw = 52
        s.rect(x+8, y+26, nw, 14, rx=3, f=TEAL_LT, st=TEAL_ST, sw=.8, fo=".8")
        s.text(x+8+nw/2, y+36, subj, sz=5.5, f=TEAL, a="middle")
        s.line(x+8+nw, y+33, x+8+nw+12, y+33, sw=.6, me="a")
        s.rect(x+8+nw+14, y+26, nw, 14, rx=3, f=TEAL_LT, st=TEAL_ST, sw=.8, fo=".8")
        s.text(x+8+nw+14+nw/2, y+36, val, sz=5.5, f=TEAL, a="middle")
        s.text(cx, CSL_Y+CSL_H-9, "C3 ✓", sz=5.5, f=TEAL_ST, a="middle", st="italic")


# ── CSL → FSL traces ──────────────────────────────────────────────

def csl_fsl_traces(s):
    s._('\n<!-- CSL → FSL format[1] traces -->')
    top = CSL_Y + CSL_H
    bot = FSL_Y
    for i, cx in enumerate((C1, C2, C3)):
        is_inc = (i == 2)
        s.line(cx, top, cx, bot, st=AMBER, sw=1.5, da="4,3", me="ao", op=".6")
        pw = 48
        py = (top + bot) / 2 - 5
        pill_st = RED if is_inc else AMBER
        pill_tf = RED if is_inc else AMBER
        s.rect(cx-pw/2, py, pw, 10, rx=5, f=WHITE, st=pill_st, sw=.6 if not is_inc else .7)
        s.text(cx, py+8, "format[1]", sz=5, f=pill_tf, a="middle", w="600")


# ── FSL ───────────────────────────────────────────────────────────

def fsl(s):
    s._('\n<!-- FSL -->')
    bx = MD_X+10; bw = MD_W-20
    s.rect(bx, FSL_Y, bw, FSL_H, f=AMBR_LT, st=AMBR_BD, sw=1.2, fo=".3")
    s.rect(bx+6, FSL_Y+6, 32, 18, rx=3, f=AMBR_ST, sw=0, fo=".15")
    s.text(bx+22, FSL_Y+18, "FSL", sz=10, f=AMBER, a="middle", w="bold")

    # Family + Property format boxes
    for cx in (C1, C2):
        s.rect(cx-40, FSL_Y+8, 80, 28, rx=4, f=AMBR_LT, st=AMBR_ST, sw=1, fo=".85")
        s.text(cx, FSL_Y+21, "SD-JWT-VC", sz=7.5, f=AMBR_DK, a="middle", w="600")
        s.text(cx, FSL_Y+31, "eIDAS ✓", sz=5, f=GREEN, a="middle")

    # ── Constraint annotation cards (left column inside FSL) ──
    ann_x = MD_X + 19
    s.ccard(ann_x, FSL_Y+8, "C5", ORANGE, "eIDAS mandate", "EU wallets → SD-JWT-VC")
    s.ccard(ann_x, FSL_Y+36, "C6", PURPLE, "pred proof req.", "GDPR → income needs ZKP")
    s.ccard(ann_x, FSL_Y+64, "C7", BLU_GOV, "VCDM conform.", "W3C → AnonCreds fails")

    # ── C9: cross-credential predicate gap ──
    fam_l, prop_r = C1-40, C2+40
    br_y = FSL_Y + 42
    mid = (C1+C2)/2
    s.path(f"M{fam_l} {br_y}L{fam_l} {br_y+12}Q{fam_l} {br_y+18} {fam_l+6} {br_y+18}L{mid-55} {br_y+18}",
           st=RED, sw=1.2, da="3,2")
    s.path(f"M{prop_r} {br_y}L{prop_r} {br_y+12}Q{prop_r} {br_y+18} {prop_r-6} {br_y+18}L{mid+55} {br_y+18}",
           st=RED, sw=1.2, da="3,2")
    s.ccard(mid-55, FSL_Y+54, "C9", RED, "cross-credential predicate gap",
            "requires cross-cred ZKP; no format supports it", w=110, h=28)

    # ── Conflict zone ──
    cz_x, cz_w, cz_h = C3-74, 186, 90
    cz_y = FSL_Y+4
    s.rect(cz_x, cz_y, cz_w, cz_h, rx=5, f=RED_LT, st=RED, sw=1.5, fo=".3", da="5,3")
    s.rect(cz_x, cz_y, cz_w, cz_h, rx=5, f="url(#hatch)", st="none", sw=0)._('<!-- hatch -->')

    # SD-JWT-VC option
    ow, oh = 82, 40
    s.rect(cz_x+8, cz_y+8, ow, oh, rx=4, f=AMBR_LT, st=AMBR_ST, sw=.9, fo=".9")
    ox1 = cz_x+8+ow/2
    s.text(ox1, cz_y+21, "SD-JWT-VC", sz=7, f=AMBR_DK, a="middle", w="600")
    s.text(ox1, cz_y+31, "eIDAS ✓ W3C ✓", sz=5, f=GREEN, a="middle")
    s.text(ox1, cz_y+41, "pred ✗", sz=5.5, f=RED, a="middle", w="bold")

    # AnonCreds option
    s.rect(cz_x+ow+16, cz_y+8, ow, oh, rx=4, f=AMBR_LT, st=AMBR_ST, sw=.9, fo=".9")
    ox2 = cz_x+ow+16+ow/2
    s.text(ox2, cz_y+21, "AnonCreds", sz=7, f=AMBR_DK, a="middle", w="600")
    s.text(ox2, cz_y+31, "pred ✓", sz=5, f=GREEN, a="middle")
    s.text(ox2, cz_y+41, "eIDAS ✗ W3C ✗", sz=5.5, f=RED, a="middle", w="bold")

    # C8 card
    c8x = cz_x+8
    c8y = cz_y+oh+16
    s.ccard(c8x, c8y, "C8", RED, "governance conflict",
            "C5∧C6∧C7 jointly unsatisfiable on IncomeCred", w=170, h=28)

    # Governance source badges
    by = c8y + 34
    for dx, label, col in [(0, "eIDAS", ORANGE), (30, "GDPR", PURPLE), (58, "W3C", BLU_GOV)]:
        bx2 = c8x+2+dx
        bw2 = 26 if label == "eIDAS" else 24 if label == "GDPR" else 22
        s.rect(bx2, by, bw2, 10, rx=2, f=col, st=col, sw=.5, fo=".12")
        s.text(bx2+bw2/2, by+7, label, sz=4.5, f=col, a="middle", w="bold")


# ── Result panel ──────────────────────────────────────────────────

def result_panel(s):
    s._('\n<!-- RESULT PANEL -->')
    s.rect(RS_X, PNL_Y, RS_W, PNL_H, rx=8, f=BG, st="#ced4da", sw=1.2)
    s.text(RS_X+RS_W/2, PNL_Y+20, "RESULT", sz=12, f="#495057", a="middle", w="bold", sp="1.5")
    hdr_line_y = PNL_Y + HDR_H
    s.line(RS_X+14, hdr_line_y, RS_X+RS_W-14, hdr_line_y, st=LTGRAY, sw=.8)

    cx, cw = RS_X+12, RS_W-24

    # ① VERIFY
    verify(s, cx, CARD1_Y, cw, CARD1_H)
    # ② IDENTIFY
    identify(s, cx, CARD2_Y, cw, CARD2_H)
    # ③ GENERATE
    generate(s, cx, CARD3_Y, cw, CARD3_H)


def verify(s, x, y, w, h):
    s.rect(x, y, w, h, rx=5)
    s.circle(x+16, y+16, 10, f=AMBR_ST, st=AMBER, sw=1.2, fo=".25")
    s.text(x+16, y+20, "1", sz=10, f=AMBER, a="middle", w="bold")
    s.text(x+40, y+20, "VERIFY", sz=11, f=DARK, w="bold")

    qw = (w-24)/2
    s.rect(x+8, y+30, qw, 34, rx=3, f=GRN_LT, st=GREEN, sw=.6, fo=".4")
    s.text(x+14, y+44, "SAT", sz=10, f=GREEN, w="bold")
    s.text(x+14, y+56, "design is consistent", sz=6.5, f=GREEN)

    s.rect(x+8, y+68, qw, 34, rx=3, f=RED_LT, st=RED, sw=.6, fo=".4")
    s.text(x+14, y+82, "UNSAT", sz=10, f=RED, w="bold")
    s.text(x+14, y+94, "constraints conflict", sz=6.5, f=RED)

    gx = x+16+qw
    mini_graph(s, gx, y+30, qw, 34, ok=True)
    mini_graph(s, gx, y+68, qw, 34, ok=False)


def mini_graph(s, x, y, w, h, ok=True):
    s.rect(x, y, w, h, rx=3, f="#fafafa", st=LTGRAY, sw=.5, da="2,2")
    s.circle(x+18, y+h/2, 5, f=BLUE_LT, st=BLUE, sw=.5)
    s.text(x+18, y+h/2+3, "S", sz=3.5, f=BLUE_DK, a="middle")
    cc = [(TEAL_LT, TEAL_ST)]*2 + [((RED_LT, RED) if not ok else (TEAL_LT, TEAL_ST))]
    for i,(nf,ns) in enumerate(cc):
        ny = y+7+i*10
        s.rect(x+32, ny, 24, 7, rx=2, f=nf, st=ns, sw=.4 if ok or i<2 else .6)
    for i in range(2):
        ny = y+7+i*10
        fc = GRN_LT if ok else (RED_LT if i>0 else GRN_LT)
        sc = GREEN if ok else (RED if i>0 else GREEN)
        s.rect(x+60, ny, 18, 7, rx=2, f=fc, st=sc, sw=.4 if ok or i==0 else .5, da="2,1" if not ok and i>0 else None)
    for i in range(3):
        ec = GRAY if (ok or i<2) else RED
        s.line(x+23, y+h/2, x+32, y+10+i*10, st=ec, sw=.3)
    label = "✓ model found" if ok else "✗ no model"
    s.text(x+w/2, y+h-4, label, sz=5, f=GREEN if ok else RED, a="middle")


def identify(s, x, y, w, h):
    s.rect(x, y, w, h, rx=5)
    s.circle(x+16, y+16, 10, f=RED, st=RED, sw=1.2, fo=".12")
    s.text(x+16, y+20, "2", sz=10, f=RED, a="middle", w="bold")
    s.text(x+40, y+20, "IDENTIFY ERRORS", sz=11, f=DARK, w="bold")

    for i, (nm, det) in enumerate([("governance_conflict","(IncomeCred)"),("cross_cred_pred_gap","(area, children)")]):
        ey = y+32+i*30
        s.rect(x+8, ey, 124, 14, rx=2, f=RED_LT, st="none", sw=0, fo=".2")
        s.text(x+12, ey+10, f"▸ {nm}", sz=7, f=RED_DK, w="600")
        s.text(x+18, ey+22, det, sz=6.5, f=GRAY)

    # Mini error graph
    gx, gy, gw, gh = x+w/2+12, y+32, w/2-24, h-42
    s.rect(gx, gy, gw, gh, rx=3, f="#fafafa", st=LTGRAY, sw=.5, da="2,2")
    s.circle(gx+18, gy+gh/2, 6, f=BLUE_LT, st=BLUE, sw=.5)
    s.text(gx+18, gy+gh/2+3, "App", sz=4, f=BLUE_DK, a="middle")
    for i, (lb, nf, ns, err) in enumerate([("Fam",TEAL_LT,TEAL_ST,False),("Prop",TEAL_LT,TEAL_ST,False),("Inc",RED_LT,RED,True)]):
        ny = gy+12+i*12
        s.rect(gx+34, ny, 28, 8, rx=2, f=nf, st=ns, sw=.8 if err else .4)
        s.text(gx+48, ny+6, lb, sz=3.5, f=RED_DK if err else TEAL, a="middle", w="bold" if err else None)
        s.rect(gx+70, ny, 24, 8, rx=2, f=(RED_LT if err else AMBR_LT), st=(RED if err else AMBR_ST), sw=.6 if err else .3)
        if err: s.text(gx+82, ny+6, "C8✗", sz=3, f=RED_DK, a="middle", w="bold")
        s.line(gx+24, gy+gh/2, gx+34, ny+4, st=RED if err else GRAY, sw=.4 if err else .3)
        s.line(gx+62, ny+4, gx+70, ny+4, st=RED if err else GRAY, sw=.4 if err else .3)
    s.path(f"M{gx+40} {gy+gh-12}L{gx+40} {gy+gh-6} {gx+70} {gy+gh-6}", st=RED, sw=.6, da="2,1")
    s.text(gx+55, gy+gh-1, "C9 gap", sz=3.5, f=RED, a="middle")


def generate(s, x, y, w, h):
    s.rect(x, y, w, h, rx=5)
    s.circle(x+16, y+16, 10, f=GREEN, st=GREEN, sw=1.2, fo=".12")
    s.text(x+16, y+20, "3", sz=10, f=GREEN, a="middle", w="bold")
    s.text(x+40, y+20, "GENERATE", sz=11, f=DARK, w="bold")

    s.rect(x+8, y+30, w-16, 14, rx=3, f=GRN_LT, st=GREEN, sw=.5, fo=".35")
    s.text(x+w/2, y+40, "Relax C6 (GDPR) → 2 valid configurations", sz=6.5, f=GREEN, a="middle", w="600")

    cfgw = (w-32)/2
    configs = [
        ("Config A", [("Fam","SD-JWT",False),("Prop","SD-JWT",False),("Inc","SD-JWT",False)], "✓ all SD-JWT-VC"),
        ("Config B", [("Fam","SD-JWT",False),("Prop","mdoc",True),("Inc","SD-JWT",False)], "✓ Prop → mdoc"),
    ]
    for ci, (title, asgn, summary) in enumerate(configs):
        gx = x+8+ci*(cfgw+8)
        gy = y+50; gh = h-58
        s.rect(gx, gy, cfgw, gh, rx=3, f="#fafafa", st=LTGRAY, sw=.6, da="3,2")
        s.text(gx+cfgw/2, gy+12, title, sz=6.5, f=GREEN, a="middle", w="600")
        s.circle(gx+18, gy+32, 5.5, f=BLUE_LT, st=BLUE, sw=.5)
        s.text(gx+18, gy+35, "App", sz=3.5, f=BLUE_DK, a="middle")
        for j, (cl, fl, is_m) in enumerate(asgn):
            ny = gy+24+j*12
            s.rect(gx+32, ny, 32, 8, rx=2, f=TEAL_LT, st=TEAL_ST, sw=.4)
            s.text(gx+48, ny+6, cl, sz=3.5, f=TEAL, a="middle")
            ff = "#e4d8fd" if is_m else AMBR_LT
            fs = PURPLE if is_m else AMBR_ST
            s.rect(gx+70, ny, 36, 8, rx=2, f=ff, st=fs, sw=.5 if is_m else .4)
            s.text(gx+88, ny+6, fl, sz=3, f=PURPLE if is_m else AMBR_DK, a="middle", w="600" if is_m else None)
            s.line(gx+23, gy+32, gx+32, ny+4, st=GRAY, sw=.3)
            s.line(gx+64, ny+4, gx+70, ny+4, st=PURPLE if is_m else GRAY, sw=.4 if is_m else .3)
        s.text(gx+cfgw/2, gy+gh-4, summary, sz=6, f=GREEN, a="middle")


# ── Assemble ──────────────────────────────────────────────────────

def generate_svg():
    s = S()
    s._(f'<svg viewBox="0 0 {W} {H}" xmlns="http://www.w3.org/2000/svg" font-family="{FONT}">')
    defs(s)
    input_panel(s)
    # Arrow: INPUT → MODEL
    arr_y = PNL_Y + PNL_H // 2
    s.line(IN_X+IN_W+4, arr_y, MD_X-4, arr_y, st=GRAY, sw=2.5, me="abig")
    s.rect(MD_X, PNL_Y, MD_W, PNL_H, rx=8, f="none", st="#ced4da", sw=1.2, da="6,3")
    s.text(MD_X+MD_W/2, PNL_Y+18, "MODEL", sz=12, f="#495057", a="middle", w="bold", sp="1.5")
    dcl(s)
    constraints_dcl_csl(s)
    csl(s)
    csl_fsl_traces(s)
    fsl(s)
    # Arrow: MODEL → RESULT
    s.line(MD_X+MD_W+4, arr_y, RS_X-4, arr_y, st=GRAY, sw=2.5, me="abig")
    result_panel(s)
    s._('</svg>')
    return s.render()

if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("-o", "--output")
    a = p.parse_args()
    svg = generate_svg()
    if a.output:
        open(a.output, "w", encoding="utf-8").write(svg)
        print(f"Written to {a.output}", file=sys.stderr)
    else:
        print(svg)