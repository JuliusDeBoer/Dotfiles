#!/usr/bin/bash
#############################################################################
# ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗        ███████╗██╗  ██╗ #
# ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║        ██╔════╝██║  ██║ #
# ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║        ███████╗███████║ #
# ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║        ╚════██║██╔══██║ #
# ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██╗███████║██║  ██║ #
# ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝ #
#############################################################################
# Create symlinks for dotfiles

DIR="$(pwd)"
BACKUP_DIR="backup"
FILES=(".zshrc" ".gitconfig" ".vimrc" ".aliases")

echo "Using backup dir: ${BACKUP_DIR}"
echo

for FILE in ${FILES[@]}; do
	echo -ne "${FILE}...\r"
	if [ -f ${HOME}/${FILE} ]; then
		mkdir -p "${BACKUP_DIR}"
		cp -H "${HOME}/${FILE}" "${BACKUP_DIR}/${FILE}"
	fi

	ln -s -f "${DIR}/${FILE}" "${HOME}/${FILE}"
	
	echo -ne "${FILE}: Done!\r\n"
done

if [ ! -d "${HOME}/.zsh/zsh-autocomplete" ]; then
	git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git ${HOME}/.zsh/zsh-autocomplete
fi

if [ ! -d "${HOME}/.zsh/zsh-syntax-highlighting" ]; then
	git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh/zsh-syntax-highlighting
fi

if [ ! -d "${HOME}/.zsh/NerdFetch" ]; then
	git clone --depth 1 https://github.com/ThatOneCalculator/NerdFetch.git ${HOME}/.zsh/NerdFetch
fi

if [ ! -d "${HOME}/.zsh/spaceship-prompt" ]; then
	git clone --depth 1 https://github.com/spaceship-prompt/spaceship-prompt.git ${HOME}/.zsh/spaceship-prompt
fi

if [ ! -f "/usr/bin/zoxide" ]; then
	echo "Zoxide isnt installed: Installing now..."
	if [ -f "/usr/bin/pacman" ]; then
		echo "Pacman found. Installing zoxide with pacman"
		sudo pacman -S zoxide
	elif [ -f "/usr/bin/apt" ]; then
		echo "Apt found. Installing zoxide with apt"
		sudo apt install zoxide
	else
		echo "Installing using curl"
		curl -sS https://webinstall.dev/zoxide | bash
	fi
fi

if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
	echo "Installing vim-plug"
	 curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
