-- tables.lua
-- Pandoc Lua filter: convert Table AST to booktabs tabular/tabularx.
--
-- Why: Pandoc emits longtable by default, which is incompatible with
-- two-column layouts (ACM sigconf). This filter emits:
--   - tabular  (≤3 columns): fits naturally in column width
--   - tabularx (≥4 columns): l-aligned columns become wrapping L columns
--     (raggedright X) so text reflows within \columnwidth
--
-- Requires: booktabs (loaded by acmart.cls), tabularx, array (in preamble)

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
  local ncols = #tbl.colspecs
  local use_tabularx = ncols >= 4

  -- Extract column alignments
  local aligns = {}
  local has_l = false
  for _, colspec in ipairs(tbl.colspecs) do
    local a = colspec[1]
    if a == pandoc.AlignRight then
      table.insert(aligns, "r")
    elseif a == pandoc.AlignCenter then
      table.insert(aligns, "c")
    else
      if use_tabularx then
        table.insert(aligns, "L")
        has_l = true
      else
        table.insert(aligns, "l")
      end
    end
  end

  -- Fall back to plain tabular if no L columns to distribute
  if use_tabularx and not has_l then
    use_tabularx = false
  end

  local lines = {}
  table.insert(lines, "\\begin{center}")
  table.insert(lines, "\\small")

  if use_tabularx then
    table.insert(lines, "\\setlength{\\tabcolsep}{4pt}")
    table.insert(lines, "\\begin{tabularx}{\\columnwidth}{" ..
                         table.concat(aligns) .. "}")
  else
    table.insert(lines, "\\begin{tabular}{" .. table.concat(aligns) .. "}")
  end

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

  if use_tabularx then
    table.insert(lines, "\\end{tabularx}")
  else
    table.insert(lines, "\\end{tabular}")
  end
  table.insert(lines, "\\end{center}")

  return pandoc.RawBlock("latex", table.concat(lines, "\n"))
end
