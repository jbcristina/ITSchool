varsta = input("Care este varsta ta? ")
varsta = int(varsta)

# varsta_ca_numar = int(varsta)
# print(type(varsta_ca_numar))

# if varsta >= 18:
# 	print(f"Esti major. Poti aplica pt permis")
# else:
# 	print(f"Esti minor. Revino peste {18-varsta} ani")

if varsta < 0:
    print(f"Varsta nu poate fi un numar negativ: {varsta}")
elif varsta < 18:
    print(f"Esti minor")
else:
    print(f"Esti major")
