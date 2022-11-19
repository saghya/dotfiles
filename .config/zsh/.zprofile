export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/scripts:${HOME}/.local/scripts/blocks"
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt5ct

export TERM="xterm-256color"
export HISTFILE="$HOME"/.config/zsh/.zsh_history
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="google-chrome-stable"
export MANPAGER="nvim +Man!"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	  exec startx >/dev/null 2>&1
fi

