

# Cauta intr-un fisier pasat ca parametru
# Daca nu este pasat niciun fisier cauta in /tmp

# Exemple:
# ./command-substitution.sh /etc
# ./command-substitution.sh
# ./command-substitution.sh ~

CALE_DIRECTOR=${1:-"/tmp"}

#DATA_EXECUTIE=$(date)

NO_FILES=$(ls -al $CALE_DIRECTOR | wc -l)

#echo "Avem $NO_FILES" fisier la $(date) in directorul $CALE_DIRECTOR
#echo "Am rulat scriptul la data $DATA_EXECUTIE"
#echo "Am rulat scriptul la data $(date)"

echo "Avem $NO_FILES in directorul $CALE_DIRECTOR"
echo "Am rulat scriptul la data $(date)"