#! /bin/bash


docker stop web-server
docker rm web-server

docker run -d -p 8090:80 -v /home/cris/work/ITSchool/site-web:/usr/share/nginx/html --name web-server nginx

