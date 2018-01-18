#!/bin/bash
source ./config/sk450p2.cfg
date
echo "${version_current_display_name}"
if [ ${console_type} == 4B ]
then	
  echo "4B /var/temp/stage"
  /usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile=/dev/null" root@${console_dhcp_ip} "( head -5 /opt/atg/distinfo/filelist.md5 | grep ${upgrade_version}; )"
fi
if [ ${console_type} == 450+ ]
then	
  echo "450+ /var/temp/stage"
  /usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile=/dev/null" root@${console_dhcp_ip} "( head -5 /opt/atg/distinfo/filelist.md5 | grep ${upgrade_version}; )"
fi
exit 0 
