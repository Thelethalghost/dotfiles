[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug zsh-users/zsh-autosuggestions
plug zap-zsh/supercharge
# plug zap-zsh/zap-prompt
plug zsh-users/zsh-syntax-highlighting
plug devadathanmb/zap-robbyrussell
plug Aloxaf/fzf-tab
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
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
bindkey -e

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(zoxide init zsh)"
alias cd="z"
alias create-venv="python3 -m venv .venv"
alias source-venv="source .venv/bin/activate"
alias pipp="python -m pip"
function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -z -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '^k' sesh-sessions
bindkey -M vicmd '^k' sesh-sessions
bindkey -M viins '^k' sesh-sessions
alias suspe="systemctl suspend"
export PATH="/home/linux/.bun/bin:$PATH"

export PATH=$PATH:/home/linux/.spicetify
