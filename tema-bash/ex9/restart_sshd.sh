#!/bin/bash

# Faceți un script ce dă restart la serviciul de sshd dacă este oprit. Puneți scriptul in crontab sa ruleze la fiecare minut. 

# Verifică dacă serviciul sshd este activ
if ! systemctl is-active --quiet sshd; then
    # Dacă nu este activ, îl pornește
    systemctl start sshd
    echo "Serviciul sshd a fost repornit la $(date)" >> sshd_restart.log
else
    echo "Serviciul sshd este deja activ la $(date)" >> sshd_restart.log
fi  
