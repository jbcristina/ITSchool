#!/bin/bash

# Faceti un script de shell cu numele group-copy.sh ce copiaza userii dintr-un grup in altul.
# Scriptul primește 2 parametrii obligatorii și diferiți: grupul sursa și grupul destinatie (in ordinea aceasta). 



# Verificam daca am primit 2 argumente
if [ "$#" -ne 2 ]; then
    echo "Te rog sa introduci grupul sursa si grupul destinatie ca argumente"
    exit 1
fi

GRUP_SURSA="$1"
GRUP_DESTINATIE="$2"

# Verificam daca grupul sursa exista
if ! getent group "$GRUP_SURSA" > /dev/null; then
    echo "Grupul sursa $GRUP_SURSA nu exista"
    exit 1
fi

# Verificam daca grupul destinatie exista
if ! getent group "$GRUP_DESTINATIE" > /dev/null; then
    echo "Grupul destinatie $GRUP_DESTINATIE nu exista"
    exit 1
fi  

# Extragem utilizatorii din grupul sursa
USERS=$(getent group "$GRUP_SURSA" | awk -F':' '{print $4}' | tr ',' ' ')

# Verificam daca exista utilizatori in grupul sursa
if [ -z "$USERS" ]; then
    echo "Nu exista utilizatori in grupul sursa $GRUP_SURSA"
    exit 0
fi  

# Adaugam utilizatorii in grupul destinatie
for USER in $USERS; do
    if id "$USER" &>/dev/null; then
        sudo usermod -aG "$GRUP_DESTINATIE" "$USER"
        echo "Utilizatorul $USER a fost adaugat in grupul $GRUP_DESTINATIE"
    else
        echo "Utilizatorul $USER nu exista, nu poate fi adaugat in grupul $GRUP_DESTINATIE"
    fi
done