###############################################
#    ███████╗███████╗██╗  ██╗██████╗  ██████╗ #
#    ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝ #
#      ███╔╝ ███████╗███████║██████╔╝██║      #
#     ███╔╝  ╚════██║██╔══██║██╔══██╗██║      #
# ██╗███████╗███████║██║  ██║██║  ██║╚██████╗ #
# ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ #
###############################################

if command -v lsd &> /dev/null; then
    alias ls=lsd
fi

export ZSH=$HOME/.zsh
export HISTFILE=$ZSH/zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export HISTORY_IGNORE="(ls|la|ll|lsd
                       |q|c|
                       cd)"

setopt HIST_IGNORE_ALL_DUPS

zstyle ':autocomplete:*' min-input 2

source $ZSH/spaceship-prompt/spaceship.zsh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/.aliases

SPACESHIP_PROMPT_ORDER=(
	user
	host
	git docker pyenv
	line_sep
	dir
	char
)

SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always

eval "$(zoxide init zsh)"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

~/.zsh/NerdFetch/nerdfetch
echo

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
