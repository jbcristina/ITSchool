#! /bin/bash

if [ "$2" = "hello" ]; then
	echo "Salut!"
fi

if [ "$2" != "hello" ]; then
	echo "Nu este Salut!"
fi

if [ -z "$2" ]; then
	echo "Stringul este gol"
fi

if [ -n "$2" ]; then
	echo "Stringul nu este gol"
fi

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Cel putin una dintre cele doua variabile nu este setata"
fi

