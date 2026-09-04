PS1='%F{blue}%B%~%b%f %F{green}❯%f '

HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

autoload -Uz compinit && compinit

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

