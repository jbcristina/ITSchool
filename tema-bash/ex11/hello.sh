#!/bin/bash
# Script simplu care scrie la nesfârșit mesaje de log.
# Pentru test, redirecționează output-ul către fișierul de log folosit de log-rotation.sh

while true; do
  echo "$(date +'%Y-%m-%d %H:%M:%S') Salut! Acesta este un mesaj de log." >> /home/cris/work/ITSchool/tema-bash/ex11/test.log
  sleep 2  # se așteaptă 2 secunde între mesaje
done