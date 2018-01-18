#!/bin/bash
date
echo "3420045aB.v3309"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@10.20.95.85 "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh http://gvrsimeng02.sim.gilbarco.com/debug_builds/beta-releases/3420045aB.v3309; sleep 10; cd /var/tmp/stage; sleep 10; ls -al; ./create.sh --dhcp --hostname sa4Bp85 tls4; sleep 10;  reboot; )"
