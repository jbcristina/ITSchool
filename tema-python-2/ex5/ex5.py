# Faceți un script de python ce muta unul cate unul fisierele dintr-un director în celalat. 
# După fiecare mutare de fișier scriptul doarme un numar random de secunde intre 1 si 5 (
# pentru a simula un long running process). Directorul sursa este primul argument al scriptului 
# iar destinatie al doilea. Incercati sa porniti in acelasi timp 2 instante ale scriptului și v
# erificati ca ambele funcționează corect.
#Hint:
#-	os.makedirs(dest_dir, exist_ok=True)
#-	src_path = os.path.join(source_dir, filename)
#-	os.rename(src_path, lock_path)
#-	time.sleep(random.randint(1, 5))
#-	shutil.move(lock_path, dest_path)

import os
import shutil
import time
import random
import sys

# Verificam daca au fost furnizate argumentele necesare
if len(sys.argv) != 3:
    print("Utilizare: python ex5.py <director_sursa> <director_destinatie>")
    sys.exit(1)

source_dir = sys.argv[1]
dest_dir = sys.argv[2]

# Cream directorul de destinatie daca nu exista
os.makedirs(dest_dir, exist_ok=True)

# Iteram prin fisierele din directorul sursa
for filename in os.listdir(source_dir):
    src_path = os.path.join(source_dir, filename)

    # Verificam daca este un fisier
    if os.path.isfile(src_path):
        # Mutam fisierul intr-un director temporar pentru a evita conflictele
        lock_path = os.path.join(source_dir, f".lock_{filename}")
        os.rename(src_path, lock_path)

        # Simulam un proces de lunga durata
        time.sleep(random.randint(1, 5))

        # Mutam fisierul in directorul de destinatie
        dest_path = os.path.join(dest_dir, filename)
        shutil.move(lock_path, dest_path)

        print(f"Fisierul '{filename}' a fost mutat in '{dest_dir}'.")
else:
    print("Toate fisierele au fost mutate cu succes.")

