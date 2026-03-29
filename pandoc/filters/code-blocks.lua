-- code-blocks.lua
-- Pandoc Lua filter: convert fenced code blocks to lstlisting environments.
--
-- Languages with a \lstdefinestyle in preamble.tex get style= (which bundles
-- language= plus formatting).  All others get a plain language= option.
--
-- Supports optional Pandoc attributes:
--   caption="..."   -> lstlisting caption option
--   #id             -> lstlisting label option

-- Languages that have a matching \lstdefinestyle in preamble.tex.
local styled = {
  refinery = true,
  problem  = true,  -- alias: uses "refinery" style
}

-- Canonical language name (for aliases like problem -> refinery).
local aliases = {
  problem = "refinery",
}

-- Inline [text]{.refi} spans -> \refi{text}
function Span(el)
  if el.classes:includes("refi") then
    local text = pandoc.utils.stringify(el.content)
    return pandoc.RawInline("latex", "\\refi{" .. text .. "}")
  end
end

function CodeBlock(el)
  local lang = el.classes[1] or ""
  local canonical = aliases[lang] or lang

  local opts = {}

  if styled[lang] then
    table.insert(opts, "style=" .. canonical)
  elseif canonical ~= "" then
    table.insert(opts, "language=" .. canonical)
  end

  -- Pass through caption from attributes
  local caption = el.attributes["caption"]
  if caption then
    table.insert(opts, "caption={" .. caption .. "}")
  end

  -- Pass through label from block identifier
  if el.identifier and el.identifier ~= "" then
    table.insert(opts, "label=" .. el.identifier)
  end

  local options = ""
  if #opts > 0 then
    options = "[" .. table.concat(opts, ", ") .. "]"
  end

  -- Pandoc escapes <! sequences in code blocks (HTML declaration heuristic),
  -- producing \! in el.text.  Undo this: lstlisting is verbatim.
  local text = el.text:gsub("\\!", "!")

  return pandoc.RawBlock("latex",
    "\\begin{lstlisting}" .. options .. "\n" ..
    text ..
    "\n\\end{lstlisting}")
end
