#!/bin/bash

# Config editor that lists all the configs and opens in nvim

config_editor () {
	
	file=$(find "$HOME"/.config/i3 "$HOME"/.config/picom "$HOME"/.config/nvim "$HOME"/.config/neofetch "$HOME"/.config/dunst | fzf-tmux -p --reverse)
	# If empty, exit
	if [ "$file" = "" ]; then
		exit
	fi


	nvim "$file"
}

config_editor

