#!/usr/bin/bash

html_from_md () {
    NAME=$1

    CSS=md.css 
    pandoc -o "$NAME.html" -s -c $CSS "$NAME" 
    sed -i  's/.md\"/.md.html\"/g' "$NAME.html" 
}


LOCATION=""
NUM=0
PRESENT=0

VAULT="$HOME/$(cat $HOME/.config/nvim/vault.txt)" 
PWD="$(pwd)"

PWD_LS="$(ls $PWD)"
VAULT_LS="$(ls $VAULT)"

if [ "${PWD_LS}" != "${VAULT_LS}" ]; then
    echo $PWD $VAULT
    echo must be in vault.
    exit
fi


if [ $# -ge 2 ]; then
    LOCATION=$1
    if [ -f $LOCATION ]; then
        echo "found $LOCATION"
        if [ ${LOCATION: -3} == ".md" ]; then
            echo "ok md file $LOCATION"
        else
            echo "bad md file $LOCATION"
            exit 
        fi
    else
        echo "not found $LOCATION"
        exit 
    fi

    echo 'two or more command line arguments'
    NUM=$(echo $@ | wc -w)
    echo $NUM
   
    PRESENT=$(cat $LOCATION | grep "\-\-\-" -q && echo $?)
    echo $LOCATION $PRESENT

    if [ "$PRESENT" != "0" ]; then
        echo -e "\n----\n" >> $LOCATION

        for i in $(seq 2 $NUM);
        do
            LINE=$(echo $@ | cut -d " " -f $i)
            if [ -f $LINE ]; then   
                if [ ${LINE: -3} == ".md" ]; then
                    echo $i $LOCATION $LINE $NOTREADY
                    echo -e "- [$LINE]($LINE)\n\n" >> $LOCATION 
                fi
            fi
        done
        nvim "$LOCATION"
        html_from_md "$LOCATION"
    fi

fi
