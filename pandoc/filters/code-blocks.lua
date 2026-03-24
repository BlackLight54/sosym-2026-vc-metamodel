-- code-blocks.lua
-- Pandoc Lua filter: convert fenced code blocks to lstlisting environments.
--
-- Fenced code blocks with language tags become:
--   \begin{lstlisting}[language=...]
--   ...
--   \end{lstlisting}
--
-- Blocks without a language tag get a plain lstlisting.

function CodeBlock(el)
  local lang = el.classes[1] or ""
  local options = ""
  if lang ~= "" then
    options = "[language=" .. lang .. "]"
  end
  return pandoc.RawBlock("latex",
    "\\begin{lstlisting}" .. options .. "\n" ..
    el.text ..
    "\n\\end{lstlisting}")
end
