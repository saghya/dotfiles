setopt auto_cd
setopt PROMPT_SUBST

HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS

# Basic auto/tab complete:
autoload -Uz compinit promptinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

source "$HOME"/.config/zsh/git-prompt/git-prompt.zsh
PROMPT='%F{blue}%B%40<..<%~%f$(gitprompt) %B%(?.%F{green}>.%F{red}>)%b%f '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### CHANGE TITLE OF TERMINALS
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
        precmd () {
            print -Pn "\033]0;%n@%M:%~\007"
        } 
    ;;
    screen*)
        precmd () {
            print -Pn "\033_%n@$%M:%~\033\\"
        }
    ;;
esac

### Run git fetch when cd'ing into a git repo
chpwd () {
  set -- "$(git rev-parse --show-toplevel 2>/dev/null)"
  # If cd'ing into a git working copy and not within the same working copy
  if [ -n "$1" ] && [ "$1" != "$vc_root" ]; then
    vc_root="$1"
    git fetch
  fi
}
chpwd

### Function extract for common file formats ###
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|exe|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

IFS=$SAVEIFS

### ALIASES ###
source "$HOME"/.config/zsh/alias.sh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source "$HOME"/.config/zsh/system-clipboard/zsh-system-clipboard.zsh

afetch

