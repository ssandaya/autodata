#!/bin/bash
source ./config/sk450p2.cfg
date
echo "report_combined_alarm_history"
(echo -e \\01I11000; sleep 3; echo -e \\035quit; sleep 3) | telnet ${console_dhcp_ip} 10001 > ${report_combined_alarm_history}
cat ${report_combined_alarm_history}
exit 0
