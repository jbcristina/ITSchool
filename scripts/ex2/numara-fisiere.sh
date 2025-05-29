
#echo "Code inainte de IF"

if [ "$#" -ne 1 ]; then
	echo "Scriptul asteapta exact un parametru"
	echo "A primit $#"
	echo "Exemplu de rulare:"
	echo "$0 /tmp"
	if [ -z "$CALE_DIRECTOR_DEFAULT" ]; then
		echo "Variabila de mediu CALE_DIRECTOR_DEFAULT nu a fost setata"
		exit 1
	else
		echo "Scriptul o sa foloseasca $CALE_DIRECTOR_DEFAULT"
		CALE_DIRECTOR=$CALE_DIRECTOR_DEFAULT
	fi
else
	CALE_DIRECTOR=$1
	echo "Am primit parametrii corecti"
fi

#echo "Code dupa IF"

#CALE_DIRECTOR=$1

echo "Ne apucam sa numaram cate fisiere sunt in directorul $CALE_DIRECTOR"

if [ -d "$CALE_DIRECTOR" ]; then
	NO_FILES=$(ls -al $CALE_DIRECTOR | wc -l)
	echo "Sunt $NO_FILES in directorul $CALE_DIRECTOR"
else
	echo "$CALE_DIRECTOR nu este director"
fi
