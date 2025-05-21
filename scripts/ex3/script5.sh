#! /bin/bash

user_to_check=$1

if id $user_to_check &> /dev/null; then
	echo "Userul $user_to_check exista"
	exit 0
else 
	echo "Userul $user_to_check nu exista"
	exit 1
fi
