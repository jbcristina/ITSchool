#! /bin/bash

for f in *.sh; do
	sha256sum $f
done

