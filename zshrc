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

SPACESHIP_RUST_SYMBOL=" "
SPACESHIP_DOCKER_SYMBOL=" "
SPACESHIP_CHAR_SYMBOL="λ "

SPACESHIP_EXEC_TIME_ELAPSED=5
SPACESHIP_EXEC_TIME_PRECISION=1

SPACESHIP_PROMPT_ORDER=(
	user
	host
	dir
	node
	rust
	package
	docker git
	line_sep
	char
)

SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always

source $ZSH/zsh-syntax-highlighting-catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source $ZSH/spaceship-prompt/spaceship.zsh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.aliases

if command -v zoxide > /dev/null; then
	eval "$(zoxide init zsh)"
fi

if command -v nvim > /dev/null; then
	export EDITOR=$(which nvim)
fi

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

if command -v nitch > /dev/null; then
	nitch
fi
