#!/bin/bash

L=20
NB='#1d1f21'
NF='#c5c8c6'
SB='#81a2be'
SF='#1d1f21'
FONT='Cousine-12'


function process_manager() {
	
	PID="$(ps -u "$USER" -o pid,comm --sort=pid | dmenu -i -fn $FONT -l $L -nb $NB -nf $NF -sb $SB -sf $SF | awk '{print $1}')"
	kill -9 "$PID"
}

process_manager
