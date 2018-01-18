#!/bin/bash
date
echo "3420045aB.v3309"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@10.20.95.85 "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh http://gvrsimeng02.sim.gilbarco.com/debug_builds/beta-releases/notyet/3420047MB.v33135; sleep 10; cd /tmp/stage; sleep 10; ls -al; ./create.sh --dhcp --hostname sa4p95 tls4; sleep 10;  reboot; )"
