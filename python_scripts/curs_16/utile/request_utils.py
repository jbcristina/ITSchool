import requests
import time

def get_response_time(url):
    start_time = time.time()
    response = requests.get(url)
    end_time = time.time()
    duration = end_time - start_time
    print(f"Call-ul catre {url} a durat {duration:.2f} milisecunde")
    return duration
