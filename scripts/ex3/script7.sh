#! /bin/bash

while true; do
	read -p "Username: " username
	if [ -n "$username" ]; then
		echo "Salut $username"
		break
	fi
done
echo "Dupa While"

