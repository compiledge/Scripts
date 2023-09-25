#!/bin/bash

# Choosing the target screen
export DISPLAY=:0.0

# Updating the wallpaper 
nitrogen --set-zoom-fill --random $HOME/Imagens/Stray/ --save

# INFO: This script can be scheduled on crontab:
# crontab -u eduardo -e
# 0 * * * * $HOME/Scripts/nitrogen-slideshow.sh
