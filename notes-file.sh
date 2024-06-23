#!/usr/bin/bash

html_from_md () {
    NAME=$1

    CSS=md.css 
    pandoc -o "$NAME.html" -s -c $CSS "$NAME" 
    sed -i  's/.md\"/.md.html\"/g' "$NAME.html" 
}



if [ $# -eq 0 ]; then
    echo "must add text for title!!"
    exit
fi

if [ $# -eq 1 ]; then
    if [ -f $1  ]; then

        FULLNAME=$1
        if [ "${FULLNAME: -5}" == ".html" ]; then
            echo 'do not edit html!'
            FULLNAME=${FULLNAME: -5}
            
        fi
        
        nvim $FULLNAME
        html_from_md $FULLNAME
        exit
    fi
fi

SPACE=" "
UNDERLINE="_"
IN=$@

LIST=""
FLAG_MIXED=0

for i in $IN;
do 
    #echo $i
     if [ "${i: -8}" == ".md.html" ]; then
        echo 'do not edit html!'
        #LIST="${i:0:-5} $LIST"

    elif [ "${i: -3}" == ".md" ]; then
        echo 'add to list'
        LIST="${i} $LIST"
    else 
        #echo "mixed input"
        FLAG_MIXED=1
    fi
    
done

#echo $LIST "<<<"

if [ "${LIST}" != "" ]; then

    if [ "${FLAG_MIXED}" == '1' ]; then
        echo "check for mixed input"
        exit
    fi 

    nvim $LIST

    for l in $LIST;
    do 
        html_from_md $l 
    done
    exit
fi


VAULT_NAME="$(cat $HOME/.config/nvim/vault.txt)" 

NAME="${IN//$SPACE/$UNDERLINE}"

DATE=$(date '+%Y-%m-%d')

NAME="${DATE}_${NAME}.md"

HEADING="# ${NAME}\n\n"

NAME="$HOME/${VAULT_NAME}/${NAME}"

echo $NAME

if [ -d "$HOME/${VAULT_NAME}/" ]; then
    touch $NAME
    echo -e $HEADING > $NAME
    nvim $NAME
    html_from_md $NAME
fi


