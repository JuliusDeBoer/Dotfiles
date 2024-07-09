#########
# zshrc #
#########

path=("${HOME}/.cargo/bin" $path)

export ZSH=$HOME/.zsh
export HISTFILE=$ZSH/zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export HISTORY_IGNORE="(ls|la|ll|lsd|
                        q |c|
                        cd)"

setopt HIST_IGNORE_ALL_DUPS

GPG_TTY=$(tty)
export GPG_TTY

eval "$(starship init zsh)"

source $ZSH/zsh-syntax-highlighting-catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.aliases

if command -v zoxide > /dev/null; then
	eval "$(zoxide init zsh)"
fi

if command -v nvim > /dev/null; then
	export EDITOR=$(which nvim)
fi

autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|wezterm*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey "^[[3~" delete-char

export PNPM_HOME="/home/julius/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if command -v nitch > /dev/null; then
	nitch
fi
