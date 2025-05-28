#!/bin/bash

L=15
NB='#1d1f21'
NF='#c5c8c6'
SB='#81a2be'
SF='#1d1f21'
FONT='Cousine-12'


open_menu () {
	dmenu_path | dmenu -i  -fn $FONT -l $L  -nb $NB  -nf  $NF -sb $SB -sf  $SF | xargs -r -d '\n' -I{} sh -c '{} &' 
}

open_menu

