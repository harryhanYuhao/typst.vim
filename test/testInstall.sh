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

