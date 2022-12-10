#!/bin/sh

alias n="nvim"
alias r="ranger"
alias z="zathura"
alias h="htop"
alias feh="feh --image-bg black -Z -."
alias df="df -h"                          # human-readable sizes
alias du="du -b -h"                       # human-readable sizes
alias free="free -h"                      # human-readable sizes

# Changing "ls" to "exa"
alias ls="exa -l --no-user --color=always --group-directories-first"
alias l="exa -la --no-user --git --color=always --group-directories-first"
alias ll="exa -lah --git --color=always --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"
alias l.="exa -a | egrep "^\.""

# Colorize grep output (good for log files)
alias grep="grep --color=auto"
alias egrep="grep -E --color=auto"
alias fgrep="grep -F --color=auto"

# confirmations
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias ln="ln -i"

# mkdir create parents
alias mkdir="mkdir -pv"

# git
alias g="git"
# bare git repo alias for dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.local/dotfiles/ --work-tree=$HOME"

