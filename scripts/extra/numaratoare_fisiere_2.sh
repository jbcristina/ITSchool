
#! /bin/bash

if [ -z "$1" ]; then
	read -p "Introdu calea catre director: " CALE_DIRECTOR
else
	CALE_DIRECTOR=$1
fi

if [ ! -d "$CALE_DIRECTOR" ]; then
	echo "Directorul $CALE_DIRECTOR introdus nu exista"
	exit 1
fi

NUMAR_DE_FISIERE=$(ls -al $CALE_DIRECTOR | wc -l)
echo "Sunt $NUMAR_DE_FISIERE fisiere in directorul $CALE_DIRECTOR"


