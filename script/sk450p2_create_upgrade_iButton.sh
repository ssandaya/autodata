#!/bin/bash -vx
source ./config/sk450p2.cfg
echo "Create upgrade iButton"
echo "ip address ${console_dhcp_ip}"
date
cat ./config/sk450p2.cfg
feature_loader="feature_loader.sh"

echo "filename: ${feature_loader}"
echo "#!/bin/bash -vr" > "${feature_loader}"

if [ ${console_type} == "450+" ]
then
  echo "450+"

  if [ ${CSLD} == ON ]
  then
    echo "LoadFeature 0332972-006" >> "${feature_loader}"
  fi
  if [ ${PLLD_Ultimate} == ON ]
  then
    echo "LoadFeature 0332972-007" >> "${feature_loader}"
  fi
  if [ ${PLLD_RiskManagement} == ON ]	
  then
   	echo "LoadFeature 0332972-008" >> "${feature_loader}"			
  fi

  if [ ${PLLD_Base_Compliance} == ON ]
  then
    echo "LoadFeature 0332972-009" >> "${feature_loader}"			
  fi
  if [ ${BIR} == ON ]
  then
  	echo "LoadFeature 0332972-010" >> "${feature_loader}"
  fi
  if [ ${AccuChart} == ON ]
  then
  	echo "LoadFeature 0332972-011" >> "${feature_loader}"
  fi
  if [ ${BIR_AccuChart_HRM} == ON ]
  then
  	echo "LoadFeature 0332972-012" >> "${feature_loader}"		
  fi
  if [ ${TSL_Timed_Sudden_Loss} == ON ]
  then
  	echo "LoadFeature 0332972-018" >> "${feature_loader}"			
  fi
  if [ ${TLSXB_16_Input_Expansion} == ON ]
  then
  	echo "LoadFeature 0333411-016" >> "${feature_loader}"				
  fi
  if [ ${TLSXB_32_Input_Expansion} == ON ]
  then
  	echo "LoadFeature 0333411-032" >> "${feature_loader}"				
  fi
  if [ ${TLSXB_48_Input_Expansion} == ON ]
  then
  	echo "LoadFeature 0333411-048" >> "${feature_loader}"				
  fi
  if [ ${TLSXB_64_Input_Expansion} == ON ]
  then
    echo "LoadFeature 0333411-064" >> "${feature_loader}"				
  fi


  if [ ${Secure_Fuel_Inventory_Reconciliation_SFIR} == ON ]   
  then
    echo "LoadFeature 0332972-019" >> "${feature_loader}"   
  fi                  
  if [ ${IFSF} == ON ]                      
  then
    echo "LoadFeature 0332972-020" >> "${feature_loader}"   
  fi                  
  if [ ${Vapor_Collection_Monitor} == ON ]                      
  then
    echo "LoadFeature 0332972-021" >> "${feature_loader}"   
  fi                  
  if [ ${Vapor_Pressure_Monitor} == ON ]                      
  then
    echo "LoadFeature 0332972-022" >> "${feature_loader}"   
  fi                  
  if [ ${Vapor_Leak_Detection} == ON ]                      
  then
    echo "LoadFeature 0332972-023" >> "${feature_loader}"   
  fi                  
  if [ ${Vapor_Pressure_Management} == ON ]                     
  then
    echo "LoadFeature 0332972-024" >> "${feature_loader}"   
  fi                  
  if [ ${Vapor_Delivery_Monitor} == ON ]                      
  then
    echo "LoadFeature 0332972-025" >> "${feature_loader}"   
  fi                  
  if [ ${Recirculation} == ON ]                   
  then
    echo "LoadFeature 0332972-026" >> "${feature_loader}"   
  fi                  
  if [ ${Temperature_Control_Relay} == ON ]           
  then
    echo "LoadFeature 0332972-027" >> "${feature_loader}"   
  fi                  
  if [ ${Intelligent_Pump_Control} == ON ]            
  then
    echo "LoadFeature 0332972-028" >> "${feature_loader}"   
  fi                  
fi



if [ ${console_type} == "4B" ]
then
  if [ ${Secure_Fuel_Inventory_Reconciliation_SFIR} == ON ]   
  then
    echo "LoadFeature 0333410-019" >> "${feature_loader}"       
  fi                  
  if [ ${IFSF} == ON ]                      
  then
    echo "LoadFeature 0333410-020" >> "${feature_loader}"       
  fi                  
  if [ ${Vapor_Collection_Monitor} == ON ]                      
  then
    echo "LoadFeature 0333410-021" >> "${feature_loader}"       
  fi                  
  if [ ${Vapor_Pressure_Monitor} == ON ]                      
  then
    echo "LoadFeature 0333410-022" >> "${feature_loader}"       
  fi                  
  if [ ${Vapor_Leak_Detection} == ON ]                      
  then
    echo "LoadFeature 0333410-023" >> "${feature_loader}"       
  fi                  
  if [ ${Vapor_Pressure_Management} == ON ]                     
  then
    echo "LoadFeature 0333410-024" >> "${feature_loader}"       
  fi                  
  if [ ${Vapor_Delivery_Monitor} == ON ]                      
  then
    echo "LoadFeature 0333410-025" >> "${feature_loader}"       
  fi                  
  if [ ${Recirculation} == ON ]                   
  then
    echo "LoadFeature 0333410-026" >> "${feature_loader}"     
  fi                  
  if [ ${Temperature_Control_Relay} == ON ]           
  then
    echo "LoadFeature 0333410-027" >> "${feature_loader}"     
  fi                  
  if [ ${Intelligent_Pump_Control} == ON ]            
  then
    echo "LoadFeature 0333410-028" >> "${feature_loader}"     
  fi                  
fi
echo "ActivateFeatures" >> "${feature_loader}"
cat "${feature_loader}"

if [[ $(wc -l < ${feature_loader} ) -ge 3 ]]
then
  ls -al  ${feature_loader}
  whoami
  cat /home/simulate/.ssh/sshpass.txt
  sshpass -f /home/simulate/.ssh/sshpass.txt scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null ${feature_loader} root@${console_dhcp_ip}:/usr/local/bin/manufacturing/final-test/
  sleep 10
  sshpass -f /home/simulate/.ssh/sshpass.txt ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@${console_dhcp_ip} "( cd /usr/local/bin/manufacturing/final-test/ && export PATH=.:${PATH}  && ls -al; [ -f ${feature_loader} ] && ./${feature_loader}; sleep 10 )"
  exit 0
else
  echo "No optional features set or activated!"
fi



