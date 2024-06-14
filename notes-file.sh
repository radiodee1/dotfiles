html_from_md () {
    NAME=$1
    pandoc -o "$NAME.html" -s -c $HOME/.config/nvim/md.css "$NAME" 
    sed -i  's/.md"/.md.html"/g' "$NAME.html" 
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
            exit 
        fi
        
        nvim $1
        html_from_md $1
        exit
    fi
fi

SPACE=" "
UNDERLINE="_"
IN=$@


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


