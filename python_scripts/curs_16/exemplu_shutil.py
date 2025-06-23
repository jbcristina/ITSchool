import shutil
import os

os.makedirs("sub_shutils", exist_ok=True)

shutil.copy2("python_scripts/curs_16/login.py", "sub_shutils/login_cp.py")
shutil.make_archive("arhiva", format="zip", root_dir="sub_shutils")
shutil.unpack_archive("arhiva.zip", extract_dir="/tmp")