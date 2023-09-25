#!/bin/bash

echo "[info]: Reading the directories list."

# INFO: The -type flag specifies directories
dirList=$(find $HOME -path '*/.*' -type d)

# INFO: With the -not flag, find ignores hidden directories
# WARN: Without this, find can produce a much larger file
# dirList=$(find $HOME -not -path '*/.*' -type d)

echo "[info]: Saving the directories list."
echo "$dirList" >> $HOME/.config/rofi/dir-db.txt

# The list directories database (dir-db) should
# be read int the rofi-read-dirs.sh scritp.

# Tip:
# This script can be scheduled on crontab:
# 0 * * * * /home/eduardo/Scripts/rofi-update-dirs.sh
