import sys

def get_argument (poz_arg, valoare_implicita):
    if len(sys.argv) >= poz_arg + 1:
        return sys.argv[poz_arg]
    else:
        return valoare_implicita

def get_int_arg (poz_arg, valoare_implicita):
    arg_string = get_argument(poz_arg, valoare_implicita)
    if arg_string.isdigit():
        return int(arg_string)
    else:
        return valoare_implicita