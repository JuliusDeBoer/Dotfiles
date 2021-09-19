;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    ███████╗███████╗██╗  ██╗██████╗  ██████╗ ;
;    ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝ ;
;      ███╔╝ ███████╗███████║██████╔╝██║      ;
;     ███╔╝  ╚════██║██╔══██║██╔══██╗██║      ;
; ██╗███████╗███████║██║  ██║██║  ██║╚██████╗ ;
; ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; requirements:
; oh-my-zsh	https://github.com/ohmyzsh/ohmyzsh
; p10k (oh-my-zsh)	https://github.com/romkatv/powerlevel10k
; zsh-syntax-highlighting (oh-my-zsh)	https://github.com/zsh-users/zsh-syntax-highlighting.git

if [[ -n $DISPLAY ]] && [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:~/.local/bin

export ZSH="/home/julius/.oh-my-zsh"

source ~/.aliases

if [ -f /usr/bin/doas ]; then
	alias sudo=doas
fi

export ZSH_HIGHLIGHT_HIGHLIGHTERS="main brackets pattern cursor"

if [[ -n $DISPLAY ]]; then
	export ZSH_THEME="powerlevel10k/powerlevel10k"
else
	export ZSH_THEME="awesomepanda"
fi

DISABLE_UPDATE_PROMPT="true"

COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh