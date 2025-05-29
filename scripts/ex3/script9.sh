#! /bin/bash

pas=1
while [ $pas -le 10 ]; do
	echo "Suntem la pasul $pas"
	((pas++))
	sleep 2
done

