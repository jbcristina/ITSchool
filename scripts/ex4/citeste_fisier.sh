#! /bin/bash

# Faceți un script de shell ce citește linie cu linie un fișier cu nume de utilizatori și pentru fiecare utilizator afișează grupurile în care acesta se afla.

cat utilizatori.txt | while read UTILIZATOR; do
	if [ -z $UTILIZATOR ]; then
		echo "Rand gol!"
		continue
	fi
	if ! id $UTILIZATOR &>/dev/null; then
		echo "Utilizatorul $UTILIZATOR nu exista"
		continue
	fi
	echo "Utilizatorul $UTILIZATOR este in grupurile: " 
	groups $UTILIZATOR
done

