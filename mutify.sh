#!/bin/bash

beta=$(ps aux | grep -c spotify)
delta=$((0))
tau=$((0))

echo "Ad Status $alpha"
echo "Spotify status $beta"
echo "Playback status $gama"

while [ $beta -ge 2 ]
do 
	gamma=$(playerctl --player=spotify status | grep -c Playing)
	beta=$(ps aux | grep -c spotify)
	delta=$((delta + 1))
	tau=$((tau + 1))
	var=$(($(playerctl --player=spotify metadata mpris:length)/1000000))
	if [ $var -lt 35 ] && [ $gamma -eq 1 ]
	then
		playerctl --player=spotify volume 0
		echo "Ad detected muting."
		sleep $(($var+2))
		var=$(($(playerctl --player=spotify metadata mpris:length)/1000000))
		gama=$(playerctl --player=spotify status | grep -c Playing)

		if [ $var -lt 35 ] && [ $gamma -eq 1 ]
		then
			echo "Ad detected muting."
                	sleep $(($var-2))
			echo "Ad Over unmuting."
			playerctl --player=spotify volume 1
		else
			echo "Ad Over unmuting."
			playerctl --player=spotify volume 1
		fi

	else
		true
		#echo "No Ads are being Played"
	fi

	if [ $delta == 120 ]
	then
		delta=$((0))
		clear
		echo "$tau"
	fi

	sleep 2
done



#REMEMBER: always leave extra spaces while coding shell script, but here delta is an exception--> delta= $((0)) is invalid
