#! /bin/bash

NUME=$1
VARSTA=$2

if [ "$NUME" == "Andrei" ] && [ "$VARSTA" -eq 25 ]; then
       echo "Ai ghicit"
else
       echo "Mai incearca"
fi

