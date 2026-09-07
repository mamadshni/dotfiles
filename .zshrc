# zmodload zsh/zprof

# === must run BEFORE oh-my-zsh so $fpath is complete for compinit ==

eval "$(zoxide init zsh --cmd cd)"
eval "$(/opt/homebrew/bin/brew shellenv)"
typeset -U path PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX=true        # skip the compaudit security check
plugins=(git)

source <(fzf --zsh)
source $ZSH/oh-my-zsh.sh

# === PATH ===
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# === aliases ===
alias proj="cd ~/Desktop/Projects"
alias learn="cd ~/Desktop/Learn"
alias zshconfig="nvim ~/.zshrc"
alias pip="pip3"
alias python="python3"
alias venv="source ~/.venv/bin/activate"
alias ccclaude='ln -sf ~/.claude/settings-claude.json ~/.claude/settings.json'
alias ccadesso='ln -sf ~/.claude/settings-adesso.json ~/.claude/settings.json'
alias ccdefault='ln -sf ~/.claude/settings-default.json ~/.claude/settings.json'

# === nvm: lazy-loaded (only inits on first node/npm/npx/pnpm/corepack/nvm call) ===
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm node npm npx pnpm corepack
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
nvm()      { _load_nvm; nvm "$@"; }
node()     { _load_nvm; node "$@"; }
npm()      { _load_nvm; npm "$@"; }
npx()      { _load_nvm; npx "$@"; }
pnpm()     { _load_nvm; pnpm "$@"; }
corepack() { _load_nvm; corepack "$@"; }

# === completions (static files, no subprocess at startup) ===
# regenerate ng completion once:  ng completion script > ~/.ng-completion.zsh
[ -s ~/.ng-completion.zsh ] && source ~/.ng-completion.zsh
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# === compile the compdump to bytecode for faster loads ===
{
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# zprof
