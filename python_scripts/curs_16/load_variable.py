from dotenv import load_dotenv
import os

load_dotenv()

print(os.getenv("TOKEN"))
print(os.getenv("PORT"))


