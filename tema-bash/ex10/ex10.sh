#!/bin/bash

# Adaugati in variabila de mediu PATH directorul cu calea ~/bin-itschools/ doar dacă acesta exista. 
# Faceți acest lucru în mod automat de fiecare data cand se porneste o sesiune cu login pentru userul curent. 
# Adaugati un script în acel director și încercați să-l executați de oriunde.

# Verificam daca directorul ~/bin-itschools/ exista
if [ -d "$HOME/bin-itschools" ]; then
    # Adaugam directorul la PATH daca nu este deja acolo
    # Variabila PATH conține o listă de directoare separate prin două puncte (:), 
    # în care sistemul caută executabile atunci când rulezi comenzi în terminal. 
    # Pentru a evita adăugarea de mai multe ori a aceluiași director, această condiție folosește o tehnică sigură: 
    # adaugă două puncte la început și la sfârșit (":$PATH:") și caută secvența exactă :$HOME/bin-itschools: oriunde în șir. 
    # Dacă această secvență nu este găsită (!=), atunci blocul de cod din interiorul instrucțiunii if va fi executat, 
    # adăugând directorul la PATH. Astfel, această linie previne duplicarea directorului în PATH și asigură că acesta este adăugat
    # doar dacă nu există deja.
    if [[ ":$PATH:" != *":$HOME/bin-itschools:"* ]]; then   
        export PATH="$HOME/bin-itschools:$PATH"
        echo "Directorul ~/bin-itschools/ a fost adaugat la PATH."
    else
        echo "Directorul ~/bin-itschools/ este deja in PATH."
    fi
else
    echo "Directorul ~/bin-itschools/ nu exista."
fi

# Crearea directorului ~/bin-itschools/ daca nu exista
mkdir -p "$HOME/bin-itschools"
# Crearea unui script de test in ~/bin-itschools/
echo -e "#!/bin/bash\necho \"Script executat cu succes!\"" > "$HOME/bin-itschools/test_script.sh"
# Facem scriptul executabil
chmod +x "$HOME/bin-itschools/test_script.sh"
# Informații despre utilizare
echo "Pentru a rula scriptul, utilizați comanda: test_script.sh sau ~/bin-itschools/test_script.sh"
# Sfarsitul scriptului
exit 0
# Notă: Pentru ca modificările să aibă efect în sesiunea curentă,
# este necesar să adăugați export PATH="$HOME/bin-itschools:$PATH" în fișierul .bashrc sau .bash_profile al utilizatorului.