-- abstract.lua
-- Pandoc Lua filter: convert fenced divs with class .abstract
-- to \begin{abstract}...\end{abstract} in LaTeX output.

function Div(el)
  if el.classes:includes("abstract") then
    local content = pandoc.write(pandoc.Pandoc(el.content), "latex")
    return pandoc.RawBlock("latex",
      "\\begin{abstract}\n" .. content .. "\\end{abstract}")
  end
end
