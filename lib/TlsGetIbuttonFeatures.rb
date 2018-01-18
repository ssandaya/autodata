# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "iButtono Features!"
system "C:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I90700\"; C:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
system "C:/cygwin64/bin/bash.exe -c \"(echo -e \"\\001I90700\"; C:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001\" > tlsrpt_907.txtt"