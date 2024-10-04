[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug zsh-users/zsh-autosuggestions
plug zap-zsh/supercharge
# plug zap-zsh/zap-prompt
plug zsh-users/zsh-syntax-highlighting
plug devadathanmb/zap-robbyrussell
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
eval "$(starship init zsh)"
alias logout="hyprctl dispatch exit"

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
