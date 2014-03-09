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
eval "`dircolors -b`"
zstyle :compinstall filename '/home/daniel/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${LS_COLORS}

autoload -Uz compinit
compinit

# SYSTEM
alias h='history 0'
alias g='grep'

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

# TITLE
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%~\a"}
        preexec () {print -Pn "\e]0;$1\a"}
        ;;
esac

# MAN PAGES
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# INCLUDES
source ~/.dotfiles/zsh/git/config.zsh
source ~/.dotfiles/zsh/git/aliases.zsh
source ~/.dotfiles/zsh/composer/config.zsh
source ~/.dotfiles/zsh/composer/aliases.zsh
source ~/.dotfiles/zsh/symfony/config.zsh
source ~/.dotfiles/zsh/symfony/aliases.zsh
