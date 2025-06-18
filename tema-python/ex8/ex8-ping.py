
import subprocess

try:
    # Folosește subprocess pentru a executa comanda
    # result = subprocess.run(["ping", "-c", "1", "8.8.8.8"], capture_output=True, text=True, check=True)
    # result = subprocess.run(["ls", "-l", "/etc"], capture_output=True, text=True, check=True)
    result = subprocess.run(["cat", "/etc"], capture_output=True, text=True, check=True)
    print("Comanda a reușit!")
    print("Ieșire:", result.stdout)
except subprocess.CalledProcessError as e:
    print("Comanda a eșuat!")
    print("Cod de eroare:", e.returncode)
    print("Mesaj eroare:", e.stderr)