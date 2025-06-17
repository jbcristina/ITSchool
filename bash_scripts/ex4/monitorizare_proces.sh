#! /bin/bash

# Monitorizarea unui proces și repornirea automată dacă se oprește

while true; do
	if  pgrep hello &>/dev/null; then
		echo "Scriptul inca ruleaza"
		sleep 5
	else
		echo "Scriptul s-a oprit. Il repornim"
		nohup ./hello.sh &
	fi
done


