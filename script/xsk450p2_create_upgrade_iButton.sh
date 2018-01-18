#!/bin/bash
source ./config/sk450p2.cfg
date
echo "${version_current_display_name}"
echo "Create upgrade iButton"
echo "Today `date`"
echo "Under development ..."
exit 0


cd /home/ubuntu04/veeder/usb
rm -rf *
cd /home/ubuntu04/Downloads
cp ${version_upgrade_tar_file} /home/ubuntu04/veeder/usb
ssh root@${console_dhcp_ip} '[ -d /opt/atg/bin ] && (cd /nextgen/dist/bin && /etc/init.d/applications stop ; sleep 10)'
ssh root@${console_dhcp_ip} '[ ! -d /mnt/usb ] && (mkdir /mnt/usb ; sleep 10)'
echo ":::mounting thumbdrive"
ssh root@${console_dhcp_ip} '[ -d /dev/sda1 ] && ( mount /dev/sda1 /mnt/usb ; sleep 10)'
echo ":::rm thumdrive"
sleep 10
ssh root@${console_dhcp_ip} '[ -d /mnt/usb ] && (cd /mnt/usb && rm -rf * ; sleep 10)'
sleep 10
echo ":::copying files to thumbdrive"
sleep 10
scp -rv /home/ubuntu04/veeder/usb/${version_upgrade_tar_file} root@${console_dhcp_ip}:/mnt/usb/${version_upgrade_tar_file}
sleep 10
ssh root@${console_dhcp_ip} '[ -d /opt/atg/bin ] && ( cd /mnt/usb && tar -xvf /mnt/usb/${version_upgrade_tar_file} && rm ${version_upgrade_tar_file} && sleep 10 )'
echo ":::starting tls application"
sleep 10
ssh root@${console_dhcp_ip} '[ -d /opt/atg/bin ] && (cd /nextgen/dist/bin && /etc/init.d/applications start ; sleep 10)'
echo ":::ALL DONE"


