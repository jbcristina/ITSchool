# Faceți un modul de utils (sau adaugati in modulul creat la exercițiile precedente) in care adaugati 
# 2 metode: una care face encode base64 la un text si alta care face decode base64 la text. 
# Testați aceste metode de utils dintr-un alt script de python.


from utils import encode_base64, decode_base64

original_text = '''Hello, 
6548976378)*&**#$@@
World!'''
print(f"Original: {original_text}")
encoded_text = encode_base64(original_text)
print(f"Encoded: {encoded_text}")
decoded_text = decode_base64(encoded_text)
print(f"Decoded: {decoded_text}")
