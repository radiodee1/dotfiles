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
    DISK1=$(snmpwalk -v 2c -c public $HOST .1.3.6.1.4.1.44738.4.1.1.5.1)

    str=$DISK1
    temp="${str#*\"}"  # Remove everything before the first "
    result1="${temp%\"*}" # Remove everything after the last "
    #echo $result1

    length=${#result1}

    if [ $length -lt 10 ]; then

        DISK2=$(snmpwalk -v 2c -c public $HOST .1.3.6.1.4.1.44738.4.1.1.5.2)
        str=$DISK2
        temp="${str#*\"}"  
        result2="${temp%\"*}"
        length=${#result2}
        #echo $result2
        if [ $length -lt 10 ]; then
            echo "$result1-$result2"
            
        else
            echo "$result1-check"
        fi 
    else

        result1="check"
        result2="check"
        echo "check-check"

    fi 
    #echo "$result1:$result2"

else
    echo "down"
fi


