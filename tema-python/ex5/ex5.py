# Pornind de la un fișier text numit logs.txt în care sunt stocate mesaje de log de la mai multe servere, 
# fiecare mesaj pe o linie, vrem să identificăm toate liniile care conțin cuvântul ERROR și să le afisam 
# împreună cu numărul liniei.
#   1. Folosește o buclă for pentru a parcurge fiecare linie din fișier.
#   2. Verifică dacă linia conține cuvântul ERROR.
#   3. Afișează linia și numărul acesteia dacă conține ERROR.

with open('logs.txt', 'r') as file:
    for line_number, line in enumerate(file, start=1):
        if 'ERROR' in line:
            print(f"Line {line_number}: {line.strip()}")
# Afișăm un mesaj de finalizare:
print("Processing complete.")
