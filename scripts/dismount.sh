#!/bin/bash

DIR="$(dirname $(readlink -f $0))"

source $DIR/vars.sh

umount /mnt/$MOUNTED_NAME \
	&& sleep 3 \
	&& cryptsetup luksClose /dev/mapper/$MOUNTED_NAME
