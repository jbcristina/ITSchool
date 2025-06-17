#! /bin/bash

dir_PATH=$(echo $PATH | tr ':' ' ')

for cale in $dir_PATH; do
	echo $cale
	current_dir=$(ls -al $cale | wc -l)
	echo "Sunt $(($current_dir-1)) fisiere in $cale"
done

