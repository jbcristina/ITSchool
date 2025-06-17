users = ["Bob", "Alice", "Mike"]

print(users)
lungime = len(users)
print(f"Initial list length: {lungime}")
print(f"Initial list length: {len(users)}")

users.append("Mari")
print(f"List length after adding Mari: {len(users)}")

print(f"On index 2 we have {users[2]}")
print("Update index 2:")
users[2] = "Patrick"
print(f"On index 2 we have: {users[2]}")

print(f"Stergem elementul de pe pozitia 1 din lista {users}")
del users[1]
print(f"Lista dupa stergere: {users}")

este_bob_in_lista = "Bob" in users
print(f"Este Bob: {este_bob_in_lista}")

prieteni = ["Amelie", "Charlie", "Charlie", "Stefan"]

users.extend(prieteni)
print(users)

users.sort()
print(users)

users.sort(reverse=True)
print(f"Reverse Sorted: {users}")

users.clear()
print(f"List after clear: {users}")
