#########
# zshrc #
#########

if command -v lsd &> /dev/null; then
    alias ls=lsd
fi

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

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

if command -v pfetch > /dev/null; then
	#echo
	#PF_INFO="              \
	#	ascii              \
	#	title              \
	#	os                 \
	#	host               \
	#	uptime             \
	#"                      \
	#PF_COLOR=1             \
	#PF_COL1=4              \
	#PF_COL2=9              \
	#PF_COL3=1              \
	#PF_ASCII="Catppuccin"  \
    #                       \
	#pfetch
	nitch
fi
