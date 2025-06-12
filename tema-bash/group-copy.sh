# Faceti un script de shell cu numele group-copy.sh ce copiaza userii dintr-un grup in altul.
# Scriptul primește 2 parametrii obligatorii și diferiți: grupul sursa și grupul destinatie (in ordinea aceasta). 

#!/bin/bash

# Verificam daca am primit 2 argumente
if [ "$#" -ne 2 ]; then
    echo "Te rog sa introduci grupul sursa si grupul destinatie ca argumente"
    exit 1
fi

GRUP_Sursa="$1"
GRUP_Destinatie="$2"

# Verificam daca grupul sursa exista
if ! getent group "$GRUP_Sursa" > /dev/null; then
    echo "Grupul sursa $GRUP_Sursa nu exista"
    exit 1
fi

# Verificam daca grupul destinatie exista
if ! getent group "$GRUP_Destinatie" > /dev/null; then
    echo "Grupul destinatie $GRUP_Destinatie nu exista"
    exit 1
fi  

# Extragem utilizatorii din grupul sursa
USERS=$(getent group "$GRUP_Sursa" | awk -F':' '{print $4}' | tr ',' ' ')

# Verificam daca exista utilizatori in grupul sursa
if [ -z "$USERS" ]; then
    echo "Nu exista utilizatori in grupul sursa $GRUP_Sursa"
    exit 0
fi  

# Adaugam utilizatorii in grupul destinatie
for USER in $USERS; do
    if id "$USER" &>/dev/null; then
        sudo usermod -aG "$GRUP_Destinatie" "$USER"
        echo "Utilizatorul $USER a fost adaugat in grupul $GRUP_Destinatie"
    else
        echo "Utilizatorul $USER nu exista, nu poate fi adaugat in grupul $GRUP_Destinatie"
    fi
done
