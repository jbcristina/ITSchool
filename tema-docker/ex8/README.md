# Faceți un script Python (app.py) care scrie loguri atât în consolă, cât și într-un fișier la calea /log/app.log. Scriptul trebuie să printeze, la fiecare secundă, un mesaj însoțit de un timestamp.
# Împachetați scriptul într-un Docker image și porniți-l. Directorul în care se scriu logurile trebuie montat ca volum Docker (deci va trebui să creați mai întâi un volum cu numele loguri  folosind docker volume create și să îl folosiți la rularea containerului).
# Porniți un al doilea container Docker cu Nginx, care folosește același volum și expune fișierul de loguri, astfel încât acesta să poată fi accesat din browser (montați volumul la calea /usr/share/nginx/html).
# Verificați în browser că puteți accesa fișierul de loguri și că acesta este actualizat cu mesaje noi la fiecare secundă.

cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex8$ sudo mkdir /log
-----------------------------------------------------------------
cris@Ubuntu22042:/log$ sudo chmod +w /log
-----------------------------------------------------
cris@Ubuntu22042:/log$ sudo touch app.log
--------------------------------------------------
cris@Ubuntu22042:/log$ sudo chmod 777 app.log 
-----------------------------------------------
cris@Ubuntu22042:/log$ ll
total 8
drwxr-xr-x  2 root root 4096 Aug 19 23:49 ./
drwxr-xr-x 21 root root 4096 Aug 19 23:44 ../
-rwxrwxrwx  1 root root    0 Aug 19 23:49 app.log*
-----------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex8$ docker build -t logger-app .
[+] Building 21.9s (8/8) FINISHED                                                                                                                                       docker:default
 => [internal] load build definition from Dockerfile                                                                                                                              0.3s
 => => transferring dockerfile: 112B                                                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/python:3.9-slim                                                                                                                2.8s
 => [internal] load .dockerignore                                                                                                                                                 0.3s
 => => transferring context: 2B                                                                                                                                                   0.0s
 => [internal] load build context                                                                                                                                                 0.6s
 => => transferring context: 457B                                                                                                                                                 0.0s
 => [1/3] FROM docker.io/library/python:3.9-slim@sha256:914169c7c8398b1b90c0b0ff921c8027445e39d7c25dc440337e56ce0f2566e6                                                         13.6s
 => => resolve docker.io/library/python:3.9-slim@sha256:914169c7c8398b1b90c0b0ff921c8027445e39d7c25dc440337e56ce0f2566e6                                                          0.5s
 => => sha256:914169c7c8398b1b90c0b0ff921c8027445e39d7c25dc440337e56ce0f2566e6 10.36kB / 10.36kB                                                                                  0.0s
 => => sha256:213766eae7e1ad5da6140428e7f15db89f2c83caf906cc06fc9c5c8a0028e3b6 1.74kB / 1.74kB                                                                                    0.0s
 => => sha256:28f8802246faa922c08dd76e3ec467e3cb4278af72e99e1afa2f68dfb9ea991d 5.30kB / 5.30kB                                                                                    0.0s
 => => sha256:0219e1e5e6ef3ef9d91f78826576a112b1c20622c10c294a4a105811454d1cb1 1.29MB / 1.29MB                                                                                    1.2s
 => => sha256:5ec99fe17015e703c289d110b020e4e362d5b425be957d68bfb400d56d83f234 13.37MB / 13.37MB                                                                                  5.3s
 => => sha256:ea3499df304f0a84e9f076a05f0cfe2a64d8fcb884894ce682df9204c6a18a91 249B / 249B                                                                                        0.9s
 => => extracting sha256:0219e1e5e6ef3ef9d91f78826576a112b1c20622c10c294a4a105811454d1cb1                                                                                         2.6s
 => => extracting sha256:5ec99fe17015e703c289d110b020e4e362d5b425be957d68bfb400d56d83f234                                                                                         6.2s
 => => extracting sha256:ea3499df304f0a84e9f076a05f0cfe2a64d8fcb884894ce682df9204c6a18a91                                                                                         0.0s
 => [2/3] WORKDIR /app                                                                                                                                                            1.9s
 => [3/3] COPY app.py .                                                                                                                                                           0.8s
 => exporting to image                                                                                                                                                            0.9s
 => => exporting layers                                                                                                                                                           0.6s
 => => writing image sha256:29e6fc9d9029fca08754b5955d34f3f4176d6c1d09a30d1219e88971f7cbad8f                                                                                      0.0s
 => => naming to docker.io/library/logger-app 
--------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex8$ docker volume create logs
logs
--------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex8$ docker volume ls
DRIVER    VOLUME NAME
local     logs
-----------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex8$ docker run -d --name logger -v logs:/log logger-app
26fad7419eeddd0efd406e0d97d181e8e5ff1c6e12f2f63a60cb9432ddbbf120
-----------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex8$ docker run -d --name nginx-loguri -p 8080:80 -v logs:/usr/share/nginx/html nginx
c6213f5eac18c234ad0571554641c187c2e85013c6d86a3f94a207608cbd0116

firefox --new-tab "http://localhost:8080/app.log"
