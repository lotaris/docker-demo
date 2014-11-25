#!/bin/bash

while read -a values; do
  GFNAME=${values[0]}

  if [[ $GFNAME == gf-node-* ]]; then
    GFIP=${values[1]}

    GFMASTER=`cat /glassfishNodes/gf-master`

    if [[ $GFNAME == $GFMASTER ]]; then
      rm -f /glassfish/gf-master
      sed -i -c -e "\|^$GFIP gf-master\$|d" /etc/hosts
    else
      rm -f /glassfishNodes/$GFNAME
      sed -i -c -e "\|^$GFIP $GFNAME\$|d" /etc/hosts
    fi
  fi
done
