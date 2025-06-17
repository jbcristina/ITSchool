
import json
import os
import sys

if os.path.isfile("/tmp/baza_de_date.json"):
    with open("/tmp/baza_de_date.json", mode="r") as file:
        detalii_cursant = json.load(file)
else:
    nume_user = input("Introduceti nume: ")
    varsta_user = input("Introduce varsta: ")
    parola_user = input ("Introduce parola: ")
    detalii_cursant = {
        "nume": nume_user,
        "varsta": varsta_user,
        "parola": parola_user
        }

if "is_blocked" in detalii_cursant and detalii_cursant["is_blocked"]:
    print(f"Userul {detalii_cursant['nume']} este blocat")
    sys.exit(1)
else:
    print("Te rog sa te loghezi")

for index in range(1,4):
    mesaj = f"Suntem la incercarea {index} din 3"
    print(mesaj)
    parola_user = input ("Introduce parola: ")
    if parola_user == detalii_cursant["parola"]:
        print("Esti logat!")
        break
    else:
        print("Parola gresita!")
        if index == 3:
            print("User blocat!")
            detalii_cursant["is_blocked"] = True
     

with open("/tmp/baza_de_date.json", mode="w") as file:
    json.dump(detalii_cursant, file, indent=4)
