

def detalii_cursant(nume, age):
    return{
        "name": nume,
        "age": age
    }
c_1 = detalii_cursant("Andrei", 23)
c_2 = detalii_cursant(nume="Mihai", age=17)

print(f"{c_1}")
print(f"{c_2}")

def dimensiuni_poza(file):
    #citim poza de pe disk
    return 1024, 800

poza_1_w, poza_1_h = dimensiuni_poza("/tmp/poze/poza1.jpg")
print(poza_1_w, poza_1_h)