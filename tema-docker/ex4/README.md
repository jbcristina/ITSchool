# Construiți o imagine de docker simpla care printeaza mesajul “Salut din container” (folosind comanda echo). Folositi imaginea de baza alpine. De ce credeți ca am folosit aceasta imagine?
# Rulati imagine si incercati sa-i dati cat mai putin cpu si memory. Care sunt valorile cele mai mici pentru CPU si memory pe care ați reușit sa i le dați containerului?
# Bonus: Dați push la imagine în contul vostru de DockerHub.



cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ docker build -t salut-alpine -f Dockerfile.salut .
[+] Building 6.0s (5/5) FINISHED                                                                               docker:default
 => [internal] load build definition from Dockerfile.salut                                                               0.2s
 => => transferring dockerfile: 92B                                                                                      0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                         2.6s
 => [internal] load .dockerignore                                                                                        0.2s
 => => transferring context: 2B                                                                                          0.0s
 => [1/1] FROM docker.io/library/alpine:latest@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1   2.4s
 => => resolve docker.io/library/alpine:latest@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1   0.1s
 => => sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1 9.22kB / 9.22kB                           0.0s
 => => sha256:eafc1edb577d2e9b458664a15f23ea1c370214193226069eb22921169fc7e43f 1.02kB / 1.02kB                           0.0s
 => => sha256:9234e8fb04c47cfe0f49931e4ac7eb76fa904e33b7f8576aec0501c085f02516 581B / 581B                               0.0s
 => => sha256:9824c27679d3b27c5e1cb00a73adb6f4f8d556994111c12db3c5d61a0c843df8 3.80MB / 3.80MB                           0.9s
 => => extracting sha256:9824c27679d3b27c5e1cb00a73adb6f4f8d556994111c12db3c5d61a0c843df8                                0.8s
 => exporting to image                                                                                                   0.2s
 => => exporting layers                                                                                                  0.0s
 => => writing image sha256:b13531b1c1413776c6cab1104948360a57188e20df819d1984e9d5ee2348988a                             0.0s
 => => naming to docker.io/library/salut-alpine                                                                          0.0s
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ docker images
REPOSITORY                    TAG       IMAGE ID       CREATED          SIZE
nginx_green                   latest    06f580b6f93d   14 minutes ago   192MB
nginx_blue                    latest    c4e0b8a8a726   14 minutes ago   192MB
salut-alpine                  latest    b13531b1c141   4 weeks ago      8.31MB
busybox                       latest    0ed463b26dae   10 months ago    4.43MB
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ docker run salut-alpine:latest 
Salut din container
--------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ docker run --cpus 1 salut-alpine
Salut din container
--------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ docker run --cpus 0.01 salut-alpine
Salut din container
------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ time docker run --cpus 1 salut-alpine
Salut din container

real	0m1.466s
user	0m0.037s
sys	0m0.177s
------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ time docker run --cpus 1 -m 10M salut-alpine
Salut din container

real	0m1.518s
user	0m0.024s
sys	0m0.174s
-----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ time docker run --cpus 1 -m 6M salut-alpine
Salut din container

real	0m1.485s
user	0m0.038s
sys	0m0.184s
--------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ docker tag salut-alpine:latest jbcristina/salut-alpine:latest
-------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ docker images
REPOSITORY                    TAG       IMAGE ID       CREATED          SIZE
nginx_green                   latest    06f580b6f93d   35 minutes ago   192MB
nginx_blue                    latest    c4e0b8a8a726   35 minutes ago   192MB
salut-alpine                  latest    b13531b1c141   4 weeks ago      8.31MB
jbcristina/salut-alpine       latest    b13531b1c141   4 weeks ago      8.31MB
busybox                       latest    0ed463b26dae   10 months ago    4.43MB
----------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ docker push jbcristina/salut-alpine
Using default tag: latest
The push refers to repository [docker.io/jbcristina/salut-alpine]
418dccb7d85a: Preparing 
denied: requested access to the resource is denied
-----------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex4$ docker run jbcristina/salut-alpine:latest
Salut din container
