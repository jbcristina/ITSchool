
detalii_cursant = {
    "nume": "Popescu",
    "prenume": "Ioana",
    "age": 54,
    "adresa": {
        "strada": "Int. Muncii",
        "nr": 34
    }
}

#print(detalii_cursant)
#print(detalii_cursant["nume"])

detalii_cursant["age"] = 32
detalii_cursant["join_date"] = "13 May"

del detalii_cursant["join_date"]

detalii_cursant["adresa"]["strada"] = "Bd. Unirii"

for detaliu_cursant in detalii_cursant:
    print(f"{detaliu_cursant} = {detalii_cursant[detaliu_cursant]}")

