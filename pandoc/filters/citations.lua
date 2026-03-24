-- citations.lua
-- Pandoc Lua filter: resolve %% @CITE: key %% markers to \cite{key}.
--
-- STUB — not yet functional. When the .bib file is set up, this filter
-- will check whether the citation key exists and convert the marker to
-- \cite{key}. Until then, markers.lua handles @CITE as \todo{} items.
--
-- To activate: add --lua-filter=pandoc/filters/citations.lua to build.sh
-- (after markers.lua, so it processes any remaining @CITE markers).

-- Placeholder: no-op filter
return {}
