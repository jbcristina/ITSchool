#! /bin/bash

read -p "Introduceti fisierul de verificat: " argument
hash_argument=$(sha256sum $argument | awk '{print $1}')
echo "$hash_argument"

for file in *.sh; do
	echo "Verificam fisierul: $file"
	hash_fisiere=$(sha256sum $file | awk '{print $1}')
	echo "$hash_fisiere"
	if [ "$hash_argument" == "$hash_fisiere" ]; then
		echo "Am gasit fisieru: $file"
		exit 0
	fi

done

echo "Nu am gasit niciun fisier"
exit 1 
	
