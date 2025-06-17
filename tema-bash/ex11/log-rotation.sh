#!/bin/bash

# Log rotation: Faceți un script ce face log rotation la un fisier de loguri primit ca argument.
# Pentru simplitate log rotation-ul se face automat la un numar de secunde primit ca argument. 
# Cand se face log rotation se copiază fișierul curent într-un nou fișier cu același nume ca fișierul original + un timestamp iar 
# fișierul original se golește. Fisierele de log rotation se și arhivează pentru a ocupa mai puțin spațiu.
# Faceți un script simplu ce printeaza la nesfarsit in loguri pentru a testa scriptul de log rotation (vedeti hello.sh de la curs).

# Verificăm dacă s-au furnizat argumentele necesare
if [ "$#" -ne 2 ]; then
    echo "Utilizare: $0 <fisier_log> <interval_secunde>"
    exit 1
fi
# Obținem argumentele
LOGFILE="$1"
INTERVAL_SECUNDE="$2"
# Verificăm dacă fișierul de log există, dacă nu, îl creăm
if [ ! -f "$LOGFILE" ]; then
    touch "$LOGFILE"
fi

echo "Începem logarea în $LOGFILE la fiecare $INTERVAL_SECUNDE secunde..."

while true; do
  sleep "$INTERVAL_SECUNDE"

  # Verificăm dacă fișierul de log conține date.
  if [ -s "$LOGFILE" ]; then
    # Generăm un timestamp (ex: 20250614000330)
    TIMESTAMP=$(date +%Y%m%d%H%M%S)
    ROTATED_LOG="${LOGFILE}.${TIMESTAMP}"

    echo "Rotăm logul: copiem $LOGFILE în $ROTATED_LOG"
    cp "$LOGFILE" "$ROTATED_LOG"

    # Golește fișierul de log original
    > "$LOGFILE"

    # Arhivăm fișierul copiat cu gzip pentru a economisi spațiu
    gzip "$ROTATED_LOG"

    echo "Logul a fost rotit în: ${ROTATED_LOG}.gz"
  fi
done

# Note: Pentru a testa acest script, puteți rula hello.sh în fundal și apoi acest script de log rotation.
# De exemplu:
# ./hello.sh &
# ./log-rotation.sh /home/cris/work/ITSchool/tema-bash/ex11/test.log 5
# Asigurați-vă că aveți permisiuni de scriere în directorul unde se află fișierul de log.