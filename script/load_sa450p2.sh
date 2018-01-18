#!/bin/bash
source ./config/load_sa450p2.cfg
date
echo "${version_current_display_name}"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh ${version_current_build_url}; sleep 5; cd /tmp/stage; sleep 5; ls -al; ./create.sh --dhcp --hostname ${console_dhcp_hostname}; sleep 10;  reboot; )"
