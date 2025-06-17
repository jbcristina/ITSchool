
AGE=$1

if [ -n "$AGE" ] && [ "$AGE" -ge 18 ]; then
	echo "Userul a introdus varsta si este major"
else
	echo "Userul nu a introdus varsta sau nu este major"
fi

