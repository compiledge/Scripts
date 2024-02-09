#!/bin/bash

nivel='*'
todo="NEXT"
sdate=$(date +%Y-%m-%d' '%a)
note=$(zenity --title="Org Capture" --text "💡 Any idea?" --width=600 --entry)
tstamp=false

# Capturing arguments
while getopts "th" opt; do
	case $opt in
	t)
		tstamp=true
		;;
	h)
		echo -e "Usage: ./org-capture.sh [opts]\n"
		echo -e "Opts:"
		echo -e "\t -t \t\t enable timestamp"
		echo -e "\t -h \t\t print this menu"
		echo -e "\nExample:"
		echo -e "\t ./org-capture.sh -t "
		exit 1
		;;

	\?)
		echo "Invalid option -$OPTARG" >&2
		exit 1
		;;
	esac

	case $OPTARG in
	-*)
		echo "Option $opt needs a valid argument"
		exit 1
		;;
	esac
done

# Avoid empty insertions
if [ -n "$note" ]; then
	task="$nivel $todo $note"
	echo "$task" >>~/org/refile.org

	# Include the current date on orgmode format
	if [ "$tstamp" = true ]; then
		echo "  [$sdate]" >>~/org/refile.org
	fi

	# Breakline to separate headers
	echo "" >>~/org/refile.org
fi
