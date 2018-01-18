#!/bin/bash
source ./config/sk450p2.cfg
date
echo "report_delivery_differences"
diff ${report_delivery_before_upgrade} ${report_delivery_after_upgrade} 
exit 0

