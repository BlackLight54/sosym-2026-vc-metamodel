-- cut-candidates.lua
-- Pandoc Lua filter: convert fenced divs and bracketed spans with class
-- "cutcandidate" to \begin{cutcandidate}...\end{cutcandidate} or strip them.
--
-- Markdown syntax:
--   Block (fenced div):
--     ::: {.cutcandidate reason="why this can be cut"}
--     Paragraphs...
--     :::
--
--   Inline (bracketed span):
--     [Text to cut.]{.cutcandidate reason="why"}
--
-- In draft mode: wraps in cutcandidate environment (block) or command (inline).
-- In submission mode: keeps content, strips wrapper.
--
-- Usage: pandoc --lua-filter=cut-candidates.lua --metadata mode=draft|submission

local mode = "draft"

function Meta(meta)
  if meta.mode then
    mode = pandoc.utils.stringify(meta.mode)
  end
end

function Div(el)
  if not el.classes:includes("cutcandidate") then
    return nil
  end

  if mode == "submission" then
    return el.content
  end

  local reason = el.attributes.reason or ""
  local opt = ""
  if reason ~= "" then
    opt = "[" .. reason .. "]"
  end

  local blocks = pandoc.List()
  blocks:insert(pandoc.RawBlock("latex", "\\begin{cutcandidate}" .. opt))
  blocks:extend(el.content)
  blocks:insert(pandoc.RawBlock("latex", "\\end{cutcandidate}"))
  return blocks
end

function Span(el)
  if not el.classes:includes("cutcandidate") then
    return nil
  end

  if mode == "submission" then
    return el.content
  end

  local reason = el.attributes.reason or ""
  local opt = ""
  if reason ~= "" then
    opt = "[" .. reason .. "]"
  end

  local inlines = pandoc.List()
  inlines:insert(pandoc.RawInline("latex", "\\cutcandidate" .. opt .. "{"))
  inlines:extend(el.content)
  inlines:insert(pandoc.RawInline("latex", "}"))
  return inlines
end

return {
  { Meta = Meta },
  { Div = Div, Span = Span },
}
