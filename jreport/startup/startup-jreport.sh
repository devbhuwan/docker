#!/bin/bash

# run tomcat
#
echo "==========> my current use id =" $(id -u)
cd $HOME_DIR/bin
./jserver-${SUFFIX}.bin

while true; do foo; sleep 2; done
