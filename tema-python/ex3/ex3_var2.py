
import sys
import os
import utils as fu


print(f"{sys.argv}")

nume = fu.get_argument(1, "John")
varsta = fu.get_int_arg(2, 0)

print(f"Userul este {nume} si are varsta {varsta}")

if int(varsta) >= 18:
    print("Este major")
    if os.path.isdir(f"dir_{nume}"):
        print("Directorul exista")
    else:
        os.makedirs (f"dir_{nume}", exist_ok=True)
else:
    print( "Varsta < 18 ani" )