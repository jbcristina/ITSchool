
if [ ! -z "$1" ]; then
	echo "Am primit arg: $1"
else
	echo "Nu am primit nimic"
	read -p "Introduceti numele: " nume_cursant
	echo "Salut $nume_cursant"
fi

echo "Bye bye"
