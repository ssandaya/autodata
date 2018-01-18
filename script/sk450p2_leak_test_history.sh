#!/bin/bash
source ./config/sk450p2.cfg
date
echo "report_leak_test_history"
(echo -e \\01I20700; sleep 3; echo -e \\035quit; sleep 3) | telnet ${console_dhcp_ip} 10001 > ${report_leak_test_history}
cat ${report_leak_test_history}
exit 0
