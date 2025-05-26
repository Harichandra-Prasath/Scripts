#!/bin/bash

fpath=$(fd -t f . "$HOME" | fzf-tmux -p --reverse)

if [ "$fpath" = "" ]; then
	exit
fi


echo "'$fpath'" | xargs nvim 
