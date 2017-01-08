#!/bin/bash
del spagobi-studio.dbox
docker build -f spagobi-tools.docker -t devbhuwan/spagobi-studio .
docker save devbhuwan/spagobi-studio -o spagobi-studio.dbox
