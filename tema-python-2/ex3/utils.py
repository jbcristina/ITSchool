import hashlib

def hash_file(file_path):
    """Returneaza SHA256 pentru un fisier."""
    with open(file_path, 'rb') as f:
        return hashlib.sha256(f.read()).hexdigest()