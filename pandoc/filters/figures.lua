-- figures.lua
-- Pandoc Lua filter: inject \Description{} for ACM accessibility compliance.
--
-- For Pandoc-style figures (![alt](path){#fig:label}), reads a `description`
-- attribute and emits \Description{text} inside the figure environment.
-- Falls back to caption text if no description attribute is provided.
-- Raw LaTeX figure blocks are untouched (manage \Description{} manually).
--
-- Markdown syntax:
--   ![Caption.](img.pdf){#fig:label description="Alt-text for accessibility."}
--
-- Note: Pandoc places #id on the Figure element but key=value attributes on
-- the Image element inside the Figure. This filter reads from the Image.
-- The \Description{} is appended as a RawInline after the Image to avoid
-- triggering Pandoc's minipage layout for multi-block figures.

function Figure(el)
  -- Find the Image element inside the Figure to read its attributes
  local desc = nil
  local found_img = false

  for _, block in ipairs(el.content) do
    if block.content then  -- Plain or Para
      for i, inline in ipairs(block.content) do
        if inline.t == "Image" then
          found_img = true
          if inline.attr.attributes.description then
            desc = inline.attr.attributes.description
            inline.attr.attributes.description = nil
          end
          if not desc then
            -- Fall back to plain-text caption
            if el.caption and el.caption.long and el.caption.long[1] then
              desc = pandoc.utils.stringify(el.caption.long[1].content)
            end
          end
          if desc and desc ~= "" then
            -- Insert \Description{} as RawInline right after the Image
            local raw = pandoc.RawInline("latex",
              "\n\\Description{" .. desc .. "}")
            table.insert(block.content, i + 1, raw)
          end
          break
        end
      end
    end
    if found_img then break end
  end

  if found_img then return el end
  return nil
end
