#! /bin/bash

while true; do
	read -p "Cale director:" cale_dir
	if [ -z "$cale_dir" ]; then
		echo "Nu ai introdus nimc"
		continue
	fi
	if [ ! -d "$cale_dir" ]; then
		echo "Director. Ce ai introdus nu este director"
		continue
	fi
	if [ -w "$cale_dir" ]; then
		echo "Toate validarile au trecut. Pot sa si citesc din directo"
		break
	else 
		echo "Nu am drept de read"
		continue
	fi
done

echo $(ls -ald $cale_dir)
echo "We are good"
