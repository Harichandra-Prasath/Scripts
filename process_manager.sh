#!/bin/bash

L=20
NB='#1d1f21'
NF='#c5c8c6'
SB='#81a2be'
SF='#1d1f21'
FONT='Cousine-12'

function cool_dmenu() {
dmenu -i -fn $FONT -l $L -nb $NB -nf $NF -sb $SB -sf $SF
}




function process_manager() {
		
	PID="$(ps -u "$USER" -o pid,comm --sort=pid | cool_dmenu | awk '{print $1}')"
	CHOICE="$(echo -e "Info\nKill" | cool_dmenu )"
	
	if [ "$CHOICE" = "Info" ]; then
		# Create a Info table
		info=$(ps -p "$PID" -o pid= -o ppid= -o user= -o cmd= -o %mem= -o %cpu= | awk '{
		printf "PID --	%s\nUSER --	%s\nCMD --	\"%s\"\nMEMORY --  %s\nCPU --	%s\n", $1, $3, $4, $(NF-1), $NF}')
		echo "$info" | zenity --text-info --title="Process Info" --width=300 --height=300 --no-wrap 
	elif [ "$CHOICE" = "Kill" ]; then
		kill -9 "$PID"
	fi

}

process_manager
