# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
