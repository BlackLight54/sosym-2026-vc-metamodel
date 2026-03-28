-- annotations.lua
-- Pandoc Lua filter: convert fenced divs and bracketed spans with annotation
-- classes (.todo, .cite, .formal, .figure, .scaffold, .meta) to \todo{}
-- commands (draft mode) or strip them (submission mode).
--
-- Replaces markers.lua. Uses native Pandoc Markdown constructs instead of
-- Obsidian %% comment syntax.
--
-- Markdown syntax:
--   Block (fenced div):
--     ::: {.todo}
--     Description of what needs doing.
--     :::
--
--   Inline (bracketed span):
--     Some prose [needs a citation]{.cite} and more prose.
--
--   Figure placeholder (id becomes label):
--     ::: {#fig:example .figure}
--     Description of the planned figure.
--     :::
--
-- Classes: .todo, .cite, .formal, .figure, .scaffold, .meta
--
-- In draft mode: emits \todo[opts]{content} (requires todonotes package).
-- In submission mode: strips entirely (both block and inline).
--
-- Usage: pandoc --lua-filter=annotations.lua --metadata mode=draft|submission

local mode = "draft"

function Meta(meta)
  if meta.mode then
    mode = pandoc.utils.stringify(meta.mode)
  end
end

--- Map annotation class to \todo options and content prefix.
-- Returns (opts_table, prefix) or nil if not an annotation class.
local function annotation_opts(classes)
  if classes:includes("todo") then
    return {}, ""
  elseif classes:includes("cite") then
    return {"color=blue!20"}, "cite: "
  elseif classes:includes("formal") then
    return {"color=green!20"}, "formal: "
  elseif classes:includes("figure") then
    return {"color=orange!20"}, "figure: "
  elseif classes:includes("scaffold") then
    return {"color=purple!15"}, "scaffold: "
  elseif classes:includes("meta") then
    return {"color=gray!10"}, "meta: "
  end
  return nil
end

--- Escape LaTeX special characters for use inside \todo{} text.
local function escape_for_todo(s)
  s = s:gsub("\\", "\\textbackslash{}")
  s = s:gsub("#", "\\#")
  s = s:gsub("_", "\\_")
  s = s:gsub("&", "\\&")
  s = s:gsub("%%", "\\%%")
  -- Unicode to LaTeX
  s = s:gsub("\xE2\x80\x94", "---")
  s = s:gsub("\xE2\x80\x93", "--")
  s = s:gsub("\xE2\x80\x99", "'")
  s = s:gsub("\xE2\x80\x98", "`")
  s = s:gsub("\xE2\x80\x9C", "``")
  s = s:gsub("\xE2\x80\x9D", "''")
  s = s:gsub("\xE2\x86\x92", "{\\textrightarrow}")
  s = s:gsub("\xC3\x97", "{\\texttimes}")
  s = s:gsub("\xC3\xBC", "{\\\"u}")
  s = s:gsub("\xC3\x9C", "{\\\"U}")
  s = s:gsub("\xC3\xA9", "{\\'e}")
  s = s:gsub("\xC2\xA7", "{\\S}")
  s = s:gsub("\xC2\xA0", " ")
  s = s:gsub("\xEF\xBF\xBD", "")
  s = s:gsub("[\x80-\xFF]+", "")
  return s
end

--- Extract source lines from a div's content.
-- Splits on both paragraph boundaries and SoftBreaks within paragraphs,
-- so consecutive Markdown lines each become a separate entry.
local function extract_lines(content)
  local lines = {}
  for _, block in ipairs(content) do
    if block.t == "Para" or block.t == "Plain" then
      local current = {}
      for _, inline in ipairs(block.content) do
        if inline.t == "SoftBreak" then
          local line = pandoc.utils.stringify(pandoc.Inlines(current))
          if line ~= "" then table.insert(lines, line) end
          current = {}
        else
          table.insert(current, inline)
        end
      end
      local line = pandoc.utils.stringify(pandoc.Inlines(current))
      if line ~= "" then table.insert(lines, line) end
    else
      local line = pandoc.utils.stringify(block)
      if line ~= "" then table.insert(lines, line) end
    end
  end
  return lines
end

--- Handle block-level annotation divs.
function Div(el)
  local opts_table, prefix = annotation_opts(el.classes)
  if not opts_table then
    return nil
  end

  if mode == "submission" then
    return {}
  end

  -- Escape each line individually, then join with \\ so the
  -- line-break backslashes are not themselves escaped.
  local lines = extract_lines(el.content)
  local escaped_lines = {}
  for _, line in ipairs(lines) do
    table.insert(escaped_lines, escape_for_todo(line))
  end

  local body = table.concat(escaped_lines, " \\\\\n")

  -- Prepend label for figure divs
  local label = el.identifier or ""
  if label ~= "" and el.classes:includes("figure") then
    body = escape_for_todo(label) .. ": " .. body
  end

  -- Build \todo command
  local opts = pandoc.List(opts_table)
  opts:insert(1, "inline")
  local opt_str = "[" .. table.concat(opts, ",") .. "]"

  return pandoc.RawBlock("latex",
    "\\todo" .. opt_str .. "{" .. escape_for_todo(prefix) .. body .. "}\n")
end

--- Handle inline annotation spans.
function Span(el)
  local opts_table, prefix = annotation_opts(el.classes)
  if not opts_table then
    return nil
  end

  if mode == "submission" then
    return {}
  end

  local content_text = pandoc.utils.stringify(el.content)
  local escaped = escape_for_todo(prefix .. content_text)

  local opt_str = ""
  if #opts_table > 0 then
    opt_str = "[" .. table.concat(opts_table, ",") .. "]"
  end

  return pandoc.RawInline("latex", "\\todo" .. opt_str .. "{" .. escaped .. "}")
end

return {
  { Meta = Meta },
  { Div = Div, Span = Span },
}
