# Faceți un modul de utils in care adaugati 2 metode: una care face sha256 hash la un string si alta la un fisier. Testați aceste metode de utils dintr-un alt script de python. Hint:
#- hashlib.sha256(text.encode()).hexdigest()
#- hashlib.sha256(f.read()).hexdigest()
#Bonus question: Folosiți libraria facuta de voi pentru a genera un sha256 hash pentru un fisier de pe disk si comparati-l cu valoarea obtinuta ruland comanda de linux sha256sum.

import hashlib

def hash_string(text):
    """Returneaza SHA256 pentru un string."""
    return hashlib.sha256(text.encode()).hexdigest()

def hash_file(file_path):
    """Returneaza SHA256 pentru un fisier."""
    with open(file_path, 'rb') as f:
        return hashlib.sha256(f.read()).hexdigest()

