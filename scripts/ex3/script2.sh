#! /bin/bash

usr=$1
pss=$2
age=$3

if [[ $usr != "Andrei" || $pss != "passwd" ]]; then 
	echo "Access denied. User sau parola gresita"
	exit 2
fi 

echo "Acum verificam varsta"

if [[ "$age" =~ ^[0-9]+$ ]]; then
	echo "Varsta este numar intreg"
else
	echo "Varsta nu este numar intreg"
	exit 3
fi


if (( $age >= 18 )); then
	echo " Varsta ok. Esti logat"
	echo "Afiseaza site..."
	exit 0
fi

echo "Varsta prea mica"
exit 3
