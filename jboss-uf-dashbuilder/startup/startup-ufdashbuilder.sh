#!/bin/bash

# run tomcat
#
echo "==========> my current use id =" $(id -u)
cd $CATALINA_HOME/bin
./catalina.sh run
