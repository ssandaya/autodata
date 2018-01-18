# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Tls01 ip 10.20.95.161"
puts "342004-007D-v231.11-internal"
system("sshpass -f ~/.ssh/sshpass.txt ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@10.20.95.161 \"( cd /opt/common/bin; ./fetch.sh http://gvrsimeng02.sim.gilbarco.com/debug_builds/releases/342004-007D-v231.11-internal; sleep 10; cd /tmp/stage; sleep 10; ./create.sh --ip 10.20.95.161 --gw 10.20.95.1 --dns 10.20.77.54 --hostname tls450p1 --hostname tls450p1; )\"
")
puts "342004-007E.v231.12-internal"
system("sshpass -f ~/.ssh/sshpass.txt ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@10.20.95.161 \"( sleep 900; cd /opt/common/bin; ./fetch.sh http://gvrsimeng02.sim.gilbarco.com/debug_builds/releases/342004-007E.v231.12-internal; sleep 10; cd /tmp/stage; sleep 10; ./create.sh --ip 10.20.95.161 --gw 10.20.95.1 --dns 10.20.77.54 --hostname tls450p1 --hostname tls450p1; sleep 10 ; reboot; )\"
")
puts "342004-007F-v231.14-internal"
system("sshpass -f ~/.ssh/sshpass.txt ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@10.20.95.161 \"( sleep 900; cd /opt/common/bin; ./fetch.sh http://gvrsimeng02.sim.gilbarco.com/debug_builds/releases/342004-007F-v231.14-internal; sleep 10; cd /tmp/stage; sleep 10; ./create.sh --ip 10.20.95.161 --gw 10.20.95.1 --dns 10.20.77.54 --hostname tls450p1 --hostname tls450p1; sleep 10 ; reboot; )\"
")

puts "Tls01 ip 10.20.95.161 - DONE!"