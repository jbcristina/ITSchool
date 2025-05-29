#! /bin/bash

# Faceți un script ce așteaptă (la nesfarsit) după un fisier pe disk sa fie creat (ce fișier doriti). După ce fișierul a fost create scriptul afișează un mesaj și iese cu succes.

# Bonus (dificultate medie): Modificați scriptul să nu aștepte la nesfarsit ci maxim 1 minut. Dar daca fisierul este create mai devreme de 1 minut scriptul trebuie sa se termine mai devreme.


fisier="fisier_de_test.txt"
timp_max=60   # Timpul maxim în secunde
numaratoare=0

echo "Se așteaptă maxim $timp_max secunde pentru crearea fișierului $fisier..."
while [ ! -f "$fisier" ]; do
  sleep 1
  numaratoare=$((numaratoare + 1))
  if [ "$numaratoare" -ge "$timp_max" ]; then
    echo "Timeout: Fișierul $fisier nu a fost creat în $timp_max secunde."
    exit 1
  fi
done

echo "Fișierul $fisier a fost creat după $numaratoare secunde!"
exit 0
