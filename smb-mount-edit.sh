if [ -d /mnt/smb  ]; then
    mount -t cifs //192.168.0.123/edit /mnt/smb 
else
    echo "could not find /mnt/smb"

fi
