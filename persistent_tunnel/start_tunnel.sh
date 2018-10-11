#!/bin/bash

PRIVATE_KEY=$1
JUMP_HOST=$2
TARGET_HOST=$3
TARGET_PORT=$4

while true; do
    ssh -R $TARGET_PORT:$TARGET_HOST:22 $JUMP_HOST -i $PRIVATE_KEY -nNT -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -o ExitOnForwardFailure=yes
    sleep 60
done

