# Rulați imaginea de docker cu numele hello-world si verificati logurile.
# Verificati apoi dacă mai rulează containerul.
# Stergeti imagine hello-world din local.


cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex1$ docker run hello-world
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

---------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex1$ docker ps -a
CONTAINER ID   IMAGE                                 COMMAND                  CREATED          STATUS                      PORTS     NAMES
2a7f10e53b81   hello-world                           "/hello"                 59 seconds ago   Exited (0) 58 seconds ago             interesting_wozniak
905ed18b65cd   gcr.io/k8s-minikube/kicbase:v0.0.47   "/usr/local/bin/entr…"   27 hours ago     Exited (130) 26 hours ago             minikube
33cdfc87cea0   hello-world                           "/hello"                 27 hours ago     Exited (0) 27 hours ago               hopeful_jennings
---------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex1$ docker logs 2a7f10e53b81

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
-------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex1$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
---------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex1$ docker rm 2a7f10e53b81 33cdfc87cea0
2a7f10e53b81
33cdfc87cea0
--------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex1$ docker images
REPOSITORY                    TAG       IMAGE ID       CREATED        SIZE
hello-world                   latest    1b44b5a3e06a   7 days ago     10.1kB
---------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex1$ docker rmi 1b44b5a3e06a
Untagged: hello-world:latest
Untagged: hello-world@sha256:a0dfb02aac212703bfcb339d77d47ec32c8706ff250850ecc0e19c8737b18567
Deleted: sha256:1b44b5a3e06a9aae883e7bf25e45c100be0bb81a0e01b32de604f3ac44711634
Deleted: sha256:53d204b3dc5ddbc129df4ce71996b8168711e211274c785de5e0d4eb68ec3851
---------------------------------------------------------------------------------
