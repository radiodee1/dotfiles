#!/bin/bash

FILE="$HOME/.local/share/gnome-shell/extensions/text-to-bar@dliebman.com/nas_ip.txt"

if ! [ -f $FILE ]; then
    echo "cannot find $FILE"
    exit 1
fi 


read -r ip < "$FILE"
HOST=$ip 

snmp_info () {
    OID_STRING=$1 
    DISK1=$(snmpwalk -v 2c -c public $HOST $OID_STRING)
    str=$DISK1
    temp="${str#*\"}"  # Remove everything before the first "
    result1="${temp%\"*}" # Remove everything after the last "
    length=${#result1}
    if [ $length -gt 10 ]; then
        result1='check'
    fi
    echo "NAS: $result1"
    return 0
}


ping -c 4  $HOST &>/dev/null

if [ $? -eq 0 ]; then

    
    result=$(snmp_info .1.3.6.1.4.1.44738.5.1.1.4) 
    if [ "$result" = "degraded" ]; then
        echo "NAS $result"
        exit
    fi 

    result1=$(snmp_info .1.3.6.1.4.1.44738.4.1.1.5.1)    

    length=${#result1}

    if [ $length -lt 10 ]; then

        result2=$(snmp_info .1.3.6.1.4.1.44738.4.1.1.5.2) 
        length=${#result2}
        if [ $length -lt 10 ]; then
            echo "NAS $result1-$result2"
            
        else
            echo "NAS $result1-check"
        fi 
    else

        result1="check"
        result2="check"
        echo "NAS check-check"

    fi 

else
    echo "NAS down"
fi

