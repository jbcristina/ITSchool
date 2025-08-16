import utils

#Testam hashing pentru un string
text = "Salut, Cristina!" # Test pentru hash_string
print(f"Hash pentru string: {utils.hash_string(text)}")

#Testam hashing pentru un fisier
file_path = "test_file.txt"
file_hash = utils.hash_file(file_path)
print(f"Hash pentru fisier: {file_path}: {file_hash}")
