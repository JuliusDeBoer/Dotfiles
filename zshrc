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
	gnu_screen
	java node php
	dotnet python bun
	ruby elixir deno swift
	golang perl rust haskell
	scala lua dart julia
	crystal conda vlang ocaml
	kubectl ansible
	terraform package
	docker git hg
	line_sep
	sudo
	char
)

SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always

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
