#!/bin/bash
source ./config/sk450p2.cfg
date
echo "${version_current_display_name}"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /opt/maintserver/bin; ls -al; sleep 10; ./revert.sh; sleep 10; reboot;)"
