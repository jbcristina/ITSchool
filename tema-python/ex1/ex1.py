# Scrieti un script de python care:
#   1. Defineste cate o variabila din fiecare tip invatat:
#       string, number, boolean, None, list, set, Dictionary, Tuple
#   2. Pentru fiecare variabila afișați valoarea și tipul ei folosind metoda print
#   3. Creați o alta variabila cu numele documentație de tip string pe mai multe linii in care sa puneti pentru fiecare 
#       variabila ceva de genul:
#       “””
#       Variabila X1 este de tipul Y1 si are valoare Z1
#       Variabila X2 este de tipul Y2 si are valoare Z2
#       “””
#   4. Afisati si acest string documentatie in consola.

# Definirea variabilelor
string_var = "Hello, World!"
number_var = 42
boolean_var = True
none_var = None
list_var = [1, 2, 3, 4, 5]
set_var = {1, 2, 3, 4, 5}
dict_var = {
    "nume": "Ionescu", 
    "prenume": "Bogdan"}
tuple_var = (1, 2, 3)   

# Afișarea valorilor și tipurilor variabilelor
print(f"Variabila string_var este de tipul {type(string_var)} si are valoarea: {string_var}")
print(f"Variabila number_var este de tipul {type(number_var)} si are valoarea: {number_var}")
print(f"Variabila boolean_var este de tipul {type(boolean_var)} si are valoarea: {boolean_var}")
print(f"Variabila none_var este de tipul {type(none_var)} si are valoarea: {none_var}")
print(f"Variabila list_var este de tipul {type(list_var)} si are valoarea: {list_var}")
print(f"Variabila set_var este de tipul {type(set_var)} si are valoarea: {set_var}")
print(f"Variabila dict_var este de tipul {type(dict_var)} si are valoarea: {dict_var}")
print(f"Variabila tuple_var este de tipul {type(tuple_var)} si are valoarea: {tuple_var}")

# Crearea documentației
documentatie = f"""
Variabila string_var este de tipul {type(string_var).__name__} si are valoarea: {string_var}
Variabila number_var este de tipul {type(number_var).__name__} si are valoarea: {number_var}
Variabila boolean_var este de tipul {type(boolean_var).__name__} si are valoarea: {boolean_var}
Variabila none_var este de tipul {type(none_var).__name__} si are valoarea: {none_var}
Variabila list_var este de tipul {type(list_var).__name__} si are valoarea: {list_var}
Variabila set_var este de tipul {type(set_var).__name__} si are valoarea: {set_var}
Variabila dict_var este de tipul {type(dict_var).__name__} si are valoarea: {dict_var}
Variabila tuple_var este de tipul {type(tuple_var).__name__} si are valoarea: {tuple_var}
""" 
# Afișarea documentației
print(f"Variabila documentatie: {documentatie}")