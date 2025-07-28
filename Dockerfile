#FROM ubuntu

##COPY hello.sh app.sh
##RUN chmod +x app.sh
##CMD ["./app.sh"]

#RUN apt update
#RUN apt install -y curl
#ENTRYPOINT ["curl","-v"]
#CMD ["google.com"]

FROM python:3

COPY hello.py hello.py

RUN mkdir -p /tmp/logs/

CMD ["python", "hello.py"]
