#Faceti un script de python ce face backup la un fisier (doar dacă acesta a fost modificat). 
# Calea catre fișierul la care face backup este primita ca argument.  
# Puneti scriptul de python in crontab sa ruleze automat la fiecare minut.
#Hint: 
#-	hashlib.sha256(f.read()).hexdigest() (reutilizati metoda de la ex2)
#-	os.listdir(backup_dir)
#-	os.path.isfile(file_path)
#-	timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
#-	shutil.copy2(file_path, backup_name)

import os
import shutil
from datetime import datetime
import utils
import sys

if len(sys.argv) != 2:
    print("Utilizare: python3 ex3.py <file_path>")
    sys.exit(1)

file_path = sys.argv[1]
backup_dir = "backup"   # Directorul unde se vor salva backup-urile 

if not os.path.isfile(file_path):
    print(f"Fisierul nu exista: {file_path}")   
    sys.exit(1)

# Cream directorul de backup daca nu exista
os.makedirs(backup_dir, exist_ok=True)  

# Generam hash-ul pentru fisierul original
original_hash = utils.hash_file(file_path)

# Verificam daca exista un backup anterior
backup_files = os.listdir(backup_dir)
backup_name = None
for f in backup_files:
    if f.startswith(os.path.basename(file_path)) and f.endswith(".bak"):
        backup_name = f
        break

if backup_name:
    # Daca exista un backup, comparam hash-urile
    backup_hash = utils.hash_file(os.path.join(backup_dir, backup_name))
    if original_hash == backup_hash:
        print("Fisierul nu a fost modificat. Backup-ul este actual.")
        sys.exit(0)

# Daca fisierul a fost modificat sau nu exista un backup, cream unul nou
timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
backup_name = f"{os.path.basename(file_path)}_{timestamp}.bak"
shutil.copy2(file_path, os.path.join(backup_dir, backup_name))
print(f"Backup creat: {backup_name}")
