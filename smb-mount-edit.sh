#!/bin/bash

if [ $# -ne '1' ]; then
    echo "Enter password for remote FS as first (only) argument"
    echo "or here at prompt. You will also then be prompted for"
    echo "sudo password if necessary."

    read -sp "Password: " passvar 
    PASS=$passvar
    echo ""
else
    PASS=$1 
fi 

MYNAME="$(id -u -n)"
MYUID="$(id -u)"
#PASS=$1 
IPADDR="$(cat ./smb-ip.txt)"
echo $PASS $MYUID $MYNAME $HOME $IPADDR


if [ -d $HOME/mnt/smb/edit  ]; then
    sudo mount -t cifs //$IPADDR/edit $HOME/mnt/smb/edit -o username=$MYNAME,password=$PASS,uid=$MYUID
else
    echo "could not find: "

    echo "$HOME/mnt/smb/edit"
    exit
fi

## 192.168.0.123
