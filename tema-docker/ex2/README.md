# Rulati un container de busybox folosind comanda sleep in detached mode. Puneți un nume containerului. Ce observati?
# Accesați containerul în linie de comanda și listați procesele.
# Omorati și sterge-ti containerul.

cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex2$ docker run -d --name busy-sleeping busybox sleep Infinity
Unable to find image 'busybox:latest' locally
latest: Pulling from library/busybox
80bfbb8a41a2: Pull complete 
Digest: sha256:ab33eacc8251e3807b85bb6dba570e4698c3998eca6f0fc2ccb60575a563ea74
Status: Downloaded newer image for busybox:latest
e5403e22606980520c30d6e2caaa1e1e451b4f10f2bda66f0257803244038488
-------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex2$ docker ps
CONTAINER ID   IMAGE     COMMAND            CREATED         STATUS         PORTS     NAMES
e5403e226069   busybox   "sleep Infinity"   9 seconds ago   Up 8 seconds             busy-sleeping
--------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex2$ docker exec -it busy-sleeping sh
/ # ps
PID   USER     TIME  COMMAND
    1 root      0:00 sleep Infinity
   15 root      0:00 sh
   21 root      0:00 ps
/ # exit
---------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex2$ docker stop busy-sleeping
busy-sleeping
---------------------------------------------------------------------------------
CONTAINER ID   IMAGE                                 COMMAND                  CREATED         STATUS                        PORTS     NAMES
e5403e226069   busybox                               "sleep Infinity"         3 minutes ago   Exited (137) 33 seconds ago             busy-sleeping
---------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex2$ docker rm e5403e226069
e5403e226069
