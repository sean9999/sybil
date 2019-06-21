#!/bin/bash

source /root/scripts/vars.sh

fallocate -l $STORAGE_SIZEM $STORAGE_LOCATION
dd if=/dev/zero of=$STORAGE_LOCATION bs=1M count=$STORAGE_SIZE
