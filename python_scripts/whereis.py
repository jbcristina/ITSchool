import sys
import os

if len(sys.argv) != 2:
    print("Ai chemat scrptul in mod gresit!")
    print(f"Example: python3 {sys.argv[0]} ls")
    sys.exit(1)
else:
    scriptul_cautat = sys.argv[1]

print(f"Cautam locatia executabilului {scriptul_cautat}")

variabila_path = os.getenv("PATH")

lista_cai = variabila_path.split(":")
for cale_din_path in lista_cai:
    if os.path.isdir(cale_din_path):
        cale_completa = cale_din_path + "/" + scriptul_cautat
        if os.path.isfile(cale_completa):
            print(cale_completa)