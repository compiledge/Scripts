#!/bin/bash
# Credits: https://itsfoss.com/i3-customization/#customize-i3-lock-screen

BLANK='#00000000'
CLEAR='#00000000'
DEFAULT='#7aa2f7'
TEXT='#7aa2f7'
WRONG='#f7768e'
VERIFYING='#bb9af7'

i3lock \
	--insidever-color=$CLEAR \
	--ringver-color=$VERIFYING \
	\
	--insidewrong-color=$CLEAR \
	--ringwrong-color=$WRONG \
	\
	--inside-color=$BLANK \
	--ring-color=$DEFAULT \
	--line-color=$BLANK \
	--separator-color=$DEFAULT \
	\
	--verif-color=$VERIFYING \
	--wrong-color=$WRONG \
	--time-color=$TEXT \
	--date-color=$TEXT \
	--layout-color=$TEXT \
	--keyhl-color=$VERIFYING \
	--bshl-color=$WRONG \
	\
	--screen 1 \
	--blur 9 \
	--clock \
	--indicator \
	--time-str="%H:%M:%S" \
	--date-str="%A, %Y-%m-%d"
# --keylayout 1
