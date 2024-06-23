#!/usr/bin/bash

html_from_md () {
    NAME=$1

    CSS=md.css 
    pandoc -o "$NAME.html" -s -c $CSS "$NAME" 
    sed -i  's/.md\"/.md.html\"/g' "$NAME.html" 
}


VAULT="$HOME/$(cat $HOME/.config/nvim/vault.txt)" 

VAULTLIST="$VAULT*.md" 

for i in $VAULTLIST;
do
    echo $i
    BASENAME=$(echo "$i" | sed "s/.*\///" )
    echo $BASENAME
    echo $VAULT
    DATESTRING="${BASENAME:0:10}"
    echo $DATESTRING

    date=$DATESTRING

    EXIT=0
    if [ "z$date" == "z" ]
    then
      echo "No date specified"
      EXIT=1
    fi
    if ! [[ "$date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]
    then
      echo "Expected date in YYYY-MM-DD format"
      EXIT=1
    fi
    if ! date -d "$date" 2>/dev/null
    then
      EXIT=1
    fi
    #echo "VALID DATE"

    SPACE=" "
    UNDERLINE="_"

    if [ $EXIT == 1 ]; then
        echo "must modify filename"
        NEWDATERAW=$(stat -c %y "$i")
        NEWDATE="${NEWDATERAW:0:10}"
        echo $NEWDATE
        IN=$BASENAME
        NAME="${IN//$SPACE/$UNDERLINE}"


        mv "$i" "${VAULT}${NEWDATE}_${NAME}"

        html_from_md "${VAULT}${NEWDATE}_${NAME}"

        if [ -f "${VAULT}${BASENAME}.html" ]; then
            echo "rm ${VAULT}${BASENAME}.html"
            rm "${VAULT}${BASENAME}.html"
        fi 

    fi

done
