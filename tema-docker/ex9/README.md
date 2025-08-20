# Creați o imagine de docker cu numele tools plecand de la imaginea de baza ubuntu si instalati pe ea (în Dockerfile următoarele):
# -	vim
# -	ping (iputils-ping)
# Puneti in CMD un sleep Infinity ca imaginea sa nu “moara” imediat ce a fost pornita. Fceti build la imagine si porniti un container de test (dati ping catre google.com) 
# O sa folosim aceasta imagine in exercitiile urmatoare.

cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex9$ docker build -t tools .
[+] Building 89.1s (6/6) FINISHED                                                                                                                                       docker:default
 => [internal] load build definition from Dockerfile                                                                                                                              0.5s
 => => transferring dockerfile: 246B                                                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                                                                  3.8s
 => [internal] load .dockerignore                                                                                                                                                 0.3s
 => => transferring context: 2B                                                                                                                                                   0.0s
 => [1/2] FROM docker.io/library/ubuntu:latest@sha256:7c06e91f61fa88c08cc74f7e1b7c69ae24910d745357e0dfe1d2c0322aaf20f9                                                           17.9s
 => => resolve docker.io/library/ubuntu:latest@sha256:7c06e91f61fa88c08cc74f7e1b7c69ae24910d745357e0dfe1d2c0322aaf20f9                                                            0.3s
 => => sha256:7c06e91f61fa88c08cc74f7e1b7c69ae24910d745357e0dfe1d2c0322aaf20f9 6.69kB / 6.69kB                                                                                    0.0s
 => => sha256:35f3a8badf2f74c1b320a643b343536f5132f245cbefc40ef802b6203a166d04 424B / 424B                                                                                        0.0s
 => => sha256:e0f16e6366fef4e695b9f8788819849d265cde40eb84300c0147a6e5261d2750 2.29kB / 2.29kB                                                                                    0.0s
 => => sha256:b71466b94f266b4c2e0881749670e5b88ab7a0fd4ca4a4cdf26cb45e4bde7e4e 29.72MB / 29.72MB                                                                                  8.4s
 => => extracting sha256:b71466b94f266b4c2e0881749670e5b88ab7a0fd4ca4a4cdf26cb45e4bde7e4e                                                                                         7.7s
 => [2/2] RUN apt-get update &&         apt-get install -y vim curl iputils-ping &&      apt-get clean                                                                           63.1s
 => exporting to image                                                                                                                                                            2.6s
 => => exporting layers                                                                                                                                                           2.4s
 => => writing image sha256:63d9f02ddd9b603cf81a4d83e84d0b89af1270b18fa2b8134a73b249b2f929fa                                                                                      0.0s
 => => naming to docker.io/library/tools
-------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex9$ docker run -it --rm tools:latest ping google.com
PING google.com (142.251.208.110) 56(84) bytes of data.
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=1 ttl=254 time=37.5 ms
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=2 ttl=254 time=22.4 ms
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=3 ttl=254 time=22.9 ms
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=4 ttl=254 time=22.5 ms
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=5 ttl=254 time=21.9 ms
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=6 ttl=254 time=22.1 ms
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=7 ttl=254 time=21.3 ms
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=8 ttl=254 time=33.3 ms
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=9 ttl=254 time=22.4 ms
64 bytes from bud02s41-in-f14.1e100.net (142.251.208.110): icmp_seq=10 ttl=254 time=22.7 ms
^C
--- google.com ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9194ms
rtt min/avg/max/mdev = 21.262/24.892/37.475/5.343 ms