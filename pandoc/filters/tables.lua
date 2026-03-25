-- tables.lua
-- Pandoc Lua filter: convert Table AST to \begin{tabular} with booktabs rules.
--
-- Why: Pandoc emits longtable by default, which is incompatible with
-- two-column layouts (ACM sigconf). This filter emits bare tabular
-- wrapped in \begin{center} — no float, matching longtable's inline behavior.
--
-- Requires: booktabs (loaded by acmart.cls)

--- Render a list of Blocks to a LaTeX string.
local function blocks_to_latex(blocks)
  local doc = pandoc.Pandoc(blocks)
  local result = pandoc.write(doc, "latex")
  -- Trim trailing whitespace/newlines
  return (result:gsub("%s+$", ""))
end

--- Render a single table cell to a LaTeX string.
local function cell_to_latex(cell)
  return blocks_to_latex(cell.contents)
end

--- Convert a Row (header or body) to a LaTeX row string.
local function row_to_latex(row)
  local cells = {}
  for _, cell in ipairs(row.cells) do
    table.insert(cells, cell_to_latex(cell))
  end
  return table.concat(cells, " & ") .. " \\\\"
end

function Table(tbl)
  -- Extract column alignments
  local aligns = {}
  for _, colspec in ipairs(tbl.colspecs) do
    local a = colspec[1]
    if a == pandoc.AlignRight then
      table.insert(aligns, "r")
    elseif a == pandoc.AlignCenter then
      table.insert(aligns, "c")
    else
      table.insert(aligns, "l")
    end
  end

  local lines = {}
  table.insert(lines, "\\begin{center}")
  table.insert(lines, "\\begin{tabular}{" .. table.concat(aligns) .. "}")
  table.insert(lines, "\\toprule")

  -- Header rows
  for _, headerRow in ipairs(tbl.head.rows) do
    table.insert(lines, row_to_latex(headerRow))
  end
  table.insert(lines, "\\midrule")

  -- Body rows
  for _, body in ipairs(tbl.bodies) do
    for _, row in ipairs(body.body) do
      table.insert(lines, row_to_latex(row))
    end
  end

  table.insert(lines, "\\bottomrule")
  table.insert(lines, "\\end{tabular}")
  table.insert(lines, "\\end{center}")

  return pandoc.RawBlock("latex", table.concat(lines, "\n"))
end
