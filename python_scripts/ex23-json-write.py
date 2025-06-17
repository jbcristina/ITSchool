import json

user_details = {
    "name": "Eugenia Ionescu",
    "age": 23,
    "is_admin": True,
    "address": {
        "street": "One Infinity Loop",
        "number": 1
    }
}

lista_cursanti = [user_details, user_details]

with open("/tmp/user_details.json", "w") as user_detail_storage:
    json.dump(lista_cursanti, user_detail_storage, indent=4)
    print("JSON created on disk!")