#!/bin/bash

# Adauga automat hasbang in fisierele de sh in care nu este prezent. 
# Scriptul verifica toate scripturile sh dintr-un director primit ca parametru.

# Verificăm dacă s-a furnizat un argument
if [ "$#" -ne 1 ]; then
    echo "Utilizare: $0 <director_scripturi>"
    exit 1
fi

# Obținem argumentul
DIRECTOR="$1"
# Verificăm dacă directorul există
if [ ! -d "$DIRECTOR" ]; then
    echo "Directorul $DIRECTOR nu există."
    exit 1
fi
# Căutăm toate fișierele cu extensia .sh în directorul specificat
find "$DIRECTOR" -type f -name "*.sh" | while read -r SCRIPT; do
    # Verificăm dacă fișierul conține deja un shebang
    if ! grep -q "^#!/bin/bash" "$SCRIPT"; then
        echo "Adăugăm shebang în $SCRIPT"
        # Adăugăm shebang la începutul fișierului
        sed -i '1s/^/#!\/bin\/bash\n/' "$SCRIPT"
    else
        echo "Shebang deja prezent în $SCRIPT"
    fi
done
