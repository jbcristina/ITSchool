#! /bin/bash

# Faceti un script cu numele config.sh ce face load în variabilele de mediu la variabilele definite intr-un fisier config.txt ce arată în felul următor:

# DB_USER:admindb
# DB_PASS:12343dsadasdasFDTR!@13
# DB_HOSTNAME:my-db.com 
# DB_PORT:1234

# Cerințe bonus
# 1.	Cum facem ca variabilele setate automat în script să fie disponibile și în sesiunea de shell curentă?
# 2.	Cum facem ca variabilele să fie disponibile de fiecare dată când deschidem un terminal nou al userului curent?
# 3.	Cum facem să le setam doar dacă nu sunt deja setate?


CONFIG_FILE="ex4-config.txt"

# Verificam daca fisierul ex4-config.txt exista:
if [ ! -f "$CONFIG_FILE" ]; then
	echo "Fisierul "$CONFIG_FILE" nu exista!"
	exit 1
fi

# Citim fisierul si exportam variabilele:
while read -r line; do
	key=$(echo $line | awk -F: '{print $1}' | xargs)
	value=$(echo $line | awk -F: '{print $2}' | xargs)

	# Verificam daca sunt linii invalide (linii goale):
	if [[ -z "$key" || -z "$value" ]]; then
		echo Linie invalida $line
		continue
	fi

	# Verificam daca variabila este deja setata:
	if printenv | grep -w $key >> /dev/null; then
		echo Variabila $key este deja setata
		continue
	fi
	export $key=$value
	echo "Variabila exportata: "
	echo "export $key=$value" >> ~/.bashrc
	printenv | grep -w $key
done < "$CONFIG_FILE"
