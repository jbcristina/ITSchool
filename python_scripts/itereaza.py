
# users = ["Amelie", "Bob", "Charlie"]

# for user in users:
# 	print(f"Userul curent este: {user}")

# users = []

# for index in range(1, 10):
# 	print(f"Userul curent are indexul: {index}")

users = []

# for index in range(1, 11):
# 	user_name = input(f"Numele userului {index} din 5: ")
# 	if not user_name:
# 		print("Nu ai introdus username valid")
# 	elif user_name not in users:
# 		print(f"Introducem userul in lista: {user_name}")
# 		users.append(user_name)
# 	else:
# 		print(f"Userul {user_name} este deja in lista")

# print(f"Lista finala {users}")

for index in range(1, 6):
	user_name = input(f"Numele userului {index} din 5: ")
	if not user_name:
		print("Nu ai introdus username valid")
		continue

	if user_name in users:
		print(f"Userul {user_name} este deja in lista")
		continue

	print(f"Introducem userul in lista: {user_name}")
	users.append(user_name)

print(f"Lista finala: {users}")