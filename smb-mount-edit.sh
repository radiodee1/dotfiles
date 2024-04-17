if [ -d /mnt/smb/edit  ]; then
    mount -t cifs //192.168.0.123/edit /mnt/smb/edit -o username=dave,password=droptest1,uid=1000
else
    echo "could not find /mnt/smb/edit"

fi

## 192.168.0.123
