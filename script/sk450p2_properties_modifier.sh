#!/bin/bash
CONFIG="/tmp/test.cfg"

# Use this to set the new config value, needs 2 parameters. 
# You could check that $1 and $1 is set, but I am lazy
function set_config(){
    sudo sed -i "s/^\($1\s*=\s*\).*\$/\1$2/" $CONFIG
}

# INITIALIZE CONFIG IF IT'S MISSING
if [ ! -e "${CONFIG}" ] ; then
    # Set default variable value
    sudo touch $CONFIG
    echo "myname=\"Test\"" | sudo tee --append $CONFIG
fi

# LOAD THE CONFIG FILE
source $CONFIG

echo "${myname}" # SHOULD OUTPUT DEFAULT (test) ON FIRST RUN
myname="Steve"
echo "${myname}" # SHOULD OUTPUT Erl
set_config myname $myname # SETS THE NEW VALUE