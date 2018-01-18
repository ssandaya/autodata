#!/bin/bash -vx
source ./config/$1
date
echo "${version_upgrade_factory_tar_file}"
echo "write factory gzip to thumb drive"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} '[ -d /mnt/usb ] && ( mount /dev/sda1 /mnt/usb ; cd /mnt/usb && rm -rf *; gzip -dcv /tmp/thumbdrive.tar.gz | (cd /mnt/usb && tar x --no-same-owner -f -); sleep 20; cd; umount /dev/sda1 /mnt/usb; /opt/maintserver/bin/mount-upgrade-thumb.sh; cd /mnt/usb; rm -rf *; gzip -dcv /tmp/thumbdrive.tar.gz | (cd /mnt/usb && tar x --no-same-owner -f -); sleep 20; cd;/opt/maintserver/bin/unmount-upgrade-thumb.sh; sleep 10)'
echo "Success!"
exit 0

