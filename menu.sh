#!/bin/bash


open_menu () {
	dmenu_path | dmenu -i -l 15 -fn 'Cousine-12' -nb '#1d1f21' -nf '#c5c8c6' -sb '#81a2be' -sf '#1d1f21' | xargs -r -d '\n' -I{} sh -c '{} &' 
}

open_menu

