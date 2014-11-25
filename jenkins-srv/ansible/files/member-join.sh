#!/bin/bash

while read -a values; do
  GFNAME=${values[0]}

  if [[ $GFNAME == gf-node-* ]]; then
    GFIP=${values[1]}

    NB_NODES=`ls /glassfishNodes | wc -l`

    if [[ $NB_NODES -eq 0 ]]; then
      echo $GFNAME > /glassfishNodes/gf-master
      echo "$GFIP gf-master" >> /etc/hosts
    else
      touch /glassfishNodes/$GFNAME
      echo "$GFIP $GFNAME" >> /etc/hosts
    fi
  fi
done
