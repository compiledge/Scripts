#!/bin/bash


# Variables
tomato="🍅️"
red="\033[0;31m"
green="\033[0;32m"
nc="\033[0;m"

w_minutes=25;
r_minutes=5;
cycles=4;

if [ $# -eq 0 ]
then
	echo "Default mode!"
	echo "To change default mode try:"
	echo "./pom [minutes to work] [minutes to rest] [max cycles]"
	echo "./pom 25 5 4"
else
	w_minutes=$1
	r_minutes=$2
	cycles=$3
fi

# Calc work timer
w_secs=$(($w_minutes*60))
w_secs=$(($w_secs/10))

# Calc rest timer
r_secs=$(($r_minutes*60))
r_secs=$(($r_secs/10))

echo -e "${red}"
echo -e "    ██████╗  ██████╗ ███╗   ███╗ ██████╗ ██████╗  ██████╗ ██████╗  ██████╗ "
echo -e "    ██╔══██╗██╔═══██╗████╗ ████║██╔═══██╗██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗"
echo -e "    ██████╔╝██║   ██║██╔████╔██║██║   ██║██║  ██║██║   ██║██████╔╝██║   ██║"
echo -e "    ██╔═══╝ ██║   ██║██║╚██╔╝██║██║   ██║██║  ██║██║   ██║██╔══██╗██║   ██║"
echo -e "    ██║     ╚██████╔╝██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝██║  ██║╚██████╔╝"
echo -e "    ╚═╝      ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ "
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
	zenity --notification --text="Cycle #${i} complete!\n ${tomato}" >> /dev/null
	zenity --info --title="Pomodoro" --text="Pomo: Cycle #${i} complete!\n ${tomato}" >> /dev/null
	tomato+="🍅️"

	# Stop music
	cmus-remote -U

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

	# Final cycle?
	if [ $i -lt $cycles ]
	then
	 zenity --warning --title="Pomodoro" --text="Starting the new cycle: $((i+1))!" >> /dev/null
	fi
 done
