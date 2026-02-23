# ============================================================================
# ZAP PLUGIN MANAGER
# ============================================================================
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

FUNCNEST=100

# Plugins
plug zsh-users/zsh-autosuggestions
plug zap-zsh/supercharge
plug zsh-users/zsh-syntax-highlighting
plug devadathanmb/zap-robbyrussell
plug Aloxaf/fzf-tab
plug zap-zsh/vim

# ============================================================================
# KEY BINDINGS
# ============================================================================
bindkey -v
bindkey '^[[Z' autosuggest-accept

# ============================================================================
# COMPLETIONS (Optimized - rebuilds cache only once per day)
# ============================================================================
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ============================================================================
# PROMPT & NAVIGATION
# ============================================================================
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# ============================================================================
# ALIASES
# ============================================================================
alias cd="z"
alias ls="eza --icons"
alias vim="nvim"
alias vi="nvim"
alias create-venv="python3 -m venv .venv"
alias source-venv="source .venv/bin/activate"
alias suspend="systemctl suspend"
alias logout="hyprctl dispatch exit"
alias cat="bat --color=always"
alias top="btop"
alias tf="terraform"
alias ktl="kubectl"

# ============================================================================
# ENVIRONMENT VARIABLES & PATH
# ============================================================================
export LANG=en_US.UTF-8
export GH_EDITOR=nvim
export EDITOR=nvim
# Go, Spicetify, Scripts
export PATH="$HOME/.config/scripts:$PATH"
export PATH="$HOME/.spicetify:$PATH"
export PATH="$HOME/go/bin:$PATH"

# PNPM
export PNPM_HOME="/home/nyx/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ============================================================================
# PYTHON (PYENV) - Lazy-loaded for faster startup
# ============================================================================
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# Lazy-load pyenv to speed up shell startup
pyenv() {
    unset -f pyenv
    eval "$(pyenv init - zsh)"
    eval "$(pyenv virtualenv-init -)"
    pyenv "$@"
}

# ============================================================================
# ENVMAN
# ============================================================================
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# ============================================================================
# SDKMAN - Lazy-loaded for faster startup
# ============================================================================
export SDKMAN_DIR="$HOME/.sdkman"

# Lazy-load sdk command
sdk() {
    unset -f sdk
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk "$@"
}

ueks() {
  aws eks update-kubeconfig --region "ap-south-1" --name "$1"
}

eks() {
  local region="ap-south-1"
  local cluster="$1"

  if [[ -z "$cluster" ]]; then
    cluster=$(aws eks list-clusters \
      --region "$region" \
      --query 'clusters[]' \
      --output text | tr '\t' '\n' | fzf --prompt="EKS Cluster > ")
  fi

  [[ -z "$cluster" ]] && return

  aws eks update-kubeconfig \
    --region "$region" \
    --name "$cluster"
}
