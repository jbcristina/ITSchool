#!/bin/bash

# Faceți un script ce face backup la fiecare 5 secunde la un director (doar la fisierele ce s-au modificat din acel director). 
# Scriptul primește ca argument numele directorului la care trebuie făcut backup. 
# Frecvența la care se face backup este citită dintr-o variabila de mediu cu numele FRECVENTA_BACKUP (cu valoare implicită de 5 secunde). 
# Hint: -	Folosiți comanda sha256sum pentru a verifica dacă un fișier a fost modificat.



# Verificam daca directorul a fost specificat ca argument
if [ -z "$1" ]; then
    echo "Te rog sa introduci un director ca argument"
    exit 1
fi

DIRECTOR="$1"

#Setam frecventa backup-ului implicita 5 secunde daca nu esste definita in variabila de mediu FRECVENTA_BACKUP
FRECVENTA_BACKUP=${FRECVENTA_BACKUP:-5}

# Setam directorul unde se vor salva backup-urile
BACKUP_DIR="${DIRECTOR}_backup"
mkdir -p "$BACKUP_DIR"

# Salvam hashurile anterioare pentru comparatie intr-un fisier hashes.txt
HASHES_FILE="$BACKUP_DIR/hashes.txt"
touch "$HASHES_FILE"

echo "Backup-ul directorului $DIRECTOR va fi efectuat la fiecare $FRECVENTA_BACKUP secunde."

while true; do
    # Parcurgem toate fisierele din directorul specificat
    for FILE in "$DIRECTOR"/*; do
        if [ -f "$FILE" ]; then
            # Calculam hash-ul fisierului curent
            CURRENT_HASH=$(sha256sum "$FILE" | awk '{print $1}')
            # Verificam daca fisierul exista deja in hashes.txt
            PREVIOUS_HASH=$(grep "$(basename "$FILE")" "$HASHES_FILE" | awk '{print $2}')

            if [ "$CURRENT_HASH" != "$PREVIOUS_HASH" ]; then
                # Daca hash-ul s-a schimbat, copiem fisierul in directorul de backup
                TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
                BACKUP_FILE="${BACKUP_DIR}/$(basename "$FILE")_$TIMESTAMP"
                cp "$FILE" "$BACKUP_FILE"
                # Actualizam fisierul hashes.txt cu noul hash
                if [ -z "$PREVIOUS_HASH" ]; then
                    echo "$(basename "$FILE") $CURRENT_HASH" >> "$HASHES_FILE"
                else
                    # Actualizam hash-ul existent
                    sed -i "s/$(basename "$FILE") .*/$(basename "$FILE") $CURRENT_HASH/" "$HASHES_FILE"
                fi
                echo "Backup la $(basename "$FILE") efectuat."
            else
                # Daca hash-ul nu s-a schimbat, nu facem nimic
                echo "Nu s-a modificat $(basename "$FILE"), nu se face backup."
            fi
        elif [ -d "$FILE" ]; then
            # Daca este un subdirector, putem decide daca vrem sa facem backup si la fisierele din el
            echo "$(basename "$FILE") este un director, nu se face backup."
        else
            # Daca nu este un fisier sau director, ignoram
            echo "$(basename "$FILE") nu este un fisier valid, ignorat."
        fi
    done
    sleep "$FRECVENTA_BACKUP"
done