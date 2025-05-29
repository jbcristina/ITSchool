#! /bin/bash

if [ ! -f "file.txt" ]; then
	echo "Fisierul nu exista"
fi

if [ ! -d "/director/inexistent" ]; then
	echo "Directorul nu exista"
fi

if [ -r "script.sh" ]; then
	echo "Fisierul script.sh exista si ai drepturi de read pe el"
fi

if [ -x "script.sh" ]; then
	echo "Fisierul script.sh exista si ai drepturi de execute pe el"
fi

