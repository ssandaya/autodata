#!/bin/bash
source ./config/sk450p2.cfg
date
echo "reset_database"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "[ -d /opt/atg/bin ] && ( cd /nextgen/dist/bin && /etc/init.d/applications stop && sleep 30; rm -rf /nextgen/dist/bin/*.tls && sleep 5 && tar -xvf database.tar && sleep 5 && /usr/local/bin/set-app-permissions && sleep 5 && /etc/init.d/applications start && sleep 5 )"
