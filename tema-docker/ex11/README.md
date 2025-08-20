# Creați 2 rețele docker de tip bridge cu numele public si private.  Rețeaua private trebuie sa nu aiba access la internet (vezi optiunea –internal).
# Porniti 3 containere de docker plecand de la imaginea tools (vezi exercițiul 9). Numele containerelor sunt: frontend, backend si database. 
# Conectati containerele la aceste rețele astfel incat:
# -	frontend-ul poate sa acceseze backend-ul, dar nu si baza de date.
# -	backend-ul poate sa acceseze atat frontend-ul cat si baza de date
# -	baza de date poate fi accesată doar de către backend și nu are access la internet.
# Verificati aceste conexiuni facand ping din fiecare container.


cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker network create public
f61d3f36b682c0f9be78f0e93a184c630d544cb9442613ae63ff845a3fb57572
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker network create --internal private
f7690117c5da94738809f931bc37a5f96fe6ea446203bf4548086a1248ed6254
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker run -dit --name frontend --network public tools:latest 
e312aada590013e100981b9caaacfc31bf1eb315d0ff424abe379c0c7d7f6316
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker run -dit --name backend --network public tools:latest 
628d97f0d6c46a3e4a1f6e3c448a055c0ea24fb11d7d28f7e437c4c369c4453d
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker run -dit --name database --network private tools:latest 
1585b2326e230a0c3428558e8e09274ad5af18847e4e991ddb6c23d29f92e11d
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker network connect private backend
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker inspect frontend | grep -A 5 Networks
            "Networks": {
                "public": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "MacAddress": "5a:36:04:c1:e2:19",
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker inspect backend | grep -A 25 Networks
            "Networks": {
                "private": {
                    "IPAMConfig": {},
                    "Links": null,
                    "Aliases": [],
                    "MacAddress": "1a:fd:2f:d1:38:82",
                    "DriverOpts": {},
                    "GwPriority": 0,
                    "NetworkID": "f7690117c5da94738809f931bc37a5f96fe6ea446203bf4548086a1248ed6254",
                    "EndpointID": "f7eddd9ca00b0b7df8ba856a4d4f027c26c27ce8406aa5f11d19d3a9ae8dfc11",
                    "Gateway": "",
                    "IPAddress": "172.20.0.3",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DNSNames": [
                        "backend",
                        "628d97f0d6c4"
                    ]
                },
                "public": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "MacAddress": "56:73:64:94:a9:c2",
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker inspect database | grep -A 25 Networks
            "Networks": {
                "private": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "MacAddress": "86:89:e0:74:10:b8",
                    "DriverOpts": null,
                    "GwPriority": 0,
                    "NetworkID": "f7690117c5da94738809f931bc37a5f96fe6ea446203bf4548086a1248ed6254",
                    "EndpointID": "ad4a470eefa3f22e84e60cbd4a8e92c3d6e4dabf3cb327718189f12f7ad60a35",
                    "Gateway": "",
                    "IPAddress": "172.20.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DNSNames": [
                        "database",
                        "1585b2326e23"
                    ]
                }
            }
        }
    }
]
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker exec -it frontend ping -c 2 backend 
PING backend (172.19.0.3) 56(84) bytes of data.
64 bytes from backend.public (172.19.0.3): icmp_seq=1 ttl=64 time=0.198 ms
64 bytes from backend.public (172.19.0.3): icmp_seq=2 ttl=64 time=0.313 ms
--- backend ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 0.198/0.255/0.313/0.057 ms
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker exec -it frontend ping -c 2 database 
ping: database: Temporary failure in name resolution
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker exec -it backend ping -c 2 frontend 
PING frontend (172.19.0.2) 56(84) bytes of data.
64 bytes from frontend.public (172.19.0.2): icmp_seq=1 ttl=64 time=0.720 ms
64 bytes from frontend.public (172.19.0.2): icmp_seq=2 ttl=64 time=0.410 ms
--- frontend ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1059ms
rtt min/avg/max/mdev = 0.410/0.565/0.720/0.155 ms
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker exec -it backend ping -c 2 database 
PING database (172.20.0.2) 56(84) bytes of data.
64 bytes from database.private (172.20.0.2): icmp_seq=1 ttl=64 time=2.30 ms
64 bytes from database.private (172.20.0.2): icmp_seq=2 ttl=64 time=0.058 ms
--- database ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1000ms
rtt min/avg/max/mdev = 0.058/1.181/2.304/1.123 ms
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker exec -it database ping -c 2 frontend 
ping: frontend: Temporary failure in name resolution
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker exec -it database ping -c 2 backend 
PING backend (172.20.0.3) 56(84) bytes of data.
64 bytes from backend.private (172.20.0.3): icmp_seq=1 ttl=64 time=0.071 ms
64 bytes from backend.private (172.20.0.3): icmp_seq=2 ttl=64 time=0.065 ms
--- backend ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1060ms
rtt min/avg/max/mdev = 0.065/0.068/0.071/0.003 ms
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker exec -it frontend ping -c 2 google.com
PING google.com (142.251.39.78) 56(84) bytes of data.
64 bytes from bud02s39-in-f14.1e100.net (142.251.39.78): icmp_seq=1 ttl=254 time=21.6 ms
64 bytes from bud02s39-in-f14.1e100.net (142.251.39.78): icmp_seq=2 ttl=254 time=20.5 ms
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1071ms
rtt min/avg/max/mdev = 20.534/21.071/21.609/0.537 ms
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker exec -it backend ping -c 2 google.com
PING google.com (142.251.39.78) 56(84) bytes of data.
64 bytes from bud02s39-in-f14.1e100.net (142.251.39.78): icmp_seq=1 ttl=254 time=20.1 ms
64 bytes from bud02s39-in-f14.1e100.net (142.251.39.78): icmp_seq=2 ttl=254 time=19.1 ms
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1003ms
rtt min/avg/max/mdev = 19.080/19.579/20.078/0.499 ms
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex11$ docker exec -it database ping -c 2 google.com
ping: google.com: Temporary failure in name resolution