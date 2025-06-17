#! /bin/bash

# Scrieți un script care verifica dacă un site este available (status code între 200 si 399). Scriptul verifică de un număr maxim de ori primit tot ca argument.
# Hint: Comanda pentru a citi doar status code-ul este: curl -o /dev/null -s -w "%{http_code}\n" https://example.com


# Verificam daca au fost furnizate 2 argumente: site-ul si nr max de incercari:
if [ "$#" -ne 2 ]; then
	echo "Utilizare: $0 URL NR_MAX_INCERCARI"
	exit 1
fi

URL="$1"
NR_MAX_INCERCARI="$2"

# Verificam daca numarul maxim de incercari este un numar pozitiv:
if ! [[ "$NR_MAX_INCERCARI" =~ ^[0-9]+$ ]] || [[ "$NR_MAX_INCERCARI" -lt 1 ]]; then
	echo "Eroare: NR_MAX_INREGISTRARI trebuie sa fie un numar pozitiv"
	exit 1
fi

incercare=1
while [ "$incercare" -le "$NR_MAX_INCERCARI" ]; do
	echo "Incercarea "$incercare" din "$NR_MAX_INCERCARI"...."
	
	# Folosim comanda pentru a citi doar statul code-ul site-ului:
	status_code=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")

	# Verificam daca status code-ul este intre 200 si 399:
	if [ "$status_code" -ge 200 ] && [ "$status_code" -le 399 ]; then
		echo "SUCCESS: Site-ul "$URL" este disponibil! (HTTP status code: "$status_code")"
		exit 0
	else
		echo "FAIL: Site-ul "$URL" nu este disponibil! (HTTP status code: "$status_code")"
	fi

	incercare=$((incercare + 1))
	sleep 1  # Pauza de 1 secunda intre incercari
done

echo "Eroare: Nu s-a reusit contactatrea site-ului "$URL" dupa "$NR_MAX_INCERCARI" incercari"
exit 1
