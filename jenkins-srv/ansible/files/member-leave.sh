#!/bin/bash

while read -a values; do
  GFNAME=${values[0]}

  if [[ $GFNAME == gf-node-* ]]; then
    GFIP=${values[1]}

    rm -f /glassfishNodes/$GFNAME

    sed -i -c -e "\|^$GFIP $GFNAME\$|d" /etc/hosts
  fi
done
