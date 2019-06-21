#!/bin/bash

source /root/scripts/vars.sh

mkfs.ext4 -j /dev/mapper/$MOUNTED_NAME

