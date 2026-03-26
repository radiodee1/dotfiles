#!/bin/bash

FILE="$HOME/.config/waybar/scripts/nas_ip.txt"

if ! [ -f $FILE ]; then
    echo "cannot find $FILE"
    exit 1
fi 


read -r ip < "$FILE"
HOST=$ip 

ping -c 4  $HOST &>/dev/null

if [ $? -eq 0 ]; then
    echo "up"
else
    echo "down"
fi
