#!/bin/bash -vx
source ./config/sk450p2.cfg
date
echo "Upgrade Release: ${upgrade_release} ${upgrade_version}"
echo "Create upgrade thumbdrive"
sleep 10
if [ ! -d /home/jenkins/thumbdrive ] 
then
  mkdir -p /home/jenkins/thumbdrive/
else
  chmod ugo+wr -R /home/jenkins/thumbdrive/
fi
if [ -d /home/jenkins/thumbdrive ] 
then
  cd /home/jenkins/thumbdrive/
else
  echo "thumbdrive dir not found!"
  exit 1
fi  
rm -rf *
wget ${version_upgrade_factory_build_url}
unzip ${version_upgrade_factory_tar_file}
tar xvzf fedora.tar.gz 
cd fedora
tar xvzf create-upgrade-thumb.tgz
cd create-upgrade-thumb/
/usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@${console_dhcp_ip} '[ ! -d /mnt/usb ] && ( mkdir /mnt/usb; sleep 10)'
/usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@${console_dhcp_ip} '[ -d /mnt/usb ] && (  mount /dev/sda1 /mnt/usb; cd /mnt/usb && rm -rf *; sleep 10; cd; umount /mnt/usb; sleep 10)'

if [ ${console_type} == 4B ]
then	
  /usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt scp -v -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" upgrade*.gz root@${console_dhcp_ip}:/var/tmp/thumbdrive.tar.gz
  sleep 30
  /usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@${console_dhcp_ip} '[ -d /mnt/usb ] &&  ( mount /dev/sda1 /mnt/usb; cd /mnt/usb; rm -rf *; gzip -dcv /var/tmp/thumbdrive.tar.gz | (cd /mnt/usb && tar x --no-same-owner -f -); sleep 30; umount /mnt/usb; sleep 30; /opt/maintserver/bin/mount-upgrade-thumb.sh; cd /mnt/usb; gzip -dcv /var/tmp/thumbdrive.tar.gz | (cd /mnt/usb && tar x --no-same-owner -f -); sleep 30; cd; /opt/maintserver/bin/unmount-upgrade-thumb.sh; sleep 10; rm /var/tmp/thumbdrive.tar.gz; sleep 10)'
fi
if [ ${console_type} == 450+ ]
then	
  /usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt scp -v -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" upgrade*.gz root@${console_dhcp_ip}:/tmp/thumbdrive.tar.gz
  sleep 30
  /usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" root@${console_dhcp_ip} '[ -d /mnt/usb ] &&  ( mount /dev/sda1 /mnt/usb; cd /mnt/usb; rm -rf *; gzip -dcv /tmp/thumbdrive.tar.gz | (cd /mnt/usb && tar x --no-same-owner -f -); sleep 30; umount /mnt/usb; sleep 30; /opt/maintserver/bin/mount-upgrade-thumb.sh; cd /mnt/usb; gzip -dcv /tmp/thumbdrive.tar.gz | (cd /mnt/usb && tar x --no-same-owner -f -); sleep 30; cd; /opt/maintserver/bin/unmount-upgrade-thumb.sh; sleep 10)'
fi

echo "Success!"
exit 0



