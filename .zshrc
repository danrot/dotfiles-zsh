# GENERAL OPTIONS
setopt AUTOCD                                           
setopt EXTENDEDGLOB
setopt NOMATCH
setopt NOTIFY

unsetopt BEEP

# HISTORY
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt NO_HIST_BEEP

# KEY BINDINGS
bindkey -e
bindkey '\e[A' history-beginning-search-backward        # down
bindkey '\e[B' history-beginning-search-forward         # up
bindkey '^[[3~' delete-char                             # del
bindkey '^[[1;5C' forward-word                          # ctrl + left
bindkey '^[[1;5D' backward-word                         # ctrl + right
bindkey '^[OH' beginning-of-line                        # pos1
bindkey '^[OF' end-of-line                              # end



# COMPLETION
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
