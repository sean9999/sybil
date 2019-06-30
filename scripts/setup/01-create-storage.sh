#!/bin/bash

##	strict mode
set -euo pipefail
IFS=$'\n\t'

##	global vars
DIR="$(dirname $(readlink -f $0))"
source $DIR/../vars.sh

##	sanity assurance
mkdir -p $STORAGE_ROOT

##	do the work
fallocate -l $STORAGE_SIZE $STORAGE_LOCATION
dd if=/dev/zero of=$STORAGE_LOCATION bs=1M count=$STORAGE_SIZE

##	show the results
file $STORAGE_LOCATION
