#!/bin/bash

# run tomcat
#
echo "==========> my current use id =" $(id -u)
cd $JREPORT_SERVER/bin
./JRServer.sh
cd $JREPORT_DESIGNER/bin
./JReport.sh
