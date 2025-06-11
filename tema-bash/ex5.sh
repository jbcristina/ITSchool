#! /bin/bash

# Creați un script ce face backup la un fișier primit ca parametru printr-o variabila de mediu cu numele  BACKUP_FILE_PATH, doar dacă fișierul a fost modificat. Cerințe:

# A.	Toate backupurile sunt ținute într-un subdirector. Numele subdirectorului de backup este și el primit tot ca variabila de mediu (și are valoare implicită backup în caz că nu a fost setată).
# B.	Fiecare fișier de backup are un timestamp în nume.  
# C.	Dacă variabilă de mediu BACKUP_FILE_PATH nu a fost setată se afișează o eroare.
# D.	Dacă există deja un fișier de backup cu același conținut doar îl redenumim cu timestamp-ul curent  (nu mai facem încă un backup). 
# Hint: Comenzi utile:
#	Folosiți comanda sha256sum pentru a verifica dacă un fișier a fost modificat.
#	Folosiți următoarea comanda pentru a genera un date cu zi și oră:	date +"%Y-%m-%d-%H-%M-%S"


# Verificam daca variabila de mediu BACKUP_FILE_PATH este setata:
if [ -z "$BACKUP_FILE_PATH" ]; then
	echo "Eroare: BACKUP_FILE_PATH nu este setata!"
	exit 1
fi

# Setam numele directorului de backup cu valoarea implicita daca nu este definit:
BACKUP_DIR=${BACKUP_DIR:-backup}

# Cream directorul de backup daca nu exista:
mkdir -p "$BACKUP_DIR"

# Generam timestamp:
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")

# Calculam hash-ul fisierului original:
FILE_HASH=$(sha256sum "$BACKUP_FILE_PATH" | awk '{print $1}')

# Cautam daca exista deja un backup cu acelasi hash:
EXISTING_BACKUP=$(find "$BACKUP_DIR" -type f -exec sha256sum {} + | awk -v hash="$FILE_HASH" '$1 == hash {print $2}')

if [ -n "$EXISTING_BACKUP" ]; then
	# Daca backup-ul exista, redenumim fisierul cu noul timestamp:
	mv "$EXISTING_BACKUP" "$BACKUP_DIR/$(basename "$BACKUP_FILE_PATH")-$TIMESTAMP"
	echo "Fisierul de backup deja exista. redenumit cu timestamp"
else
	# Cream un nou backup
	cp "$BACKUP_FILE_PATH" "$BACKUP_DIR/$(basename "$BACKUP_FILE_PATH")-$TIMESTAMP"
	echo "Backup creat: $BACKUP_DIR/$(basename "$BACKUP_FILE_PATH")-$TIMESTAMP"
fi


	
