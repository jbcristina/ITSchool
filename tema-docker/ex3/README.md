# Porniti un server  nginx cu numele blue pe portul 8080 si altul cu numele green pe portul 8090. Pentru fiecare server serviți un fișier static index.html din local cu background blue respectiv green. Accesati-le in browser.

# Scope: Într-un curs viitor o sa vedem cum putem face balansare automata de trafic intre instanta blue si green.



cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex3$ docker build -f Dockerfile.blue -t nginx_blue .
[+] Building 38.8s (8/8) FINISHED                                                                              docker:default
 => [internal] load build definition from Dockerfile.blue                                                                0.3s
 => => transferring dockerfile: 148B                                                                                     0.0s
 => [internal] load metadata for docker.io/library/nginx:latest                                                          2.7s
 => [internal] load .dockerignore                                                                                        0.2s
 => => transferring context: 2B                                                                                          0.0s
 => [1/3] FROM docker.io/library/nginx:latest@sha256:33e0bbc7ca9ecf108140af6288c7c9d1ecc77548cbfd3952fd8466a75edefe57   31.4s
 => => resolve docker.io/library/nginx:latest@sha256:33e0bbc7ca9ecf108140af6288c7c9d1ecc77548cbfd3952fd8466a75edefe57    0.3s
 => => sha256:ad5708199ec7d169c6837fe46e1646603d0f7d0a0f54d3cd8d07bc1c818d0224 8.59kB / 8.59kB                           0.0s
 => => sha256:33e0bbc7ca9ecf108140af6288c7c9d1ecc77548cbfd3952fd8466a75edefe57 10.25kB / 10.25kB                         0.0s
 => => sha256:f15190cd0aed34df2541e6a569d349858dd83fe2a519d7c0ec023133b6d3c4f7 2.29kB / 2.29kB                           0.0s
 => => sha256:b1badc6e50664185acfaa0ca255d8076061c2a9d881cecaaad281ae11af000ce 28.23MB / 28.23MB                         4.7s
 => => sha256:a2da0c0f2353a40d540821152b3b9453660db34259766b1ce68b0b1f708435fd 44.07MB / 44.07MB                         7.5s
 => => sha256:e5d9bb0b85cc4679fa056599af85512f519647fc66ac34366bfe010a35655d05 629B / 629B                               0.8s
 => => sha256:14a859b5ba2476efceab3febd8bbb2a45d9e4512e3dc517ace62011249bb25bc 955B / 955B                               1.3s
 => => sha256:716cdf61af5980e38ce793a90c1add1c40c93cc9371c2370705497ed3c48a77a 404B / 404B                               1.9s
 => => sha256:14e422fd20a0170c368a8b40a1d145de07fcf31cf075f77861f2231fa5bd7936 1.21kB / 1.21kB                           2.3s
 => => sha256:c3741b707ce659db0b820eef3d7277607c8fcc73494e162cb6d349f5799b16c8 1.40kB / 1.40kB                           2.8s
 => => extracting sha256:b1badc6e50664185acfaa0ca255d8076061c2a9d881cecaaad281ae11af000ce                               13.7s
 => => extracting sha256:a2da0c0f2353a40d540821152b3b9453660db34259766b1ce68b0b1f708435fd                                8.7s
 => => extracting sha256:e5d9bb0b85cc4679fa056599af85512f519647fc66ac34366bfe010a35655d05                                0.0s
 => => extracting sha256:14a859b5ba2476efceab3febd8bbb2a45d9e4512e3dc517ace62011249bb25bc                                0.0s
 => => extracting sha256:716cdf61af5980e38ce793a90c1add1c40c93cc9371c2370705497ed3c48a77a                                0.0s
 => => extracting sha256:14e422fd20a0170c368a8b40a1d145de07fcf31cf075f77861f2231fa5bd7936                                0.0s
 => => extracting sha256:c3741b707ce659db0b820eef3d7277607c8fcc73494e162cb6d349f5799b16c8                                0.0s
 => [internal] load build context                                                                                        0.3s
 => => transferring context: 232B                                                                                        0.0s
 => [2/3] RUN rm /usr/share/nginx/html/index.html                                                                        2.5s
 => [3/3] COPY index_blue.html /usr/share/nginx/html/index.html                                                          0.5s
 => exporting to image                                                                                                   0.5s
 => => exporting layers                                                                                                  0.3s
 => => writing image sha256:c4e0b8a8a7268c73a35f206998a879daa54509fef1d41e24474c81370d457aeb                             0.0s
 => => naming to docker.io/library/nginx_blue                                                                            0.0s
---------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex3$ docker build -f Dockerfile.green -t nginx_green .
[+] Building 2.1s (8/8) FINISHED                                                                               docker:default
 => [internal] load build definition from Dockerfile.green                                                               0.1s
 => => transferring dockerfile: 150B                                                                                     0.0s
 => [internal] load metadata for docker.io/library/nginx:latest                                                          0.7s
 => [internal] load .dockerignore                                                                                        0.1s
 => => transferring context: 2B                                                                                          0.0s
 => [1/3] FROM docker.io/library/nginx:latest@sha256:33e0bbc7ca9ecf108140af6288c7c9d1ecc77548cbfd3952fd8466a75edefe57    0.0s
 => [internal] load build context                                                                                        0.1s
 => => transferring context: 236B                                                                                        0.0s
 => CACHED [2/3] RUN rm /usr/share/nginx/html/index.html                                                                 0.0s
 => [3/3] COPY index_green.html /usr/share/nginx/html/index.html                                                         0.4s
 => exporting to image                                                                                                   0.3s
 => => exporting layers                                                                                                  0.2s
 => => writing image sha256:06f580b6f93d5eec58d9ceafb944d0f200a55cd0255d3aab9902ae5cb9f4d471                             0.0s
 => => naming to docker.io/library/nginx_green                                                                           0.1s
----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex3$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
----------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex3$ docker images
REPOSITORY                    TAG       IMAGE ID       CREATED          SIZE
nginx_green                   latest    06f580b6f93d   11 seconds ago   192MB
nginx_blue                    latest    c4e0b8a8a726   31 seconds ago   192MB
busybox                       latest    0ed463b26dae   10 months ago    4.43MB
---------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex3$ docker run -d -p 8080:80 --name nginx_blue nginx_blue
b006bc827df76aec9bf3ec34e71d8164d93f21694576dfa339845490105b1a71
---------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex3$ docker run -d -p 8090:80 --name nginx_green nginx_green
9b60c65fc7880190251e76b2f777af4eca4b9ce8d94c9d83bf0d1516f1ba7f04
---------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex3$ docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                                     NAMES
9b60c65fc788   nginx_green   "/docker-entrypoint.…"   4 seconds ago    Up 3 seconds    0.0.0.0:8090->80/tcp, [::]:8090->80/tcp   nginx_green
b006bc827df7   nginx_blue    "/docker-entrypoint.…"   25 seconds ago   Up 24 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   nginx_blue
--------------------------------------------------------------------------------------------------------------
firefox --new-tab "http://localhost:8080 http://localhost:8090"
