

# Scrieți un script bash care verifică dacă un fișier specificat ca argument:
#	1. Există și este un fisier obișnuit.
#	2. Este executabil.
#	3. Dacă ambele condiții sunt îndeplinite, afișează un mesaj că fișierul este executabil.
#	4. Dacă nu există sau nu este executabil, afișează un mesaj corespunzător.

#! /bin/bash

# Verifica daca s-a furnizat un argument

if [ -z "$1" ]; then
	echo "Utilizare: $0 <cale_catre_fisier>"
	exit 1
fi

FILE="$1"

# Verificare cu && si ||

if [ -f "$FILE" ] && [ -x "$FILE" ]; then
	echo "Fisierul $FILE exista si este executabil"
elif [ ! -f "$FILE" ]; then
	echo "Fisierul $FILE nu exista sau nu este un fisier obisnuit"
else
	echo "Fisierul $FILE exista, dar nu este executabil"
fi


