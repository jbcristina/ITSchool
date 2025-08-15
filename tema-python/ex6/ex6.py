# Vrei să monitorizezi o aplicație pe care ai lansat-o (de exemplu, un script sau un serviciu) și să te asiguri 
# că procesul rulează continuu. Dacă procesul se oprește, scriptul va încerca să îl pornească din nou.
#   1. Folosește o buclă while pentru a monitoriza în mod continuu procesul.
#   2. Verifică dacă procesul este activ folosind comanda pgrep.
#   3. Dacă procesul nu este găsit, pornește aplicația din nou.
#   4. Afișează un mesaj de avertizare de fiecare dată când procesul este repornit.
#   5. Numele procesului ce trebuie monitorizat este hardcodat într-o variabila la începutul scriptului.
#   6. Hints:
#      - process_name = “my-script.sh”
#      - process_check = subprocess.run(["pgrep", "-f", process_name], capture_output=True, text=True)
#      - if process_check.returncode != 0:...

import subprocess
import time

# Numele procesului ce trebuie monitorizat
process_name = "my-script.sh"

while True:
    # Verifică dacă procesul este activ folosind pgrep
    process_check = subprocess.run(["pgrep", "-f", process_name], capture_output=True, text=True)
    if process_check.returncode != 0:
        # Procesul nu este activ, îl pornim din nou
        print(f"[AVERTISMENT] Procesul '{process_name}' nu este activ. Încerc repornirea...")
        try:
            subprocess.Popen(["/bin/bash", process_name])
            print(f"[INFO] Procesul '{process_name}' a fost repornit.")
        except Exception as e:
            print(f"[EROARE] Nu s-a putut porni procesul: {e}")
    
    # Așteaptă 5 secunde înainte de o nouă verificare
    time.sleep(5)
