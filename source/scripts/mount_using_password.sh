#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

$DIR/luks_open.sh \
	&& sleep 3 \
	&& mount -t ext4 /dev/mapper/$MOUNTED_NAME /mnt/$MOUNTED_NAME



