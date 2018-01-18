#!/bin/bash
source ./config/sk450p2.cfg
date
echo "${version_current_display_name}"
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /opt/common/bin; ls -al; sleep 10; ./fetch.sh ${version_current_build_url}; sleep 5; cd /tmp/stage; sleep 5; ls -al; ./create.sh --dhcp --hostname ${console_dhcp_hostname}; sleep 10;  reboot; )"






ssh root@10.20.95.104 '[ -d /opt/atg/bin ] && (cd /nextgen/dist/bin && /etc/init.d/applications stop ; sleep 10)'
ssh root@10.20.95.104 '[ ! -d /mnt/usb ] && (mkdir /mnt/usb ; sleep 10)'
puts ":::mounting thumbdrive"
ssh root@10.20.95.104 '[ -d /dev/sda1 ] && ( mount /dev/sda1 /mnt/usb/ ; sleep 10)'
puts ":::rm thumdrive"
sleep 10
system("C:/cygwin64/bin/ssh root@10.20.95.104 \"[ -d /mnt/usb ] && (cd /mnt/usb && rm -rf * ; sleep 10)\"")
sleep 10
puts ":::copying files to thumbdrive"
sleep 10
#system("C:/cygwin64/bin/scp /cygdrive/c/Users/sandaya/Downloads/3420046KB.v33045-thumb.tar root@10.2.1.129:/mnt/usb/targetbuild.tar")
system("C:/cygwin64/bin/scp -rv /cygdrive/c/usb/ root@10.20.95.104:/mnt/ ")
sleep 10
system("C:/cygwin64/bin/ssh root@10.2.1.129 \"[ -d /opt/atg/bin ] && ( tar -xvf /mnt/usb/targetbuild.tar && sleep 10 )\"")
puts ":::unmounting thumbdrive"
system("C:/cygwin64/bin/ssh root@10.2.1.129 \"[ -d /opt/atg/bin ] && ( umount /mnt/usb /dev/sda1 ; sleep 10)\"")
puts ":::removing mount point"
sleep 10
system("C:/cygwin64/bin/ssh root@10.2.1.129 '[ -d /opt/atg/bin ] && ( rmdir  /mnt/usb; sleep 10)'")
#puts ":::starting tls application"
#sleep 10
#system ("C:/cygwin64/bin/ssh root@10.2.1.129 '[ -d /opt/atg/bin ] && (cd /nextgen/dist/bin && /etc/init.d/applications start ; sleep 10)'")
puts ":::ALL DONE"


