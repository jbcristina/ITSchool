#!/bin/bash

Dir=$1

if [ -z "$Dir" ] || [ ! -d "$Dir" ] ;then
	echo " Utilizare: $0 <director>"
	echo " In loc sa fac exit din script voi folosi directorul $0"
	Dir=$(dirname "$0")
else
	echo " Scriptul va adauga #!/bin/bash in toate scripturile de shell  di directorul "$Dir", unde #!/bin/bash nu e setat deja"
fi
for script in "$Dir"/*.sh;do
	if [ -f "$script" ];then
		shebang=$(head -n 1 "$script")

		if [ "$shebang" != "#!/bin/bash" ];then
			{ echo "#!/bin/bash"; cat "$script"; } >"$script.tmp"
			mv "$script.tmp" "$script"
			chmod +x "$script"
		fi
	fi
done