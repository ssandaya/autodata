#!/bin/bash
date
echo "3420047MB.v33137"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@10.20.95.93 "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh http://gvrsimeng02.sim.gilbarco.com/debug_builds/beta-releases/notyet/3420047NB.v33138-limited-beta; sleep 5; cd /tmp/stage; sleep 5; ls -al; ./create.sh --dhcp --hostname sa450p2; sleep 10;  reboot; )"
