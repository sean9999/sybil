#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh
COUNT=02
dd if=/dev/urandom of=$CHALLENGES_ROOT/challenge.$COUNT.bin bs=64 count=1

