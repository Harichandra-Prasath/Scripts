#!/bin/bash

L=20
NB='#1d1f21'
NF='#c5c8c6'
SB='#81a2be'
SF='#1d1f21'
FONT='Cousine-12'


WDIR=$HOME/texts/
TWSPACE=2
BASE_SESSION=0
TERMINAL=st

function cool_dmenu() {
dmenu -i -fn $FONT -l $L -nb $NB -nf $NF -sb $SB -sf $SF -p "$1" $2 
}


function window_manager() {
	tmux new-window -t $BASE_SESSION:1 -n "noter"
	tmux send-keys -t "$BASE_SESSION:noter" "nvim $1" C-m
	tmux select-window -t "$BASE_SESSION:noter"
}


function new_session_manager() {
	$TERMINAL -e bash -c "tmux new-session -d -s $BASE_SESSION"
	window_manager "$1"
	$TERMINAL -e bash -c "tmux attach -t $BASE_SESSION"
}

function noter() {
	
	CHOICE="$(echo -e "New\n$(command ls -t1 "$WDIR")" | cool_dmenu )"	
	
	# exit safe if no choice
	if [ "$CHOICE" = "" ]; then
		exit 0	
	elif [ "$CHOICE" = "New" ]; then
		CHOICE="$(echo "" | cool_dmenu "Enter a name: " <&-)" || exit 0			
	fi

	# Switch to the Terminal workspace
	i3-msg "workspace "$ws$TWSPACE"" > /dev/null 2>&1
	
	# Try to check for the tmux session	
	if ! tmux switch-client -t $BASE_SESSION; then 
		new_session_manager "$WDIR$CHOICE"	
	else
		window_manager "$WDIR$CHOICE"
	fi
	
	

}

noter
