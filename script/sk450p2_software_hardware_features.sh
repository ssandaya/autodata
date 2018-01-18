#!/bin/bash
source ./config/sk450p2.cfg
date
echo "report_software_hardware_features"
(echo -e \\01I90700; sleep 3; echo -e \\035quit; sleep 3) | telnet ${console_dhcp_ip} 10001 > ${report_software_hardware_features}
cat ${report_software_hardware_features}
exit 0
