#!/bin/bash
source ./config/sk450p2.cfg
date
echo "report_inventory_differences"
diff ${report_inventory_before_upgrade} ${report_inventory_after_upgrade} 
exit 0

