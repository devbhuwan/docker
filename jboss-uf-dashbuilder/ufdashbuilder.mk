#!/bin/bash
rm ufdashbuilder.dbox
docker build -f ufdashbuilder.docker -t devbhuwan/ufdashbuilder .
#docker save devbhuwan/ufdashbuilder -o ufdashbuilder.dbox
