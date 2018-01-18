#!/bin/bash
source ./config/sk450p2.cfg
date
echo "report_delivery_before_upgrade"
(echo -e \\01I20200; sleep 3; echo -e \\035quit; sleep 3) | telnet ${console_dhcp_ip} 10001
(echo -e \\01I20200; sleep 3; echo -e \\035quit; sleep 3) | telnet ${console_dhcp_ip} 10001 > ${report_delivery_before_upgrade}
exit 0
