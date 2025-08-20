# Creați o nouă rețea de tipul bridge cu numele retea-interna.
# Porniti doua containere de tipul tools (vezi exercițiul 9) cu nume diferite.
# Logati-va pe fiecare container și încercați sa dati ping la celalat container folosind ip-ul și apoi DNS-ul.
# Deconectati DOAR primul container de la reteaua retea-interna. Incercati iar sa dati ping intre containere pe baza de IP si pe baza de DNS. 
# Conectati ambele containere la reteaua bridge default. Inspectati ambele retele (bridge-ul default si bridge-ul retea-interna) si verificati ce containere sunt atasate. 
# Inspectati si containerele si verificati la ce retele sunt conectate.


cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker network create retea-interna
e7bbb48b556be5caa413398aa66f12ea46c5e7fd63332c54e36beab46f6a2760
--------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker run -dit --name container1 --network retea-interna tools:latest 
35fad0a50cbda95d9f4680bce87a6d68f82cc497ca456b8bec856f5951542e6c
----------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker run -dit --name container2 --network retea-interna tools:latest 
b0c38f6e182d31f630dd509e5a7b14c90ed5dc549cf49fc17fec67ec81af38c3
----------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker inspect container1
                    "Gateway": "172.18.0.1",
                    "IPAddress": "172.18.0.2",
---------------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker inspect container2
                    "Gateway": "172.18.0.1",
                    "IPAddress": "172.18.0.3",
--------------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker exec -it container1 bash
root@35fad0a50cbd:/# ping 172.18.0.3
PING 172.18.0.3 (172.18.0.3) 56(84) bytes of data.
64 bytes from 172.18.0.3: icmp_seq=1 ttl=64 time=1.28 ms
64 bytes from 172.18.0.3: icmp_seq=2 ttl=64 time=0.090 ms
64 bytes from 172.18.0.3: icmp_seq=3 ttl=64 time=0.059 ms
64 bytes from 172.18.0.3: icmp_seq=4 ttl=64 time=0.082 ms
^C
--- 172.18.0.3 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3082ms
rtt min/avg/max/mdev = 0.059/0.377/1.277/0.519 ms
root@35fad0a50cbd:/# ping container2
PING container2 (172.18.0.3) 56(84) bytes of data.
64 bytes from container2.retea-interna (172.18.0.3): icmp_seq=1 ttl=64 time=0.105 ms
64 bytes from container2.retea-interna (172.18.0.3): icmp_seq=2 ttl=64 time=0.454 ms
64 bytes from container2.retea-interna (172.18.0.3): icmp_seq=3 ttl=64 time=0.060 ms
64 bytes from container2.retea-interna (172.18.0.3): icmp_seq=4 ttl=64 time=0.061 ms
^C
--- container2 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3053ms
rtt min/avg/max/mdev = 0.060/0.170/0.454/0.164 ms
root@35fad0a50cbd:/# exit
exit
---------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker exec -it container2 bash
root@b0c38f6e182d:/# ping 172.18.0.2
PING 172.18.0.2 (172.18.0.2) 56(84) bytes of data.
64 bytes from 172.18.0.2: icmp_seq=1 ttl=64 time=0.072 ms
64 bytes from 172.18.0.2: icmp_seq=2 ttl=64 time=0.082 ms
64 bytes from 172.18.0.2: icmp_seq=3 ttl=64 time=0.060 ms
64 bytes from 172.18.0.2: icmp_seq=4 ttl=64 time=0.061 ms
^C
--- 172.18.0.2 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3076ms
rtt min/avg/max/mdev = 0.060/0.068/0.082/0.009 ms
root@b0c38f6e182d:/# ping container1
PING container1 (172.18.0.2) 56(84) bytes of data.
64 bytes from container1.retea-interna (172.18.0.2): icmp_seq=1 ttl=64 time=0.165 ms
64 bytes from container1.retea-interna (172.18.0.2): icmp_seq=2 ttl=64 time=0.064 ms
64 bytes from container1.retea-interna (172.18.0.2): icmp_seq=3 ttl=64 time=0.057 ms
64 bytes from container1.retea-interna (172.18.0.2): icmp_seq=4 ttl=64 time=0.058 ms
^C
--- container1 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3074ms
rtt min/avg/max/mdev = 0.057/0.086/0.165/0.045 ms
root@b0c38f6e182d:/# exit
exit
--------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker network disconnect retea-interna container1
-----------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker exec -it container1 bash
root@35fad0a50cbd:/# ping 172.18.0.3
ping: connect: Network is unreachable
root@35fad0a50cbd:/# ping container2
ping: container2: Temporary failure in name resolution
root@35fad0a50cbd:/# exit
exit
--------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker network disconnect retea-interna container2
-------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker exec -it container2 bash
root@b0c38f6e182d:/# ping 172.18.0.2
ping: connect: Network is unreachable
root@b0c38f6e182d:/# ping container1
ping: container1: Temporary failure in name resolution
root@b0c38f6e182d:/# exit
exit
----------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker network connect bridge container1
---------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker network connect bridge container2
--------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker network inspect retea-interna 
[
    {
        "Name": "retea-interna",
        "Id": "e7bbb48b556be5caa413398aa66f12ea46c5e7fd63332c54e36beab46f6a2760",
        "Created": "2025-08-20T08:19:59.261773097+03:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv4": true,
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]
-------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker network inspect bridge 
[
    {
        "Name": "bridge",
        "Id": "0ab500ce8ef1adad19eed496cc2affdf6dbb4123d0393809474b6c1602c32c04",
        "Created": "2025-08-20T08:13:55.827051838+03:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv4": true,
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "35fad0a50cbda95d9f4680bce87a6d68f82cc497ca456b8bec856f5951542e6c": {
                "Name": "container1",
                "EndpointID": "0ad2d23def49a012a6ec1ddec7e81417649f92e52227ba22efa7b0010eee2517",
                "MacAddress": "72:69:1b:2e:3f:a0",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "b0c38f6e182d31f630dd509e5a7b14c90ed5dc549cf49fc17fec67ec81af38c3": {
                "Name": "container2",
                "EndpointID": "8ac8b5cbbaa26c09af349ccf659777dfaef222fe6a6e602f5db23157fed51ec1",
                "MacAddress": "26:d4:83:53:d0:3f",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
--------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker inspect container1
            "Networks": {
                "bridge": {
                    "IPAMConfig": {},
                    "Links": null,
                    "Aliases": [],
                    "MacAddress": "72:69:1b:2e:3f:a0",
                    "DriverOpts": {},
                    "GwPriority": 0,
                    "NetworkID": "0ab500ce8ef1adad19eed496cc2affdf6dbb4123d0393809474b6c1602c32c04",
                    "EndpointID": "0ad2d23def49a012a6ec1ddec7e81417649f92e52227ba22efa7b0010eee2517",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DNSNames": null
                }
---------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex10$ docker inspect container2
            "Networks": {
                "bridge": {
                    "IPAMConfig": {},
                    "Links": null,
                    "Aliases": [],
                    "MacAddress": "26:d4:83:53:d0:3f",
                    "DriverOpts": {},
                    "GwPriority": 0,
                    "NetworkID": "0ab500ce8ef1adad19eed496cc2affdf6dbb4123d0393809474b6c1602c32c04",
                    "EndpointID": "8ac8b5cbbaa26c09af349ccf659777dfaef222fe6a6e602f5db23157fed51ec1",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.3",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DNSNames": null
                }
----------------------------------------------------------------------------------------------------------------
