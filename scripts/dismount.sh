#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

sudo umount /mnt/$MOUNTED_NAME \
	&& sleep 1 \
	&& sudo cryptsetup close /dev/mapper/$MOUNTED_NAME
