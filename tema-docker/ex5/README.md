# Imachetati intr-o imagine de docker un script de python ce muta fisiere dintr-un director “input” intr-un director “output”. După fiecare fișier mutat scriptul de python “doarme” 5 secunde.
# A.	Porniti imagine de docker si mapati input si output folder la 2 directoare de pe masina VM.
# Hint: Puteți avea mai multe -v augmentes la același run:
#   -v /tmp/input:/input \
#   -v /tmp/output:/output
# B.	Porniti 4 containere de docker configurate identic. Verificati ca sunt mutate fișierele de 4 ori mai repede.  


cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5$ pwd
/home/cris/work/ITSchool/tema-docker/ex5
---------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5$ mkdir input
----------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5$ mkdir output
---------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5$ cd input/
--------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5/input$ touch file{1..100}.txt
-------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5$ docker build -t mover .
[+] Building 21.2s (8/8) FINISHED                                                                                                                        docker:default
 => [internal] load build definition from Dockerfile                                                                                                               0.5s
 => => transferring dockerfile: 179B                                                                                                                               0.0s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                                                                3.0s
 => [internal] load .dockerignore                                                                                                                                  0.2s
 => => transferring context: 2B                                                                                                                                    0.0s
 => [1/3] FROM docker.io/library/python:3.12-slim@sha256:d67a7b66b989ad6b6d6b10d428dcc5e0bfc3e5f88906e67d490c4d3daac57047                                         11.2s
 => => resolve docker.io/library/python:3.12-slim@sha256:d67a7b66b989ad6b6d6b10d428dcc5e0bfc3e5f88906e67d490c4d3daac57047                                          0.2s
 => => sha256:d67a7b66b989ad6b6d6b10d428dcc5e0bfc3e5f88906e67d490c4d3daac57047 10.37kB / 10.37kB                                                                   0.0s
 => => sha256:8f3d1de1b41cd7340a89b024d6f7a10043f7b0d07d97eb36ba76f22fcfa9a235 1.75kB / 1.75kB                                                                     0.0s
 => => sha256:bad5eac7befe06d25bef9d4d894d7467355bac08745c745a88977774933fa032 5.58kB / 5.58kB                                                                     0.0s
 => => sha256:5d587318e932a89b94608393c99dd30ee5092a6991c1656f717bd4f4e13d60df 1.29MB / 1.29MB                                                                     1.0s
 => => sha256:e5c05dcf47fbdb2f18dc242ad1b7f48fbd3813c0027ffcfb8e81e4aa7e0965f4 12.11MB / 12.11MB                                                                   4.2s
 => => sha256:d76206d463c08ba2a3f7bbab2de2a933ad73f33ab4ab813eafe50c9dff9edc12 251B / 251B                                                                         1.1s
 => => extracting sha256:5d587318e932a89b94608393c99dd30ee5092a6991c1656f717bd4f4e13d60df                                                                          2.3s
 => => extracting sha256:e5c05dcf47fbdb2f18dc242ad1b7f48fbd3813c0027ffcfb8e81e4aa7e0965f4                                                                          5.2s
 => => extracting sha256:d76206d463c08ba2a3f7bbab2de2a933ad73f33ab4ab813eafe50c9dff9edc12                                                                          0.0s
 => [internal] load build context                                                                                                                                  0.4s
 => => transferring context: 903B                                                                                                                                  0.0s
 => [2/3] COPY script.py .                                                                                                                                         1.0s
 => [3/3] RUN useradd -m -s /bin/bash mover                                                                                                                        3.4s
 => exporting to image                                                                                                                                             0.7s
 => => exporting layers                                                                                                                                            0.4s
 => => writing image sha256:b7e5b53c6f5a47ea8a7e7bba812da2f15a51e83c7e0b28c6186e58ad7b16b51e                                                                       0.0s
 => => naming to docker.io/library/mover 
-----------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5$ docker run -v /tmp/input:/tmp/input -v /tmp/output:/tmp/output --name file_mover1 mover
----------------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5$ docker run -v /tmp/input:/tmp/input -v /tmp/output:/tmp/output --name file_mover2 mover
------------------------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5$ docker run -v /tmp/input:/tmp/input -v /tmp/output:/tmp/output --name file_mover3 mover
----------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex5$ docker run -v /tmp/input:/tmp/input -v /tmp/output:/tmp/output --name file_mover4 mover