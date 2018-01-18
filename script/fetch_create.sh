#!/bin/bash
source ./$1

date
echo "3420047KB.v33132"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@$ip_address "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh $fetch_address; sleep 10; cd $create_dir; sleep 10; ls -al; ./create.sh --dhcp --hostname $host_name; sleep 10;  reboot; )"
