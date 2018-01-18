#!/bin/bash -vx
source ./config/sk450p2.cfg

CONFIG=./tlsregress_back/RS232Prop.properties

function set_config(){

    oldvalue=`grep $1= $CONFIG | cut -d "=" -f 2`
    if [ -z $oldvalue ]; then
        echo $1=$2 >> $CONFIG
    else
        cat $CONFIG | sed "s/^\($1\s*=\s*\).*\$/\1$2/" >$CONFIG.new
        cp $CONFIG.new $CONFIG
        rm $CONFIG.new
    fi
}

CONFIG=./tlsregress_back/RS232Prop.properties
host=`grep Host= ./tlsregress_back/RS232Prop.properties | cut -d "=" -f 2`
echo $host
sleep 5
# audiodevice=`grep audio.device= /recalbox/share/system/recalbox.conf | cut -d "=" -f 2`

if [ ! -z $host ]; then
    set_config Host ${console_dhcp_ip}
fi

# if [ ! -z $audiodevice ]; then
#     set_config audio.device ${audiodevice}
# fi