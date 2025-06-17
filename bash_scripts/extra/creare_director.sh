#! /bin/bash

# Varifica daca un director exista. Daca nu exista creeaza-l (folosind operatorul -d).

# Directorul de verificat
DIRECTOR=$1

# Verifica daca directorul exista
if [ -d "$DIRECTOR" ]; then
	echo "Directorul '$DIRECTOR' exista deja."
else
	echo "Directorul '$DIRECTOR' nu exista. Creare in curs..."
	mkdir "$DIRECTOR"
	echo "Directorul '$DIRECTOR' a fost creat."
fi

