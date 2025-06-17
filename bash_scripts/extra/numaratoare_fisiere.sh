#! /bin/bash

## Scriptul printeaza un mesaj de genul "Sunt X fisiere in directorul Y"
## Directorul in care trebuie sa numere fisierele este primit ca parametru
## Daca nu se introduce niciun parametru, se numara fisierele din directorul /tmp

#CALE_DIRECTOR=${1:-/tmp}
#NUMAR_DE_FISIERE=$(ls -al $CALE_DIRECTOR | wc -l)

#echo "Sunt $NUMAR_DE_FISIERE fisiere in directorul $CALE_DIRECTOR"

# Daca nu se paseaza numele directorului se printeaza un mesaj de eroare si se iese cu un cod de eroare

CALE_DIRECTOR=${1}
NUMAR_DE_FISIERE=$(ls -al $CALE_DIRECTOR | wc -l)

if [ -z $1 ]; then
	echo "Directorul nu a fost pasat. rulati scriptul in felul acesta: $0 /cale/catre/director"
	exit 1; #Se termina cu erroare
fi

echo "Sunt $NUMAR_DE_FISIERE fisiere in directorul $CALE_DIRECTOR"