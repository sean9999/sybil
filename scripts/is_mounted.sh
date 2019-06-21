#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

ls $DIARY_ROOT
