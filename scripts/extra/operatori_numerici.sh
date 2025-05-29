#! /bin/bash

if [ "$1" -eq 10 ]; then
	echo "$1 este 10"
fi

if [ "$1" -ne 5 ]; then
	echo "$1 nu este 5"
fi

if [ "$1" -lt 20 ]; then
	echo "$1 este mai mic decat 20"
fi

if [ "$1" -le 10 ]; then
	echo "$1 este mai mic sau egal cu 10"
fi

if [ "$1" -gt 5 ]; then
	echo "$1 este mai mare decat 5"
fi

if [ "$1" -ge 10 ]; then
	echo "$1 este mai mare sau egal cu 10"
fi

if [ "$1" -gt 0 ] && [ "$1" -lt 10 ]; then
	echo "Numar intre 1 si 9 inclusiv"
fi

