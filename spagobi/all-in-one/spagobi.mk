#!/bin/bash
rm spagobi-all-in-one.dbox
docker build -f spagobi.docker -t devbhuwan/spagobi-all-in-one .
#docker save devbhuwan/spagobi-all-in-one -o spagobi-all-in-one.dbox
