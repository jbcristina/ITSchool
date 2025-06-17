
friends = {"Charlie", "Bob", "Charlie", "Alice"}

print(f"Set: {friends}")
print(f"Set: {len(friends)}")

#Cannot access by position in sets
#print(f"Set: {friends[0]}")

print(f"List size before pop: {len(friends)}")

#pop get and remove the element
print(f"A random element from list: {friends.pop()}")
print(f"List size after pop: {len(friends)}")

friends.add("Mark") #Add element
print(f"Set after add: {friends}")

if "Charlie" in friends:
    friends.remove("Charlie")  # Remove element (KeyError if not found)
    print(f"List: {friends}")
else:
    print(f"No Charlie here")

friends.discard("Patrick")  # Safe remove (no error if not found)
friends.update(["Sam", "Pam"])  # Add multiple elements

print("Final list: ")

for friend in friends:
    print(f"\t {friend}")