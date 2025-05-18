[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

FUNCNEST=100

plug zsh-users/zsh-autosuggestions
plug zap-zsh/supercharge

# plug zap-zsh/zap-prompt
plug zsh-users/zsh-syntax-highlighting
plug devadathanmb/zap-robbyrussell
plug Aloxaf/fzf-tab
plug zap-zsh/vim

bindkey -v
bindkey '^[[Z' autosuggest-accept

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
eval "$(starship init zsh)"
alias logout="hyprctl dispatch exit"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#zoxide
eval "$(zoxide init zsh)"

#Aliases
alias cd="z"
alias create-venv="python3 -m venv .venv"
alias source-venv="source .venv/bin/activate"
alias suspe="systemctl suspend"
export PATH="$HOME/.config/scripts:$PATH"
export PATH="$HOME/.spicetify:$PATH"
export PATH="$HOME/go/bin:$PATH"
alias vim="nvim"
alias vi="nvim"
alias ecr-login="aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 783764618939.dkr.ecr.ap-south-1.amazonaws.com"

# pnpm
export PNPM_HOME="/home/nyx/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/nyx/.bun/_bun" ] && source "/home/nyx/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export ENCORE_INSTALL="/home/nyx/.encore"
export PATH="$ENCORE_INSTALL/bin:$PATH"

#PHP
export PATH="/home/nyx/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/nyx/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export GH_EDITOR=nvim
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
