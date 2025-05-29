
#! /bin/bash

# 1. Creaza userul bob daca nu exista
if ! id "bob" &>/dev/null; then
	sudo adduser bob
	echo "Userul bob a fost creat"
fi

# 2. Sterge userul alice daca exista
if id "alice" &>/dev/null; then
	sudo deluser alice
	echo "Userul alice a fost sters"
fi

# 3. Face switch la userul bob si ruleaza procesul de sleep
sudo su - bob nohup sleep 300 &>/dev/null &
echo "Procesul sleep a fost pornit de userul bob"

# 4. Verifica daca userul bob are un proces sleep activ
if ps -u bob | grep "sleep"; then
	echo "Userul bob are un proces sleep activ"
else 
	echo "Eroare: Userul bob nu are un proces sleep activ"
	exit 1
fi

# 5. Verifica daca userul bob are un proces Python
if ps -u bob | grep "python"; then
	echo "Userul bob are un proces Python activ"
else 
	echo "Eroare: Userul bob nu are un proces Python activ"
	exit 1
fi

# 6. Verifica daca userul alice ruleaza un proces Python
if ps -u alice 2>/dev/null | grep "python"; then
	echo "Eroare: Userul alice are un proces Python activ"
	exit 1
else 
	echo "Userul alice nu are un proces python activ"
fi

echo "Toate verificarile au fost efectuate cu succes"
exit 0