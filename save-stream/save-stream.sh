#!/bin/bash

NAME=$1

function saveStream {
	SUFFIX=$(date +%Y.%m.%d-%H:%M:%S)
	streamlink $1 best -o ./$1-$SUFFIX\.mpeg
}

saveStream $NAME

while [ $? -eq 1 ]
do
	echo "sleeping $(date)"
	sleep 60
	saveStream $NAME
done
