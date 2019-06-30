#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

cryptsetup luksDump $STORAGE_LOCATION

