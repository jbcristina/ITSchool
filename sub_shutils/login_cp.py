import logging
logging.basicConfig(
    level=logging.DEBUG,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[
        logging.FileHandler("app.log"),
        logging.StreamHandler()
    ]

)

logging.debug("Acesta este un mesaj de debug")
logging.info("Acesta este un mesaj de info")
logging.warning("Acesta este un mesaj de warning")
logging.error("Acesta este un mesaj de error")
