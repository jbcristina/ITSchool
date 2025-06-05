#! /bin/bash

# Faceți un script ce compara dacă 2 fișiere (primite ca argument) sunt identice ca si continut. (sha256sum).

# Bonus (dificultate ridicata): În loc de 2 fișiere comparati o lista de oricât de multe fișiere. 
# Dacă oricare 2 fișiere din lista sunt diferite intoarce-ti un mesaj de eroare.  

# Verificam daca cele doua fisiere au fost furnizate ca argumente:
if [ "$#" -lt 2 ]; then
	echo "Utilizare: $0 fisier1 fisier2 [fisier3.... fisier4]"
	exit 1
fi

# Calculam check-sum-ul primului fisier pentru referinta:
if [ ! -f "$1" ]; then
	echo "Eroare: fisierul "$1" nu exista"
	exit 1
fi
ref_hash=$(sha256sum "$1" | awk '{print $1}')

# Parcurgem lista de fisiere din lista de argumente si verificam daca toate au acelasi check-sum:
for file in "$@"; do
	if [ ! -f "$file" ]; then
		echo "Eroare: fisierul "$file" nu exista"
		exit 1
	fi
	current_hash=$(sha256sum "$file" | awk '{print $1}')

	if [ "$current_hash" != "$ref_hash" ]; then
		echo "Eroare: fisierul "$file" nu este identic cu fisierul "$1""
		exit 1
	fi
done

echo "Toate fisierele sunt identice din punct de vedere al continutului"
exit 0
