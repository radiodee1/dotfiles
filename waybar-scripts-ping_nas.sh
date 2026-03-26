#!/bin/bash

FILE="$HOME/.config/waybar/scripts/nas_ip.txt"

if ! [ -f $FILE ]; then
    echo "cannot find $FILE"
    exit 1
fi 


read -r ip < "$FILE"
HOST=$ip 

# Ping the host once with a 1-second timeout and suppress output
if ping -c 4  $HOST &>/dev/null; then
    echo "up"
else
    echo "down"
fi
