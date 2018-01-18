# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Tls Report Generator"
puts "::: STARTING REPORTS"

puts "::: stopping the beep"
system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001IS530000149\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
system "c:/cygwin64/bin/bash.exe -c \"(echo -e \"\\001IS530000149\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001\" > report_output/rpt_tls_S530.txt > report_output/rpt_tls_S530.txt >report_output/rpt_tls_S530.txt >rpt_tls_S530.txt "

puts "::: sending 201 via telnet  in-tank inventory"
sleep 10
system "C:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I20100\"; C:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "C:/cygwin64/bin/bash.exe -c \"(echo -e \"\\001I20100\"; C:/cygwin64/bin/sleep 10; echo -e '\\035quit\" ; C:/cygwin64/bin/sleep 1) | C:/cygwin64/bin/telnet 10.2.1.129 10001\" > report_output/rpt_tl1_201.txt"

puts "::: sending 202 via telnet : delivery report"
sleep 10
system "C:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I20200\"; C:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "C:/cygwin64/bin/bash.exe -c \"(echo -e \"\\001I20200\"; C:/cygwin64/bin/sleep 10; echo -e '\\035quit\" ; C:/cygwin64/bin/sleep 1) | C:/cygwin64/bin/telnet 10.2.1.129 10001\" > report_output/rpt_tls_201.txt "


#puts "Other Reports"
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I20700\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I20B00\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001IC0700\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001IC070001\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001ICA100\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001ICA200\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I11000\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001IA7100\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I20100\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001IA9100\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001IA9J00\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001IA9H00\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I@9H00\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I37300\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I37400\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I37600\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I3770000\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I@81000\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#system "c:/cygwin64/bin/bash.exe -c '(echo -e \"\\001I@ZZ00\"; c:/cygwin64/bin/sleep 10; echo -e \"\\035quit\" ; /cygdrive/c/cygwin64/bin/sleep 1) | /cygdrive/c/cygwin64/bin/telnet 10.2.1.129 10001' "
#

puts "::: THAT\'S ALL FOR NOW!"
sleep 20
