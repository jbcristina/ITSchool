
#! /bin/bash

CALE=$1

if [ -z "$CALE" ]; then
	echo "Nu ai introdus calea catre executabil"
	echo "Exemplu de utilizare script:"
	echo "$0 /cale/catre/fisier/script.sh"
	exit 1
fi

if [ ! -f "$CALE" ]; then
	echo "Fisierul nu exista sau este director"
	exit 2
fi

if [ ! -x "$CALE" ]; then
	echo "Nu avem drept de executie"
	exit 3
fi

#source $CALE
## echo "Hello World!"
## exit 123

bash $CALE

exit_code=$?
echo "Exit Code-ul ultimei comenzi: " $exit_code

if [ "$exit_code" -eq 0 ]; then
	echo "We are really good"
	exit 0
else
	echo "Scriptul a iesit cu erroare: $exit_code"
	exit 4
fi

