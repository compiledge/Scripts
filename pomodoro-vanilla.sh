#!/bin/bash


# Variables
tomato="🍅️"
red="\033[0;31m"
green="\033[0;32m"
nc="\033[0;m"

# Default pomodoro variables
w_minutes=25
r_minutes=5
cycles=4
pause_music=false
back_music=false

# Getting arguments with getopt
while getopts "w:r:c:pbh" opt; do
	case $opt in
		w) w_minutes="$OPTARG"
			;;
		r) r_minutes="$OPTARG"
			;;
		c) cycles="$OPTARG"
			;;
		p) pause_music=true
			;;
		b) back_music=true
			;;
		h) echo -e "Usage: ./pomodoro_vanilla.sh [opts]\n"
			echo -e "Opts:"
			echo -e "\t -w \t\t minutes to work"
			echo -e "\t -r \t\t minutes to rest"
			echo -e "\t -c \t\t max cycles"
			echo -e "\t -p \t\t [cmus] stop music after work"
			echo -e "\t -b \t\t [cmus] bring back music after rest"
			echo -e "\nExample:"
			echo -e "\t ./pomodoro_vanilla.sh -w 25 -r 5  -c 4 -p -b"
			exit 1
			;;

		\?) echo "Invalid option -$OPTARG" >&2
			exit 1
			;;
	esac

	case $OPTARG in
		-*) echo "Option $opt needs a valid argument"
			exit 1
			;;
	esac
done

# Calc work timer
w_secs=$(($w_minutes*60))
w_secs=$(($w_secs/10))

# Calc rest timer
r_secs=$(($r_minutes*60))
r_secs=$(($r_secs/10))

echo -e "${red}"
echo -e " ░█▀█░█▀█░█▄█░█▀█░█▀▄░█▀█░█▀▄░█▀█ "
echo -e " ░█▀▀░█░█░█░█░█░█░█░█░█░█░█▀▄░█░█ "
echo -e " ░▀░░░▀▀▀░▀░▀░▀▀▀░▀▀░░▀▀▀░▀░▀░▀▀▀ "
echo -e "${nc}"

for (( i=1; i <= $cycles; i++))
do
	# Work Cycle
	echo -e "Cycle #${i} $tomato [$w_minutes m] ${red}"
	echo -ne '|                      | [0%]\r'
	sleep $w_secs
	echo -ne '|====>                 | [10%]\r'
	sleep $w_secs
	echo -ne '|======>               | [20%]\r'
	sleep $w_secs
	echo -ne '|========>             | [30%]\r'
	sleep $w_secs
	echo -ne '|==========>           | [40%]\r'
	sleep $w_secs
	echo -ne '|============>         | [50%]\r'
	sleep $w_secs
	echo -ne '|==============>       | [60%]\r'
	sleep $w_secs
	echo -ne '|================>     | [70%]\r'
	sleep $w_secs
	echo -ne '|==================>   | [80%]\r'
	sleep $w_secs
	echo -ne '|====================> | [90%]\r'
	sleep $w_secs
	echo -ne "${green}"
	echo -ne '|======================| [100%]\r'
	echo -ne "${red}"
	echo -e '\n'

	# Stop music on Cmus player
	if [ "$pause_music" = true ] ; then
		cmus-remote -U
	fi

	zenity --notification --text="Cycle #${i} complete!\n ${tomato}" >> /dev/null
	zenity --info --title="Pomodoro" --text="Pomo: Cycle #${i} complete!\n ${tomato}" >> /dev/null
	tomato+="🍅️"


	# Rest Cycle
	echo -ne '|                      | [0%]\r'
	sleep $r_secs
	echo -ne '|====>                 | [10%]\r'
	sleep $r_secs
	echo -ne '|======>               | [20%]\r'
	sleep $r_secs
	echo -ne '|========>             | [30%]\r'
	sleep $r_secs
	echo -ne '|==========>           | [40%]\r'
	sleep $r_secs
	echo -ne '|============>         | [50%]\r'
	sleep $r_secs
	echo -ne '|==============>       | [60%]\r'
	sleep $r_secs
	echo -ne '|================>     | [70%]\r'
	sleep $r_secs
	echo -ne '|==================>   | [80%]\r'
	sleep $r_secs
	echo -ne '|====================> | [90%]\r'
	sleep $r_secs
	echo -ne "${green}"
	echo -ne '|======================| [100%]\r'
	echo -e "${nc}"
	echo -e '\n'
	zenity --notification --text="Pomo: Break complete!" >> /dev/null

	# Return music on Cmus player
	if [ "$back_music" = true ] ; then
		cmus-remote -u
	fi

	# Final cycle?
	if [ $i -lt $cycles ]
	then
	 zenity --warning --title="Pomodoro" --text="Starting the new cycle: $((i+1))!" >> /dev/null
	fi
 done
