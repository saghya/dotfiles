source ~/.config/zsh/.zprofile
export PATH=~/.local/bin:$PATH
export TERM="xterm-256color"
export HISTFILE=~/.config/zsh/.zsh_history

export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='brave'
export MANPAGER='nvim +Man!'

setopt auto_cd
setopt PROMPT_SUBST

HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
autoload -Uz compinit promptinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
compinit
zstyle ':completion:*' menu select

bindkey -e
bindkey  "^[[3~"  delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

source ~/.config/zsh/git-prompt/git-prompt.plugin.zsh
# PROMPT="%F{48}%~%f > "
PROMPT='%{$fg[green]%}%~%f$(git_super_status) > '

alias n='nvim'
alias r='ranger'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Changing "ls" to "exa"
alias ls='exa --color=always --group-directories-first'
alias l='exa -la --no-user --git --color=always --group-directories-first'
alias ll='exa -lah --git --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

pfetch

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

