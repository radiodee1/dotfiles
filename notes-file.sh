if [ $# -eq 0 ]; then
    echo "must add text for title!!"
    exit
fi

if [ $# -eq 1 ]; then
    if [ -f $1  ]; then
        nvim $1
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
fi
