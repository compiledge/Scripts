#!/bin/bash

var="󰼩 Suspend
 Hibernate
󰜉 Reboot
 Power-off
󰜗 Hibrid-sleep
󱩱 Suspend-then-hibernate
"

command=$(echo -e "$var" | rofi -dmenu -i -sort)

case $command in

"󰼩 Suspend")
	systemctl suspend
	;;

"󰜉 Reboot")
	systemctl reboot
	;;

" Power-off")
	systemctl poweroff
	;;

" Hibernate")
	systemctl hibernate
	;;

"󰜗 Hibrid-sleep")
	systemctl hybrid-sleep
	;;

"󱩱 Suspend-then-hibernate")
	systemctl suspend-then-hibernate
	;;

esac
