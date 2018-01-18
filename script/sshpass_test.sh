#!/bin/bash
date
echo "sshpass test"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@10.20.95.104 "( cd /opt/common/bin; ls -al; sleep 1; cd /opt/atg; sleep 1; ls -al; sleep 10; exit 0 )"
