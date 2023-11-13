#!/bin/bash

nivel='*'
todo="NEXT"
sdate=$(date +%Y-%m-%d' '%a)
note=$(zenity --title="Org Capture" --text "💡 Any idea?" --width=600 --entry)

# Avoid empty insertions
if [ -n "$note" ]; then
	task="$nivel $todo $note"
	echo "$task" >> ~/git/org/refile.org
	
	# Include the current date on orgmode format
	# echo "  [$sdate]" >> ~/git/org/refile.org

	# Breakline to separate headers
	echo "" >> ~/git/org/refile.org
fi
