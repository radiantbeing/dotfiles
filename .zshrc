export PATH="$(brew --prefix rustup)/bin:$PATH"

export CLICOLOR=1
export EDITOR="nvim"
export VISUAL="nvim"

alias vi="nvim"
alias vim="nvim"

autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(mise activate zsh)"

