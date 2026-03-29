-- acronyms.lua
-- Pandoc Lua filter: convert +key syntax to acronym-package commands.
--
-- Mirrors the pandoc-acro Markdown syntax but targets the LaTeX `acronym`
-- package (\ac, \acs, \acl, \acf and their plural/caps variants).
--
-- Syntax (in sections/*.md):
--   +KEY              → \ac{KEY}        auto first/subsequent
--   [+KEY]{.short}    → \acs{KEY}       short form
--   [+KEY]{.long}     → \acl{KEY}       long form
--   [+KEY]{.full}     → \acf{KEY}       full form
--   .plural           → p suffix        (\acp, \acsp, …)
--   .caps             → uppercase A     (\Ac, \Acs, …)
--   Combinable:  [+KEY]{.long .plural .caps} → \Aclp{KEY}
--
-- Definitions: read from `acronyms` metadata (acronyms.yaml).
-- The filter auto-generates pandoc/acronym-defs.tex with \acrodef commands,
-- which preamble.tex \input's.  No manual sync needed.
--
-- Usage: listed in pandoc/defaults.yaml filters list.

local acronyms = {}  -- key → {short, long}

--- Resolve the output directory for acronym-defs.tex.
-- When pandoc runs from the repo root (build.sh does `cd "$SCRIPT_DIR"`),
-- the working directory is the repo root, so "pandoc/acronym-defs.tex" works.
local DEFS_FILE = "pandoc/acronym-defs.tex"

--- Pass 1: read acronym definitions from metadata and write defs file.
local function Meta(meta)
  if not meta.acronyms then return end

  -- Collect and sort keys for deterministic output.
  local keys = {}
  for key, val in pairs(meta.acronyms) do
    if type(val) == "table" then
      acronyms[key] = {
        short = val.short and pandoc.utils.stringify(val.short) or key,
        long  = val.long  and pandoc.utils.stringify(val.long)  or key,
      }
      keys[#keys + 1] = key
    end
  end
  table.sort(keys)

  -- Write \acrodef commands to a .tex file that preamble.tex \input's.
  local lines = { "%% Auto-generated from pandoc/acronyms.yaml — do not edit." }
  for _, key in ipairs(keys) do
    local a = acronyms[key]
    lines[#lines + 1] = string.format("\\acrodef{%s}[%s]{%s}", key, a.short, a.long)
  end
  lines[#lines + 1] = ""  -- trailing newline

  local content = table.concat(lines, "\n")

  -- Only write if content changed (avoid unnecessary Overleaf churn).
  local f = io.open(DEFS_FILE, "r")
  if f then
    local existing = f:read("*a")
    f:close()
    if existing == content then return end
  end

  f = io.open(DEFS_FILE, "w")
  if f then
    f:write(content)
    f:close()
  end
end

--- Build the LaTeX acronym command from modifier classes.
-- Construction rule: \{A|a}c{s|l|f|""}{p|""}{key}
local function build_command(key, classes)
  local variant = ""
  local plural  = ""
  local caps    = false

  if classes then
    if classes:includes("short") then variant = "s"
    elseif classes:includes("long") then variant = "l"
    elseif classes:includes("full") then variant = "f"
    end
    if classes:includes("plural") then plural = "p" end
    if classes:includes("caps")   then caps = true end
  end

  local base = caps and "A" or "a"
  return "\\" .. base .. "c" .. variant .. plural .. "{" .. key .. "}"
end

--- Pass 2: handle bracketed spans [+KEY]{.short .plural .caps}
-- Must run in its own pass BEFORE the Str pass, because pandoc walks
-- bottom-up within a pass: Str inside a Span would fire first and
-- consume the +KEY before the Span handler sees it.
local function Span(el)
  local text = pandoc.utils.stringify(el.content)
  local key = text:match("^%+([A-Za-z][A-Za-z0-9%-]*)$")
  if not key then return nil end
  if not acronyms[key] then return nil end
  return pandoc.RawInline("latex", build_command(key, el.classes))
end

--- Pass 3: handle bare +KEY in running text
local function Str(el)
  local key, rest = el.text:match("^%+([A-Za-z][A-Za-z0-9%-]*)(.*)$")
  if not key then return nil end
  if not acronyms[key] then return nil end

  local raw = pandoc.RawInline("latex", build_command(key, nil))
  if rest == "" then
    return raw
  else
    return { raw, pandoc.Str(rest) }
  end
end

return {
  { Meta = Meta },
  { Span = Span },
  { Str = Str },
}
