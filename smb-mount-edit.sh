
if [ $# -ne '1' ]; then
    echo "enter password as first (only) argument"
    exit 
fi 

MYNAME="$(id -u -n)"
MYUID="$(id -u)"
PASS=$1 
IPADDR="$(cat ./smb-ip.txt)"
echo $PASS $MYUID $MYNAME $HOME $IPADDR


if [ -d $HOME/mnt/smb/edit  ]; then
    sudo mount -t cifs //$IPADDR/edit $HOME/mnt/smb/edit -o username=$MYNAME,password=$PASS,uid=$MYUID
else
    echo "could not find: "

    echo "$HOME/mnt/smb/edit"
    exit
fi

## 192.168.0.123
