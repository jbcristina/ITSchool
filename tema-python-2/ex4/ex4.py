# Faceți un script de python ce verifica dacă nivelul de ocupare al discului este mai mare de un prag 
# (configurable printr-o variabila de mediu - implicit 90%). În cazul în care ocuparea discului 
# este mai mare de acest prag printeaza un mesaj de alertă în consola.
# Puneti acest script sa ruleze in ~/.bashrc

import os
import shutil
import time

# Citim pragul din variabila de mediu sau folosim valoarea implicită (90%)
threshold = int(os.getenv('DISK_USAGE_THRESHOLD', 90))

# Obtinem informatii despre partitia root "/"
total, used, free = shutil.disk_usage("/")

# Calculam procentul de ocupare
percent_used = (used / total) * 100

 
# Verificam daca procentul utilizat este mai mare decat pragul
if percent_used > threshold:
    print(f"Alerta: Ocuparea discului este {percent_used:.2f}%, depasind pragul de {threshold}%.")
else:
    print(f"Ocuparea discului este {percent_used:.2f}%, sub pragul de {threshold}%.")
  
