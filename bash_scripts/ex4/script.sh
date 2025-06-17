#! /bin/bash

parola_corecta=1234
user_corect=admin

for index in {1..3}; do
	while [ -z "$username" ]; do
		read -p "Username: " username
	done
	read -p "Parola: " parola
	echo "Userul a introdus username $username si parola $parola"
	if [[ $username != $user_corect || $parola != $parola_corecta ]]; then
		echo "Gresit. Incercarea $((3-index))"
	else 
		echo "Esti logat"
		continue
	fi
done


 
