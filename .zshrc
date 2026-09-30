# zmodload zsh/zprof   # profiling: uncomment together with `zprof` at the bottom

# ── Homebrew ────────────────────────────────────────────────────────────────
# static copy of `brew shellenv zsh` (saves a ~80 ms subprocess per shell);
# must run before oh-my-zsh so $fpath is complete for compinit
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
fpath[1,0]="/opt/homebrew/share/zsh/site-functions"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# ── PATH ────────────────────────────────────────────────────────────────────
typeset -U path PATH
export BUN_INSTALL="$HOME/.bun"
path=(
  $BUN_INSTALL/bin
  $HOME/.local/bin
  $HOME/.dotnet
  $HOME/.dotnet/tools
  /opt/homebrew/bin
  /opt/homebrew/sbin
  $path
)

# ── Environment ─────────────────────────────────────────────────────────────
# lazygit on macOS defaults to ~/Library/Application Support; use the stowed config
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"

# fzf: catppuccin/fzf mocha, bg darkened to crust #11111b (matches ghostty/zellij/nvim)
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#11111B,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# ── Cached init scripts ─────────────────────────────────────────────────────
# `eval "$(tool init)"` spawns a process every shell; cache the output instead.
# Regenerated automatically when the tool's resolved binary path changes (brew upgrade).
_cached_source() {  # usage: _cached_source <name> <cmd> [args...]
  local name=$1; shift
  local bin=${commands[$1]:A} cache=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/$name.zsh
  [[ -n $bin ]] || return
  if [[ ! -s $cache || "$(head -1 $cache)" != "# $bin" ]]; then
    mkdir -p ${cache:h}
    { print -r -- "# $bin"; "$@"; } >| $cache
  fi
  source $cache
}

_cached_source fzf fzf --zsh

# ── oh-my-zsh ───────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX=true   # skip the compaudit security check
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ── Aliases ─────────────────────────────────────────────────────────────────
alias proj="cd ~/Desktop/Projects"
alias learn="cd ~/Desktop/Learn"
alias zshconfig="nvim ~/.zshrc"
alias zj="zellij"

alias pip="pip3"
alias python="python3"
alias venv="source ~/.venv/bin/activate"

alias ccclaude='ln -sf ~/.claude/settings-claude.json ~/.claude/settings.json'
alias ccadesso='ln -sf ~/.claude/settings-adesso.json ~/.claude/settings.json'
alias ccdefault='ln -sf ~/.claude/settings-default.json ~/.claude/settings.json'

# ── nvm (lazy: loads on first nvm/node/npm/npx/pnpm/corepack call) ──────────
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm node npm npx pnpm corepack
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}
for cmd in nvm node npm npx pnpm corepack; do
  eval "$cmd() { _load_nvm; $cmd \"\$@\"; }"
done
unset cmd

# ── Completions (static files, no subprocess at startup) ────────────────────
# regenerate ng completion once:  ng completion script > ~/.ng-completion.zsh
[[ -s ~/.ng-completion.zsh ]] && source ~/.ng-completion.zsh
[[ -s $BUN_INSTALL/_bun ]] && source $BUN_INSTALL/_bun

# ── zoxide: must be last (after compinit), per zoxide docs ──────────────────
_cached_source zoxide zoxide init zsh --cmd cd

# zprof
