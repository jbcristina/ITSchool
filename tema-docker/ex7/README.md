# Alegeți orice alta imagine de pe docker hub ce nu a fost folosită la curs. Încercați sa înțelegeți ce face imaginea și cum se rulează local. Rulati imaginea local. 

cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex7$ docker build -t my-appache2 .
[+] Building 24.5s (7/7) FINISHED                                                                                                                                       docker:default
 => [internal] load build definition from Dockerfile                                                                                                                              0.2s
 => => transferring dockerfile: 101B                                                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/httpd:latest                                                                                                                   2.6s
 => [internal] load .dockerignore                                                                                                                                                 0.2s
 => => transferring context: 2B                                                                                                                                                   0.0s
 => [internal] load build context                                                                                                                                                 0.3s
 => => transferring context: 65B                                                                                                                                                  0.0s
 => [1/2] FROM docker.io/library/httpd:latest@sha256:3198c1839e1a875f8b83803083758a7635f1ae999f0601f30f2f3b8ce2ac99e3                                                            19.2s
 => => resolve docker.io/library/httpd:latest@sha256:3198c1839e1a875f8b83803083758a7635f1ae999f0601f30f2f3b8ce2ac99e3                                                             0.2s
 => => sha256:3198c1839e1a875f8b83803083758a7635f1ae999f0601f30f2f3b8ce2ac99e3 10.14kB / 10.14kB                                                                                  0.0s
 => => sha256:7bc639e75649411beb3f0a2cfd74713c3b9ed2ee9dde4a65bf41c89cb408f895 2.09kB / 2.09kB                                                                                    0.0s
 => => sha256:199e3a0352645ad4ae027e853af5986bd5b4766c3a5e98987ad10d5922eb7465 7.85kB / 7.85kB                                                                                    0.0s
 => => sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1 32B / 32B                                                                                          0.4s
 => => sha256:396b1da7636e2dcd10565cb4f2f952cbb4a8a38b58d3b86a2cacb172fb70117c 29.77MB / 29.77MB                                                                                  4.7s
 => => sha256:40712a21826a7433482f008d5c652d6011d0f75977fa53b5b3648e38be352521 145B / 145B                                                                                        0.8s
 => => sha256:d2b1a5ae8cd3f1046b4d7a3b24d63b24bad44dae6ec4a40f3ef6ae779c484117 1.99MB / 1.99MB                                                                                    1.2s
 => => sha256:7e8bbac53823c0c06d17fcab850fb16f8bf144999690704ccce8cad642b8522f 13.43MB / 13.43MB                                                                                  3.4s
 => => sha256:779ccd5833972bf936ca3e3344157a5af26ccd24c07ee58f525c631e0af0f772 293B / 293B                                                                                        1.7s
 => => extracting sha256:396b1da7636e2dcd10565cb4f2f952cbb4a8a38b58d3b86a2cacb172fb70117c                                                                                         8.1s
 => => extracting sha256:40712a21826a7433482f008d5c652d6011d0f75977fa53b5b3648e38be352521                                                                                         0.0s
 => => extracting sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1                                                                                         0.0s
 => => extracting sha256:d2b1a5ae8cd3f1046b4d7a3b24d63b24bad44dae6ec4a40f3ef6ae779c484117                                                                                         0.9s
 => => extracting sha256:7e8bbac53823c0c06d17fcab850fb16f8bf144999690704ccce8cad642b8522f                                                                                         2.5s
 => => extracting sha256:779ccd5833972bf936ca3e3344157a5af26ccd24c07ee58f525c631e0af0f772                                                                                         0.0s
 => [2/2] COPY index.html /usr/local/apache2/htdocs/index.html                                                                                                                    1.5s
 => exporting to image                                                                                                                                                            0.3s
 => => exporting layers                                                                                                                                                           0.2s
 => => writing image sha256:27c5008da72fd5f7966b6200afd55614770a4966cf7be1dc1016a42a1b2ef64d                                                                                      0.0s
 => => naming to docker.io/library/my-appache2                                                                                                                                    0.0s
--------------------------------------------------------------------------------------------------------------------------------------------------
cris@Ubuntu22042:~/work/ITSchool/tema-docker/ex7$ docker run -it --name my-running-app -p 8070:80 my-appache2:latest 
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Sun Aug 17 19:05:55.737136 2025] [mpm_event:notice] [pid 1:tid 1] AH00489: Apache/2.4.65 (Unix) configured -- resuming normal operations
[Sun Aug 17 19:05:55.737604 2025] [core:notice] [pid 1:tid 1] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [17/Aug/2025:19:06:22 +0000] "GET / HTTP/1.1" 200 28
172.17.0.1 - - [17/Aug/2025:19:06:23 +0000] "GET /favicon.ico HTTP/1.1" 404 196
--------------------------------------------------------------------------------------------------------------------------------------------------------
firefox --new-tab "http://localhost:8070"