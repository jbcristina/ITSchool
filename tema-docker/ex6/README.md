# 1.	Construiți două imagini Docker separate, ambele pornind de la imaginea de bază ubuntu.
# 2.	Prima imagine va folosi instrucțiunea ENTRYPOINT cu comanda echo.
# 3.	A doua imagine va folosi instrucțiunea CMD cu comanda echo.
# -	În ambele cazuri, atât ENTRYPOINT, cât și CMD trebuie să conțină doar comanda echo.
# 4.	Rulați fiecare imagine separat și testați următoarele situații:
# -	Furnizați argumentul Salut și verificați rezultatul afișat în terminal.
# -	Furnizați comanda ls ca argument și observați comportamentul containerului.


cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex6$ docker build -t entrypoint-test -f Dockerfile.entrypoint .
[+] Building 16.4s (5/5) FINISHED                                                                                                                                       docker:default
 => [internal] load build definition from Dockerfile.entrypoint                                                                                                                   0.2s
 => => transferring dockerfile: 161B                                                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                                                                                                   2.9s
 => [internal] load .dockerignore                                                                                                                                                 0.2s
 => => transferring context: 2B                                                                                                                                                   0.0s
 => [1/1] FROM docker.io/library/ubuntu:20.04@sha256:8feb4d8ca5354def3d8fce243717141ce31e2c428701f6682bd2fafe15388214                                                            12.4s
 => => resolve docker.io/library/ubuntu:20.04@sha256:8feb4d8ca5354def3d8fce243717141ce31e2c428701f6682bd2fafe15388214                                                             0.1s
 => => sha256:8feb4d8ca5354def3d8fce243717141ce31e2c428701f6682bd2fafe15388214 6.69kB / 6.69kB                                                                                    0.0s
 => => sha256:c664f8f86ed5a386b0a340d981b8f81714e21a8b9c73f658c4bea56aa179d54a 424B / 424B                                                                                        0.0s
 => => sha256:b7bab04fd9aa0c771e5720bf0cc7cbf993fd6946645983d9096126e5af45d713 2.30kB / 2.30kB                                                                                    0.0s
 => => sha256:13b7e930469f6d3575a320709035c6acf6f5485a76abcf03d1b92a64c09c2476 27.51MB / 27.51MB                                                                                  3.4s
 => => extracting sha256:13b7e930469f6d3575a320709035c6acf6f5485a76abcf03d1b92a64c09c2476                                                                                         7.9s
 => exporting to image                                                                                                                                                            0.2s
 => => exporting layers                                                                                                                                                           0.0s
 => => writing image sha256:2bdc15ffe601fa2bc340611b069d48c4619eace4f7bcf3c28a2e3e8114b29ac8                                                                                      0.0s
 => => naming to docker.io/library/entrypoint-test                                                                                                                                0.0s
--------------------------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex6$ docker build -t cmd-test -f Dockerfile.cmd .
[+] Building 1.7s (5/5) FINISHED                                                                                                                                        docker:default
 => [internal] load build definition from Dockerfile.cmd                                                                                                                          0.1s
 => => transferring dockerfile: 147B                                                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                                                                                                   0.8s
 => [internal] load .dockerignore                                                                                                                                                 0.1s
 => => transferring context: 2B                                                                                                                                                   0.0s
 => CACHED [1/1] FROM docker.io/library/ubuntu:20.04@sha256:8feb4d8ca5354def3d8fce243717141ce31e2c428701f6682bd2fafe15388214                                                      0.0s
 => exporting to image                                                                                                                                                            0.2s
 => => exporting layers                                                                                                                                                           0.0s
 => => writing image sha256:0cb8dfc6d7dd29d80e4fafe7acc2980f6c7f574afc0b17e69923e61cdda46aa6                                                                                      0.0s
 => => naming to docker.io/library/cmd-test 
------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex6$ docker run --rm entrypoint-test Salut
Salut
-----------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex6$ docker run --rm entrypoint-test ls
ls
-----------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex6$ docker run --rm cmd-test Salut
docker: Error response from daemon: failed to create task for container: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: error during container init: exec: "Salut": executable file not found in $PATH: unknown

Run 'docker run --help' for more information
-----------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex6$ docker run --rm cmd-test ls
bin
boot
dev
etc
home
lib
lib32
lib64
libx32
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
