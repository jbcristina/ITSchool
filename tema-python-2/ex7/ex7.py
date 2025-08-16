# Faceti un script de python care primeste ca argument un string base64 si un nume de fisier. 
# Scriptul o sa creeze pe disk un fișier cu numele primit ca argument și o sa ii puna ca și conținut 
# stringul decodat din base64.
# Testati scriptul.

import base64
import sys

if len(sys.argv) != 3:
    print("Utilizare: python3 ex7.py <string_base64> <nume_fisier>")
    sys.exit(1)

encoded_text = sys.argv[1]
filename = sys.argv[2]

try:
    # Decodificam textul din base64
    decoded_bytes = base64.b64decode(encoded_text)
    decoded_text = decoded_bytes.decode('utf-8')

    # Scriem textul decodat in fisier
    with open(filename, 'w', encoding='utf-8') as file:
        file.write(decoded_text)

    print(f"Fisierul '{filename}' a fost creat cu succes.")
except Exception as e:
    print(f"Eroare la procesarea textului: {e}")
    sys.exit(1)
