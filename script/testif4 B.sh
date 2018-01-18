#!/bin/bash -vx
source ./config/sk450p2.cfg
date
echo "${version_current_display_name}"
if [ ${console_type} == "450+" ]
then	
  echo "450+"
fi
if [ ${console_type} == "4B" ]
then	
  echo "4B"
fi

exit 0
