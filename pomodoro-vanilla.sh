#!/bin/bash

# Variables
tomato="🍅️"
red="\033[0;31m"
green="\033[0;32m"
nc="\033[0;m"

echo -e "${red}"
echo -e "    ██████╗  ██████╗ ███╗   ███╗ ██████╗ ██████╗  ██████╗ ██████╗  ██████╗ "
echo -e "    ██╔══██╗██╔═══██╗████╗ ████║██╔═══██╗██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗"
echo -e "    ██████╔╝██║   ██║██╔████╔██║██║   ██║██║  ██║██║   ██║██████╔╝██║   ██║"
echo -e "    ██╔═══╝ ██║   ██║██║╚██╔╝██║██║   ██║██║  ██║██║   ██║██╔══██╗██║   ██║"
echo -e "    ██║     ╚██████╔╝██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝██║  ██║╚██████╔╝"
echo -e "    ╚═╝      ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ "
echo -e "${nc}"

for i in {1..4}
do
	# Cycles
	echo -e "Cycle #${i} $tomato [30m] ${red}"
	echo -ne '|                     [0%]\r'
	sleep 75
	echo -ne '|>                    [5%]\r'
	sleep 75
	echo -ne '|>>                  [10%]\r'
	sleep 75
	echo -ne '|>>>                 [15%]\r'
	sleep 75
	echo -ne '|>>>>                [20%]\r'
	sleep 75
	echo -ne '|>>>>>               [25%]\r'
	sleep 75
	echo -ne '|>>>>>>              [30%]\r'
	sleep 75
	echo -ne '|>>>>>>>             [35%]\r'
	sleep 75
	echo -ne '|>>>>>>>>            [40%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>           [45%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>          [50%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>>         [55%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>>>        [60%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>>>>       [65%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>>>>>      [70%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>>>>>>     [75%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>>>>>>>    [80%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>>>>>>>>   [85%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>>>>>>>>>  [90%]\r'
	sleep 75
	echo -ne '|>>>>>>>>>>>>>>>>>>> [95%]\r'
	sleep 75 
	echo -ne "${green}"
	echo -ne '|>>>>>>>>>>>>>>>>>>>>[100%]\r'
	echo -ne "${red}"
	echo -e '\n'
	zenity --notification --text="Cycle #${i} complete!\n ${tomato}" >> /dev/null
	zenity --info --title="Pomodoro" --text="Pomo: Cycle #${i} complete!\n ${tomato}" >> /dev/null
	tomato+="🍅️"

	 # Cycles
	 echo -ne '|                    [0%]\r'
	 sleep 30
	 echo -ne '|>>                  [10%]\r'
	 sleep 30
	 echo -ne '|>>>>                [20%]\r'
	 sleep 30
	 echo -ne '|>>>>>>              [30%]\r'
	 sleep 30
	 echo -ne '|>>>>>>>>            [40%]\r'
	 sleep 30
	 echo -ne '|>>>>>>>>>>          [50%]\r'
	 sleep 30
	 echo -ne '|>>>>>>>>>>>>        [60%]\r'
	 sleep 30
	 echo -ne '|>>>>>>>>>>>>>>      [70%]\r'
	 sleep 30
	 echo -ne '|>>>>>>>>>>>>>>>>    [80%]\r'
	 sleep 30
	 echo -ne '|>>>>>>>>>>>>>>>>>>  [90%]\r'
	 sleep 30
	 echo -ne "${green}"
	 echo -ne '|>>>>>>>>>>>>>>>>>>>>[100%]\r'
	 echo -ne "${nc}"
	 echo -e '\n'

	 zenity --notification --text="Pomo: Break complete!" >> /dev/null
	 if [ $i -lt 4 ]
	 then
		 zenity --warning --title="Pomodoro" --text="Starting the new cycle: $((i+1))!" >> /dev/null
	 fi
 done
