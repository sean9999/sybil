#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
#source $DIR/vars.sh

alias bat=cat

bat $DIR/vars.sh
