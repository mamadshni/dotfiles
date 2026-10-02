# Packages

Everything these dotfiles expect on a fresh Mac. Install in order, then run `stow .` from the repo root.

## 1. Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Apps (casks)

| Package | Used for | Config |
|---|---|---|
| `ghostty` | Terminal | `.config/ghostty/` |
| `nikitabobko/tap/aerospace` | Tiling window manager | `aerospace/aerospace.toml` |
| `hammerspoon` | macOS automation | `.hammerspoon/init.lua` |
| `font-fira-code-nerd-font` | Font used by Ghostty (`FiraCode Nerd Font`) and icons in nvim/lazygit | — |

```bash
brew install --cask ghostty hammerspoon font-fira-code-nerd-font
brew install --cask nikitabobko/tap/aerospace
```

## 3. CLI tools (formulae)

| Package | Used for | Config |
|---|---|---|
| `stow` | Symlinks this repo into `~` | `.stow-local-ignore` |
| `neovim` | Editor (LazyVim) | `.config/nvim/` |
| `zellij` | Terminal multiplexer (alias `zj`) | `.config/zellij/` |
| `lazygit` | Git TUI, also opened from nvim | `.config/lazygit/config.yml` |
| `yazi` | Terminal file manager | `.config/yazi/` |
| `fzf` | Fuzzy finder, shell keybindings (`source <(fzf --zsh)`) | `.zshrc` |
| `zoxide` | Smarter `cd` (`zoxide init zsh --cmd cd`) | `.zshrc` |
| `ripgrep` | Search backend for nvim pickers | — |
| `fd` | File finder for nvim pickers | — |
| `gh` | GitHub CLI | — |
| `luarocks` | Lua packages for lazy.nvim plugins | — |
| `python` | `python`/`pip` aliases | `.zshrc` |
| `tmux` | Optional: config kept, zellij is the daily driver | `.config/tmux/tmux.conf` |

```bash
brew install stow neovim zellij lazygit yazi fzf zoxide ripgrep fd gh luarocks python
brew install tmux   # optional
```

## 4. Shell & runtimes (installers, not brew)

| Package | Used for | Install |
|---|---|---|
| Oh My Zsh | Zsh framework (`robbyrussell` theme, `git` plugin) | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |
| nvm | Node version manager (lazy-loaded in `.zshrc`), then `nvm install --lts` | https://github.com/nvm-sh/nvm#installing-and-updating |
| Bun | JS runtime (`~/.bun`) | `curl -fsSL https://bun.sh/install \| bash` |
| .NET SDK | `~/.dotnet/tools` on `PATH` | https://dotnet.microsoft.com/download |

> Oh My Zsh's installer replaces `~/.zshrc`. Run it **before** `stow .`, then delete the generated `~/.zshrc` so stow can link this repo's one.

## 5. Link the dotfiles

```bash
git clone <this repo> ~/.dotfiles
cd ~/.dotfiles && stow .
```

Then:
- Open `nvim` once — lazy.nvim installs all plugins (Catppuccin theme included).
- Start AeroSpace and Hammerspoon, grant them Accessibility permissions in System Settings.

## Themes (no install needed)

Catppuccin Mocha (dark) / Latte (light) everywhere; theme files live in the repo:
- Ghostty: `.config/ghostty/themes/catppuccin-mocha-dark`
- Zellij: `.config/zellij/themes/catppuccin-mocha-dark.kdl`
- Neovim: `catppuccin/nvim` plugin via `.config/nvim/lua/plugins/catppuccin.lua`
- Lazygit: `.config/lazygit/config.yml`
- fzf: `FZF_DEFAULT_OPTS` in `.zshrc`
- Yazi: `.config/yazi/theme.toml` (catppuccin/yazi mocha-blue) + `Catppuccin-mocha.tmTheme` (catppuccin/bat) for code previews
