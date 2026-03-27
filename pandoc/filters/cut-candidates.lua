-- cut-candidates.lua
-- Pandoc Lua filter: convert @CUT-START / @CUT-END region markers to
-- \begin{cutcandidate}...\end{cutcandidate} or strip them.
--
-- Marker syntax (standalone lines in Obsidian Markdown):
--   %% @CUT-START: reason %%
--   ...paragraphs...
--   %% @CUT-END %%
--
-- In draft mode: wraps region in cutcandidate environment (color tint).
-- In submission mode: strips the markers, keeps the text unchanged.
--
-- Usage: pandoc --lua-filter=cut-candidates.lua --metadata mode=draft|submission

local mode = "draft" -- default

function Meta(meta)
  if meta.mode then
    mode = pandoc.utils.stringify(meta.mode)
  end
end

--- Check if a block is a standalone @CUT-START or @CUT-END marker.
-- Returns ("start", reason) or ("end", nil) or nil.
local function parse_cut_marker(block)
  if block.t ~= "Para" then return nil end

  local text = pandoc.utils.stringify(block.content)
  text = text:match("^%s*(.-)%s*$")

  -- Match %% @CUT-START: reason %%
  local reason = text:match("^%%%%@CUT%-START:%s*(.-)%s*%%%%$")
    or text:match("^%%%% @CUT%-START:%s*(.-)%s*%%%%$")
  if reason then
    return "start", reason
  end

  -- Match %% @CUT-END %%
  if text:match("^%%%%@CUT%-END%s*%%%%$")
    or text:match("^%%%% @CUT%-END%s*%%%%$") then
    return "end", nil
  end

  return nil
end

function Blocks(blocks)
  local result = pandoc.List()
  local i = 1

  while i <= #blocks do
    local kind, reason = parse_cut_marker(blocks[i])

    if kind == "start" then
      -- Collect blocks until matching @CUT-END
      local region = pandoc.List()
      i = i + 1
      local depth = 1

      while i <= #blocks and depth > 0 do
        local inner_kind = parse_cut_marker(blocks[i])
        if inner_kind == "start" then
          depth = depth + 1
          region:insert(blocks[i])
        elseif inner_kind == "end" then
          depth = depth - 1
          if depth > 0 then
            region:insert(blocks[i])
          end
          -- depth == 0: consume the @CUT-END, don't add it
        else
          region:insert(blocks[i])
        end
        i = i + 1
      end

      if mode == "submission" then
        -- Keep content, strip markers
        result:extend(region)
      else
        -- Wrap in cutcandidate environment
        local opt = ""
        if reason and reason ~= "" then
          opt = "[" .. reason .. "]"
        end
        result:insert(pandoc.RawBlock("latex",
          "\\begin{cutcandidate}" .. opt))
        result:extend(region)
        result:insert(pandoc.RawBlock("latex",
          "\\end{cutcandidate}"))
      end

    elseif kind == "end" then
      -- Orphan @CUT-END — skip it
      i = i + 1

    else
      result:insert(blocks[i])
      i = i + 1
    end
  end

  return result
end

return {
  { Meta = Meta },
  { Blocks = Blocks },
}