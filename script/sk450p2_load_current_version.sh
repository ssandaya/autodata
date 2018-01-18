#!/bin/bash -vx
source ./config/sk450p2.cfg
date
echo "${version_current_display_name}"
if [ ${console_type} == 4B ]
then
  if [ ${static_or_dynamic_ip} == D ]	
  then
    /usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh ${version_current_build_url}; sleep 5; cd /var/tmp/stage; sleep 5; ls -al; ./create.sh --dhcp --hostname ${console_dhcp_hostname}; sleep 10;  reboot; )"
  else
    /usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh ${version_current_build_url}; sleep 5; cd /var/tmp/stage; sleep 5; ls -al; ./create.sh --ip ${console_dhcp_ip} --gw 10.20.95.1 --dns 10.20.77.54 --hostname ${console_dhcp_hostname}; sleep 10;  reboot; )"
  fi
fi
if [ ${console_type} == 450+ ]
then	
  if [ ${static_or_dynamic_ip} == D ]	
  then
    /usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh ${version_current_build_url}; sleep 5; cd /tmp/stage; sleep 5; ls -al; ./create.sh --dhcp --hostname ${console_dhcp_hostname}; sleep 10;  reboot; )"
  else
    /usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh ${version_current_build_url}; sleep 5; cd /tmp/stage; sleep 5; ls -al; ./create.sh --ip ${console_dhcp_ip} --gw 10.20.95.1 --dns 10.20.77.54 --hostname ${console_dhcp_hostname}; sleep 10;  reboot; )"
  fi
fi
cat ~/.ssh/id_rsa.pub | /usr/bin/sshpass -f /home/simulate/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

exit 0
