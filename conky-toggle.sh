#!/usr/bin/env bash

# Looking for the conky PID list
runningConkys=$(pgrep -a conky)

# If the list is empty
if [[ -z "$runningConkys" ]]; then

	conky -c ~/.conky/conkyrc.conf &

else # if the list is NOT empty

	# Kill all conkyt instances
	killall conky
fi
