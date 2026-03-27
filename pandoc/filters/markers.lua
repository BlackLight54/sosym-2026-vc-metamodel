-- markers.lua
-- Pandoc Lua filter: convert Obsidian %% markers to \todo{} or strip them.
--
-- Two modes of marker placement:
--   1. Standalone: marker on its own line → block-level \todo[inline]{...}
--   2. Inline: marker embedded in prose  → margin \todo{...} (no [inline])
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

--- Parse marker content (the text between %% delimiters) into type + content.
-- Unlike parse_marker, this does NOT expect the %% delimiters.
local function parse_marker_inner(text)
  text = text:match("^%s*(.-)%s*$")
  if text == "" then return nil end

  local marker_type, content = text:match("^@(%u+):%s*(.+)$")
  if marker_type then
    return marker_type, content
  end

  return "COMMENT", text
end


--- Escape LaTeX special characters and Unicode for use inside \todo{} text.
local function escape_for_todo(s)
  s = s:gsub("\\", "\\textbackslash{}")
  s = s:gsub("#", "\\#")
  s = s:gsub("_", "\\_")
  s = s:gsub("&", "\\&")
  s = s:gsub("%%", "\\%%")
  -- Unicode → LaTeX
  s = s:gsub("\xE2\x80\x94", "---")           -- em dash —
  s = s:gsub("\xE2\x80\x93", "--")            -- en dash –
  s = s:gsub("\xE2\x80\x99", "'")             -- right single quote '
  s = s:gsub("\xE2\x80\x98", "`")             -- left single quote '
  s = s:gsub("\xE2\x80\x9C", "``")            -- left double quote "
  s = s:gsub("\xE2\x80\x9D", "''")            -- right double quote "
  s = s:gsub("\xE2\x86\x92", "{\\textrightarrow}")  -- → right arrow
  s = s:gsub("\xC3\x97", "{\\texttimes}")      -- × multiplication
  s = s:gsub("\xC3\xBC", "{\\\"u}")            -- ü
  s = s:gsub("\xC3\x9C", "{\\\"U}")            -- Ü
  s = s:gsub("\xC3\xA9", "{\\'e}")             -- é
  s = s:gsub("\xC2\xA7", "{\\S}")              -- § section sign
  s = s:gsub("\xC2\xA0", " ")                 -- non-breaking space → regular space
  s = s:gsub("\xEF\xBF\xBD", "")              -- U+FFFD replacement char → strip
  -- Catch-all: strip any remaining non-ASCII bytes
  s = s:gsub("[\x80-\xFF]+", "")
  return s
end

--- Build a \todo command string.
-- @param marker_type  string: TODO, CITE, FORMAL, FIGURE, COMMENT, or other
-- @param content      string: raw marker content (will be escaped)
-- @param is_block     boolean: true for standalone (adds [inline]), false for margin
-- @return string: LaTeX command
local function make_todo_cmd(marker_type, content, is_block)
  content = escape_for_todo(content)

  if mode == "submission" then
    return nil
  end

  local opts = {}
  if is_block then
    table.insert(opts, "inline")
  end

  if marker_type == "CITE" then
    table.insert(opts, "color=blue!20")
    content = "cite: " .. content
  elseif marker_type == "FORMAL" then
    table.insert(opts, "color=green!20")
    content = "formal: " .. content
  elseif marker_type == "FIGURE" then
    table.insert(opts, "color=orange!20")
    local label, desc = content:match("^(.-)%s*|%s*(.+)$")
    if label and desc then
      content = "figure " .. label .. ": " .. desc
    else
      content = "figure: " .. content
    end
  elseif marker_type == "SCAFFOLD" then
    table.insert(opts, "color=purple!15")
    content = "scaffold: " .. content
  elseif marker_type == "META" then
    table.insert(opts, "color=gray!10")
    content = "meta: " .. content
  elseif marker_type == "COMMENT" then
    table.insert(opts, "color=gray!20")
  elseif marker_type ~= "TODO" then
    -- Unknown marker type — include the type name
    content = marker_type .. ": " .. content
  end

  local opt_str = ""
  if #opts > 0 then
    opt_str = "[" .. table.concat(opts, ",") .. "]"
  end

  return "\\todo" .. opt_str .. "{" .. content .. "}"
end

--- Convert a parsed standalone marker to a RawBlock or empty list.
local function convert_marker(marker_type, content)
  local cmd = make_todo_cmd(marker_type, content, true)
  if not cmd then
    return {} -- submission mode: strip
  end
  return pandoc.RawBlock("latex", cmd)
end

--- Process inline markers within a paragraph's Inlines list.
-- Finds %%...%% spans embedded in prose text and replaces them with
-- RawInline \todo{} margin notes (no [inline]).
-- Returns new Inlines list, or nil if no markers found.
local function process_inline_markers(inlines)
  -- Quick check: does the paragraph contain %% at all?
  local full_text = pandoc.utils.stringify(pandoc.Inlines(inlines))
  if not full_text:find("%%%%") then
    return nil
  end

  local result = pandoc.List()
  local in_marker = false
  local marker_parts = {}

  for _, el in ipairs(inlines) do
    if el.t == "Str" then
      local text = el.text
      -- Process text, potentially splitting on %% delimiters
      while text ~= "" do
        local pos = text:find("%%%%")
        if pos then
          local before = text:sub(1, pos - 1)
          local after = text:sub(pos + 2)

          if in_marker then
            -- Found closing %%
            if before ~= "" then
              table.insert(marker_parts, before)
            end
            -- Emit the marker as an inline \todo
            local marker_text = table.concat(marker_parts)
            local mtype, mcontent = parse_marker_inner(marker_text)
            if mtype then
              local cmd = make_todo_cmd(mtype, mcontent, false)
              if cmd then
                result:insert(pandoc.RawInline("latex", cmd))
              end
              -- else: submission mode, marker stripped
            end
            marker_parts = {}
            in_marker = false
          else
            -- Found opening %%
            if before ~= "" then
              result:insert(pandoc.Str(before))
            end
            in_marker = true
            marker_parts = {}
          end

          text = after
        else
          -- No more %% in remaining text
          if in_marker then
            table.insert(marker_parts, text)
          else
            if text ~= "" then
              result:insert(pandoc.Str(text))
            end
          end
          text = ""
        end
      end
    elseif el.t == "Space" or el.t == "SoftBreak" then
      if in_marker then
        table.insert(marker_parts, " ")
      else
        result:insert(el)
      end
    else
      -- Other inline elements (Emph, Strong, Math, Code, Link, etc.)
      if in_marker then
        table.insert(marker_parts, pandoc.utils.stringify(el))
      else
        result:insert(el)
      end
    end
  end

  -- Unclosed marker at end of paragraph — emit as literal text
  if in_marker then
    result:insert(pandoc.Str("%%" .. table.concat(marker_parts)))
  end

  return result
end

--- Split Para inlines on SoftBreak to recover individual source lines.
-- Returns a list of { inlines = {pandoc Inline...}, text = "stringified" }.
local function split_on_softbreak(inlines)
  local lines = {}
  local current = {}
  for _, inline in ipairs(inlines) do
    if inline.t == "SoftBreak" then
      if #current > 0 then
        table.insert(lines, {
          inlines = pandoc.List(current),
          text = pandoc.utils.stringify(pandoc.Inlines(current)),
        })
        current = {}
      end
    else
      table.insert(current, inline)
    end
  end
  if #current > 0 then
    table.insert(lines, {
      inlines = pandoc.List(current),
      text = pandoc.utils.stringify(pandoc.Inlines(current)),
    })
  end
  return lines
end

function Para(el)
  local lines = split_on_softbreak(el.content)

  -- Classify each line as marker or prose
  local classified = {}
  local has_marker = false
  local has_prose = false
  for _, line in ipairs(lines) do
    local marker_type, content = parse_marker(line.text)
    if marker_type then
      table.insert(classified, {
        kind = "marker", type = marker_type, content = content,
      })
      has_marker = true
    else
      table.insert(classified, {
        kind = "prose", inlines = line.inlines,
      })
      has_prose = true
    end
  end

  -- All markers: emit block-level \todo[inline]{} for each
  if has_marker and not has_prose then
    local blocks = {}
    for _, c in ipairs(classified) do
      local block = convert_marker(c.type, c.content)
      if block and block.t then
        table.insert(blocks, block)
      end
    end
    return blocks
  end

  -- Mixed or pure prose: split into blocks per line group
  if has_marker and has_prose then
    local blocks = {}
    local prose_acc = pandoc.List() -- accumulates inlines for consecutive prose lines

    local function flush_prose()
      if #prose_acc > 0 then
        local processed = process_inline_markers(prose_acc) or prose_acc
        table.insert(blocks, pandoc.Para(processed))
        prose_acc = pandoc.List()
      end
    end

    for _, c in ipairs(classified) do
      if c.kind == "marker" then
        flush_prose()
        local block = convert_marker(c.type, c.content)
        if block and block.t then
          table.insert(blocks, block)
        end
      else
        -- Insert SoftBreak between consecutive prose lines
        if #prose_acc > 0 then
          prose_acc:insert(pandoc.SoftBreak())
        end
        prose_acc:extend(c.inlines)
      end
    end
    flush_prose()
    return blocks
  end

  -- Pure prose (no markers found via line classification):
  -- still check for inline markers embedded within prose lines
  local new_inlines = process_inline_markers(el.content)
  if new_inlines then
    return pandoc.Para(new_inlines)
  end

  return nil -- no markers at all
end

--- Handle Plain blocks (used inside list items, table cells, etc.)
-- Only does inline marker processing — standalone markers in Plain blocks
-- are rare, but inline markers within list prose are common.
function Plain(el)
  local new_inlines = process_inline_markers(el.content)
  if new_inlines then
    return pandoc.Plain(new_inlines)
  end
  return nil
end

return {
  { Meta = Meta },
  { Para = Para, Plain = Plain },
}
