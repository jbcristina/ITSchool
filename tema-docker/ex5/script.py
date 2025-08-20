import os
import time
import shutil
import random

src = "/tmp/input"
dst = "/tmp/output"

while True:
    fisiere = os.listdir(src)
    fisiere = sorted(fisiere)
    #print(fisiere)

    if not fisiere:
        print(f"Nu sunt fisiere de mutat. Astept....")
        time.sleep(2)
        continue

    nume_fisier = fisiere[0]
    cale_completa_src = src + "/" + nume_fisier
   #print(cale_completa_src)

    cale_completa_dst = dst + "/" + nume_fisier
    #print(cale_completa_dst)

    try:
        shutil.move(cale_completa_src,cale_completa_dst)
        sleep_time = random.randint(2,5)
        print(f"Am mutat {nume_fisier}")
        print(f"Am dormit {sleep_time}")
    except Exception as e:
        print(f"{nume_fisier} nu poate fi mutat. Exceptie {e}")
    time.sleep(sleep_time)

