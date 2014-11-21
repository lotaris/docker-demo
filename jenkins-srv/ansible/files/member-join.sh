#!/bin/bash

while read -a values; do
  GFNAME=${values[0]}

  if [[ $GFNAME == gf-node-* ]]; then
    GFIP=${values[1]}

    touch /glassfishNodes/$GFNAME

    echo "$GFIP $GFNAME" >> /etc/hosts
  fi
done
