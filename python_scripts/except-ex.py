
while True:
    try:
        age = input("Varsta? ")
        age = int(age)
        if age > 150:
            raise Exception("Varsta este prea mare")
        break
    except ValueError as exceptie_value_error:
        print(f"Value error este: {exceptie_value_error}")
        print("Varsta invalida. Mai incearca")       
    except Exception as exceptie:
        print(f"Eroarea este: {exceptie}")
        print("Varsta invalida. Mai incearca")
    finally:
        print("FINALLY: Asta se executa mereu")

while True:
    try:
        street_number = input("Numarul strazii? ")
        street_number = int(street_number)
        if street_number > 10000:
            raise Exception("Varsta este prea mare")
        break
    except ValueError as exceptie_value_error:
        print(f"Value error este: {exceptie_value_error}")   
    except Exception as exceptie:
        print(f"Eroarea este: {exceptie}")
    finally:
        print("FINALLY: Asta se executa mereu")

print(type(age))

print(f"Bye,Bye. Age {str(age)}")
