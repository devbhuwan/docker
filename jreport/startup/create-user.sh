#!/bin/bash
#
# Dynamic Create user and group
#

mkdir -p /home/duser

#
# Group creation
#
if [ -z $GID ]; then
  export GID=1000
fi
sys_entry=$(getent group $GID | cut -f1 -d:)
if [ -z $sys_entry ]; then
  groupadd -g $GID duser
  export GRP_NAME=duser
else
  export GRP_NAME=$sys_entry
fi

#
# User creation
#
if [ -z $UID ]; then
  export UID=1000
fi
sys_entry=$(getent passwd $UID | cut -f1 -d:)
if [ -z $sys_entry ]; then
  useradd -s /bin/bash -g $GID -d /home/duser -p duser -u $UID duser
  export USR_NAME=duser
else
  export USR_NAME=$sys_entry
fi
