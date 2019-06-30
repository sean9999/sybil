#!/bin/bash

##	strict mode
set -euo pipefail
IFS=$'\n\t'

##	globals
DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

##	what challenge do we present?
CHALLENGE="01"
YUBI_SLOT="2"
YUBI_NICK="$(ykinfo -m -q)"

##	sanity check
sudo mkdir -p /mnt/$MOUNTED_NAME

##	do the work
cryptsetup open --type luks2 --key-file <(ykchalresp -${YUBI_SLOT} -i $CHALLENGES_ROOT/$VAULT_NAME/yubi-${YUBI_NICK}.slot-${YUBI_SLOT}.challenge-${CHALLENGE}.bin) $STORAGE_LOCATION $MOUNTED_NAME \
	&& sleep 1 \
	&& mount /dev/mapper/$MOUNTED_NAME /mnt/$MOUNTED_NAME

##	show results
$DIR/is_mounted.sh
