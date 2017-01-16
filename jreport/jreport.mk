#!/bin/bash
rm jreport.dbox
docker build -f jreport.docker -t devbhuwan/jreport .
#docker save devbhuwan/jreport -o jreport.dbox
