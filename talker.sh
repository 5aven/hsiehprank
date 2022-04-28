#!/bin/bash

#start infinite loop

#display logo
echo -e "  _________\n  |   ____/____ ___  __ ____   ____\n  |____  \___   \  \/ /  __ \ /    \ \n  /----\  \/ _\  \   /\  ___/|   |  \ \n /______  /____  /\_/  \___  \___|  /\n        \/     \/          \/     \/"

for (( ; ; ))

do
	#get info from github
	wget https://github.com/5aven/hsiehprank/blob/main/input -O input.txt -q
	fullinput=$(cat input.txt)
	
	#separate into different variables
	input=$(cat input.txt | grep LC1)
	input=${input#*"Input: "}
	input=${input%%"</td>"*}

	echo Text input
	echo $input

	time=$(cat input.txt | grep LC2)
	time=${time#*"Time increment: "}
	time=${time%%"</td>"*}

	echo "Time Interval (seconds)"
	echo $time

	random=$(cat input.txt | grep LC3)
	random=${random#*"Random? (y/n): "}
	random=${random%%"</td>"*}

	echo "Is it random?"
	echo $random

	on=$(cat input.txt | grep LC4)
	on=${on#*"On? (y/n): "}
	on=${on%%"</td>"*}

	echo "Is it on?"
	echo $on

	volume=$(cat input.txt | grep LC5)
        volume=${volume#*"Volume (1/7): "}
        volume=${volume%%"</td>"*}

        echo "Volume"
        echo $volume
	
	if test $on == "y"
	then
		if test $random == "y"
		then
			time=$[$RANDOM % ($time*2) + $time]
			echo "the time is random"
			echo $time
		else
			echo "the time isn't random"
		fi
		
		osascript -e "set Volume $volume"
		
		if echo "$input" | grep 'https'
		then
			open $input
		else
			say "$input"
		fi
	fi
	
	sleep $time

done
