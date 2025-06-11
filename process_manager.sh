#!/bin/bash

L=20
NB='#1d1f21'
NF='#c5c8c6'
SB='#81a2be'
SF='#1d1f21'
FONT='Cousine-12'
H=175
W=500

function cool_dmenu() {
dmenu -i -fn $FONT -l $L -nb $NB -nf $NF -sb $SB -sf $SF
}




function process_manager() {
	
	while true
	do
		selection="$(ps -u "$USER" -o pid,comm,%cpu,%mem --sort=pid | cool_dmenu)"
		
		if [ "$selection" = "" ]; then
			exit 0  
		fi

		PID=$(echo "$selection" | awk '{print $1}')
		CHOICE="$(echo -e "Info\nKill" | cool_dmenu )"
		
		if [ "$CHOICE" = "Info" ]; then
			# Create a Info table
			info=$(ps -p "$PID" -o pid= -o user=  -o %mem= -o %cpu= -o cmd= | awk '{
			    pid=$1; user=$2; mem=$3; cpu=$4;
			    # Reconstruct full command from $5 onward
			    cmd="";
			    for (i=5; i<=NF; i++) {
				cmd = cmd $i " ";
			    }
			    printf " PID: %s\nUser: %s\n%%MEM: %s\n%%CPU: %s\n CMD: %s\n", pid, user, mem, cpu, cmd;}')
			echo "$info" | zenity --text-info  --width=$W --height=$H --no-wrap
		elif [ "$CHOICE" = "Kill" ]; then
			kill -9 "$PID"
		else
			break
		fi
	done
}

process_manager
