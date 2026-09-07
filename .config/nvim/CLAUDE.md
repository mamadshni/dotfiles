# LazyVim Config — Claude Code Instructions

## Model Strategy
Start Claude Code with: `claude --model opusplan`
- **Plan phase** → Opus (architecture, research, decisions)
- **Execute phase** → Sonnet (writing code)
- Use `/model haiku` for quick one-off questions to save quota

## Stack
- Neovim (latest stable), LazyVim starter pack
- Lua (Stylua formatting, `stylua.toml` already present)

## File Structure Rules
```
~/.config/nvim/
├── init.lua          ← NEVER modify this file
├── lua/
│   ├── config/
│   │   ├── options.lua    ← vim options only
│   │   ├── keymaps.lua    ← global keymaps only
│   │   ├── autocmds.lua   ← autocommands only
│   │   └── lazy.lua       ← lazy.nvim bootstrap (don't touch)
│   └── plugins/
│       └── <one file per plugin or feature group>.lua
```

**Rules:**
- One plugin = one file in `lua/plugins/`. Name it after the plugin (e.g. `neo-tree.lua`, `telescope.lua`).
- Config (opts, keys, event) lives inside the plugin file, not in `config/`.
- Never touch `init.lua`.

## Starter Pack — What's Already Included
LazyVim starter includes these by default (do NOT re-add):
- `lazy.nvim` (plugin manager)
- `LazyVim` core (which bundles: `nvim-lspconfig`, `nvim-cmp`, `nvim-treesitter`, `telescope.nvim`, `neo-tree.nvim`, `which-key.nvim`, `lualine.nvim`, `noice.nvim`, `tokyonight`, `mason.nvim`, `conform.nvim`, `flash.nvim`)

Before adding a plugin, check: `:Lazy` — it might already be there.

## Coding Standards
- Always use the latest Neovim API (`vim.keymap.set`, `vim.api.*`, not legacy `vim.cmd` unless necessary)
- Use `opts = {}` over `config = function() require("x").setup({}) end` when possible
- Lazy-load via `event`, `ft`, or `keys` — never `lazy = false` unless required
- No inline `require` chains; keep plugin files readable

## Changelog (Living Docs)
<!-- Claude Code: append entries here after every change -->
<!-- Format: `- YYYY-MM-DD: <what changed> (<filename>)` -->
