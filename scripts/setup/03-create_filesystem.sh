#!/bin/bash

##	strict mode
set -euo pipefail
IFS=$'\n\t'

##	globals
DIR="$(dirname $(readlink -f $0))"
source $DIR/../vars.sh

##	sanity check
###	@todo: exit the script if fail, and show a useful error msg
cryptsetup isLuks -v $STORAGE_LOCATION

##	do the work
cryptsetup open $STORAGE_LOCATION $MOUNTED_NAME --type luks2

##	create the filesystem
mkfs.ext4 -j /dev/mapper/$MOUNTED_NAME




