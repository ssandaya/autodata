#!/bin/bash
source ./config/sk450p2.cfg
date
echo "${version_current_display_name}"

if [ ${console_type} == 4B ]
then	
  echo "4B /var/temp/stage"
  /usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh ${version_upgrade_build_url}; sleep 5; cd /var/tmp/stage; sleep 5; ls -al; ./create.sh --dhcp --hostname ${console_dhcp_hostname}; sleep 10;  reboot; )"
fi
if [ ${console_type} == 450+ ]
then	
  echo "450+ /var/temp/stage"
    /usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh ${version_upgrade_build_url}; sleep 5; cd /tmp/stage; sleep 5; ls -al; ./create.sh --dhcp --hostname ${console_dhcp_hostname}; sleep 10;  reboot; )"
fi
exit 0 
