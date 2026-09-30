# Dotfiles — Claude Code Instructions

Personal macOS dotfiles, symlinked into `~` with GNU Stow (`stow .` from repo root).

## Golden Rule: Read the Docs First

Before changing **any** tool's config, research it. Never rely on memory alone — tools change fast and options get renamed/deprecated.

1. **Search the internet** (WebSearch) for the tool's current official docs and best practices.
2. **Read the official docs** (WebFetch) for the exact feature/option being touched. Prefer official sources over blogs/forums.
3. **Check installed version** (e.g. `nvim --version`, `zellij --version`) and make sure docs match it.
4. **Follow best practices** from the docs — idiomatic config, no deprecated options, no hacks when a native option exists.
5. **Cite** the doc URL(s) used in the reply when explaining a change.

If docs and existing config disagree, flag it and prefer the docs.

## Official Docs per Tool

| Tool | Config path | Docs |
|---|---|---|
| Neovim | `.config/nvim/` | https://neovim.io/doc/user/ |
| LazyVim | `.config/nvim/` | https://www.lazyvim.org/ |
| lazy.nvim | `.config/nvim/lua/config/lazy.lua` | https://lazy.folke.io/ |
| Zellij | `.config/zellij/config.kdl` | https://zellij.dev/documentation/ |
| tmux | `.config/tmux/tmux.conf` | https://github.com/tmux/tmux/wiki · `man tmux` |
| Ghostty | `.config/ghostty/` | https://ghostty.org/docs |
| AeroSpace | `aerospace/aerospace.toml` | https://nikitabobko.github.io/AeroSpace/guide |
| Hammerspoon | `.hammerspoon/init.lua` | https://www.hammerspoon.org/docs/ |
| Zsh | `.zshrc` | https://zsh.sourceforge.io/Doc/ |
| GNU Stow | repo root | https://www.gnu.org/software/stow/manual/ |

For any tool not listed: search for its official docs first, then add a row here.

## Tool-specific Instructions

- Neovim: also follow `.config/nvim/CLAUDE.md`.

## Keybinding Changes: Check Conflicts, Ask First

Before adding or changing **any** shortcut (AeroSpace, Zellij, Neovim, Ghostty, Hammerspoon, tmux, Zsh, …):

1. Check the new key against every layer. Keys are handled in this order: AeroSpace / Hammerspoon (global) → Ghostty → Zellij → Neovim / shell. Include tool defaults, not just this repo's config (Zellij merges defaults unless `clear-defaults=true`; LazyVim ships its own keymaps).
2. Report the conflicts to the user first: the key, what each layer does with it, and which layer wins. If nothing clashes, say so.
3. Only edit after the user approves.

## Conventions

- Keep configs minimal and commented only where intent is non-obvious.
- Don't break Stow layout: files must live at the path they'd have relative to `~`.
- After editing, validate when possible (e.g. `zellij setup --check`, `tmux source-file`, `nvim --headless "+Lazy! sync" +qa`, `ghostty +validate-config`).
