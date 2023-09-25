#!/bin/bash

# Variables
tomato="🍅️"
red="\033[0;31m"
green="\033[0;32m"
nc="\033[0;m"

clear;
echo -e "${red}"
echo -e "    ██████╗  ██████╗ ███╗   ███╗ ██████╗ ██████╗  ██████╗ ██████╗  ██████╗ "
echo -e "    ██╔══██╗██╔═══██╗████╗ ████║██╔═══██╗██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗"
echo -e "    ██████╔╝██║   ██║██╔████╔██║██║   ██║██║  ██║██║   ██║██████╔╝██║   ██║"
echo -e "    ██╔═══╝ ██║   ██║██║╚██╔╝██║██║   ██║██║  ██║██║   ██║██╔══██╗██║   ██║"
echo -e "    ██║     ╚██████╔╝██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝██║  ██║╚██████╔╝"
echo -e "    ╚═╝      ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ "
echo -e "${nc}"

# Cycles
echo -e "Cycle $tomato [60m] ${red}"
echo -ne '|                     [0%]\r'
sleep 180
echo -ne '|>                    [5%]\r'
sleep 180
echo -ne '|>>                  [10%]\r'
sleep 180
echo -ne '|>>>                 [15%]\r'
sleep 180
echo -ne '|>>>>                [20%]\r'
sleep 180
echo -ne '|>>>>>               [25%]\r'
sleep 180
echo -ne '|>>>>>>              [30%]\r'
sleep 180
echo -ne '|>>>>>>>             [35%]\r'
sleep 180
echo -ne '|>>>>>>>>            [40%]\r'
sleep 180
echo -ne '|>>>>>>>>>           [45%]\r'
sleep 180
echo -ne '|>>>>>>>>>>          [50%]\r'
sleep 180
echo -ne '|>>>>>>>>>>>         [55%]\r'
sleep 180
echo -ne '|>>>>>>>>>>>>        [60%]\r'
sleep 180
echo -ne '|>>>>>>>>>>>>>       [65%]\r'
sleep 180
echo -ne '|>>>>>>>>>>>>>>      [70%]\r'
sleep 180
echo -ne '|>>>>>>>>>>>>>>>     [75%]\r'
sleep 180
echo -ne '|>>>>>>>>>>>>>>>>    [80%]\r'
sleep 180
echo -ne '|>>>>>>>>>>>>>>>>>   [85%]\r'
sleep 180
echo -ne '|>>>>>>>>>>>>>>>>>>  [90%]\r'
sleep 180
echo -ne '|>>>>>>>>>>>>>>>>>>> [95%]\r'
sleep 180 
echo -ne "${green}"
echo -ne '|>>>>>>>>>>>>>>>>>>>>[100%]\r'
echo -ne "${red}"
echo -e '\n'

# Stop music
cmus-remote -U

# Send notification (zenity)
zenity --notification --text="Cycle complete!\n ${tomato}" >> /dev/null
zenity --info --title="Pomodoro" --text="Pomo: Cycle complete!\n ${tomato}" >> /dev/null
