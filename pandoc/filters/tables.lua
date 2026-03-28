-- tables.lua
-- Pandoc Lua filter: emit booktabs tabularx/tabular instead of longtable.
--
-- Why: Pandoc emits longtable by default, which is incompatible with
-- two-column layouts (ACM sigconf). This filter reads the table AST
-- and emits tabularx (≥4 columns) or tabular (<4), wrapped in a
-- table float when a caption is present. Pandoc's native caption and
-- label handling is preserved.
--
-- Requires: booktabs (loaded by acmart.cls), tabularx, array (in preamble)

--- Render Inlines to a LaTeX string.
local function inlines_to_latex(inlines)
  return pandoc.write(pandoc.Pandoc({pandoc.Plain(inlines)}), "latex")
    :gsub("%s+$", "")
end

--- Render Blocks to a LaTeX string.
local function blocks_to_latex(blocks)
  local result = pandoc.write(pandoc.Pandoc(blocks), "latex")
  return (result:gsub("%s+$", ""))
end

--- Render a single table cell.
local function cell_to_latex(cell)
  return blocks_to_latex(cell.contents)
end

--- Render a row as a LaTeX table row.
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

  -- Build column spec
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
  if use_tabularx and not has_l then
    use_tabularx = false
  end

  -- Extract caption from AST
  local caption_latex = nil
  if tbl.caption and tbl.caption.long and #tbl.caption.long > 0 then
    caption_latex = blocks_to_latex(tbl.caption.long)
    caption_latex = caption_latex:gsub("%s+$", "")
  end

  -- Extract identifier for \label (from table attributes if present)
  local label_latex = nil
  if tbl.attr and tbl.attr.identifier and tbl.attr.identifier ~= "" then
    label_latex = "\\label{" .. tbl.attr.identifier .. "}"
  end

  local lines = {}
  local has_caption = caption_latex and caption_latex ~= ""

  if has_caption then
    table.insert(lines, "\\begin{table}")
    -- Emit \caption{...} with \label inside if we have one
    if label_latex then
      table.insert(lines, "\\caption{" .. caption_latex .. "}" .. label_latex)
    else
      table.insert(lines, "\\caption{" .. caption_latex .. "}")
    end
  else
    table.insert(lines, "\\begin{center}")
  end
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

  if has_caption then
    table.insert(lines, "\\end{table}")
  else
    table.insert(lines, "\\end{center}")
  end

  return pandoc.RawBlock("latex", table.concat(lines, "\n"))
end
