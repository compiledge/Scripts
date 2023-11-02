#!/usr/bin/env bash
## This is an upgrade on cmus-feh script:
## Cover art can be founded on parent directory too.
## Credits to: https://github.com/TiredSounds/cmus-scripts

## 'status_display_program' for Cmus. Shows album art in a fixed size window.
## Use your window manager to automatically manipulate the window.
## There are several album art viewers for Cmus but this I believe is the most
## compatible with different setups as it is simpler. No weird hacks.

## Requires feh (light no-gui image viewer).

# File folder & Parent Folder
FOLDER=$( cmus-remote -Q | grep "file" | sed "s/file //" | rev | \
cut -d"/" -f2- | rev )

PFOLDER=$( cmus-remote -Q | grep "file" | sed "s/file //" | rev | \
cut -d"/" -f3- | rev)

# Reading the list of files
FLIST=$( find "$FOLDER" -type f )
PFLIST=$( find "$PFOLDER" -type f )

# Finding the cover file
COVER=$( echo "$FLIST" | grep -i ".jpeg\|.png\|.jpg" )
PCOVER=$( echo "$PFLIST" | grep -i ".jpeg\|.png\|.jpg" )

if [[ -n $COVER ]] || [[ -n $PCOVER ]] ; then

	# Reading the PATH to the cover file
	ART=$( echo "$FLIST" | grep -i "cover.jpg\|cover.png\|front.jpg\|front.png\
		\|folder.jpg\|folder.png" | head -n1 )

	PART=$( echo "$PFLIST" | grep -i "cover.jpg\|cover.png\|front.jpg\|front.png\
		\|folder.jpg\|folder.png" | head -n1 )

	if [[ -z "$ART" ]]; then
		ART=$( echo "$FLIST" | grep -i ".png\|.jpg\|.jpeg" | head -n1 )
	fi

	if [[ -z "$PART" ]]; then
		PART=$( echo "$PFLIST" | grep -i ".png\|.jpg\|.jpeg" | head -n1 )
	fi

	# Finding and killing the feh process
	PROC=$( ps -eF | grep "feh" | grep -v "cmus\|grep" | cut -d"/"  -f2- )

	if [[ "/$PROC" == "$ART" ]] || [[ "/$PROC" == "$PART" ]] ; then
		exit
	fi

	killall -q feh

	# '200x200' is the window size for the artwork. '+1160+546' is the offset.
	# For example, if you want a 250 by 250 window on the bottom right hand corner of a 1920 by 1080 screen: "250x250+1670+830"
	# setsid feh -g 200x200+1160+546 -x --zoom fill "$ART" &
	# setsid feh -g 200x200+1160+546 -x --zoom fill "$PART" &
	if [[ -n $ART ]]; then
		setsid feh -g 200x200+1160+546 -x --zoom fill "$ART" &
	elif [[ -n $PART ]]; then
		setsid feh -g 200x200+1160+546 -x --zoom fill "$PART" &
	fi 
else
	killall -q feh
	exit
fi
