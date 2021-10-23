#!/bin/sh

alias n='nvim'
alias r='ranger'
alias feh='feh --image-bg black -Z -.'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# Changing "ls" to "exa"
alias ls='exa -l --no-user --color=always --group-directories-first'
alias l='exa -la --no-user --git --color=always --group-directories-first'
alias ll='exa -lah --git --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# pacman and yay
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua'                          # update only AUR pkgs (yay)

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'

# git
alias g="git"
# bare git repo alias for dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

