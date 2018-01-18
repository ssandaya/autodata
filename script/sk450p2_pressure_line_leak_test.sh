#!/bin/bash
source ./config/sk450p2.cfg
date
echo "report_pressure_line_leak_test"
(echo -e \\01I37300; sleep 3; echo -e \\035quit; sleep 3) | telnet ${console_dhcp_ip} 10001 > ${report_pressure_line_leak_test}
cat ${report_pressure_line_leak_test}
exit 0
