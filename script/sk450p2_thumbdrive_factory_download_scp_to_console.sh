#!/bin/bash -vx
source ./config/$1
date
echo "${version_upgrade_factory_tar_file}"
echo "scp factory gzip file to console"
if [ -d /home/jenkins/thumbdrive/fedora/create-upgrade-thumb ]
then
  cd /home/jenkins/thumbdrive/fedora/create-upgrade-thumb
  /usr/bin/sshpass -p vrlinux scp -rv -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null upgrade*.gz root@${console_dhcp_ip}:/tmp/thumbdrive.tar.gz
  exit 0
else
  echo "!exists /home/jenkins/thumbdrive/fedora/create-upgrade-thumb" 
  exit 1
fi


