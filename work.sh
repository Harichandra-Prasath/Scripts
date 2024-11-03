#!/bin/bash

dir=$(fd -t d --max-depth 1 . '/home/hcp_0/' | fzf-tmux -p --reverse)

# If empty, exit
if [ "$dir" = "" ]; then
	exit
fi


# Split to get the name for session and window
IFS='/'
read -a paths<<<"$dir"

p_len=${#paths[@]}
_name=${paths[p_len-1]}

# Create a new session and switch current client
tmux switchc -t  `tmux -u new-session -c "$dir" -s "$_name" -n "$_name" -dP`

sleep 0.3

# Send VsCode keys
tmux send-keys -t "$_name":"$_name" "code ." Enter

