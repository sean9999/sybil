#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

cryptsetup open --type luks2 --key-file <(ykchalresp -2 -i $DIR/../challenges/challenge.00.bin) ../cryptstore dianne \
	&& sleep 2 \
	&& mount /dev/mapper/dianne /mnt/dianne

$DIR/is_mounted.sh

