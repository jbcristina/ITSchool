#! /bin/bash

cai=("/etc" "/var/log" "/tmp" "/home/cris/work/ITSchool/" "/work/ITSchool")

for cale in ${cai[@]}; do
	echo "Calea este: $cale"
	if [ ! -d "$cale" ]; then
		echo "Calea $cale nu exista"
		continue
	fi
	echo "Sunt $(ls -al $cale | wc -l) fisiere in directorul $cale"
done 

