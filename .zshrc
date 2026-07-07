export PATH="$(brew --prefix rustup)/bin:$PATH"

export CLICOLOR=1

autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(mise activate zsh)"

