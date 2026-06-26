export PATH="$(brew --prefix rustup)/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# 컬러 출력
export CLICOLOR=1

# 기본 에디터
export EDITOR="nvim"
export VISUAL="nvim"

# Vim 별칭
alias vi="nvim"
alias vim="nvim"

# 자동 완성
autoload -Uz compinit
compinit

# starship 활성화
eval "$(starship init zsh)"

