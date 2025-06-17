
# Scrie un script care verifica daca un utilizator exista in sistem si daca ruleaza un anumit proces.
# 	- Daca utilizatorul exista si procesul specificat ruleaza, afiseaza "Utilizatorul ruleaza procesul".
#	- Daca utilizatorul exista, dar procesul nu ruleaza, afiseaza "Utilizatorul nu ruleaza procesul".
#	- Daca utilizatorul nu exista, afiseaza "Utilizatorul nu exista"

#! /bin/bash

# Verifica daca sunt furnizati doi parametri

if [ "$#" -ne 2 ]; then
	echo "Utilizare: $0 <utilizator> <proces>"
	exit 1
fi

USER_TO_CHECK=$1
PROCESS_TO_CHECK=$2

# Verifica daca utilizatorul exista

if id "$USER_TO_CHECK" &>/dev/null; then
	# Verifica daca utilizatorul ruleaza procesul specificat
	if pgrep -u "$USER_TO_CHECK" -x "$PROCESS_TO_CHECK" >/dev/null; then
		echo "Utilizatorul $USER_TO_CHECK ruleaza procesul $PROCESS_TO_CHECK"
	else
		echo "Utilizatorul $USER_TO_CHECK nu ruleaza procesul $PROCESS_TO_CHECK"
	fi
else
	echo "Utilizatorul $UZER_TO_CHECK nu exista"
fi

