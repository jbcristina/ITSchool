#!/bin/bash

# Faceți un script de shell numit group-list.sh ce imi afiseaza toți userii ce se afla într-un grup separati prin spațiu. 
# Scriptul primește ca argument obligatoriu numele grupului. Dacă nu este niciun user în grup nu afișează nimic.
# Hint: folositi o comanda similară cu aceasta: 
# cat /etc/group | grep -e "sudo:" | awk -F':' '{print $4}' | tr ',' ' '


# Verificam daca numele grupului a fost specificat ca argument
if [ -z "$1" ]; then
    echo "Te rog sa introduci numele grupului ca argument"
    exit 1
fi      

GRUP="$1"
# Cautam grupul in fisierul /etc/group si extragem utilizatorii
USERS=$(cat /etc/group | grep -e "$GRUP:" | awk -F':' '{print $4}' | tr ',' ' ')
# Verificam daca exista utilizatori in grup
if [ -z "$USERS" ]; then
    echo "Nu exista utilizatori in grupul $GRUP"
else
    echo "Utilizatorii din grupul $GRUP sunt: $USERS"
fi  
# Sfarsitul scriptului
exit 0