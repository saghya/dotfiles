export ZDOTDIR=~/.config/zsh

typeset -U PATH path
path=("$HOME/.local/bin" ~/.local/scripts "$path[@]")
export PATH
