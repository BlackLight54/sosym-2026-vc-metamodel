# Ingesting Notion and Todoist

The Zettelkasten is wired to pull from Notion and Todoist via MCP servers declared in the
repo-root `.mcp.json`. This document is the runbook.

## Why this is a separate, follow-up step

MCP servers in `.mcp.json` are loaded **at Claude Code session start**. The session that *adds*
`.mcp.json` cannot use the servers it just declared. So ingestion runs in a later session, after
tokens are set and the session is restarted.

## One-time setup

1. **Notion.** Create an internal integration at <https://www.notion.so/my-integrations>, copy its
   secret, and **share the relevant Notion pages/databases with the integration** (otherwise the
   API returns nothing). Export the secret:
   ```bash
   export NOTION_TOKEN="ntn_xxx"
   ```
2. **Todoist.** Copy the API token from Todoist → Settings → Integrations → Developer:
   ```bash
   export TODOIST_API_TOKEN="xxxx"
   ```
3. Restart the Claude Code session so the `notion` and `todoist` MCP servers load. Confirm their
   tools are available before pulling.

> Network caveat: this repo runs in a managed remote environment whose network policy may block
> `npx` installs or outbound calls to `api.notion.com` / `api.todoist.com`. If the servers fail to
> reach the APIs, use the file-export fallback below.

## Pull → inbox → distill

1. **Pull** Notion pages and Todoist tasks/projects into the inbox, one raw file per item:
   - `inbox/notion/<page-title>.md`
   - `inbox/todoist/<project-or-section>.md`
2. **Distill.** Convert each raw item into atomic notes following `README.md`:
   - A Notion knowledge page → one or more `C-` concept notes (or `S-` if it is a literature note).
   - A Todoist project/task that encodes a research thread or open problem → a `Q-` question note;
     a task that records a settled design choice → a `D-` decision note.
   - **Never** leave a raw dump as a note. One idea per note, tagged from `tags.md`, linked into a MOC.
   - Tag ingested notes `prov/notion` or `prov/todoist` so their origin stays visible.
3. **Link.** Add each new note to the relevant MOC and set reciprocal `related` links.
4. **Verify.** Run `./check_links.sh`; resolve orphans and dangling links.

## File-export fallback (if MCP is blocked)

Export Notion as Markdown (Notion: `•••` → Export → Markdown & CSV) and Todoist as CSV/JSON
(per-project Export, or the REST API), drop the files into `inbox/notion/` and `inbox/todoist/`,
and run the same distill step from the files instead of the MCP tools.
