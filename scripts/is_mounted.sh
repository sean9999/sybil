#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

ls -a --file-type /dev/mapper/$MOUNTED_NAME
