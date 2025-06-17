#! /bin/bash

incercari_ramase=3
parola_corecta="itschool"
user_corect="cursant"

este_logat_cu_success="NO"

if grep $user_correct baza-date.db &> /dev/null; then
	echo "Cont blocat"
	exit 12
fi

while (( incercari_ramase >= 0 )); do
	read -p "User: " username
	read -p "Parola: " parola

	if [[ $username == $user_corect && $parola == $parola_corecta ]]; then
		echo "Esti logat"
		este_logat_cu_success="YES"
		break
	else
		echo "Parola sau username gresit"
		((incercari_ramase--))
		echo "Mai ai $incercari_ramase incercari"
		continue
	fi
done

echo 
if [[ $este_logat_cu_success == "YES" ]]; then
	echo "All good. Acum afisam site-ul"
else
	echo "Cont Blocat"


fi

