#!/bin/bash

# Reading the directories database (bash/zsh)
dirList=$(< $HOME/.config/rofi/dir-db.txt)

# Search directories in the $HOME
# rofi -dmenu -i 	-> read the dirList (ignore case/sort)
#
# Pick one directory from list
mypath=$(echo "$dirList" | rofi -dmenu -i -sort)

# $1 -> The target application to receive the path
if [ -n "$mypath" ]; then
	case $1 in
		"ranger")
			kitty -e $1 "$mypath"
		;;

		"nemo")
			$1 "$mypath"
		;;

		"kitty")
			$1 -d "$mypath"
		;;
	esac
fi
