
# Develop a script that determines the highest partition load on your computer,
# determines the interval in which the load is and prints a message according 
# to this intervval. The intervals are 0%-69%, 70%-89%, 90%-98%, 99% and 100%.

#! /bin/bash

LOAD=$(df | awk '{ print $5 }' | grep -v Use | cut -f 1 -d '%' | sort -n -r | head -1)

case $LOAD in
	[0-9]|[1-6][0-9] )
		echo "Your partition load is between 0 and 69"
		;;
	[7-8][0-9] )
		echo "Your partition load is between 70 and 80"
		;;
	9[0-8] )
		echo "Your partition load is between 90 and 98"
		;;
	99 )
		echo "Your partition load is 99"
		;;
	100 )
		echo "Your partition load is 100"
		;;
esac

