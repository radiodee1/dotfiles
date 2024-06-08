
if [ -d $HOME/mnt/smb/edit  ]; then
    echo "mount point already set up"
else
    echo "could not find: "

    echo "$HOME/mnt/smb/edit"

    mkdir -p $HOME/mnt/smb/edit
fi

