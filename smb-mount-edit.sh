if [ -d /mnt/smb  ]; then
    mount -t cifs //truenas.local/edit /mnt/smb 
else
    echo "could not find /mnt/smb"

fi

## 192.168.0.123
