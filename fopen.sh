#!/bin/bash
                                                                                                │
fpath=$(fd -t f . '/home/hcp_0/' | fzf-tmux -p --reverse)

if [ "$fpath" = "" ]; then
	exit
fi

IFS='/'
read -a paths<<<"$fpath"

p_len=${#paths[@]}
f_name=${paths[p_len-1]}


#If last name contains spaces it needs to be taken care
IFS='\'
read -a parts<<<"$f_name"

echo ${parts[@]}
f_len=${#parts[@]}

echo "$f_len"
