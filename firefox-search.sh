#!/bin/bash

# Capture the search string
string=$(zenity --title="Firefox Search String" --text "🔍 Any question?" --width=600 --entry)

# Setting the search string to firefox
if [ -n "$string" ]; then
	firefox --search "$string"
fi
