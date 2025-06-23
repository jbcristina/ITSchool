import psutil

psutil.cpu_count()
print(f"{psutil.cpu_count()}")

disk_usage = psutil.disk_usage("/")
disk_usage_total = disk_usage.total
disk_usage_free = disk_usage.free
disk_usage_used = disk_usage.used
procent = disk_usage.percent
print(f"{disk_usage}")
print(f"{disk_usage_total / (1024**3):.2f} GB")
print(f"{disk_usage_free / (1024**3):.2f} GB")
print(f"{disk_usage_used / (1024**3):.2f} GB")
print(f"{procent}%")

for proc in psutil.process_iter(["pid", "name", "status", "username"]):
    print(proc.info)