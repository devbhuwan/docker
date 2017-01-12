#!/bin/bash
rm dashbuilder.dbox
docker build -f dashbuilder.docker -t devbhuwan/dashbuilder .
#docker save devbhuwan/dashbuilder -o dashbuilder.dbox
