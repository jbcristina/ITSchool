
# Faceti un script in python care primeste 2 parametrii (numele utilizatorului si varsta acestuia):
# 1. Importa libraria sys
# 2. Daca nu au fost pasati parametrii, arunca o exceptie.
# 3. Daca au fost pasati parametrii:
#    a. printati mesajul "Au fost pasati <n> parametrii".
#    b. daca varsta este mai mare de 18 ani, creati un subdirector pe disk cu numele utilizatorului.

import sys
import os

if len(sys.argv) < 3:
    raise Exception("Nu au fost pasati parametrii necesari.")
else:
    nume_utilizator = sys.argv[1]
    varsta = int(sys.argv[2])
    
    print(f"Au fost pasati {len(sys.argv) - 1} parametrii.")
    
    if varsta > 18:
        try:
            os.makedirs(nume_utilizator)
            print(f"Subdirectorul '{nume_utilizator}' a fost creat cu succes.")
        except FileExistsError:
            print(f"Subdirectorul '{nume_utilizator}' exista deja.")
        except Exception as e:
            print(f"A aparut o eroare la crearea subdirectorului: {e}")
    else:
        print("Utilizatorul nu are varsta necesara pentru a crea un subdirector.")
        print("Varsta trebuie sa fie mai mare de 18 ani pentru a crea un subdirector.")
        print("Nu s-a creat niciun subdirector.")