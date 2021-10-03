###############################################
#    ███████╗███████╗██╗  ██╗██████╗  ██████╗ #
#    ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝ #
#      ███╔╝ ███████╗███████║██████╔╝██║      #
#     ███╔╝  ╚════██║██╔══██║██╔══██╗██║      #
# ██╗███████╗███████║██║  ██║██║  ██║╚██████╗ #
# ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ #
###############################################
# requirements:
# oh-my-zsh	https://github.com/ohmyzsh/ohmyzsh
# p10k (oh-my-zsh)	https://github.com/romkatv/powerlevel10k
# zsh-syntax-highlighting (oh-my-zsh)	https://github.com/zsh-users/zsh-syntax-highlighting.git

if [[ -n $DISPLAY ]] && [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ ! -f ${HOME}/.oh-my-zsh/oh-my-zsh.sh ]; then
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	echo "Done!"
fi

if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
	echo "Installing p10k..."
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	echo "Done!"
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
	echo "Installing zsh-syntax-highlighting..."
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	echo "Done!"
fi

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:~/.local/bin

export ZSH="${HOME}/.oh-my-zsh"


if [ -f /usr/bin/doas ]; then
	alias sudo=doas
fi

if [[ -n $DISPLAY ]]; then
	export ZSH_THEME="powerlevel10k/powerlevel10k"
else
	export ZSH_THEME="awesomepanda"
fi

DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"
export ZSH_HIGHLIGHT_HIGHLIGHTERS="main brackets pattern cursor"


plugins=(
	git
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source ~/.aliases

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh