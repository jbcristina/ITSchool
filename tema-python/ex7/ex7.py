# Vrei să monitorizezi timpul de răspuns al unui site web pentru a verifica dacă serverul răspunde rapid. 
# Scriptul va trimite cereri HTTP la fiecare 2 secunde și va afișa timpul de răspuns în milisecunde.
#   1. Scrieți o funcție ce primește ca parametru un url și întoarce timpul de răspuns al paginii 
#  (cat dureaza sa primim un răspuns).
#    ○ folosește libraria time pt asta.
#   2. Adaugati încă o funcție ce primește doi parametrii (un url si un numar de repetari):
#      ○ Funcția va face într-un for sau while un număr de cal-uri către url și va memora timpurile de răspuns 
# într-o listă (folosind prima metoda)
#      ○ Funcția va face o medie și va întoarce într-un tuplu 3 valori în următoarea ordine: (min, media, max)
#      ○ Rulați de cateva ori funcția cu cateva url-uri si afișați rezultatele

import time
import requests

# Funcția care returnează timpul de răspuns în milisecunde pentru un url
def get_response_time(url):
    start = time.time()
    try:
        requests.get(url)
    except requests.RequestException:
        return None
    end = time.time()
    return round((end - start) * 1000, 2)  # timp în milisecunde, rotunjit la 2 zecimale

# Funcția care face mai multe apeluri și calculează min, medie, max
def measure_response_times(url, repetitions):
    times = []
    for _ in range(repetitions):
        resp_time = get_response_time(url)
        if resp_time is not None:
            times.append(resp_time)
        time.sleep(2)  # Pauză între apeluri

    if not times:
        return (None, None, None)

    return (
        min(times),
        round(sum(times) / len(times), 2),
        max(times)
    )

# Exemplu de rulare
urls = ["https://www.google.com", "https://www.microsoft.com"]

for site in urls:
    min_t, avg_t, max_t = measure_response_times(site, 5)
    print(f"{site} ➜ Timp răspuns (ms) ➜ Min: {min_t}, Medie: {avg_t}, Max: {max_t}")