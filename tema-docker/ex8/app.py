import logging
import time
from datetime import datetime

logfile_path = "/log/app.log"

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(message)s",
    handlers=[
        logging.FileHandler(logfile_path), #scrie in fisier
        logging.StreamHandler()  #scrie in consola
    ]
)

while True:
    msg = f"Mesaj log la {datetime.now().isoformat(sep=' ')}"
    logging.info(msg)
    time.sleep(1)