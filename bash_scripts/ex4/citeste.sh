#! /bin/bash

if [[ -z $1 ]]; then
	echo "Numele cursantului nu a fost pasat"
	while [[ -z $NUME_CURSANT ]]; do
		read -p "Introduceti numele cursantului: " NUME_CURSANT
	done
else
	NUME_CURSANT=$1
fi

echo "Numele cursantului este: $NUME_CURSANT"
