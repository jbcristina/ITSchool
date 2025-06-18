
# Scrieti un program in python care:
#   ● Citește o variabila cu numele “parolă” introdusă de utilizator, folosind metoda input()
#   ● Verifica dacă variabila are aceeași valoare ca o variabila de mediu cu numele PAROLA_SECRETA
#   ● Dacă are aceeași valoare, printati “Parola corecta”, în caz contrar afișați parola greșită.
#   ● Rulați programul cu mai multe valori și verificati ca face ce trebuie.

import os
# Citirea variabilei de la utilizator
parola = input("Introduceți parola: ")

# Verificarea parolei
if parola == os.getenv("PAROLA_SECRETA"):
    print("Parola corecta")
else:
    print("Parola gresita") 

# Nota: Setam variabila de mediu PAROLA_SECRETA înainte de a rula acest script:
# export PAROLA_SECRETA="parola_ta_secreta"