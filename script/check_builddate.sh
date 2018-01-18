#!/bin/bash -vx
source ./$1

date
echo "$console_version"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@$ip_address "( cat /proc/platform/system_info | grep '$bootloader_build_date'; )"
