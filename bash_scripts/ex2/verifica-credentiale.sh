
UTILIZATOR=$1
PAROLA=$2

#if [ -f "incercari.txt" ]; then
#	nr_incercari=$(cat incercari.txt)
#else
#	echo "1" > incercari.txt
#fi

#if [ "$UTILIZATOR" = "admin" ] && [ "$PAROLA" = "1234" ]; then
#	echo "Esti logat"
#else
#	echo Access denied
#	exit 1
#fi

#if [ "$UTILIZATOR" != "admin" ] || [ "$PAROLA" != "1234" ]; then
#	echo "User sau parola gresita"
#	exit 1
#else
#	echo "Esti logat"
#fi
if ls -al /sdsd; then 
	echo
fi

if [[ "$UTILIZATOR" != "admin" || "$PAROLA" != "1234" ]]; then
	echo "User sau parola gresita"
	exit 1
else
	echo "Esti logat"
fi

