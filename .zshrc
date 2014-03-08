# HISTORY
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# ZSH OPTIONS
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep

# KEY BINDINGS
bindkey -e
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# COMPLETION
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit

