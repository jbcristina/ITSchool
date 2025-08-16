#Faceți un script de python ce genereaza un log fake. 
#Cerinte:
#-	scriptul primește ca argument cate linii de log să genereze
#-	fiecare linie este scrisă cu un level de logging random (INFO, WARNING, sau ERROR) 
#-	fiecare linie de log contine:
#-	un mesaj random dintr-o lista de mesaje predefinite de voi
#-	un request id random dintr-o lista fixa de 10 request id-uri generata la începutul scriptului (fiecare request id este un UUID)
#-	data și ora la care s-a printat mesajul și nivelul de logging
#Folosiți cateva comenzi de shell sa explorati log-ul generat.  
#Hint:
#-	random.choice(my_list)
#-	uuid.uuid4()
#-	logging library configurata ca la curs (vezi Comenzi Utile)

import logging
import random
import uuid
import sys
from datetime import datetime

# Configurare logging
logging.basicConfig(
    filename='log_file.log',  # Numele fișierului de log
    format='%(asctime)s - %(levelname)s - %(message)s',
    level=logging.DEBUG,
    datefmt='%Y-%m-%d %H:%M:%S'
)

# Lista de mesaje predefinite
messages = [
    "User logged in successfully",
    "File uploaded successfully",
    "Error processing request",
    "Data saved to database",
    "Connection timeout",
    "Invalid user credentials",
    "File not found",
    "Operation completed successfully",
    "Unexpected error occurred",
    "Request processed"
]

# Generare lista de 10 request ID-uri unice
#request_ids = [str(uuid.uuid4()) for _ in range(10)]

request_ids = []

for id in range(10):
    request_ids.append(str(uuid.uuid4()))


# Verificare argumente
if len(sys.argv) != 2:
    print("Utilizare: python3 ex1.py <number_of_lines>")
    sys.exit(1)

# Obținerea numărului de linii de log de generat
try:
    num_lines = int(sys.argv[1])
except ValueError:
    print("Introduceti un numar intreg pentru numarul de linii.")
    sys.exit(1)
    
# Generare linii de log
for _ in range(num_lines):
    level = random.choice([logging.INFO, logging.WARNING, logging.ERROR])
    message = random.choice(messages)
    request_id = random.choice(request_ids)
    
    # Logare mesaj
    if level == logging.INFO:
        logging.info(f"Request ID: {request_id} - {message}")
    elif level == logging.WARNING:
        logging.warning(f"Request ID: {request_id} - {message}")
    elif level == logging.ERROR:
        logging.error(f"Request ID: {request_id} - {message}")

# Afișare mesaj de final
print(f"Generated {num_lines} log lines.")