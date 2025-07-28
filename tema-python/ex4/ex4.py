
# 1. Pentru acest exercițiu trebuie creat un fisier pe disk cu numele urls.txt ce conține pe fiecare linie cate 
# o adresa url, de genul:
#○ https://httpstat.us/201
#○ https://httpstat.us/400
#○ https://httpstat.us/500
#○ https://httpstat.us/404
#○ https://httpstat.us/201
#○ https://httpstat.us/503
#○ https://httpstat.us/200
#○ https://httpstat.us/303
# 2. Citește linie cu line conținutul fișierului urls.txt
# 3. Folosește libraria requests pentru a face un call http catre fiecare url
# 4. Daca url-ul a intors un status de success (intre 200 si 299) adauga url-ul intr-un fisier cu numele success.txt
# 5. Daca url-ul a intors un status de eroare (orice status intre 300 si 599) adauga url-ul intr-un fisier cu numele
#  errors.txt

import requests
import os
from time import sleep
import time

# Definim variabilele pentru numele fișierelor:
urls_file = 'urls.txt'
success_file = 'success.txt'
error_file = 'error.txt'

# Asigurăm că fișierele de ieșire sunt goale înainte de a scrie:
with open(success_file, 'w') as f:
    pass
with open(error_file, 'w') as f:
    pass

# Verificăm dacă fișierul urls.txt există:
if not os.path.exists(urls_file):
    raise FileNotFoundError(f"Fișierul '{urls_file}' nu a fost găsit. Asigurați-vă că există în directorul curent.")    

# Citim URL-urile din fișier:
with open(urls_file, 'r') as file:
    urls = file.readlines()
    # Procesăm fiecare URL:
    for url in urls:
        url = url.strip()  # Stergem orice spațiu alb de la început sau sfârșit
        if not url:
            continue  # Sărim peste liniile goale
        print(f"Processing URL: {url}") # Afișăm URL-ul curent pentru a urmări progresul
        try:
            response = requests.get(url)
            time.sleep(1)  # Așteptăm 1 secundă între cereri pentru a evita blocarea serverului\
            if 200 <= response.status_code < 300:
                with open(success_file, 'a') as success_f:
                    success_f.write(f"{url}\n")
            else:
                with open(error_file, 'a') as error_f:
                    error_f.write(f"{url} - Status Code: {response.status_code}\n")
        except requests.RequestException as e:
            with open(error_file, 'a') as error_f:
                error_f.write(f"{url} - Error: {str(e)}\n")

# Afișăm un mesaj de finalizare:
print("Processing complete. Verificati 'success.txt' si 'error.txt'.")