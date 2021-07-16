# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -n $DISPLAY ]] && [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ $(cd ~/.dotfiles && git pull -q | grep "Already up to date." -q) ]; then
	source ~/.zshrc
	return
fi

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin

export ZSH="/home/julius/.oh-my-zsh"

if [[ -n $DISPLAY ]]; then
	export ZSH_THEME="powerlevel10k/powerlevel10k"
else
	export ZSH_THEME="awesomepanda"
fi

DISABLE_UPDATE_PROMPT="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

ZSH_AUTOSUGGEST_STRATEGY=(completion)

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
eval $(thefuck --alias fuck)

if command -v colorls >> /dev/null; then
	alias ls="colorls"
fi

pfetch

echo '\e[1;34m'"Welcome $(whoami)!"'\e[1;37m'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
