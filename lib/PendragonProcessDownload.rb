# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#puts "Copy software version download to thumbdrive"
#
#@download_dir = "c:/Users/sandaya/Downloads"
#puts ":::STARTING ..."
#puts ":::rm c:/usb folder"
#system("C:/Users/sandaya/.babun/cygwin/bin/rm -rv /cygdrive/c/usb")
#sleep 10
#puts ":::mkdir c:/usb folder"
#system("C:/Users/sandaya/.babun/cygwin/bin/mkdir -pv /cygdrive/c/usb")
#sleep 10
#puts ":::tar software version from pendragon"
#system("C:/Users/sandaya/.babun/cygwin/bin/tar -xvf /cygdrive/c/Users/sandaya/Downloads/3420047NB.v33140-thumb.tar -C  /cygdrive/c/usb")
#3420047AB.v3316-thumb.tar

system("tar -xvf /home/ubuntu04/Downloads/3420047NB.v33140-thumb.tar -C  /home/ubuntu04/veeder/usb/")
sleep 10
#puts ":::stopping tls applications"
#system("ssh root@10.20.95.104 '[ -d /opt/atg/bin ] && (cd /nextgen/dist/bin && /etc/init.d/applications stop ; sleep 10)'")
#sleep 10
puts ":::creating mount point on thumbdrive"
system("ssh root@10.2.1.129 \"[ ! -d /mnt/usb ] && (mkdir /mnt/usb ; sleep 10)\"")
sleep 10
puts ":::mounting thumbdrive"
system("C:/cygwin64/bin/ssh root@10.20.95.104 \"[ -d /dev/sda1 ] && ( mount /dev/sda1 /mnt/usb/ ; sleep 10)\"")
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


