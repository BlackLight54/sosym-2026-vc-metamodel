-- markers.lua
-- Pandoc Lua filter: convert Obsidian %% markers to \todo{} or strip them.
--
-- Markers are always on their own line (per CLAUDE.md), so pandoc parses
-- each as a separate Para block — unless consecutive marker lines have no
-- blank line between them, in which case pandoc joins them into one Para
-- separated by SoftBreak. We handle both cases.
--
-- Usage: pandoc --lua-filter=markers.lua --metadata mode=draft|submission

local mode = "draft" -- default

function Meta(meta)
  if meta.mode then
    mode = pandoc.utils.stringify(meta.mode)
  end
end

--- Check if a string is an Obsidian marker line.
-- Returns (type, content) or nil.
local function parse_marker(text)
  text = text:match("^%s*(.-)%s*$")

  local inner = text:match("^%%%%(.-)%%%%$")
  if not inner then return nil end

  inner = inner:match("^%s*(.-)%s*$")
  if inner == "" then return nil end

  local marker_type, content = inner:match("^@(%u+):%s*(.+)$")
  if marker_type then
    return marker_type, content
  end

  return "COMMENT", inner
end


--- Convert a parsed marker to a RawBlock or empty list.
local function convert_marker(marker_type, content)
  if mode == "submission" then
    return {} -- strip
  end

  local cmd
  if marker_type == "TODO" then
    cmd = "\\todo[inline]{" .. content .. "}"
  elseif marker_type == "CITE" then
    cmd = "\\todo[inline]{cite: " .. content .. "}"
  elseif marker_type == "FORMAL" then
    cmd = "\\todo[inline]{formal: " .. content .. "}"
  elseif marker_type == "FIGURE" then
    local label, desc = content:match("^(.-)%s*|%s*(.+)$")
    if label and desc then
      cmd = "\\todo[inline]{figure " .. label .. ": " .. desc .. "}"
    else
      cmd = "\\todo[inline]{figure: " .. content .. "}"
    end
  elseif marker_type == "COMMENT" then
    cmd = "\\todo[inline]{" .. content .. "}"
  else
    cmd = "\\todo[inline]{" .. marker_type .. ": " .. content .. "}"
  end

  return pandoc.RawBlock("latex", cmd)
end

--- Split Para inlines on SoftBreak to recover individual source lines.
local function split_on_softbreak(inlines)
  local lines = {}
  local current = {}
  for _, inline in ipairs(inlines) do
    if inline.t == "SoftBreak" then
      if #current > 0 then
        table.insert(lines, pandoc.utils.stringify(pandoc.Inlines(current)))
        current = {}
      end
    else
      table.insert(current, inline)
    end
  end
  if #current > 0 then
    table.insert(lines, pandoc.utils.stringify(pandoc.Inlines(current)))
  end
  return lines
end

function Para(el)
  local lines = split_on_softbreak(el.content)

  -- Check if ALL lines are markers
  local parsed = {}
  local all_markers = true
  for _, line in ipairs(lines) do
    local marker_type, content = parse_marker(line)
    if marker_type then
      table.insert(parsed, { type = marker_type, content = content })
    else
      all_markers = false
      break
    end
  end

  if all_markers and #parsed > 0 then
    local blocks = {}
    for _, m in ipairs(parsed) do
      local block = convert_marker(m.type, m.content)
      if block then
        -- convert_marker returns either a RawBlock or empty table
        if block.t then
          table.insert(blocks, block)
        end
      end
    end
    return blocks
  end

  -- Fallback: check if the whole paragraph is a single marker
  local text = pandoc.utils.stringify(el)
  local marker_type, content = parse_marker(text)
  if marker_type then
    return convert_marker(marker_type, content)
  end

  return nil -- not a marker
end

return {
  { Meta = Meta },
  { Para = Para },
}
