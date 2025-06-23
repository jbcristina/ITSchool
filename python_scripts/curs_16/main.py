from utile.request_utils import get_response_time

timpul_de_raspuns = get_response_time("http://www.google.com")
print(timpul_de_raspuns)