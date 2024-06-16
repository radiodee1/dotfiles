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

for i in $IN;
do 
    echo $i
     if [ "${i: -8}" == ".md.html" ]; then
        echo 'do not edit html!'
        #LIST="${i:0:-5} $LIST"

    elif [ "${i: -3}" == ".md" ]; then
        echo 'add to list'
        LIST="${i} $LIST"
    fi
    
done

echo $LIST "<<<"

if [ "${LIST}" != "" ]; then
    nvim $LIST

    for l in $LIST;
    do 
        html_from_md $l 
    done
    exit
fi

NAME="${IN//$SPACE/$UNDERLINE}"

DATE=$(date '+%Y-%m-%d')

NAME="${DATE}_${NAME}.md"

NAME="$HOME/Documents/vault/${NAME}"

echo $NAME

if [ -d "$HOME/Documents/vault/" ]; then
    touch $NAME
    nvim $NAME
    html_from_md $NAME
fi


