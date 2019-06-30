#!/bin/bash

DIR="$(dirname $(readlink -f $0))"

cat $DIR/vars.sh
