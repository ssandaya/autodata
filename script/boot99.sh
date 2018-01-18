date
echo "Login issue"
export SSHPASS=vrlinux
cat /home/ubuntu04/.ssh/sshpass.txt
/usr/bin/sshpass -f /home/ubuntu04/.ssh/sshpass.txt ssh -v -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@10.20.95.99 << !
   echo "Hello sshpass!"
!
