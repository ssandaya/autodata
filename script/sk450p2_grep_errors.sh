#!/bin/bash
source ./config/sk450p2.cfg
date
echo "grep_errors"
/usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( [ -d /opt/atg/logs ] && grep -i error /**/**/*.log; sleep 5; exit 0)"
exit 0


