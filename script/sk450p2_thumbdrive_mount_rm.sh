#!/bin/bash -vx
source ./config/sk450p2.cfg
date
echo "${version_upgrade_factory_tar_file}"
echo "create clean mount thumbdrive"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} '[ ! -d /mnt/usb ] && (mkdir /mnt/usb ; sleep 10)'
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} '[ -f /tmp/thumbdrive.tar.gz ] && ( rm /tmp/thumbdrive.tar.gz ; sleep 10)'
exit 0
