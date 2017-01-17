#!/bin/bash
#
# Common startup files
#
chmod +x /startup/*
. /startup/create-user.sh

for var in "$@"
do
  usr=$(echo $var | cut -f1 -d:)
  script=$(echo $var | cut -f2 -d:)
  allfolders=$(echo $var | cut -f3 -d:)
  case $usr in
    root )
      bash /startup/$script
      ;;
    duser )
      for folder in $allfolders
      do
        chown -R $USR_NAME:$GRP_NAME $folder
      done
      su $USR_NAME -c "bash /startup/$script"
      bash
      ;;
  esac
done
