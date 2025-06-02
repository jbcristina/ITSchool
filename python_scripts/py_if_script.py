import sys

user_admin = "admin"
pass_admin = "admin1234"

user_prompt = input("Introduceti userul: ")
pass_prompt = input("Introduceti parola: ")

if user_prompt == user_admin and pass_prompt == pass_admin:
    print("Te-ai logat!")
else:
    print("User sau parola gresita!")
    sys.exit(1)

print("Bye, bye!")
