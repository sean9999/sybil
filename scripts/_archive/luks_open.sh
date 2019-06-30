#!/bin/bash

DIR="$(dirname $(readlink -f $0))"

source $DIR/vars.sh

echo cryptsetup luksOpen --type luks2 $STORAGE_LOCATION $MOUNTED_NAME

sleep 3

cryptsetup luksOpen --type luks2 $STORAGE_LOCATION $MOUNTED_NAME

