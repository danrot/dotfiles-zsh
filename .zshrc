# GENERAL OPTIONS
[[ -z "$PS1" ]] && return

setopt AUTOCD                                           
setopt EXTENDEDGLOB
setopt NOMATCH
setopt NOTIFY

unsetopt BEEP

# PROMPTS
setopt PROMPT_SUBST
autoload -U colors && colors
PS1=' %{$fg_bold[cyan]%}%~ %(?:%{$fg_bold[green]%}$:%{$fg_bold[red]%}$) %{$reset_color%}'

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
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit

# DIRECTORIES
alias ls='ls --color'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lh='ls -h'
alias lla='ls -la'
alias llh='ls -lh'
alias llha='ls -lha'

# FILES
alias vi='vim'

# INCLUDES
source ~/.dotfiles/zsh/git/config.zsh
source ~/.dotfiles/zsh/git/aliases.zsh
