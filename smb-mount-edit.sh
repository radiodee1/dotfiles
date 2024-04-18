
if [ $# -ne '1' ]; then
    echo "enter password as first (only) argument"
    exit 
fi 

PASS=$1 
echo $PASS


if [ -d /mnt/smb/edit  ]; then
    mount -t cifs //192.168.0.123/edit /mnt/smb/edit -o username=dave,password=$PASS,uid=1000
else
    echo "could not find /mnt/smb/edit"
    exit
fi

## 192.168.0.123
