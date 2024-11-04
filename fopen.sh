#!/bin/bash

fpath=$(fd -t f . '/home/hcp_0/' | fzf-tmux -p --reverse)

if [ "$fpath" = "" ]; then
	exit
fi


echo "'$fpath'" | xargs code 
