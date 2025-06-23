zile = {"Lu", "Ma", "Mi", "Jo", "Vi"}

print(zile)


friends_list = ["Ana", "Mihai", "Mioara", "Ana"]
friends_set = {"Ana", "Mihai", "Mioara", "Ana"}
friends_tuple = ("Ana", "Mihai", "Mioara", "Ana", "Mihai")

friends_set.add("Mihai")

print(f"friends_set = {friends_set}")
print(f"friends_list = {friends_list}")
print(f"friends_tuple = {friends_tuple}")
print(f"friends_tuple[3] = {friends_tuple[3]}")

for friend in friends_set:
    print(f"friend_set = {friend}")

for friend in friends_tuple:
    print(f"friend_tuple = {friend}")