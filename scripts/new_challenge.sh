#!/bin/bash

source /root/scripts/vars.sh

dd if=/dev/urandom of=$CHALLENGES_ROOT/00.bin bs=64 count=1

