export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/scripts:${HOME}/.local/scripts/blocks"
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt6ct

export TERM="xterm-256color"
export HISTFILE="$HOME"/.config/zsh/.zsh_history
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="google-chrome-stable"
export MANPAGER="nvim +Man!"

export XSECURELOCK_BACKGROUND_COLOR="#171727"
export XSECURELOCK_AUTH_BACKGROUND_COLOR="#7287FD"
export XSECURELOCK_AUTH_FOREGROUND_COLOR="#0E0E1E"
export XSECURELOCK_PASSWORD_PROMPT="asterisks"
export XSECURELOCK_SHOW_KEYBOARD_LAYOUT=0

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	  exec startx "$HOME"/.config/X11/xinitrc >/dev/null 2>&1
fi

