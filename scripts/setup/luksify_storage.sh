#!/bin/bash

source /root/scripts/vars.sh

cryptsetup luksFormat --type luks2 -y $STORAGE_LOCATION

