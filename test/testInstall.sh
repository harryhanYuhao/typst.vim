#!/bin/bash

if [[ -d $HOME/.vim/ || -f $HOME/.vimrc ]]; then
	echo "this script is not for production. Only for TESTING!"
	echo "It was create a new vimrc file and sabotage your previous cnfig"
	echo "are you sure to continue?"
	read input
	if [[ $input == "y" ]]; then
		echo "continue"
		unset input
	else
		exit 1
	fi
fi

echo "Back up will be created, but not backup of backup"

mv $HOME/.vim/ $HOME/.vim.bak/
mv $HOME/.vimrc $HOME/.vimrc.bak
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/vimrc --create-dirs \
	https://raw.githubusercontent.com/harryhanYuhao/typst.vim/main/test/minimalVimrc
