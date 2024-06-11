
if [ $# -eq '1' ]; then
    echo "Using $1 as ip address."
    echo $1 > ./smb-ip.txt
    exit 
fi 

if [ -d $HOME/mnt/smb/edit  ]; then
    echo "mount point already set up"
else
    echo "could not find: "

    echo "$HOME/mnt/smb/edit"

    mkdir -p $HOME/mnt/smb/edit
fi

